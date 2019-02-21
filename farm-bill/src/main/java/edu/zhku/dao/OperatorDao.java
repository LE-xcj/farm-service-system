package edu.zhku.dao;

import edu.zhku.pojo.Operator;

import java.util.List;

/**
 * @author chujian
 * @ClassName OperatorDao
 * @Description 功能描述
 * @date 2019/2/21 20:22
 */
//todo
public interface OperatorDao {

    /**
     * 根据机手的id集合来批量查询机手信息
     * @param ids   机手的id集合
     * @return    机手的集合信息
     */
    List<Operator> queryOperatorForIDList(List<String> ids);
}
    