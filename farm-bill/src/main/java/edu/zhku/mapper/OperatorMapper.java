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

    //todo
    //条件查询
    List<Operator> selectOperatorByCondition(OperatorCondition condition) throws Exception;

    //todo
    //根据id批量更新
    int updateOperatorsById(List<Operator> operators) throws Exception;

    //根据id批量删除
    int deleteOperatorsById(List<String> ids) throws Exception;


}