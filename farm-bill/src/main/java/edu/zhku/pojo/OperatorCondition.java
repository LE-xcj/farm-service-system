package edu.zhku.pojo;

import edu.zhku.constant.Size;

/**
 * @author chujian
 * @ClassName OperatorCondition
 * @Description 功能描述
 * @date 2019/2/17 18:14
 */
public class OperatorCondition {

    private Operator operator;
    private Integer page;
    private Integer pageSize = Size.OPERATORPAGESIZE;
    private int begin;

    public Operator getOperator() {
        return operator;
    }

    public void setOperator(Operator operator) {
        this.operator = operator;
    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
        this.begin = (page - 1) * pageSize;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public int getBegin() {
        return begin;
    }

    public void setBegin(int begin) {
        this.begin = begin;
    }

}
    