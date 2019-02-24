package edu.zhku.dao.impl;

import edu.zhku.dao.OperatorDao;
import edu.zhku.mapper.OperatorMapper;
import edu.zhku.pojo.Operator;
import edu.zhku.pojo.OperatorCondition;
import edu.zhku.util.RedisUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @author chujian
 * @ClassName OperatorDaoImpl
 * @Description 功能描述
 * @date 2019/2/21 22:40
 */

//todo 需要整合redis
@Component
public class OperatorDaoImpl implements OperatorDao {


    @Autowired
    private OperatorMapper operatorMapper;

    @Autowired
    private RedisUtil redisUtil;

    /**
     * 插入单个
     * @param record
     * @return
     * @throws Exception
     */
    @Override
    public int insertSelective(Operator record) throws Exception {
        int num = operatorMapper.insertSelective(record);
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
        List<Operator> operators = operatorMapper.queryOperatorForIDList(ids);
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
        Operator operator = operatorMapper.selectByPrimaryKey(oid);
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
        return num;
    }

}
    