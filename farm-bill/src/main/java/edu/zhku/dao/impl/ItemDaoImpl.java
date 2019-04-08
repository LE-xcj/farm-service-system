package edu.zhku.dao.impl;

import com.alibaba.fastjson.JSON;
import edu.zhku.constant.Table;
import edu.zhku.dao.ItemDao;
import edu.zhku.mapper.EvaluationMapper;
import edu.zhku.mapper.ItemMapper;
import edu.zhku.pojo.*;
import edu.zhku.util.RedisUtil;
import edu.zhku.vo.BillItemVo;
import edu.zhku.vo.ItemMerchantVo;
import javafx.scene.control.Tab;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author chujian
 * @ClassName ItemDaoImpl
 * @Description 功能描述
 * @date 2019/2/18 20:57
 */
@Component
public class ItemDaoImpl implements ItemDao {

    @Autowired
    private ItemMapper itemMapper;


    @Autowired
    private RedisUtil redisUtil;

    /**
     * 插入，这里就不同步到redis。因为id在数据库中是自动递增的
     * @param record
     * @return
     * @throws Exception
     */
    @Override
    public int insertSelective(Item record) throws Exception {

        int num = itemMapper.insertSelective(record);

        return num;
    }


    /**
     * 根据id查询
     * @param iid
     * @return
     * @throws Exception
     */
    @Override
    public Item selectByPrimaryKey(Integer iid) throws Exception {

        Item item = getItem(iid);

        if (null == item) {
            item = itemMapper.selectByPrimaryKey(iid);
            saveOne(item);
        }


        return item;
    }


    /**
     * 根据id更新
     * @param record
     * @return
     * @throws Exception
     */
    @Override
    public int updateByPrimaryKeySelective(Item record) throws Exception {

        int num = itemMapper.updateByPrimaryKeySelective(record);

        //更新成功就同步到redis中
        if (1 == num) {
            Item item = itemMapper.selectByPrimaryKey(record.getIid());
            saveOne(item);
        }
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

    /**
     * 条件查询，交给mysql
     * @param condition
     * @return
     * @throws Exception
     */
    @Override
    public List<Item> selectByCondition(ItemCondition condition) throws Exception {

        List<Item> items = itemMapper.selectByCondition(condition);

        return items;
    }

    /**
     * 根据ids集合批量查询item，对返回结果集种的item顺序没有强制
     * 也就是ids中的位置与item集合中item不用一一对应
     * @param ids
     * @return
     * @throws Exception
     */
    @Override
    public List<Item> selectItemByIds(List<Integer> ids) throws Exception {

        List<String> stingIds = transformIds(ids);

        //从redis那边批量获取
        List<Object> list = redisUtil.hmultiGet(Table.ITEMTABLE, stingIds);

        //数据准备
        int length = ids.size();
        List<Item> items = new ArrayList<>(length);

        //用于向mysql查缺补漏
        List<Integer> temp = new ArrayList<>();

        //遍历
        for (int i=0; i<length; ++i) {
            Object obj = list.get(i);

            //redis那边找不到
            if (null == obj) {
                //添加到查缺补漏阵营
                Integer iid = ids.get(i);
                temp.add(iid);

            } else {

                //添加到返回的结果集中
                Item item = (Item) obj;
                items.add(item);

            }
        }

        //判断是否需要从mysql查询
        if (!temp.isEmpty()) {
            List<Item> data = itemMapper.selectItemByIds(temp);
            items.addAll(data);

            //同步到redis中
            patchSave(data);
        }

        return items;
    }

    /**
     * 批量更新商品状态
     * @param ids
     * @param status
     * @return
     * @throws Exception
     */
    @Override
    public int updateItemStatus(List<Integer> ids, int status) throws Exception {
        int num = itemMapper.updateItemStatus(ids, status);

        if (num > 0) {
            //批量从mysql中获取
            List<Item> items = itemMapper.selectItemByIds(ids);

            //同步到redis中
            patchSave(items);
        }
        return num;
    }



    /**
     * 农户专用的商品总数查询接口
     * @param condition
     * @return
     * @throws Exception
     */
    @Override
    public int countForFarmer(ItemCondition condition) throws Exception {
        int num = itemMapper.countForFarmer(condition);
        return num;
    }


    /**
     * 商户专用的商品条件查询接口
     * @param item
     * @return
     * @throws Exception
     */
    @Override
    public List<Item> selectByItem(ItemConditionForMerchant item) throws Exception {
        List<Item> items = itemMapper.selectByItem(item);
        return items;
    }

    /**
     * 统计满足商户条件查询的商品数量
     * @param condition
     * @return
     * @throws Exception
     */
    @Override
    public int countForMerchant(ItemConditionForMerchant condition) throws Exception {
        int count = itemMapper.countForMerchant(condition);
        return count;
    }


    /**
     * 查询服务的销量，订单为完成
     * @param vo
     * @return
     * @throws Exception
     */
    @Override
    public List<ItemMerchantVo> countItemComplete(BillItemVo vo) throws Exception {
        List<ItemMerchantVo> result = itemMapper.countItemComplete(vo);
        return result;
    }




    //////////////////////////////////////////////////
    //////////////////评论那部分////////////////////////////
    //////////////////////////////////////////////////
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





    //////////////////////////////////////////////////
    /////////////////购物车那块////////////////////////////
    //////////////////////////////////////////////////

    /**
     * 购物车这块
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







    //////////////////////////////////////////////////
    ///////////////////private////////////////////////////
    //////////////////////////////////////////////////

    /**
     * 从redis那边查询
     * @param iid
     * @return
     */
    private Item getItem(Integer iid) {

        Object obj = redisUtil.hmGet(Table.ITEMTABLE, iid.toString());
        Item item = (Item) obj;
        return item;
    }

    /**
     * 保存到redis那边
     * @param item
     */
    private void saveOne(Item item) {

        redisUtil.hmSet(Table.ITEMTABLE, item.getIid().toString(), item);

    }


    /**
     * 批量插入到redis中
     * @param items
     */
    private void patchSave(List<Item> items) {

        if (items.isEmpty()) {
            return;
        }

        Map<String, Item> data = new HashMap<>();

        for (Item item : items) {
            String iid = item.getIid().toString();
            data.put(iid, item);
        }

        redisUtil.hmultiSet(Table.ITEMTABLE, data);

    }


    /**
     * 转换数据类型
     * @param ids
     * @return
     */
    private List<String> transformIds(List<Integer> ids) {

        List<String> result = new ArrayList<>();
        if (ids.isEmpty())
            return result;

        for (Integer id : ids) {
            String sid = id.toString();
            result.add(sid);
        }

        return result;
    }
}
    