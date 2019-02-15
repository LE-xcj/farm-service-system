package edu.zhku.dao;

import edu.zhku.pojo.Merchant;

import java.util.List;

/**
 * @author chujian
 * @ClassName MerchantDao
 * @Description 功能描述
 * @date 2019/2/15 15:26
 */
public interface MerchantDao {

    int insertSelective(Merchant merchant) throws Exception;

    //select
    Merchant selectByPrimaryKey(String mid) throws Exception;
    List<Merchant> selectMerchantByCondition(Merchant condition) throws Exception;

    //update
    int updateByPrimaryKeySelective(Merchant merchant) throws Exception;
}
