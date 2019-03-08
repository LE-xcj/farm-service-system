package edu.zhku.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import edu.zhku.constant.ExceptionMessage;
import edu.zhku.dao.ItemDao;
import edu.zhku.pojo.*;
import edu.zhku.service.FarmerServiceFacade;
import edu.zhku.service.ItemService;
import edu.zhku.service.MerchantServiceFacade;
import edu.zhku.util.AMapUtil;
import edu.zhku.util.PageUtil;
import edu.zhku.vo.ItemExpandVo;
import edu.zhku.vo.ItemVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

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
    public List<? extends Item> selectByCondition(ItemCondition condition) throws Exception {

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

        //返回map，是为了能够方便后面对距离进行排序时，能够快速通过mid获取对应的查询条件
        Map<String, MerchantConditon> mapTable = getMerchantCondition(address, destination);

        //如果该地区没有商户入驻
        if (null == mapTable){
            return new ArrayList<>();
        }

        //将查询条件，转成list
        List<MerchantConditon> merchantConditons = new ArrayList<>(mapTable.values());

        //填充查询条件
        condition.setMerchantConditons(merchantConditons);

        //初步查询的商品（先筛选地域里的商户，然后查询对应的商品，按照价格进行升序排序）
        List<Item> items = itemDao.selectByCondition(condition);

        //类似中间人
        List<? extends Item> result;

        //位置优先排序
        if (condition.getLocationFirst()){
            //根据位置的远近对item进行排序
            result = sortItem(mapTable, items, destination);
        } else {
            result = items;
        }

        return result;
    }

    /**
     * 前提条件是：如果价格相等，那么就按照距离的远近升序排序
     * 对商品进行距离的排序
     * @param mapTable
     * @param items
     */
    private List<ItemExpandVo> sortItem(Map<String, MerchantConditon> mapTable, List<Item> items, String destination) {

        int length = items.size();

        List<ItemExpandVo> itemExpandVos = new ArrayList<>(length);

        //设置origins，准备调用高德的查询两点之间距离的接口
        String[] origins = new String[length];

        for (int i=0; i<length; ++i) {

            Item item = items.get(i);
            String mid = item.getMid();

            //获取容器
            MerchantConditon merchantConditon = mapTable.get(mid);

            //填充origins
            origins[i] = merchantConditon.getLocation();

            //包装
            ItemExpandVo vo = new ItemExpandVo();
            fill(vo, item);
            vo.setMerchantConditon(merchantConditon);

            //添加到集合中
            itemExpandVos.add(vo);
        }

        //获得距离集合
        List<Integer> distance = AMapUtil.distance(destination, origins);

        //开始填充
        for (int i=0; i<length; ++i) {

            ItemExpandVo itemExpandVo = itemExpandVos.get(i);

            //获取对应位置的merchant
            MerchantConditon merchantConditon = itemExpandVo.getMerchantConditon();

            //填充距离
            merchantConditon.setDistance(distance.get(i));
        }

        //排序
        Collections.sort(itemExpandVos);

        return itemExpandVos;
    }

    /**
     * 填充
     * @param vo
     * @param item
     */
    private void fill(ItemExpandVo vo, Item item) {
        vo.setIid(item.getIid());
        vo.setIname(item.getIname());
        vo.setPrice(item.getPrice());
        vo.setUnit(item.getUnit());
        vo.setMedia(item.getMedia());
        vo.setDescription(item.getDescription());
        vo.setMid(item.getMid());
        vo.setStatus(item.getStatus());
    }


    /**
     * 计算总页数
     * @param condition
     * @return
     * @throws Exception
     */
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


    /**
     * 模糊搜索附近商户
     * @param address
     * @param destination
     * @return
     */
    private Map<String, MerchantConditon> getMerchantCondition(String address, String destination) {

        //调用登录系统查询商户的接口，根据address模糊查询指定范围内的商户
        String merchantsStr = merchantServiceFacade.queryMerchantByAddress(address);
        JSONArray merchants = JSON.parseArray(merchantsStr);

        int length = merchants.size();
        if (length == 0) {
            return null;
        }

        //设置origins，准备调用高德的查询两点之间距离的接口
        //String[] origins = new String[length];

        Map<String, MerchantConditon> merchantConditons = new HashMap<>(length);

        for (int i =0; i<length; ++i) {

            //获取商户结果集中商户的location
            JSONObject merchant = merchants.getJSONObject(i);

            //origins[i] = merchant.getString("location");

            //设置商户id，用于对距离进行排序，以及dao层查询该商户对应的服务商品
            MerchantConditon conditon = new MerchantConditon();
            String mid = merchant.getString("mid");
            String location = merchant.getString("location");

            conditon.setMid(mid);
            conditon.setLocation(location);

            //添加到查询条件中
            merchantConditons.put(mid, conditon);
        }

        //获得距离集合
        //List<Integer> distance = AMapUtil.distance(destination, origins);

        //开始填充
//        for (int i=0; i<length; ++i) {
//
//            //获取对应位置的merchant
//            MerchantConditon merchantConditon = merchantConditons.get(i);
//
//            //填充距离
//            //merchantConditon.setDistance(distance.get(i));
//        }

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
     * 批量更新item信息
     * @param ids
     * @param status
     * @return
     * @throws Exception
     */
    @Override
    public int updateItemStatus(List<Integer> ids, int status) throws Exception {
        if (null == ids || ids.isEmpty()) {
            throw new Exception(ExceptionMessage.OBJNULL);
        }
        int num = itemDao.updateItemStatus(ids, status);
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
     *
     * 插入评论
     * @param evaluation
     * @return
     * @throws Exception
     */
    @Override
    public int insertEvaluation(Evaluation evaluation) throws Exception {
        if (null == evaluation) {
            throw new Exception(ExceptionMessage.OBJNULL);
        }
        int num = itemDao.insertEvaluation(evaluation);
        return num;
    }

    /**
     * 查询某个商品的评论
     * @param condition
     * @return
     * @throws Exception
     */
    @Override
    public List<Evaluation> queryEvaluation(EvaluationDTO condition) throws Exception {
        if (null == condition) {
            throw new Exception(ExceptionMessage.OBJNULL);
        }
        List<Evaluation> result = itemDao.queryEvaluation(condition);
        return result;
    }

    /**
     * 计算总数
     * @param condition
     * @return
     * @throws Exception
     */
    @Override
    public int countEvaluation(Evaluation condition) throws Exception {
        if (null == condition) {
            throw new Exception(ExceptionMessage.OBJNULL);
        }
        int num = itemDao.countEvaluation(condition);
        return num;
    }

    /**
     * 计算一个商品的平均评分
     * @param iid
     * @return
     * @throws Exception
     */
    @Override
    public float avgLevel(Integer iid) throws Exception {

        if (null == iid) {
            throw new Exception(ExceptionMessage.OBJNULL);
        }

        float avg = itemDao.avgLevel(iid);

        return avg;
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
    