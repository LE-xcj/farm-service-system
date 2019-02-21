package edu.zhku.mapper;

import edu.zhku.pojo.BillItem;

import java.util.List;

public interface BillItemMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(BillItem record);

    int insertSelective(BillItem record);

    BillItem selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(BillItem record);

    int updateByPrimaryKey(BillItem record);

    int insertBillItemForList(List<BillItem> billItems);
}