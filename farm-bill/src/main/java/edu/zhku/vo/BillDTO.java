package edu.zhku.vo;

import edu.zhku.pojo.Bill;
import edu.zhku.pojo.BillItem;
import edu.zhku.pojo.BillOperator;

import java.util.List;

/**
 * @author chujian
 * @ClassName BillDTO
 * @Description 功能描述
 * @date 2019/2/21 20:05
 */
public class BillDTO {

    //基本
    private Bill bill;

    //双方都徐亚知道
    //一对多，一个订单可能包含多个商品
    private List<BillItem> billItems;

    //一对多，一个订单对应多个机手负责
    private List<BillOperator> billOperators;

    public Bill getBill() {
        return bill;
    }

    public void setBill(Bill bill) {
        this.bill = bill;
    }

    public List<BillItem> getBillItems() {
        return billItems;
    }

    public void setBillItems(List<BillItem> billItems) {
        this.billItems = billItems;
    }

    public List<BillOperator> getBillOperators() {
        return billOperators;
    }

    public void setBillOperators(List<BillOperator> billOperators) {
        this.billOperators = billOperators;
    }




}
    