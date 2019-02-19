package edu.zhku.service;

import edu.zhku.pojo.Notice;
import edu.zhku.pojo.NoticeCondition;
import edu.zhku.vo.NoticeVo;

/**
 * @author chujian
 * @ClassName NoticeService
 * @Description 功能描述
 * @date 2019/2/19 20:01
 */
public interface NoticeService {

    boolean tryNotify(String role, String destination, String content) throws Exception;

    int insertNotice(Notice notice) throws Exception;

    NoticeVo selectNoticeByCondition(NoticeCondition notice) throws Exception;
}
