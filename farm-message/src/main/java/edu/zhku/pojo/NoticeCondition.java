package edu.zhku.pojo;

/**
 * @author chujian
 * @ClassName NoticeCondition
 * @Description 功能描述
 * @date 2019/2/19 22:02
 */
public class NoticeCondition {
    private Notice notice;

    private int page;
    private int pageSize = 10;
    private int begin;

    public Notice getNotice() {
        return notice;
    }

    public void setNotice(Notice notice) {
        this.notice = notice;
    }

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
}
    