package edu.zhku.mapper;

import edu.zhku.pojo.BillItem;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BillItemMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(BillItem record);

    int insertSelective(BillItem record);

    BillItem selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(BillItem record);

    int updateByPrimaryKey(BillItem record);


    int insertBillItemForList(@Param("billItems") List<BillItem> billItems) throws Exception;

    List<BillItem> queryBillItemByBid(BillItem billItem) throws Exception;
}