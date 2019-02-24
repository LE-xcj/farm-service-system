package edu.zhku.service;

import edu.zhku.pojo.Operator;
import edu.zhku.pojo.OperatorCondition;

import java.util.List;

/**
 * @author chujian
 * @ClassName OperatorService
 * @Description 功能描述
 * @date 2019/2/17 17:27
 */
public interface OperatorService {

    int insertOperator(Operator operator) throws Exception;
    int insertOperators(List<Operator> operators) throws Exception;

    Operator selectOperatorById(String oid) throws Exception;
    List<Operator> selectOperatorByCondition(OperatorCondition condition) throws Exception;
    int count(OperatorCondition condition) throws Exception;

    int updateOperatorById(Operator operator) throws Exception;
    int updateOperatorsById(List<Operator> operators) throws Exception;

    int deleteOperatorById(String oid) throws Exception;
    int deleteOperatorsById(List<String> oids) throws Exception;

}
