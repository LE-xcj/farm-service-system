package edu.zhku.service;

import edu.zhku.pojo.*;
import edu.zhku.vo.BillItemVo;
import edu.zhku.vo.ItemVo;
import edu.zhku.vo.MerchantVo;
import edu.zhku.vo.ShoppingCartItemVo;

import java.util.List;
import java.util.Map;

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
    List<? extends Item> selectByCondition(ItemCondition condition) throws Exception;
    int countForFarmer(ItemCondition condition) throws Exception;

    /**
     * 给商户用的条件查询
     * @param item
     * @return
     * @throws Exception
     */
    ItemVo selectByItem(ItemConditionForMerchant item) throws Exception;




    int updateItemById(Item item) throws Exception;
    int updateItemStatus(List<Integer> ids, int status) throws Exception;

    int deleteItemById(Integer iid) throws Exception;
    int deleteItemsById(List<Integer> ids) throws Exception;


    /**
     * 插入评论
     * @param evaluation
     * @return
     * @throws Exception
     */
    int insertEvaluation(Evaluation evaluation) throws Exception;

    /**
     * 根据iid查询一系列的评论数据，分页
     * @param condition
     * @return
     * @throws Exception
     */
    List<Evaluation> queryEvaluation(EvaluationDTO condition) throws Exception;

    /**
     * 计算页数
     * @param condition
     * @return
     * @throws Exception
     */
    int countEvaluation(Evaluation condition) throws Exception;

    /**
     * 计算平均分
     * @param iid
     * @return
     * @throws Exception
     */
    float avgLevel(Integer iid) throws Exception;


    //购物车那块
    /**
     * 添加
     * @param item
     * @return
     */
    int addItemToshoppingCard(ShoppingCartItemDTO item) throws Exception;

    /**
     * 移除
     * @param item
     * @return
     */
    int removeItemFromShoppingCard(ShoppingCartItemDTO item) throws Exception;


    /**
     *
     * @param fid
     * @return
     * @throws Exception
     */
    Map<String, ShoppingCartItemVo> shoppingCardList(String fid) throws Exception;

    /**
     * 批量插入评论
     * @param evaluations
     * @return
     * @throws Exception
     */
    int evaluateForList(List<Evaluation> evaluations) throws Exception;


    /**
     * 获取某一定的订单关联的评论
     * @param condition
     * @return
     * @throws Exception
     */
    Map<Integer,ItemEva> queryEvaluationByBid(EvaluationDTO condition) throws Exception;

    /**
     * 用于统计某一商品累计销售的数量
     * @param vo
     * @return
     * @throws Exception
     */
    int countItemComplete(BillItemVo vo) throws Exception;

    List<ItemNum> topItem(BillItemVo vo) throws Exception;

    List<MerchantVo> topMerchant(BillItemVo vo) throws Exception;
}
