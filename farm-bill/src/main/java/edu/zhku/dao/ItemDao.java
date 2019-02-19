package edu.zhku.dao;

import edu.zhku.pojo.Item;
import edu.zhku.pojo.ItemCondition;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @author chujian
 * @ClassName ItemDao
 * @Description 功能描述
 * @date 2019/2/17 19:17
 */
@Component
public interface ItemDao {
    int insertSelective(Item record) throws Exception;

    Item selectByPrimaryKey(Integer iid) throws Exception;

    int updateByPrimaryKeySelective(Item record) throws Exception;

    int deleteByPrimaryKey(Integer iid) throws Exception;


    //批量删除
    int deleteItemsById(List<Integer> ids) throws Exception;

    List<Item> selectByCondition(ItemCondition condition) throws Exception;

    List<Item> selectByItem(Item item) throws Exception;
}
    