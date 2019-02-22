package edu.zhku.dao;

import edu.zhku.pojo.Operator;
import edu.zhku.pojo.OperatorCondition;

import java.util.List;

/**
 * @author chujian
 * @ClassName OperatorDao
 * @Description 功能描述
 * @date 2019/2/21 20:22
 */
public interface OperatorDao {

    int insertSelective(Operator record) throws Exception;

    Operator selectByPrimaryKey(String oid) throws Exception;

    int updateByPrimaryKeySelective(Operator record) throws Exception;

    int deleteByPrimaryKey(String oid) throws Exception;
    /**
     * 根据机手的id集合来批量查询机手信息
     * @param ids   机手的id集合
     * @return    机手的集合信息
     */
    List<Operator> queryOperatorForIDList(List<String> ids);

    //批量插入
    int insertOperators(List<Operator> operators) throws Exception;

    //分页查询
    List<Operator> selectOperatorByCondition(OperatorCondition condition) throws Exception;

    //根据id批量更新
    int updateOperatorsById(List<Operator> operators) throws Exception;

    //根据id批量删除
    int deleteOperatorsById(List<String> ids) throws Exception;

}
    