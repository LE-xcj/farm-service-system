package edu.zhku.mapper;

import edu.zhku.pojo.Bill;

public interface BillMapper {
    int deleteByPrimaryKey(String bid);

    int insert(Bill record);

    int insertSelective(Bill record);

    Bill selectByPrimaryKey(String bid);

    int updateByPrimaryKeySelective(Bill record);

    int updateByPrimaryKey(Bill record);
}