package edu.zhku.controller;

import edu.zhku.pojo.Notice;
import edu.zhku.pojo.NoticeCondition;
import edu.zhku.pojo.NoticeDTO;
import edu.zhku.service.NoticeService;
import edu.zhku.util.RedisUtil;
import edu.zhku.vo.NoticeVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author chujian
 * @ClassName NoticeColler
 * @Description 功能描述
 * @date 2019/2/19 22:26
 */
@RestController
@RequestMapping("/notice")
public class NoticeController {

    @Autowired
    private NoticeService noticeService;

    @Autowired
    RedisUtil redisUtil;

    /**
     * 分页查询消息
     * @param condition
     * @return
     * @throws Exception
     */
    @RequestMapping("/queryNotice")
    public NoticeVo queryNotice(NoticeCondition condition) throws Exception {
        NoticeVo vo = noticeService.selectNoticeByCondition(condition);
        return vo;
    }

    @RequestMapping("/updateNotice")
    public int updateNotice(Notice notice) throws Exception {
        int num = noticeService.updateNotice(notice);
        return num;
    }

    @RequestMapping("/updateNoticeStatusForList")
    public int updateNoticeStatusForList(NoticeDTO dto) throws Exception {
        int num = noticeService.updateNoticeStatusForList(dto);
        return num;
    }

    @RequestMapping("/count")
    public int count(Notice condition) throws Exception {
        int num = noticeService.count(condition);
        return num;
    }

    @RequestMapping("/notice")
    public void notice(Notice notice) throws Exception {
        noticeService.tryNotify("farmer", notice.getDestination(), notice.getContent());
    }


}
    