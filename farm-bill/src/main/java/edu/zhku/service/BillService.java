package edu.zhku.service;

import edu.zhku.pojo.Bill;
import edu.zhku.pojo.BillCondition;
import edu.zhku.vo.BillVo;

import java.util.List;

/**
 * @author chujian
 * @ClassName BillService
 * @Description 功能描述
 * @date 2019/2/21 17:26
 */
public interface BillService {

    int createBill(Bill bill, List<Integer> itemIds, List<Integer> nums) throws Exception;

    int updateBill(Bill bill) throws Exception;

    BillVo queryBill(BillCondition condition) throws Exception;

    int arragenOperator(Bill bill, List<String> operators) throws Exception;

}
    