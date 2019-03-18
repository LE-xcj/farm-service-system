package edu.zhku.service;

import edu.zhku.pojo.*;
import edu.zhku.vo.BillStatusVo;
import edu.zhku.vo.BillVo;

import java.util.List;

/**
 * @author chujian
 * @ClassName BillService
 * @Description 功能描述
 * @date 2019/2/21 17:26
 */
public interface BillService {

    int createBill(BillDO bill) throws Exception;

    int arragenOperator(BillDO bill) throws Exception;

    int updateBill(Bill bill) throws Exception;

    List<BillVo> queryBill(BillCondition condition) throws Exception;

    int count(BillCondition condition) throws Exception;


    /**
     * 批量更新订单状态
     * @param vo
     * @return
     * @throws Exception
     */
    int updateBillStatusForList(BillStatusVo vo) throws Exception;

    /**
     * 根据bid查询第三方表，获取item的ids
     * @param billItem
     * @return
     * @throws Exception
     */
    List<Item> queryBillItemByBid(BillItem billItem) throws Exception;
}
    