package edu.zhku.mapper;

import edu.zhku.pojo.Item;
import edu.zhku.pojo.ItemCondition;
import edu.zhku.pojo.ItemConditionForMerchant;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ItemMapper {

    int insert(Item record) throws Exception;
    int insertSelective(Item record) throws Exception;

    Item selectByPrimaryKey(Integer iid) throws Exception;

    int updateByPrimaryKeySelective(Item record) throws Exception;
    int updateByPrimaryKey(Item record) throws Exception;

    int deleteByPrimaryKey(Integer iid) throws Exception;







    //批量删除
    int deleteItemsById(@Param("ids") List<Integer> ids) throws Exception;

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
    List<Item> selectItemByIds(@Param("ids") List<Integer> ids) throws Exception;
}