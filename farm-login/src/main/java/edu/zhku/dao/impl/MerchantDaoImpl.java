package edu.zhku.dao.impl;

import edu.zhku.dao.MerchantDao;
import edu.zhku.mapper.MerchantMapper;
import edu.zhku.pojo.Farmer;
import edu.zhku.pojo.Merchant;
import edu.zhku.util.RedisUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @author chujian
 * @ClassName MerchantDaoImpl
 * @Description 功能描述
 * @date 2019/2/15 15:27
 */

@Component
public class MerchantDaoImpl implements MerchantDao{

    @Autowired
    private MerchantMapper merchantMapper;

    @Autowired
    private RedisUtil redisUtil;

    @Override
    public int insertSelective(Merchant merchant) throws Exception {
        int flag = merchantMapper.insertSelective(merchant);

        if (flag == 1) {
            redisUtil.set(merchant.getMid(), merchant);
        }

        return flag;
    }

    @Override
    public Merchant selectByPrimaryKey(String mid) throws Exception {
        Merchant merchant = null;
        merchant = (Merchant) redisUtil.get(mid);

        if (merchant == null) {
            merchant = merchantMapper.selectByPrimaryKey(mid);
            redisUtil.set(mid, merchant);
        }

        return merchant;
    }

    @Override
    public List<Merchant> selectMerchantByCondition(Merchant condition) throws Exception {
        List<Merchant> merchants = merchantMapper.selectMerchantByCondition(condition);
        return merchants;
    }

    @Override
    public int updateByPrimaryKeySelective(Merchant merchant) throws Exception {
        int flag = merchantMapper.updateByPrimaryKeySelective(merchant);
        if (flag == 1) {
            merchant = merchantMapper.selectByPrimaryKey(merchant.getMid());
            redisUtil.set(merchant.getMid(), merchant);
        }

        return flag;
    }

}
    