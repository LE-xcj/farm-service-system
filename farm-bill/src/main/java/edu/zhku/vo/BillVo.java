package edu.zhku.vo;

import edu.zhku.pojo.Bill;
import edu.zhku.pojo.Operator;

import java.util.List;

/**
 * @author chujian
 * @ClassName BillVo
 * @Description 功能描述
 * @date 2019/2/21 17:54
 */
public class BillVo {

    //商户需要知道
    private Object farmer;

    //农户需要知道
    private Object merchant;

    //基本
    private Bill bill;

    //双方都可以知道
    //一对多，一个订单可能包含多个商品
    private List<ItemDTO> items;

    //一对多，一个订单对应多个机手负责
    private List<Operator> operators;

    public Object getFarmer() {
        return farmer;
    }

    public void setFarmer(Object farmer) {
        this.farmer = farmer;
    }

    public Object getMerchant() {
        return merchant;
    }

    public void setMerchant(Object merchant) {
        this.merchant = merchant;
    }

    public Bill getBill() {
        return bill;
    }

    public void setBill(Bill bill) {
        this.bill = bill;
    }

    public List<ItemDTO> getItems() {
        return items;
    }

    public void setItems(List<ItemDTO> items) {
        this.items = items;
    }

    public List<Operator> getOperators() {
        return operators;
    }

    public void setOperators(List<Operator> operators) {
        this.operators = operators;
    }
}
    