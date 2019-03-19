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
import edu.zhku.vo.*;
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
     * 批量插入评论
     * @param evaluations
     * @return
     * @throws Exception
     */
    @Override
    public int evaluateForList(List<Evaluation> evaluations) throws Exception {
        if (null == evaluations || evaluations.isEmpty()) {
            throw new Exception(ExceptionMessage.OBJNULL);
        }
        int num = itemDao.evaluateForList(evaluations);
        return num;
    }


    /**
     * 根据bid查询关联的评论
     * @param condition
     * @return
     * @throws Exception
     */
    @Override
    public Map<Integer, ItemEva> queryEvaluationByBid(EvaluationDTO condition) throws Exception {

        if (condition == null || condition.getBid() == null) {
            throw new Exception(ExceptionMessage.OBJNULL);
        }


        //关联的评论
        List<Evaluation> evaluations = itemDao.queryEvaluation(condition);
        int size = evaluations.size();
        if (size == 0){
            return new HashMap<>();
        }
        Map<Integer, ItemEva> result = new HashMap<>(size);

        //第一步初始化,用商品id作为key
        //对于某一订单，商品和评论就是一对一的关系
        for (Evaluation evaluation : evaluations) {

            Integer iid = evaluation.getIid();
            ItemEva itemEva = new ItemEva();
            itemEva.setEvaluation(evaluation);

            result.put(iid, itemEva);
        }

        //批量查询item
        List<Integer> ids = new ArrayList<>(result.keySet());
        List<Item> items = itemDao.selectItemByIds(ids);

        //包装
        for (Item item : items) {
            Integer iid = item.getIid();
            ItemEva itemEva = result.get(iid);
            itemEva.setItem(item);
        }

        return result;
    }

    /**
     * 统计某个商品的销量
     * @param vo
     * @return
     * @throws Exception
     */
    @Override
    public int countItemComplete(BillItemVo vo) throws Exception {

        isNull(vo);

        List<ItemMerchantVo> itemMerchantVos = itemDao.countItemComplete(vo);

       if (isNull(itemMerchantVos)) {
           return 0;
       }

        ItemMerchantVo itemMerchantVo = itemMerchantVos.get(0);
        int num = itemMerchantVo.getTotal();

        return num;
    }

    /**
     * 查询销量比比较好的item
     * @param vo
     * @return
     * @throws Exception
     */
    @Override
    public List<ItemNum> topItem(BillItemVo vo) throws Exception {

        isNull(vo);

        List<ItemMerchantVo> vos = itemDao.countItemComplete(vo);

        if (isNull(vos)) {
            return new ArrayList<>();
        }

        //进行包装
        Map<Integer, ItemNum> result = new LinkedHashMap<>();
        for (ItemMerchantVo v : vos) {

            ItemNum itemNum = new ItemNum();
            itemNum.setNum(v.getTotal());

            Integer iid = v.getIid();
            result.put(iid, itemNum);
        }


        //批量查询item
        List<Integer> iids = new ArrayList<>(result.keySet());
        List<Item> items = itemDao.selectItemByIds(iids);

        //重新组装
        for (Item item : items) {
            Integer iid = item.getIid();

            ItemNum itemNum = result.get(iid);
            itemNum.setItem(item);
        }

        List<ItemNum> data = new ArrayList<>(result.values());

        return data;
    }

    /**
     * 查询销量不错的商户
     * @param vo
     * @return
     * @throws Exception
     */
    @Override
    public List<ItemMerchantVo> topMerchant(BillItemVo vo) throws Exception {

        isNull(vo);

        List<ItemMerchantVo> data = itemDao.countItemComplete(vo);

        return data;
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
     * 添加或者更新数量
     * @param item
     * @return
     * @throws Exception
     */
    @Override
    public int addItemToshoppingCard(ShoppingCartItemDTO item) throws Exception {
        if (item == null) {
            throw new Exception(ExceptionMessage.OBJNULL);
        }

        String fid = item.getFid();
        List<ItemBrief> briefs = addOrUpage(item);

        int num = itemDao.updateItemFromShoppingCard(fid, briefs);
        return num;
    }


    @Override
    public int removeItemFromShoppingCard(ShoppingCartItemDTO item) throws Exception {
        if (item == null) {
            throw new Exception(ExceptionMessage.OBJNULL);
        }

        //获取购物车的信息
        List<ItemBrief> briefs = getItemBrief(item);

        //需要删除的item
        List<Integer> ids = item.getIds();

        //对briefs进行删除
        removeItemFromShoppingCard(briefs, ids);

        //更新信息
        String fid = item.getFid();
        int num = itemDao.updateItemFromShoppingCard(fid, briefs);

        return num;
    }

    /**
     * 对briefs进行删除操作
     * @param briefs
     * @param ids
     * @return
     */
    private void removeItemFromShoppingCard (List<ItemBrief> briefs, List<Integer> ids) {

        //遍历移除
        Iterator<ItemBrief> iterator = briefs.iterator();
        while (iterator.hasNext()) {
            ItemBrief brief = iterator.next();

            Integer iid = brief.getIid();

            //如果ids有，就删除
            if (ids.contains(iid)) {
                iterator.remove();
            }
        }

    }


    /**
     * 获取某个农户的购物车信息
     * @param fid
     * @return
     * @throws Exception
     */
    @Override
    public Map<String, ShoppingCartItemVo> shoppingCardList(String fid) throws Exception {

        //从redis那边获取购物车的简要信息
        List<ItemBrief> briefs = getItemBrief(fid);

        int length = briefs.size();

        //准备返回的vo, mid —> item视图
        Map<String, ShoppingCartItemVo> result = new HashMap<>(length);

        //购物车有东西
        if (length != 0) {

            //iid ->  num
            Map<Integer, Integer> nums = new HashMap<>(length);

            //进行初始化
            for (ItemBrief brief : briefs) {

                //初始化nums
                Integer iid = brief.getIid();
                Integer num = brief.getNum();
                nums.put(iid, num);

                //初始化返回的vo
                String mid = brief.getMid();
                ShoppingCartItemVo vo = new ShoppingCartItemVo();
                result.put(mid, vo);

            }

            //批量查询商品
            List<Integer> ids = new ArrayList<>(nums.keySet());
            List<Item> items = itemDao.selectItemByIds(ids);

            //包装
            packItemVo(result, items, nums);

        }

        return result;
    }


    /**
     * 包装
     * @param result
     * @param items
     * @param nums
     */
    private void packItemVo(Map<String, ShoppingCartItemVo> result, List<Item> items, Map<Integer, Integer> nums) {

        //对item进行包装
        packItem(result, items, nums);

        //对商户信息进行包装
        packMerchant(result);

    }

    /**
     * 填充item信息
     * @param result
     * @param items
     * @param nums
     */
    private void packItem(Map<String, ShoppingCartItemVo> result, List<Item> items, Map<Integer, Integer> nums) {

        //再次遍历itemss结果集
        for (Item item : items) {

            //通过item的mid定位对应的vo
            String mid = item.getMid();
            ShoppingCartItemVo vo = result.get(mid);

            if (vo == null) {
                vo = new ShoppingCartItemVo();
            }

            //根据item的id获取对应的数量
            Integer iid = item.getIid();
            int num = nums.get(iid);

            //填充itemNum，填充item信息和数量
            ItemNum itemNum = new ItemNum();
            itemNum.setItem(item);
            itemNum.setNum(num);

            //添加
            List<ItemNum> itemNums = vo.getItemNums();
            if (null == itemNums) {
                itemNums = new ArrayList<>();
            }
            itemNums.add(itemNum);


        }
    }

    /**
     * 填充merchant信息
     * @param result
     */
    private void packMerchant(Map<String, ShoppingCartItemVo> result) {

        //将mid集合转为list
        List<String> lmids = new ArrayList<>(result.keySet());

        //转为json字符串
        String mids = JSON.toJSONString(lmids);

        //获取merchant集合
        String merchants = merchantServiceFacade.queryMerchantByIds(mids);

        JSONArray array = JSON.parseArray(merchants);
        int length = array.size();

        //遍历填充merchant
        for (int i=0; i<length; ++i) {
            //获取mid属性
            JSONObject merchant = array.getJSONObject(i);
            String mid = merchant.getString("mid");

            //填充merchant信息
            ShoppingCartItemVo vo = result.get(mid);
            vo.setMerchant(array.get(i));
        }

    }


    /**
     * 添加或者更新数量
     * @param item
     * @return
     */
    private List<ItemBrief> addOrUpage(ShoppingCartItemDTO item) throws Exception {

        //定位是哪个农户的购物车, 购物车中所有商品信息简要
        List<ItemBrief> briefs = getItemBrief(item);

        //获取目标商品id
        ItemBrief source = item.getBrief();
        int iid = source.getIid();

        boolean add = true;

        Iterator<ItemBrief> iterator = briefs.iterator();

        //有可能添加，也有可能是数量更新，也有可能是删除
        while (iterator.hasNext()) {
            ItemBrief brief = iterator.next();
            if (iid == brief.getIid()) {

                //数量叠加，这里对于减少就是加负数
                int num = source.getNum() + brief.getNum();

                //数量小于=0，那么就需要移除
                if (num <= 0) {
                    iterator.remove();
                } else {
                    brief.setNum(num);
                }
                add = false;
                break;
            }
        }

        //添加到购物车
        if (add && source.getNum() > 0) {
            briefs.add(source);
        }

        return briefs;
    }


    /**
     * 从redis那边获取
     * @param fid
     * @return
     * @throws Exception
     */
    private List<ItemBrief> getItemBrief(String fid) throws Exception {
        List<ItemBrief> briefs = itemDao.getItemBrief(fid);

        if (briefs == null) {
            briefs = new ArrayList<>();
        }

        return briefs;
    }

    /**
     * 从redis那边获取
     * @param item
     * @return
     */
    private List<ItemBrief> getItemBrief(ShoppingCartItemDTO item) throws Exception {
        String fid = item.getFid();
        List<ItemBrief> briefs = getItemBrief(fid);
        return briefs;
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



    private boolean isNull(List<ItemMerchantVo> itemMerchantVos) {
        if (itemMerchantVos == null || itemMerchantVos.isEmpty()) {
            return true;
        }
        return false;
    }

    private boolean isNull(BillItemVo vo) throws Exception {
        if (null == vo) {
            throw new Exception(ExceptionMessage.OBJNULL);
        }
        return false;
    }
}
    