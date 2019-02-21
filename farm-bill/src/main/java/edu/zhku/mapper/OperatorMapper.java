package edu.zhku.mapper;

import edu.zhku.pojo.Operator;
import edu.zhku.pojo.OperatorCondition;

import java.util.List;

public interface OperatorMapper {

    int insert(Operator record) throws Exception;
    int insertSelective(Operator record) throws Exception;

    Operator selectByPrimaryKey(String oid) throws Exception;

    int updateByPrimaryKeySelective(Operator record) throws Exception;
    int updateByPrimaryKey(Operator record) throws Exception;

    int deleteByPrimaryKey(String oid) throws Exception;





    //批量插入
    int insertOperators(List<Operator> operators) throws Exception;

    //分页查询
    List<Operator> selectOperatorByCondition(OperatorCondition condition) throws Exception;

    //根据id批量更新
    int updateOperatorsById(List<Operator> operators) throws Exception;

    //根据id批量删除
    int deleteOperatorsById(List<String> ids) throws Exception;


    /**
     * 根据机手的id集合批量查询机手信息
     * @param ids
     * @return
     */
    List<Operator> queryOperatorForIDList(List<String> ids);
}