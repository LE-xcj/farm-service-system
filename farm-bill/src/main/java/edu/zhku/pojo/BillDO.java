package edu.zhku.pojo;

import java.util.List;

/**
 * @author chujian
 * @ClassName BillItemDTO
 * @Description 功能描述
 * @date 2019/2/22 14:39
 */

public class BillDO extends Bill{

    private List<Integer> itemIds;

    private List<Integer> nums;

    private List<String> operators;

    public List<Integer> getItemIds() {
        return itemIds;
    }

    public void setItemIds(List<Integer> itemIds) {
        this.itemIds = itemIds;
    }

    public List<Integer> getNums() {
        return nums;
    }

    public void setNums(List<Integer> nums) {
        this.nums = nums;
    }

    public List<String> getOperators() {
        return operators;
    }

    public void setOperators(List<String> operators) {
        this.operators = operators;
    }
}
    