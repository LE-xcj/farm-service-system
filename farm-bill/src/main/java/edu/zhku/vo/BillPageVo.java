package edu.zhku.vo;

import java.util.List;

/**
 * @author chujian
 * @ClassName BillPageVo
 * @Description 功能描述
 * @date 2019/2/22 17:04
 */
public class BillPageVo {

    private List<BillVo> bills;
    private int totalPage = 0;

    public List<BillVo> getBills() {
        return bills;
    }

    public void setBills(List<BillVo> bills) {
        this.bills = bills;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }
}
    