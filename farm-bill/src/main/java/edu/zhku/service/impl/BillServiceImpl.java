package edu.zhku.service.impl;

import edu.zhku.constant.BillStatus;
import edu.zhku.constant.ExceptionMessage;
import edu.zhku.constant.Role;
import edu.zhku.dao.BillDao;
import edu.zhku.dao.ItemDao;
import edu.zhku.pojo.*;
import edu.zhku.service.BillService;
import edu.zhku.service.FarmerServiceFacade;
import edu.zhku.service.MerchantServiceFacade;
import edu.zhku.service.NotifyServiceFacade;
import edu.zhku.util.KeyFactory;
import edu.zhku.util.MessageFactory;
import edu.zhku.vo.BillDTO;
import edu.zhku.vo.BillVo;
import edu.zhku.vo.ItemDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @author chujian
 * @ClassName BillServiceImpl
 * @Description 功能描述
 * @date 2019/2/21 19:11
 */
@Service
public class BillServiceImpl implements BillService {

    @Autowired
    private BillDao billDao;

    @Autowired
    private ItemDao itemDao;

    @Override
    public int createBill(Bill bill, List<Integer> itemIds, List<Integer> nums) throws Exception {

        //自己生产订单号

        if(illegal(bill) || illegal(itemIds, nums)) {
            throw new Exception(ExceptionMessage.PARAMETORERRO);
        }

        //填充订单必要信息，同时返回第三方表需要插入的记录
        List<BillItem> billItems = buildBill(bill, itemIds, nums);

        //向订单表插入订单bill
        int num = billDao.createBill(bill);

        //向 “订单-商品” 第三张表插入记录
        billDao.insertBillItemForList(billItems);

        return num;
    }


    /**
     * 更新订单信息，一般是更新状态
     * 或者强制只能更新订单的状态
     * @param bill
     * @return
     * @throws Exception
     */
    @Override
    public int updateBill(Bill bill) throws Exception {

        if (null == bill || bill.getBid() == null) {
            throw new Exception(ExceptionMessage.OBJNULL);
        }

        int num = billDao.updateBillById(bill);

        //根据订单状态是否为null来判断是否更新状态
        Integer status = bill.getStatus();
        if (status != null && status != 0) {

            //获取订单状态
            int flag = status;
            String role = null;
            String destination = null;

            //更新的状态是-1或1，那么就是商户操作的，所以通知对象是农户
            if (flag == BillStatus.OK || flag == BillStatus.REJECT) {
                role = Role.FARMER.getPref();
                destination = bill.getFid();
            } else {
                role = Role.MERCHANT.getPref();
                destination = bill.getMid();
            }

            //订单id
            String bid = bill.getBid();

            //获取模板消息
            String content = MessageFactory.getContent(bid, flag);

            //通知
            notice(role, destination, content);
        }

        return num;
    }


    //外部接口
    private FarmerServiceFacade farmerServiceFacade;
    private MerchantServiceFacade merchantServiceFacade;

    @Override
    public BillVo queryBill(BillCondition condition) throws Exception {

        if (null == condition) {
            throw new Exception(ExceptionMessage.OBJNULL);
        }

        BillVo vo = new BillVo();

        //1、订单 与 “订单-商品” 与 “订单-机手” 这三张表连接，设置bill基本信息
        BillDTO dto = billDao.queryBill(condition);
        Bill bill = dto.getBill();
        vo.setBill(bill);

        //2、获取billVo中的bill对象，然后尝试重redis缓存那边查询商户merchant、农户信息farmer
        String fid = bill.getFid();
        String mid = bill.getMid();
        String farmer = farmerServiceFacade.queryFarmerById(fid);
        String merchant = merchantServiceFacade.queryMerchantById(mid);
        vo.setFarmer(farmer);
        vo.setMerchant(merchant);

        //3、获取billVo中“billItems集合，然后批量从redis查对应的商品信息items，以及设置对应的数量（要保证对应关系）
        List<BillItem> billItems = dto.getBillItems();
        List<ItemDTO> items = billDao.queryItemAndSetNum(billItems);
        vo.setItems(items);

        //4、获取billVo中的billOperators集合对象，然后从redis那边查对应的机手信息operators，可以无序
        List<BillOperator> billOperators = dto.getBillOperators();
        List<Operator> operators = billDao.queryOperator(billOperators);
        vo.setOperators(operators);


        return vo;
    }

