package edu.zhku.dao;

import edu.zhku.pojo.*;
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


    /**
     * 农户专用，条件查询商品
     * @param condition
     * @return
     * @throws Exception
     */
    List<Item> selectByCondition(ItemCondition condition) throws Exception;


    /**
     * 统计满足农户查询条件的商品数量，用于计算页数
     * @param condition
     * @return
     * @throws Exception
     */
    int countForFarmer(ItemCondition condition) throws Exception;

    /**
     * 商户专用的商品条件查询接口
     * @param item
     * @return
     * @throws Exception
     */
    List<Item> selectByItem(ItemConditionForMerchant item) throws Exception;

    /**
     * 统计满足商户条件查询的商品数量
     * @param condition
     * @return
     * @throws Exception
     */
    int countForMerchant(ItemConditionForMerchant condition) throws Exception;


    /**
     * 根据id集合批量查询商品
     * @param ids
     * @return
     * @throws Exception
     */
    List<Item> selectItemByIds(List<Integer> ids) throws Exception;

    /**
     * 批量更新商品状态
     * @param ids
     * @param status
     * @return
     * @throws Exception
     */
    int updateItemStatus(List<Integer> ids, int status) throws Exception;

    /**
     * 插入评论
     * @param evaluation
     * @return
     */
    int insertEvaluation(Evaluation evaluation) throws Exception;

    /**
     * 查询评论
     * @param condition
     * @return
     */
    List<Evaluation> queryEvaluation(EvaluationDTO condition) throws Exception;

    /**
     * 计算总数
     * @param condition
     * @return
     */
    int countEvaluation(Evaluation condition) throws Exception;

    /**
     * 计算平均评分
     * @param iid
     * @return
     * @throws Exception
     */
    float avgLevel(Integer iid) throws Exception;


    /**
     * 获取redis那边的数据
     * @param fid
     * @return
     */
    List<ItemBrief> getItemBrief(String fid) throws Exception;

    /**
     * 更新数据
     * @param fid
     * @param items
     * @return
     * @throws Exception
     */
    int updateItemFromShoppingCard(String fid, List<ItemBrief> items) throws Exception;

    /**
     *
     * @param evaluations
     * @return
     * @throws Exception
     */
    int evaluateForList(List<Evaluation> evaluations) throws Exception;
}
    