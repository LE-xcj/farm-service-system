package edu.zhku.mapper;

import edu.zhku.pojo.Bill;
import edu.zhku.pojo.BillCondition;
import edu.zhku.vo.BillDTO;
import edu.zhku.vo.BillStatusVo;

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


    /**
     * 批量更新订单的状态
     * @param billStatusVo
     * @return
     * @throws Exception
     */
    int updateBillStatusForList(BillStatusVo billStatusVo) throws Exception;

    /**
     * 批量查询订单
     * @param vo
     * @return
     * @throws Exception
     */
    List<Bill> selectBillForList(BillStatusVo vo) throws Exception;
}