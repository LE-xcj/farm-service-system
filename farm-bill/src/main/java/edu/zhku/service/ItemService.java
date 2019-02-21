package edu.zhku.service;

import edu.zhku.pojo.Item;
import edu.zhku.pojo.ItemCondition;
import edu.zhku.pojo.ItemConditionForMerchant;
import edu.zhku.vo.ItemVo;

import java.util.List;

/**
 * @author chujian
 * @ClassName ItemService
 * @Description 功能描述
 * @date 2019/2/17 17:27
 */
public interface ItemService {

    int insertItem(Item item) throws Exception;

    /**
     * 根据商品的id查询
     * @param iid
     * @return
     * @throws Exception
     */
    Item selectItemById(Integer iid) throws Exception;

    /**
     * 给农户用的条件查询
     * @param condition
     * @return
     * @throws Exception
     */
    List<Item> selectByCondition(ItemCondition condition) throws Exception;
    int countForFarmer(ItemCondition condition) throws Exception;

    /**
     * 给商户用的条件查询
     * @param item
     * @return
     * @throws Exception
     */
    ItemVo selectByItem(ItemConditionForMerchant item) throws Exception;




    int updateItemById(Item item) throws Exception;

    int deleteItemById(Integer iid) throws Exception;
    int deleteItemsById(List<Integer> ids) throws Exception;
}
