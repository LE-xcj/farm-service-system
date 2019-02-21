package edu.zhku.dao.impl;

import edu.zhku.dao.BillDao;
import edu.zhku.dao.ItemDao;
import edu.zhku.dao.OperatorDao;
import edu.zhku.mapper.BillItemMapper;
import edu.zhku.mapper.BillMapper;
import edu.zhku.mapper.BillOperatorMapper;
import edu.zhku.pojo.*;
import edu.zhku.util.RedisUtil;
import edu.zhku.vo.BillDTO;
import edu.zhku.vo.ItemDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @author chujian
 * @ClassName BillDaoImpl
 * @Description 功能描述
 * @date 2019/2/21 19:13
 */
@Component
public class BillDaoImpl implements BillDao {

    //todo
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

    @Autowired
    private RedisUtil redisUtil;



    @Override
    public int createBill(Bill bill) throws Exception {
        int num = billMapper.insertSelective(bill);
        return num;
    }

    @Override
    public int insertBillItemForList(List<BillItem> billItems) {
        int num = billItemMapper.insertBillItemForList(billItems);
        return num;
    }

    @Override
    public int updateBillById(Bill bill) throws Exception {
        int num = billMapper.updateByPrimaryKeySelective(bill);
        return num;
    }

    @Override
    public int insertBillOperatorsForList(List<BillOperator> billOperators) {
        int num = billOperatorMapper.insertBillOperatorsForList(billOperators);
        return num;
    }

    @Override
    public Bill queryBillById(String bid) throws Exception {
        Bill bill = billMapper.selectByPrimaryKey(bid);
        return bill;
    }

    @Override
    public List<Operator> queryOperatorForIDList(List<String> ids) {
        List<Operator> operators = operatorDao.queryOperatorForIDList(ids);
        return operators;
    }


    @Override
    public BillDTO queryBill(BillCondition condition) throws Exception {
        //todo 非常重要的多表查询
        return null;
    }

    @Override
    public List<ItemDTO> queryItemAndSetNum(List<BillItem> billItems) throws Exception {
        //todo
        return null;
    }

    @Override
    public List<Operator> queryOperator(List<BillOperator> billOperators) throws Exception {
        //todo
        return null;
    }

}
    