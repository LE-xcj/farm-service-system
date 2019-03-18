package edu.zhku.dao.impl;

import edu.zhku.dao.BillDao;
import edu.zhku.dao.ItemDao;
import edu.zhku.dao.OperatorDao;
import edu.zhku.mapper.BillItemMapper;
import edu.zhku.mapper.BillMapper;
import edu.zhku.mapper.BillOperatorMapper;
import edu.zhku.pojo.*;
import edu.zhku.vo.BillDTO;
import edu.zhku.vo.BillStatusVo;
import edu.zhku.vo.ItemDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author chujian
 * @ClassName BillDaoImpl
 * @Description 功能描述
 * @date 2019/2/21 19:13
 */

/**
 * 订单的Dao层，整合第三张表的mapper，相当于多个mapper集成
 * 这里不接触redis
 * 完全交由itemDao、operatorDao负责
 * 而且订单不进行缓存，直接从MySQL中查询.因为订单涉及条件查询，不易于在redis结构化
 */
@Component
public class BillDaoImpl implements BillDao {

    @Autowired
    private BillMapper billMapper;

    @Autowired
    private BillItemMapper billItemMapper;

    @Autowired
    private BillOperatorMapper billOperatorMapper;


    @Autowired
    private ItemDao itemDao;

    @Autowired
    private OperatorDao operatorDao;






    //////////////////////////////////////////////////////////////////////
    /////////////////////////第三张表的mapper//////////////////////////////////
    //////////////////////////////////////////////////////////////////////


    /**
     * 订单和商品的第三张表，批量插入相关记录
     * @param billItems
     * @return
     */
    @Override
    public int insertBillItemForList(List<BillItem> billItems) throws Exception {
        int num = billItemMapper.insertBillItemForList(billItems);
        return num;
    }

    @Override
    public List<BillItem> queryBillItemByBid(BillItem billItem) throws Exception {

        List<BillItem> result = billItemMapper.queryBillItemByBid(billItem);
        return result;
    }


    /**
     * 批量插入BillOperator第三张表，商户负责调配相应机手负责某一订单
     * @param billOperators
     * @return
     */
    @Override
    public int insertBillOperatorsForList(List<BillOperator> billOperators) throws Exception {
        int num = billOperatorMapper.insertBillOperatorsForList(billOperators);
        return num;
    }







    //////////////////////////////////////////////////////////////////////
    ////////////////////////////billMapper////////////////////////////////////
    //////////////////////////////////////////////////////////////////////

    /**
     * 创建订单
     * @param bill
     * @return
     * @throws Exception
     */
    @Override
    public int createBill(Bill bill) throws Exception {
        int num = billMapper.insertSelective(bill);
        return num;
    }


    /**
     * billMapper提供实现
     *
     * 根据订单id来更新，其实一般更新订单就是对订单的状态进行更新
     * @param bill
     * @return
     * @throws Exception
     */
    @Override
    public int updateBillById(Bill bill) throws Exception {
        int num = billMapper.updateByPrimaryKeySelective(bill);
        return num;
    }


    /**
     * billMapper提供实现
     *
     * 根据订单id查询订单信息
     * @param bid
     * @return
     * @throws Exception
     */
    @Override
    public Bill queryBillById(String bid) throws Exception {
        Bill bill = billMapper.selectByPrimaryKey(bid);
        return bill;
    }


    /**
     * 由billMapper提供实现
     *
     * 根据条件查询相应订单，农户商户共用接口
     * @param condition
     * @return
     * @throws Exception
     */
    @Override
    public List<BillDTO> queryBill(BillCondition condition) throws Exception {
        List<BillDTO> billDTO = billMapper.queryBill(condition);
        return billDTO;
    }

    @Override
    public int count(BillCondition condition) throws Exception {
        int total = billMapper.count(condition);
        return total;
    }

    @Override
    public int updateBillStatusForList(BillStatusVo vo) throws Exception {
        int num = billMapper.updateBillStatusForList(vo);
        return num;
    }

    @Override
    public List<Bill> selectBillForList(BillStatusVo vo) throws Exception {
        List<Bill> bills = billMapper.selectBillForList(vo);
        return bills;
    }



    //////////////////////////////////////////////////////////////////////
    /////////////////////////其他Dao层////////////////////////////////////////
    //////////////////////////////////////////////////////////////////////



    /**
     * operatorDao提供
     *
     * 根据机手的id集合，批量查询机手信息
     * @param ids  机手的id集合
     * @return   机手信息集合
     */
    @Override
    public List<Operator> queryOperatorForIDList(List<String> ids) {
        List<Operator> operators = operatorDao.queryOperatorForIDList(ids);
        return operators;
    }


    /**
     * 由operatorDao提供
     *
     * 这里完全依赖operatorDao接口，其中过程实现billDao不负责
     * 所以这里可以不用再理
     * @param billOperators
     * @return
     * @throws Exception
     */
    @Override
    public List<Operator> queryOperator(List<BillOperator> billOperators) throws Exception {

        //抽取其中的机手id
        List<String> ids = new ArrayList<>(billOperators.size());
        for (BillOperator billOperator : billOperators) {
            ids.add(billOperator.getOid());
        }
        List<Operator> operators = operatorDao.queryOperatorForIDList(ids);

        return operators;
    }


    /**
     * 由itemDao提供支持
     *
     * 这里也是依赖itemDao，但是itemDao一定要保证数据都查询过
     * @param billItems  订单-商品
     * @return
     * @throws Exception
     */
    @Override
    public List<ItemDTO> queryItemAndSetNum(List<BillItem> billItems) throws Exception {

        int length = billItems.size();
        List<ItemDTO> itemDTOS = new ArrayList<>(length);
        List<Integer> ids = new ArrayList<>(length);

        Map<Integer, Integer> map = new HashMap<>(length);

        //遍历获取id
        for (BillItem billItem : billItems) {

            //获取商品的id
            Integer iid = billItem.getIid();

            //添加到查询参数列表中
            ids.add(iid);

            //这里以商品id为key，商品数量为value
            map.put(iid, billItem.getNum());
        }

        //从itemDao获取出查询的数据
        List<Item> items = itemDao.selectItemByIds(ids);

        //填充itemDto中的item属性
        for (Item item : items) {

            ItemDTO itemDTO = new ItemDTO();

            //获取商品key，然后定位到map中对应的num
            Integer num = map.get(item.getIid());

            //填充数据
            itemDTO.setItem(item);
            itemDTO.setNum(num);

            itemDTOS.add(itemDTO);
        }

        return itemDTOS;
    }

}
    