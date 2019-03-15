package edu.zhku.controller;

import edu.zhku.constant.Role;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

/**
 * @author chujian
 * @ClassName NoticeController
 * @Description 功能描述
 * @date 2019/3/15 22:40
 */
@RestController
@RequestMapping("/notice")
public class NoticeController {

    @RequestMapping("/farmerNoticeList")
    public ModelAndView farmerNoticeList(HttpSession session) {

        ModelAndView mv = new ModelAndView();

        String fid = (String) session.getAttribute(Role.FARMER.getPref());
        mv.addObject("key", fid);

        mv.setViewName("noticeList");
        return mv;

    }

    @RequestMapping("/merchantNoticeList")
    public ModelAndView merchantNoticeList(HttpSession session) {
        ModelAndView mv = new ModelAndView();

        String mid = (String) session.getAttribute(Role.MERCHANT.getPref());
        mv.addObject("key", mid);

        mv.setViewName("noticeList");
        return mv;
    }
}
    