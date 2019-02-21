package edu.zhku.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import edu.zhku.constant.ExceptionMessage;
import edu.zhku.dao.ItemDao;
import edu.zhku.mapper.ItemMapper;
import edu.zhku.pojo.Item;
import edu.zhku.pojo.ItemCondition;
import edu.zhku.pojo.ItemConditionForMerchant;
import edu.zhku.pojo.MerchantConditon;
import edu.zhku.service.FarmerServiceFacade;
import edu.zhku.service.ItemService;
import edu.zhku.service.MerchantServiceFacade;
import edu.zhku.util.AMapUtil;
import edu.zhku.util.PageUtil;
import edu.zhku.vo.ItemVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

/**
 * @author chujian
 * @ClassName ItemServiceImpl
 * @Description 功能描述
 * @date 2019/2/17 17:27
 */
@Service
public class ItemServiceImpl implements ItemService{


    @Autowired
    private ItemDao itemDao;

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

        int num = itemDao.insertSelective(item);

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

        Item item = itemDao.selectByPrimaryKey(iid);

        return item;
    }



    @Autowired
    private FarmerServiceFacade farmerServiceFacade;

    @Autowired
    private MerchantServiceFacade merchantServiceFacade;
    /**
     * 根据条件查询商品信息
     * 重点,给农户调用的s
     * @param condition
     * @return
     * @throws Exception
     */
    @Override
    public List<Item> selectByCondition(ItemCondition condition) throws Exception {

        if (null == condition) {
            throw new Exception(ExceptionMessage.OBJNULL);
        }

        //获取农户的location
        String fid = condition.getFid();
        String destination = getDestination(fid);

        if (null == destination) {
            throw new Exception(ExceptionMessage.LOCATIONNULL);
        }

        //根据address模糊查询该位置范围的商户
        String address = condition.getAddress();
        List<MerchantConditon> merchantConditons = getMerchantCondition(address, destination);

        //如果该地区没有商户入驻
        if (null == merchantConditons){
            return new ArrayList<>();
        }

        //对merchantCondition按照距离进行升序排序
        Collections.sort(merchantConditons);

        //填充查询条件
        condition.setMerchantConditons(merchantConditons);

        List<Item> items = itemDao.selectByCondition(condition);
        return items;
    }

    @Override
    public int countForFarmer(ItemCondition condition) throws Exception {
        int total = itemDao.countForFarmer(condition);
        int totalPage = PageUtil.count(total, condition.getPageSize());
        return totalPage;
    }


    /**
     * 根据item条件查询
     * 给商户用的
     * @param condition
     * @return
     * @throws Exception
     */
    @Override
    public ItemVo selectByItem(ItemConditionForMerchant condition) throws Exception {

        if (null == condition) {
            throw new Exception(ExceptionMessage.OBJNULL);
        }

        List<Item> items = itemDao.selectByItem(condition);

        int total = itemDao.countForMerchant(condition);
        int totalPage = PageUtil.count(total, condition.getPageSize());

        ItemVo vo = new ItemVo();
        vo.setItems(items);
        vo.setTotalPage(totalPage);


        return vo;
    }


    private List<MerchantConditon> getMerchantCondition(String address, String destination) {

        //调用登录系统查询商户的接口，根据address模糊查询指定范围内的商户
        String merchantsStr = merchantServiceFacade.queryMerchantByAddress(address);
        JSONArray merchants = JSON.parseArray(merchantsStr);

        //设置origins，准备调用高德的查询两点之间距离的接口
        int length = merchants.size();
        if (length == 0) {
            return null;
        }
        String[] origins = new String[length];

        List<MerchantConditon> merchantConditons = new ArrayList<>(length);

        for (int i =0; i<length; ++i) {

            //获取商户结果集中商户的location
            JSONObject merchant = merchants.getJSONObject(i);
            origins[i] = merchant.getString("location");

            //设置商户id，用于对距离进行排序，以及dao层查询该商户对应的服务商品
            MerchantConditon conditon = new MerchantConditon();
            String mid = merchant.getString("mid");
            conditon.setMid(mid);

            //添加到查询条件中
            merchantConditons.add(conditon);
        }

        //获得距离集合
        List<Integer> distance = AMapUtil.distance(destination, origins);

        //开始填充
        for (int i=0; i<length; ++i) {

            //获取对应位置的merchant
            MerchantConditon merchantConditon = merchantConditons.get(i);

            //填充距离
            merchantConditon.setDistance(distance.get(i));
        }

        return merchantConditons;
    }

    /**
     * 获取指定农户的location
     * @param fid
     * @return
     */
    private String getDestination(String fid) {
        //调用登录系统的服务，查询指定id的农户的location
        String farmerStr = farmerServiceFacade.queryFarmerById(fid);

        JSONObject farmer = JSON.parseObject(farmerStr);
        String destination = farmer.getString("location");

        return destination;
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
        if (isIllegal(item) || isNull(item.getIid())) {
            throw new Exception(ExceptionMessage.PARAMETORERRO);
        }

        int num = itemDao.updateByPrimaryKeySelective(item);
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

        int num = itemDao.deleteByPrimaryKey(iid);

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

        int num = itemDao.deleteItemsById(ids);

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

        String iname = item.getIname();
        String mid = item.getMid();
        String unit = item.getUnit();

        //2、3
        if (isNull(iname, mid, unit))
            return true;

        //4
        Float price = item.getPrice();
        if (price <= 0) {
            return true;
        }

        return false;

    }
}
    