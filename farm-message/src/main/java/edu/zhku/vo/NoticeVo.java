package edu.zhku.vo;

import edu.zhku.pojo.Notice;

import java.util.List;

/**
 * @author chujian
 * @ClassName NoticeVo
 * @Description 功能描述
 * @date 2019/2/19 22:18
 */
public class NoticeVo {

    private List<Notice> notices;

    private int totalPage;

    public List<Notice> getNotices() {
        return notices;
    }

    public void setNotices(List<Notice> notices) {
        this.notices = notices;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }
}
    