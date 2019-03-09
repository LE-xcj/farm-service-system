package edu.zhku.pojo;

import java.util.List;

/**
 * @author chujian
 * @ClassName ShoppingCartItemDTO
 * @Description 功能描述
 * @date 2019/3/9 14:38
 */
public class ShoppingCartItemDTO {

    private String fid;

    private List<Integer> ids;

    private ItemBrief brief;

    public String getFid() {
        return fid;
    }

    public void setFid(String fid) {
        this.fid = fid;
    }

    public ItemBrief getBrief() {
        return brief;
    }

    public void setBrief(ItemBrief brief) {
        this.brief = brief;
    }

    public List<Integer> getIds() {
        return ids;
    }

    public void setIds(List<Integer> ids) {
        this.ids = ids;
    }
}
    