    /**
     * 安排机手负责相应订单，并且通知农户负责人的信息
     * @param bill
     * @param operators
     * @return
     * @throws Exception
     */
    @Override
    public int arragenOperator(Bill bill, List<String> operators) throws Exception {

        if (bill == null || operators == null || operators.isEmpty()) {
            throw new Exception(ExceptionMessage.OBJNULL);
        }

        //进行封装
        List<BillOperator> billOperators = new ArrayList<>();

        for (String oid : operators) {
            BillOperator bo = new BillOperator();
            bo.setBid(bill.getBid());
            bo.setOid(oid);

            billOperators.add(bo);
        }

        int num = billDao.insertBillOperatorsForList(billOperators);

        //通知农户，商户已经安排了相应的机手负责
        String fid = bill.getFid();
        //预防fid为null
        if (null == fid) {
            bill = billDao.queryBillById(bill.getBid());
            fid = bill.getFid();
        }

        //获取机手信息
        List<Operator> os = billDao.queryOperatorForIDList(operators);

        //通知三要素：role、destination、content
        String bid = bill.getBid();
        String content = MessageFactory.getContent(bid, os);

        //通知
        notice(Role.FARMER.getPref(), fid, content);

        return num;
    }

    @Autowired
    private NotifyServiceFacade notifyServiceFacade;
    /**
     * 通知
     * @param role
     * @param destination
     * @param content
     * @return
     */
    private boolean notice(String role, String destination, String content) {
        boolean notify = notifyServiceFacade.notify(role, destination, content);
        return notify;
    }


    /**
     * 填充订单信息：填充订单表的单号、金额
     *
     * @param bill
     * @param itemIds   商品id集合
     * @param nums      商品对应的数量
     * @return   订单-商品 表插入的记录集合
     * @throws Exception
     */
    private List<BillItem> buildBill(Bill bill, List<Integer> itemIds, List<Integer> nums) throws Exception {

        //订单号
        String bid = KeyFactory.generateKey();
        bill.setBid(bid);


        //订单与商品的第三张表
        List<BillItem> billItems = new ArrayList<>();

        //获取商品的信息
        List<Item> items = itemDao.selectItemByIds(itemIds);
        float money = 0.0F;
        int length = items.size();

        //计算金额
        for (int i=0; i<length; ++i) {
            Item item = items.get(i);

            //数量
            int num = nums.get(i);

            //商品id
            Integer iid = itemIds.get(i);

            //单价 X 数量
            money += item.getPrice() * num;

            BillItem billItem = new BillItem();
            billItem.setBid(bid);
            billItem.setIid(iid);
            billItem.setNum(num);
            billItems.add(billItem);

        }

        //设置金额
        bill.setMoney(money);

        return billItems;
    }


    /**
     * 判断订单是否非法，null或者fid为null
     * @param bill
     * @return
     */
    private boolean illegal(Bill bill) {
        if (null == bill || bill.getFid() == null) {
            return true;
        }
        return false;
    }

    /**
     * 判断创建订单的相应数据是否合法，商品数量和id要一一对应，并且不能为null
     * @param itemIds
     * @param nums
     * @return
     */
    private boolean illegal(List<Integer> itemIds, List<Integer> nums) {
        if (null == itemIds || nums == null ||
                itemIds.isEmpty() || nums.isEmpty() || itemIds.size() != nums.size()) {
            return true;
        }
        return false;

    }
}
    