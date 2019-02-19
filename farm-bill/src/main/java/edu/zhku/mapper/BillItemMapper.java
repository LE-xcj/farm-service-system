package edu.zhku.mapper;

import edu.zhku.pojo.BillItem;

public interface BillItemMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(BillItem record);

    int insertSelective(BillItem record);

    BillItem selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(BillItem record);

    int updateByPrimaryKey(BillItem record);
}