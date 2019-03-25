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
import edu.zhku.util.AMapUtil;
import edu.zhku.util.KeyFactory;
import edu.zhku.util.MessageFactory;
import edu.zhku.util.PageUtil;
import edu.zhku.vo.BillDTO;
import edu.zhku.vo.BillStatusVo;
import edu.zhku.vo.BillVo;
import edu.zhku.vo.ItemDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    public int createBill(BillDO bill) throws Exception {

        //自己生产订单号
        List<Integer> itemIds = bill.getItemIds();
        List<Integer> nums = bill.getNums();

        if(illegal(bill) || illegal(itemIds, nums)) {
            throw new Exception(ExceptionMessage.PARAMETORERRO);
        }

        //设置location
        setLocation(bill);

        //填充订单必要信息，同时返回第三方表需要插入的记录
        List<BillItem> billItems = buildBill(bill, itemIds, nums);

        //向订单表插入订单bill
        int num = billDao.createBill(bill);

        //向 “订单-商品” 第三张表插入记录
        billDao.insertBillItemForList(billItems);

        String bid = bill.getBid();
        String mid = bill.getMid();
        String content = MessageFactory.getContent(bid);

        //通知商户有新的订单
        notice(Role.MERCHANT.getPref(), mid, content);

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

        //设置location,有可能更新
        setLocation(bill);

        int num = billDao.updateBillById(bill);

        //根据订单状态是否为null来判断是否更新状态
        Integer status = bill.getStatus();

        if (status != null && status != 0) {

            //订单id
            String bid = bill.getBid();

            //获取订单信息
            bill = billDao.queryBillById(bid);

            tryNotice(bill, status);

        }

        return num;
    }



    @Override
    public List<BillVo> queryBill(BillCondition condition) throws Exception {

        if (null == condition) {
            throw new Exception(ExceptionMessage.OBJNULL);
        }


        //订单 与 “订单-商品” 与 “订单-机手” 这三张表连接，设置bill基本信息
        List<BillDTO> dtos = billDao.queryBill(condition);


        //遍历结果集
        List<BillVo> billVos = new ArrayList<>(dtos.size());
        for (BillDTO dto : dtos) {

            //订单的视图
            BillVo vo = new BillVo();

            //1、填充订单
            fillBill(dto, vo);

            //2、获取billVo中的bill对象，然后尝试重redis缓存那边查询商户merchant、农户信息farmer
            fillFarmAndMercahnt(dto, vo);

            //3、获取billVo中“billItems集合，然后批量从redis查对应的商品信息items，以及设置对应的数量（要保证对应关系）
            fillItems(dto, vo);

            //4、获取billVo中的billOperators集合对象，然后从redis那边查对应的机手信息operators，可以无序
            fillOperators(dto, vo);

            billVos.add(vo);
        }


        return billVos;
    }

    /**
     * 安排机手负责相应订单，并且通知农户负责人的信息
     * @param billDO
     * @return
     * @throws Exception
     */
    @Override
    public int arragenOperator(BillDO billDO) throws Exception {

        List<String> operators = billDO.getOperators();
        Bill bill = (Bill) billDO;

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
            bill =  billDao.queryBillById(bill.getBid());
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

    @Override
    public int count(BillCondition condition) throws Exception {
        int total = billDao.count(condition);
        int totalPage = PageUtil.count(total, condition.getPageSize());
        return totalPage;
    }

    @Override
    public int updateBillStatusForList(BillStatusVo vo) throws Exception {

        if (vo == null) {
            throw new Exception(ExceptionMessage.OBJNULL);
        }

        List<String> bids = vo.getBids();
        if (null == bids || bids.isEmpty()) {
            throw new Exception(ExceptionMessage.OBJNULL);
        }

        int num = billDao.updateBillStatusForList(vo);

        //通知
        List<Bill> bills = billDao.selectBillForList(vo);
        tryNotice(bills, vo.getStatus());

        return num;
    }

    @Override
    public List<Item> queryBillItemByBid(BillItem billItem) throws Exception {
        if (billItem == null || billItem.getBid() == null) {
            throw new Exception(ExceptionMessage.OBJNULL);
        }

        List<BillItem> data = billDao.queryBillItemByBid(billItem);

        //如果没有
        if (data == null || data.isEmpty()) {
            return new ArrayList<>();
        }

        //获取item的id集合
        List<Integer> iids = new ArrayList<>(data.size());
        for (BillItem bi : data) {
            iids.add(bi.getIid());
        }

        //批量查询item
        List<Item> items = itemDao.selectItemByIds(iids);

        return items;
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
     * 单个通知
     * @param bill
     * @param status
     */
    private void tryNotice(Bill bill, int status) {
        if (null == bill)
            return;
        List<Bill> bills = new ArrayList<>();
        tryNotice(bills, status);
    }

    /**
     * 批量通知
     * @param bills
     * @param status
     */
    private void tryNotice(List<Bill> bills, int status) {

        if (null == bills)
            return;

        for(Bill bill : bills) {
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


            //获取模板消息
            String bid = bill.getBid();
            String content = MessageFactory.getContent(bid, flag);

            //通知
            notice(role, destination, content);

            //发送评价链接
            sendEvaluation(flag, bill);
        }
    }

    /**
     * 根据订单的状态判断是否需要发送评价链接
     * @param flag
     * @param bill
     */
    private void sendEvaluation(int flag, Bill bill) {
        //发送评价消息
        if (flag == BillStatus.COMPLETE) {

            String bid = bill.getBid();

            //农户
            String role = Role.FARMER.getPref();
            String destination = bill.getFid();
            String content = MessageFactory.getEvaluationUrl(bid);

            //通知
            notice(role, destination, content);
        }

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

        int length = itemIds.size();

        //建立商品与数量的对应关系, iid -> num
        Map<Integer, Integer> map = new HashMap<>();
        for (int i=0; i<length; ++i) {
            map.put(itemIds.get(i), nums.get(i));
        }

        //产生订单号
        String bid = KeyFactory.generateKey();
        bill.setBid(bid);


        //订单与商品的第三张表
        List<BillItem> billItems = new ArrayList<>();

        //获取商品的信息
        List<Item> items = itemDao.selectItemByIds(itemIds);
        float money = 0.0F;


        //计算金额
        for (Item item : items) {

            Integer iid = item.getIid();

            //获取对应的数量
            int num = map.get(iid);

            //单价 X 数量
            money += item.getPrice() * num;

            BillItem billItem = new BillItem();
            billItem.setBid(bid);
            billItem.setIid(iid);
            billItem.setNum(num);

            //添加到biillItem
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


    /**
     * 填充bill属性
     * @param dto
     * @param vo
     */
    private void fillBill(BillDTO dto, BillVo vo) {

        Bill bill = new Bill();

        bill.setBid(dto.getBid());
        bill.setFid(dto.getFid());
        bill.setMid(dto.getMid());
        bill.setMoney(dto.getMoney());
        bill.setStatus(dto.getStatus());
        bill.setCreatetime(dto.getCreatetime());
        bill.setDeadline(dto.getDeadline());
        bill.setRemark(dto.getRemark());
        bill.setAddress(dto.getAddress());
        bill.setLocation(dto.getLocation());

        vo.setBill(bill);

    }


    //外部接口
    @Autowired
    private FarmerServiceFacade farmerServiceFacade;

    @Autowired
    private MerchantServiceFacade merchantServiceFacade;
    /**
     * 填充农户和商户信息
     * @param bill
     * @param vo
     */
    private void fillFarmAndMercahnt(BillDTO bill, BillVo vo) throws Exception {

        String fid = bill.getFid();
        String mid = bill.getMid();

        String farmer = null;
        if (null != fid) {
            farmer = farmerServiceFacade.queryFarmerById(fid);
        }


        String merchant = null;
        if (null != mid){
            merchant = merchantServiceFacade.queryMerchantById(mid);
        }


        vo.setFarmer(farmer);
        vo.setMerchant(merchant);
    }


    /**
     * 填充商品信息
     * @param dto
     * @param vo
     * @throws Exception
     */
    private void fillItems(BillDTO dto, BillVo vo) throws Exception {
        List<BillItem> billItems = dto.getBillItems();
        List<ItemDTO> items = billDao.queryItemAndSetNum(billItems);
        vo.setItems(items);
    }

    /**
     * 填充机手信息,因为订单可能还是未确认状态，所以机手的信息会没有
     * @param dto
     * @param vo
     * @throws Exception
     */
    private void fillOperators(BillDTO dto, BillVo vo) throws Exception {
        List<BillOperator> billOperators = dto.getBillOperators();

        if (null == billOperators || billOperators.isEmpty()) {
            return;
        }

        List<Operator> operators = billDao.queryOperator(billOperators);
        vo.setOperators(operators);
    }

    /**
     * 设置订单的目的地址坐标
     * @param bill
     */
    private void setLocation(Bill bill) {
        String address = bill.getAddress();
        if (null == address || "".equals(address.trim())) {
            return;
        }

        String location = AMapUtil.geoCode(address);
        bill.setLocation(location);
    }
}
    