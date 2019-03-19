package edu.zhku.vo;

import edu.zhku.constant.Size;

/**
 * @author chujian
 * @ClassName BillItemVo
 * @Description 功能描述
 * @date 2019/3/19 15:27
 */
public class BillItemVo {

    //查询条件
    private int status;
    private Integer iid;
    private boolean mid = false;

    private Integer page;
    private Integer pageSize = Size.NORMALPAGESIZE;
    private int begin;

    //是否按照数量降序
    boolean desc = true;


    public boolean isMid() {
        return mid;
    }

    public void setMid(boolean mid) {
        this.mid = mid;
    }

    public boolean isDesc() {
        return desc;
    }

    public void setDesc(boolean desc) {
        this.desc = desc;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }


    public Integer getIid() {
        return iid;
    }

    public void setIid(Integer iid) {
        this.iid = iid;
    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
        this.begin = (this.page - 1) * pageSize;
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
    