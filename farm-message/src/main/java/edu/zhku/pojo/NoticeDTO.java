package edu.zhku.pojo;

import java.util.List;

/**
 * @author chujian
 * @ClassName NoticeVo
 * @Description 功能描述
 * @date 2019/3/15 20:20
 */
public class NoticeDTO {
    private List<Integer> ids;

    private int status;

    public List<Integer> getIds() {
        return ids;
    }

    public void setIds(List<Integer> ids) {
        this.ids = ids;
    }


    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
    