package edu.zhku.dao.impl;

import edu.zhku.constant.Table;
import edu.zhku.dao.OperatorDao;
import edu.zhku.mapper.OperatorMapper;
import edu.zhku.pojo.Operator;
import edu.zhku.pojo.OperatorCondition;
import edu.zhku.util.RedisUtil;
import javafx.scene.control.Tab;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author chujian
 * @ClassName OperatorDaoImpl
 * @Description 功能描述
 * @date 2019/2/21 22:40
 *
 * 整合redis
 */
@Component
public class OperatorDaoImpl implements OperatorDao {


    @Autowired
    private OperatorMapper operatorMapper;

    @Autowired
    private RedisUtil redisUtil;

    /**
     * 插入单个，还没有被调用
     * @param record
     * @return
     * @throws Exception
     */
    @Override
    public int insertSelective(Operator record) throws Exception {
        int num = operatorMapper.insertSelective(record);

        if (1 == num) {
            saveOne(record);
        }
        return num;
    }

    /**
     * 批量插入
     * @param operators
     * @return
     * @throws Exception
     */
    @Override
    public int insertOperators(List<Operator> operators) throws Exception {
        int num = operatorMapper.insertOperators(operators);

        if (num == operators.size()) {
            patchSave(operators);
        }
        return num;
    }


    /**
     * 删除单个
     * @param oid
     * @return
     * @throws Exception
     */
    @Override
    public int deleteByPrimaryKey(String oid) throws Exception {

        int num = operatorMapper.deleteByPrimaryKey(oid);
        return num;
    }

    /**
     * 批量删除
     * @param ids
     * @return
     * @throws Exception
     */
    @Override
    public int deleteOperatorsById(List<String> ids) throws Exception {
        int num = operatorMapper.deleteOperatorsById(ids);
        return num;
    }

    /**
     * 条件查询，还是由MySQL负责
     * @param condition
     * @return
     * @throws Exception
     */
    @Override
    public List<Operator> selectOperatorByCondition(OperatorCondition condition) throws Exception {
        List<Operator> operators = operatorMapper.selectOperatorByCondition(condition);
        return operators;
    }

    /**
     * 计算总数
     * @param condition
     * @return
     * @throws Exception
     */
    @Override
    public int count(OperatorCondition condition) throws Exception {
        int total = operatorMapper.count(condition);
        return total;
    }


    /**
     * 建议搭配redis来做
     * @param ids   机手的id集合
     * @return
     */
    @Override
    public List<Operator> queryOperatorForIDList(List<String> ids) {

        //从redis那边获取
        List<Object> list = redisUtil.hmultiGet(Table.OPERATORTABLE, ids);

        //数据准备
        int length = ids.size();
        List<Operator> operators = new ArrayList<>(length);

        //用于查缺补漏
        List<String> temp = new ArrayList<>(length);

        //遍历
        for (int i=0; i<length; ++i) {

            //如果redis没有，obj为null
            Object obj = list.get(i);

            //找不到
            if (null == obj) {
                String oid = ids.get(i);
                temp.add(oid);
            } else {
                Operator operator = (Operator) obj;
                operators.add(operator);
            }
        }

        if (!temp.isEmpty()) {
            List<Operator> data = operatorMapper.queryOperatorForIDList(temp);
            operators.addAll(data);

            //保存到redis中
            patchSave(data);
        }
        return operators;
    }

    /**
     * 根据id查询
     * @param oid
     * @return
     * @throws Exception
     */
    @Override
    public Operator selectByPrimaryKey(String oid) throws Exception {

        Operator operator = getOperator(oid);

        if (null == operator) {
            operator = operatorMapper.selectByPrimaryKey(oid);

            //保存到redis中
            saveOne(operator);
        }
        return operator;
    }

    /**
     * 批量更新
     * @param operators
     * @return
     * @throws Exception
     */
    @Override
    public int updateOperatorsById(List<Operator> operators) throws Exception {
        int num = operatorMapper.updateOperatorsById(operators);

        //更新成功
        if (num > 0) {
            List<String> ids = new ArrayList<>();

            //包装ids
            for (Operator operator : operators) {
                ids.add(operator.getOid());
            }

            //批量获取operator
            List<Operator> os = operatorMapper.queryOperatorForIDList(ids);

            //批量同步到redis中
            patchSave(os);
        }

        return num;
    }

    /**
     * 单个更新
     * @param record
     * @return
     * @throws Exception
     */
    @Override
    public int updateByPrimaryKeySelective(Operator record) throws Exception {
        int num = operatorMapper.updateByPrimaryKeySelective(record);

        if (num == 1) {
            //重新到mysql中获取
            Operator operator = operatorMapper.selectByPrimaryKey(record.getOid());

            //保存到redis
            saveOne(operator);
        }

        return num;
    }


    /**
     * 批量保存到redis
     * @param operators
     */
    private void patchSave(List<Operator> operators) {

        if (operators.isEmpty()) {
            return;
        }
        Map<String, Operator> data = new HashMap<>();

        for (Operator operator : operators) {
            String oid = operator.getOid();
            data.put(oid, operator);
        }

        redisUtil.hmultiSet(Table.OPERATORTABLE, data);
    }

    /**
     * 保存一个到redis中
     * @param operator
     */
    private void saveOne(Operator operator) {
        redisUtil.hmSet(Table.OPERATORTABLE, operator.getOid(), operator);
    }


    /**
     * 从redis中，根据id查询
     * @param oid
     * @return
     */
    private Operator getOperator(String oid) {

        Object obj = redisUtil.hmGet(Table.OPERATORTABLE, oid);
        Operator operator = (Operator) obj;
        return operator;

    }
}
    