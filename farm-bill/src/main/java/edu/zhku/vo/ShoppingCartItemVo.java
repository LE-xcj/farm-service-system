package edu.zhku.vo;

import edu.zhku.pojo.ItemNum;

import java.util.ArrayList;
import java.util.List;

/**
 * @author chujian
 * @ClassName ShoppingCartItemVo
 * @Description 功能描述
 * @date 2019/3/9 14:25
 */
public class ShoppingCartItemVo {

    private Object merchant;
    private List<ItemNum> itemNums = new ArrayList<>();

    public Object getMerchant() {
        return merchant;
    }

    public void setMerchant(Object merchant) {
        this.merchant = merchant;
    }

    public List<ItemNum> getItemNums() {
        return itemNums;
    }

    public void setItemNums(List<ItemNum> itemNums) {
        this.itemNums = itemNums;
    }
}
    