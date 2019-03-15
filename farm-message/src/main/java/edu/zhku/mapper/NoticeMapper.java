package edu.zhku.mapper;

import edu.zhku.pojo.Notice;
import edu.zhku.pojo.NoticeCondition;
import edu.zhku.pojo.NoticeDTO;

import java.util.List;

public interface NoticeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Notice record);


    Notice selectByPrimaryKey(Integer id);


    int updateByPrimaryKey(Notice record) throws Exception;


    int updateByPrimaryKeySelective(Notice record) throws Exception;

    int insertSelective(Notice record);
    List<Notice> selectByCondition(NoticeCondition condition) throws Exception;
    int count(NoticeCondition notice) throws Exception;

    int updateNoticeStatusForList(NoticeDTO dto) throws Exception;
}