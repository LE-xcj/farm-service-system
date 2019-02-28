package edu.zhku.pojo;

import java.util.List;

/**
 * @author chujian
 * @ClassName ItemDTO
 * @Description 功能描述
 * @date 2019/2/28 22:06
 */
public class ItemUpdateDTO {
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
    