package edu.zhku.service.impl;

import edu.zhku.constant.ExceptionMessage;
import edu.zhku.mapper.ItemMapper;
import edu.zhku.pojo.Item;
import edu.zhku.pojo.ItemCondition;
import edu.zhku.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author chujian
 * @ClassName ItemServiceImpl
 * @Description 功能描述
 * @date 2019/2/17 17:27
 */
@Service
public class ItemServiceImpl implements ItemService{


    @Autowired
    private ItemMapper itemMapper;

    /**
     * 新增商品
     * 要求：
     *  1、对象为null
     *  2、iid <= 0
     *  3、iname、mid、unit 为null， 并且“”
     *  4、price <= 0
     * @param item
     * @return
     * @throws Exception
     */
    @Override
    public int insertItem(Item item) throws Exception {

        if (isIllegal(item)){
            throw new Exception(ExceptionMessage.PARAMETORERRO);
        }

        int num = itemMapper.insertSelective(item);

        return num;
    }


    /**
     * 根据id查询商品信息
     * @param iid
     * @return
     * @throws Exception
     */
    @Override
    public Item selectItemById(Integer iid) throws Exception {
        if (isNull(iid)){
            throw new Exception(ExceptionMessage.PARAMETORERRO);
        }

        Item item = itemMapper.selectByPrimaryKey(iid);

        return item;
    }


    /**
     * 根据条件查询商品信息
     * 重点
     * @param condition
     * @return
     * @throws Exception
     */
    @Override
    public List<Item> selectByCondition(ItemCondition condition) throws Exception {

        if (null == condition) {
            throw new Exception(ExceptionMessage.OBJNULL);
        }

        List<Item> items = itemMapper.selectByCondition(condition);

        return items;
    }

    /**
     * 根据id更新信息
     * 更新之前，还是检查item是否合法
     * @param item
     * @return
     * @throws Exception
     */
    @Override
    public int updateItemById(Item item) throws Exception {
        if (isIllegal(item)) {
            throw new Exception(ExceptionMessage.PARAMETORERRO);
        }

        int num = itemMapper.updateByPrimaryKeySelective(item);
        return num;
    }


    /**
     * 根据id删除商品
     * @param iid
     * @return
     * @throws Exception
     */
    @Override
    public int deleteItemById(Integer iid) throws Exception {

        if (isNull(iid)){
            throw new Exception(ExceptionMessage.PARAMETORERRO);
        }

        int num = itemMapper.deleteByPrimaryKey(iid);

        return num;
    }

    /**
     *根据id批量删除商品
     * @param ids
     * @return
     * @throws Exception
     */
    @Override
    public int deleteItemsById(List<Integer> ids) throws Exception {


        for (Integer id : ids) {
            if (isNull(id)) {
                throw new Exception(ExceptionMessage.PARAMETORERRO);
            }
        }

        int num = itemMapper.deleteItemsById(ids);

        return num;
    }


    /**
     * 判断id是否null
     *  1、iid == null
     *  2、iid <= 0
     * @param iid
     * @return
     */
    private boolean isNull(Integer iid) {
        if (null == iid || iid <= 0){
            return true;
        }

        return false;

    }


    /**
     * 判断属性是否为null
     *  要求、只要有一个为null、“”，都视为null
     * @param attrs
     * @return
     */
    private boolean isNull(String... attrs) {

        if (null == attrs){
            return true;
        }

        for (String attr : attrs) {
            if (null == attr || "".equals(attr.trim())){
                return true;
            }
        }

        return false;
    }


    /**
     * 判断商品的信息是否合法
     * 非法：
     *  1、对象为null
     *  2、iid <= 0
     *  3、iname、mid、unit 为null， 并且“”
     *  4、price <= 0
     *
     * @param item
     * @return
     */
    private boolean isIllegal(Item item) {

        //1
        if (null == item) {
            return true;
        }

        Integer iid = item.getIid();
        String iname = item.getIname();
        String mid = item.getMid();
        String unit = item.getUnit();

        //2、3
        if (isNull(iid) || isNull(iname, mid, unit))
            return true;

        //4
        Float price = item.getPrice();
        if (price <= 0) {
            return true;
        }

        return false;

    }

}
    