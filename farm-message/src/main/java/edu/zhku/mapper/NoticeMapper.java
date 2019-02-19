package edu.zhku.mapper;

import edu.zhku.pojo.Notice;
import edu.zhku.pojo.NoticeCondition;

import java.util.List;

public interface NoticeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Notice record);


    Notice selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Notice record);

    int updateByPrimaryKey(Notice record);



    int insertSelective(Notice record);
    List<Notice> selectByCondition(NoticeCondition notice) throws Exception;
    int count(Notice notice) throws Exception;
}