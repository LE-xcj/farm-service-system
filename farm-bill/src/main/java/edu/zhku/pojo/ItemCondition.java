package edu.zhku.pojo;

import edu.zhku.constant.Size;

import java.util.List;

/**
 * @author chujian
 * @ClassName ItemCondition
 * @Description 功能描述
 * @date 2019/2/17 18:09
 */
public class ItemCondition{


    private String fid;

    private String address;

    private int page;

    private int pageSize = Size.ITEMPAGESIZE;

    private boolean desc;

    private List<MerchantConditon> merchantConditons;

    public int begin;

    public String getFid() {
        return fid;
    }

    public void setFid(String fid) {
        this.fid = fid;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
        this.begin = (page - 1) * pageSize;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public boolean isDesc() {
        return desc;
    }

    public void setDesc(boolean desc) {
        this.desc = desc;
    }

    public List<MerchantConditon> getMerchantConditons() {
        return merchantConditons;
    }

    public void setMerchantConditons(List<MerchantConditon> merchantConditons) {
        this.merchantConditons = merchantConditons;
    }

    public int getBegin() {
        return begin;
    }

    public void setBegin(int begin) {
        this.begin = begin;
    }

}
    