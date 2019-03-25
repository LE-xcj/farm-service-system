package edu.zhku.dao.impl;

import edu.zhku.constant.Table;
import edu.zhku.dao.MerchantDao;
import edu.zhku.mapper.MerchantMapper;
import edu.zhku.pojo.Merchant;
import edu.zhku.util.RedisUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author chujian
 * @ClassName MerchantDaoImpl
 * @Description 功能描述
 * @date 2019/2/15 15:27
 *
 *
 * tableName -> mid -> merchant
 */
@Component
public class MerchantDaoImpl implements MerchantDao{

    @Autowired
    private MerchantMapper merchantMapper;

    @Autowired
    private RedisUtil redisUtil;

    /**
     * 插入商户数据
     * @param merchant
     * @return
     * @throws Exception
     */
    @Override
    public int insertSelective(Merchant merchant) throws Exception {
        int flag = merchantMapper.insertSelective(merchant);

        if (flag == 1) {
            insertOrUpdate(merchant);
        }

        return flag;
    }

    /**
     * 根据id查询
     * @param mid
     * @return
     * @throws Exception
     */
    @Override
    public Merchant selectByPrimaryKey(String mid) throws Exception {

        //redis
        Merchant merchant = getMerchant(mid);

        if (merchant == null) {
            merchant = merchantMapper.selectByPrimaryKey(mid);
            insertOrUpdate(merchant);
        }

        return merchant;
    }

    /**
     * 条件查询merchant
     * @param condition
     * @return
     * @throws Exception
     */
    @Override
    public List<Merchant> selectMerchantByCondition(Merchant condition) throws Exception {

        List<Merchant> merchants = merchantMapper.selectMerchantByCondition(condition);
        return merchants;
    }


    /**
     * 根据id更新merchant
     * @param merchant
     * @return
     * @throws Exception
     */
    @Override
    public int updateByPrimaryKeySelective(Merchant merchant) throws Exception {
        int flag = merchantMapper.updateByPrimaryKeySelective(merchant);

        if (flag == 1) {
            merchant = merchantMapper.selectByPrimaryKey(merchant.getMid());
            insertOrUpdate(merchant);
        }

        return flag;
    }

    /**
     * 根据id集合查询
     * @param mids
     * @return
     * @throws Exception
     */
    @Override
    public List<Merchant> queryMerchantByIds(List<String> mids) throws Exception {

        //redis那边查询，可能有缺的
        List<Object> list = redisUtil.multiHGet(Table.MERCHANTTABLE.name(), mids);

        //容器准备
        int length = mids.size();
        List<Merchant> merchants = new ArrayList<>(length);

        //用于查缺补漏的
        List<String> temp = new ArrayList<>(length);

        //遍历，这里能够这样写，是因为redis会按照mids的顺序返回数据，如果找不到，就用一个null代替
        for (int i=0; i<length; ++i) {
            Object obj = list.get(i);

            //redis那边查询不到
            if (null == obj) {
                String id = mids.get(i);
                temp.add(id);
            } else {

                //将redis查询到添加到返回的结果集中
                Merchant merchant = (Merchant) obj;
                merchants.add(merchant);
            }
        }

        //判断是否需要从mysql查询
        if (!temp.isEmpty()) {
            List<Merchant> data = merchantMapper.queryMerchantByIds(temp);
            merchants.addAll(data);

            patchSave(data);
        }

        return merchants;
    }


    /**
     * 批量保存到redis那边
     *
     * mid -> merchant
     * @param merchants
     */
    private void patchSave(List<Merchant> merchants) {
        if (merchants.isEmpty()){
            return;
        }
        Map<String, Merchant> data = new HashMap<>();

        //转换数据结构
        for (Merchant merchant : merchants) {
            String mid = merchant.getMid();
            data.put(mid, merchant);
        }
        redisUtil.multiHset(Table.MERCHANTTABLE.name(), data);
    }


    /**
     * 从redis那边查询
     * @param mid
     * @return
     */
    private Merchant getMerchant(String mid)  {
        Merchant merchant = (Merchant) redisUtil.hmGet(Table.MERCHANTTABLE.name(), mid);
        return merchant;
    }

    /**
     * 同步到redis
     * @param merchant
     */
    private void insertOrUpdate(Merchant merchant) {
        redisUtil.hmSet(Table.MERCHANTTABLE.name(), merchant.getMid(), merchant);
    }

}
    