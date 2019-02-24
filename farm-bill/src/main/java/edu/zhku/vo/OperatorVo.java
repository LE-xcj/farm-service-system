package edu.zhku.vo;

import edu.zhku.pojo.Operator;

import java.util.List;

/**
 * @author chujian
 * @ClassName OperatorVo
 * @Description 功能描述
 * @date 2019/2/24 15:51
 */
public class OperatorVo {
    private List<Operator> operators;
    private int totalPage;

    public List<Operator> getOperators() {
        return operators;
    }

    public void setOperators(List<Operator> operators) {
        this.operators = operators;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }
}
    