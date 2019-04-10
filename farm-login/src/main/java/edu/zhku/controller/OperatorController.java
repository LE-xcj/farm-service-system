package edu.zhku.controller;

import edu.zhku.constant.Role;
import edu.zhku.util.ViewNameUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

/**
 * @author chujian
 * @ClassName OperatorController
 * @Description 功能描述
 * @date 2019/2/17 18:22
 */
@RestController
@RequestMapping("/operator")
public class OperatorController {

    @Autowired
    private ViewNameUtil viewNameUtil;

    @RequestMapping("/addOperatorView")
    public ModelAndView addOperatorView(HttpSession session) throws Exception {
        String mid = (String) session.getAttribute(Role.MERCHANT.getPref());
        ModelAndView mv = new ModelAndView();
        mv.addObject("mid", mid);
        //mv.setViewName("merchant/addOperator");
        viewNameUtil.setViewName(mv, mid, "merchant/addOperator");
        return mv;
    }


    @RequestMapping("/operatorListView")
    public ModelAndView operatorListView(HttpSession session) throws Exception {
        String mid = (String) session.getAttribute(Role.MERCHANT.getPref());
        ModelAndView mv = new ModelAndView();
        mv.addObject("mid", mid);
        //mv.setViewName("merchant/operatorList");
        viewNameUtil.setViewName(mv, mid, "merchant/operatorList");
        return mv;
    }


}
    