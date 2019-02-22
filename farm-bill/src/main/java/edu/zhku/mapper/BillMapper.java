package edu.zhku.mapper;

import edu.zhku.pojo.Bill;
import edu.zhku.pojo.BillCondition;
import edu.zhku.vo.BillDTO;

import java.util.List;

public interface BillMapper {
    int deleteByPrimaryKey(String bid) throws Exception;

    int insert(Bill record) throws Exception;

    int insertSelective(Bill record) throws Exception;

    Bill selectByPrimaryKey(String bid) throws Exception;

    int updateByPrimaryKeySelective(Bill record) throws Exception;

    int updateByPrimaryKey(Bill record) throws Exception;



    //条件查询，并与两张第三方表联表查询
    List<BillDTO> queryBill(BillCondition condition) throws Exception;

    //计算页数
    int count(BillCondition condition) throws Exception;
}