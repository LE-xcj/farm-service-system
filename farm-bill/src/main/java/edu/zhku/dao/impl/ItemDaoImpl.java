package edu.zhku.dao.impl;

import edu.zhku.constant.Table;
import edu.zhku.dao.ItemDao;
import edu.zhku.mapper.ItemMapper;
import edu.zhku.pojo.Item;
import edu.zhku.pojo.ItemCondition;
import edu.zhku.pojo.ItemConditionForMerchant;
import edu.zhku.util.RedisUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @author chujian
 * @ClassName ItemDaoImpl
 * @Description 功能描述
 * @date 2019/2/18 20:57
 */

//todo 需要整合redis优化查询
@Component
public class ItemDaoImpl implements ItemDao {

    @Autowired
    private ItemMapper itemMapper;

    @Autowired
    private RedisUtil redisUtil;

    @Override
    public int insertSelective(Item record) throws Exception {

        int num = itemMapper.insertSelective(record);
        return num;
    }

    @Override
    public Item selectByPrimaryKey(Integer iid) throws Exception {

        Item item = itemMapper.selectByPrimaryKey(iid);

        return item;
    }

    @Override
    public int updateByPrimaryKeySelective(Item record) throws Exception {

        int num = itemMapper.updateByPrimaryKeySelective(record);
        return num;
    }

    @Override
    public int deleteByPrimaryKey(Integer iid) throws Exception {

        int num = itemMapper.deleteByPrimaryKey(iid);

        return num;
    }

    @Override
    public int deleteItemsById(List<Integer> ids) throws Exception {

        int num = itemMapper.deleteItemsById(ids);

        return num;
    }

    @Override
    public List<Item> selectByCondition(ItemCondition condition) throws Exception {

        List<Item> items = itemMapper.selectByCondition(condition);

        return items;
    }

    @Override
    public List<Item> selectItemByIds(List<Integer> ids) throws Exception {

        return itemMapper.selectItemByIds(ids);
    }

    @Override
    public int updateItemStatus(List<Integer> ids, int status) throws Exception {
        int num = itemMapper.updateItemStatus(ids, status);
        return num;
    }

    @Override
    public int countForFarmer(ItemCondition condition) throws Exception {
        int num = itemMapper.countForFarmer(condition);
        return num;
    }

    @Override
    public List<Item> selectByItem(ItemConditionForMerchant item) throws Exception {
        List<Item> items = itemMapper.selectByItem(item);
        return items;
    }

    @Override
    public int countForMerchant(ItemConditionForMerchant condition) throws Exception {
        int count = itemMapper.countForMerchant(condition);
        return count;
    }
}
    