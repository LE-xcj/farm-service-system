package edu.zhku.service;

import edu.zhku.pojo.Item;
import edu.zhku.pojo.ItemCondition;

import java.util.List;

/**
 * @author chujian
 * @ClassName ItemService
 * @Description 功能描述
 * @date 2019/2/17 17:27
 */
public interface ItemService {

    int insertItem(Item item) throws Exception;

    Item selectItemById(Integer iid) throws Exception;
    List<Item> selectByCondition(ItemCondition condition) throws Exception;

    int updateItemById(Item item) throws Exception;

    int deleteItemById(Integer iid) throws Exception;
    int deleteItemsById(List<Integer> ids) throws Exception;
}
