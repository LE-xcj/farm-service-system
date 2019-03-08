package edu.zhku.vo;

import edu.zhku.pojo.Item;

import java.util.List;

/**
 * @author chujian
 * @ClassName ItemVo
 * @Description 功能描述
 * @date 2019/2/21 12:32
 */
public class ItemVo {

    private List<? extends Item> items;

    private int totalPage;

    public List<? extends Item> getItems() {
        return items;
    }

    public void setItems(List<? extends Item> items) {
        this.items = items;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }
}
    