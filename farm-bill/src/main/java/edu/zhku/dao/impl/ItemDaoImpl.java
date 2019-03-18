package edu.zhku.dao.impl;

import com.alibaba.fastjson.JSON;
import edu.zhku.constant.Table;
import edu.zhku.dao.ItemDao;
import edu.zhku.mapper.EvaluationMapper;
import edu.zhku.mapper.ItemMapper;
import edu.zhku.pojo.*;
import edu.zhku.util.RedisUtil;
import edu.zhku.vo.BillStatusVo;
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


    @Autowired
    private EvaluationMapper evaluationMapper;
    /**
     * 评论那块
     * @param evaluation
     * @return
     * @throws Exception
     */
    @Override
    public int insertEvaluation(Evaluation evaluation) throws Exception {
        int num = evaluationMapper.insertSelective(evaluation);
        return num;
    }

    /**
     * 批量插入评论
     * @param evaluations
     * @return
     * @throws Exception
     */
    @Override
    public int evaluateForList(List<Evaluation> evaluations) throws Exception {
        int num = evaluationMapper.evaluateForList(evaluations);
        return num;
    }


    /**
     * 查询评论
     * @param condition
     * @return
     * @throws Exception
     */
    @Override
    public List<Evaluation> queryEvaluation(EvaluationDTO condition) throws Exception {
        List<Evaluation> evaluations = evaluationMapper.selectByCondition(condition);
        return evaluations;
    }

    /**
     * 计算总数
     * @param condition
     * @return
     * @throws Exception
     */
    @Override
    public int countEvaluation(Evaluation condition) throws Exception {

        int total = evaluationMapper.countEvaluation(condition);
        return total;
    }

    /**
     * 计算平均评分
     * @param iid
     * @return
     * @throws Exception
     */
    @Override
    public float avgLevel(Integer iid) throws Exception {
        float avg = evaluationMapper.avgLevel(iid);
        return avg;
    }


    /**
     * 从redis那边获取
     * @param fid
     * @return
     * @throws Exception
     */
    @Override
    public List<ItemBrief> getItemBrief(String fid) throws Exception {

        //强转为String
        String value = (String) redisUtil.hmGet(Table.SHOPPINGCART, fid);

        //转为list
        List<ItemBrief> briefs = JSON.parseArray(value, ItemBrief.class);

        return briefs;
    }

    /**
     * 从redis那边操作
     * @param fid
     * @param items
     * @return
     * @throws Exception
     */
    @Override
    public int updateItemFromShoppingCard(String fid, List<ItemBrief> items) throws Exception {

        //以防万一，还是转为string
        String value = JSON.toJSONString(items);
        redisUtil.hmSet(Table.SHOPPINGCART, fid, value);

        return 1;
    }


}
    