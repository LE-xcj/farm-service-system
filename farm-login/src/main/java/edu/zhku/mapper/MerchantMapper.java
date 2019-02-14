package edu.zhku.mapper;

import edu.zhku.pojo.Merchant;

import java.util.List;

public interface MerchantMapper {

    //insert
    int insert(Merchant record) throws Exception;
    int insertSelective(Merchant record) throws Exception;

    //select
    Merchant selectByPrimaryKey(String mid) throws Exception;
    List<Merchant> selectMerchantByCondition(Merchant condition) throws Exception;

    //update
    int updateByPrimaryKeySelective(Merchant record) throws Exception;
    int updateByPrimaryKey(Merchant record) throws Exception;

    //delete
    int deleteByPrimaryKey(String mid) throws Exception;
}