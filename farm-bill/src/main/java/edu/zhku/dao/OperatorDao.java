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


    //根据id批量删除
    int deleteOperatorsById(List<String> ids) throws Exception;

    //单个删除
    int deleteByPrimaryKey(String oid) throws Exception;

    //根据id批量更新
    int updateOperatorsById(List<Operator> operators) throws Exception;


    /**
     * 单个添加
     * @param record
     * @return
     * @throws Exception
     */
    int insertSelective(Operator record) throws Exception;

    //批量插入
    int insertOperators(List<Operator> operators) throws Exception;

    /**
     * 更新机手信息，by id
     * @param record
     * @return
     * @throws Exception
     */
    int updateByPrimaryKeySelective(Operator record) throws Exception;

    /**
     * 根据oid查询
     * @param oid
     * @return
     * @throws Exception
     */
    Operator selectByPrimaryKey(String oid) throws Exception;

    /**
     * 根据机手的id集合来批量查询机手信息
     * 机手的顺序可以不用管
     * @param ids   机手的id集合
     * @return    机手的集合信息
     */
    List<Operator> queryOperatorForIDList(List<String> ids);



    //分页查询
    List<Operator> selectOperatorByCondition(OperatorCondition condition) throws Exception;

    //计算总数
    int count(OperatorCondition condition) throws Exception;



}
    