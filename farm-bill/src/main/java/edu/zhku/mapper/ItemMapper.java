package edu.zhku.mapper;

import edu.zhku.pojo.Item;
import edu.zhku.pojo.ItemCondition;
import edu.zhku.pojo.ItemConditionForMerchant;

import java.util.List;

public interface ItemMapper {

    int insert(Item record) throws Exception;
    int insertSelective(Item record) throws Exception;

    Item selectByPrimaryKey(Integer iid) throws Exception;

    int updateByPrimaryKeySelective(Item record) throws Exception;
    int updateByPrimaryKey(Item record) throws Exception;

    int deleteByPrimaryKey(Integer iid) throws Exception;





    //批量删除
    int deleteItemsById(List<Integer> ids) throws Exception;

    List<Item> selectByCondition(ItemCondition condition) throws Exception;
    int countForFarmer(ItemCondition condition) throws Exception;


    List<Item> selectByItem(ItemConditionForMerchant item) throws Exception;
    int countForMerchant(ItemConditionForMerchant condition) throws Exception;


    //根据id批量查询
    List<Item> selectItemByIds(List<Integer> ids) throws Exception;
}