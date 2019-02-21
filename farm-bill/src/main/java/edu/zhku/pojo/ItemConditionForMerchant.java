package edu.zhku.pojo;

import edu.zhku.constant.Size;

/**
 * @author chujian
 * @ClassName ItemConditionForMerchant
 * @Description 功能描述
 * @date 2019/2/21 12:25
 */
public class ItemConditionForMerchant {
    private Item item;

    private int page;

    private int begin;

    private int pageSize = Size.ITEMPAGESIZE;

    public Item getItem() {
        return item;
    }

    public void setItem(Item item) {
        this.item = item;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
        this.begin = (page - 1) * pageSize;
    }

    public int getBegin() {
        return begin;
    }

    public void setBegin(int begin) {
        this.begin = begin;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }
}
    