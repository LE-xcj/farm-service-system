package edu.zhku.mapper;

import edu.zhku.pojo.Admin;

public interface AdminMapper {

    //insert
    int insert(Admin record) throws Exception;
    int insertSelective(Admin record) throws Exception;

    //select
    Admin selectByPrimaryKey(String aid) throws Exception;

    //update
    int updateByPrimaryKey(Admin record) throws Exception;
    int updateByPrimaryKeySelective(Admin record) throws Exception;

    //delete
    int deleteByPrimaryKey(String aid) throws Exception;
}