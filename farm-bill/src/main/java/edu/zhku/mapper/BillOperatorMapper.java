package edu.zhku.mapper;

import edu.zhku.pojo.BillOperator;

import java.util.List;

public interface BillOperatorMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(BillOperator record);

    int insertSelective(BillOperator record);

    BillOperator selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(BillOperator record);

    int updateByPrimaryKey(BillOperator record);

    int insertBillOperatorsForList(List<BillOperator> billOperators);
}