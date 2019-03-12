package edu.zhku.vo;

import java.util.List;

/**
 * @author chujian
 * @ClassName BillStatusVo
 * @Description 功能描述
 * @date 2019/3/12 22:38
 */
public class BillStatusVo {
    private List<String> bids;

    private int status;

    public List<String> getBids() {
        return bids;
    }

    public void setBids(List<String> bids) {
        this.bids = bids;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
    