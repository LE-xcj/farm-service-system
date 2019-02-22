package edu.zhku.pojo;

import edu.zhku.constant.Size;

/**
 * @author chujian
 * @ClassName BillCondition
 * @Description 功能描述
 * @date 2019/2/21 17:37
 */
public class BillCondition {

    private Bill bill;
    private boolean dealineFirst = false;
    private boolean desc = false;

    //分页
    private int page;
    private int pageSize = Size.BILLPAGESIZE;
    private int begin;



    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getBegin() {
        return begin;
    }

    public void setBegin(int begin) {
        this.begin = begin;
    }

    public Bill getBill() {
        return bill;
    }

    public void setBill(Bill bill) {
        this.bill = bill;
    }

    public boolean isDealineFirst() {
        return dealineFirst;
    }

    public void setDealineFirst(boolean dealineFirst) {
        this.dealineFirst = dealineFirst;
    }

    public boolean isDesc() {
        return desc;
    }

    public void setDesc(boolean desc) {
        this.desc = desc;
    }
}
    