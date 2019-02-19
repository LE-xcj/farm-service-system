package edu.zhku.controller;

import edu.zhku.pojo.NoticeCondition;
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

    @RequestMapping("/queryNotice")
    public NoticeVo queryNotice(NoticeCondition condition) throws Exception {

        redisUtil.set("skjdfkasjdfk", "ksdjflsak");
        Object skjdfkasjdfk = redisUtil.get("skjdfkasjdfk");

        NoticeVo vo = noticeService.selectNoticeByCondition(condition);
        return vo;
    }

}
    