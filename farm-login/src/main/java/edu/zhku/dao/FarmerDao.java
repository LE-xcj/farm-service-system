package edu.zhku.dao;

import edu.zhku.pojo.Farmer;

import java.util.List;

/**
 * @author chujian
 * @ClassName FarmerDao
 * @Description 功能描述
 * @date 2019/2/15 15:06
 */
public interface FarmerDao {

    //insert
    int insertSelective(Farmer farmer) throws Exception;

    //select
    Farmer selectByPrimaryKey(String fid) throws Exception;
    List<Farmer> selectFarmerByCondition(Farmer condition) throws Exception;

    //update
    int updateByPrimaryKeySelective(Farmer farmer) throws Exception;


}
