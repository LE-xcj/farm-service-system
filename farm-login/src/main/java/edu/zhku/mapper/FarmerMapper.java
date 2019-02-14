package edu.zhku.mapper;

import edu.zhku.pojo.Farmer;

import java.util.List;

public interface FarmerMapper {

    //insert
    int insert(Farmer farmer) throws Exception;
    int insertSelective(Farmer farmer) throws Exception;

    //select
    Farmer selectByPrimaryKey(String fid) throws Exception;
    List<Farmer> selectFarmerByCondition(Farmer condition) throws Exception;

    //update
    int updateByPrimaryKeySelective(Farmer farmer) throws Exception;
    int updateByPrimaryKey(Farmer farmer) throws Exception;

    //delete
    int deleteByPrimaryKey(String fid) throws Exception;
}