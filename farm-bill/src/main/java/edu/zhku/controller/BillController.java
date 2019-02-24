package edu.zhku.controller;

import edu.zhku.pojo.Bill;
import edu.zhku.pojo.BillCondition;
import edu.zhku.pojo.BillDO;
import edu.zhku.service.BillService;
import edu.zhku.vo.BillPageVo;
import edu.zhku.vo.BillVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author chujian
 * @ClassName BillController
 * @Description 功能描述
 * @date 2019/2/21 16:49
 */
@RestController
@RequestMapping("/bill")
public class BillController {

    @Autowired
    private BillService billService;


    /**
     * 针对农户的,如果创建成功需要通知商户
     * 创建订单
     * @param bill
     *   注意id与num一一对应
     */
    @RequestMapping("/createBill")
    public int createBill(BillDO bill) throws Exception {

        int num = billService.createBill(bill);
        return num;

    }

    /**
     * 条件查询订单，针对农户和商户
     * 注意：返回billVo方便，也就是订单的详细信息
     *
     * 默认订单是按照创建时间降排序，
     * 商户一般关心已确认的，而且快到预约日期的订单
     * @param condition
     */
    @RequestMapping("/queryBill")
    public BillPageVo queryBill(BillCondition condition) throws Exception {

        List<BillVo> vos = billService.queryBill(condition);

        BillPageVo vo = new BillPageVo();
        vo.setBills(vos);
        if (!vos.isEmpty()) {
            vo.setTotalPage(billService.count(condition));
        }

        return vo;
    }

    /**
     * 更新订单，主要用于更新订单的状态。订单状态更新一定要通知农户和商户
     * 订单状态：
     *  0：未确认；
     *  1：确认；2：完成；
     *  -1：拒绝；-2：取消
     * @param bill
     */
    @RequestMapping("/updateBill")
    public int updateBill(Bill bill) throws Exception {

        int num = billService.updateBill(bill);
        return num;
    }





    /**
     * 给某个订单安排机手
     * @param bill  主要获取订单的id
     */
    @RequestMapping("/arragenOperator")
    public int arragenOperator(BillDO bill) throws Exception {

        int num = billService.arragenOperator(bill);
        return num;
    }
}
    