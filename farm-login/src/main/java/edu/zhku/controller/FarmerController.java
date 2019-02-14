package edu.zhku.controller;

import edu.zhku.constant.Code;
import edu.zhku.pojo.Farmer;
import edu.zhku.service.FarmerService;
import edu.zhku.util.CodeVoFactory;
import edu.zhku.util.KeyFactory;
import edu.zhku.util.SMSUtil;
import edu.zhku.vo.CodeVo;
import org.apache.http.HttpResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.Timer;
import java.util.TimerTask;

/**
 * @author chujian
 * @ClassName FarmerController
 * @Description 功能描述
 * @date 2019/2/13 10:00
 */
@RestController
@RequestMapping("/farmer")
public class FarmerController {

    @Autowired
    FarmerService farmerService;

    @RequestMapping("/signIn")
    public ModelAndView signIn() {

        ModelAndView mv = new ModelAndView();

        mv.addObject("role", "1");
        mv.addObject("action", "farmer");

        mv.setViewName("signin");
        return mv;
    }


    @RequestMapping("/login")
    public CodeVo login(Farmer farmer) throws Exception {
        //手机号和密码不能为空
        if (isNull(farmer)) {
            return CodeVoFactory.getVo(Code.ATTRIBUTECANNOTNULL);
        }
        CodeVo vo = farmerService.login(farmer);

        return vo;
    }

    @RequestMapping("/signUp")
    public ModelAndView signUp() throws Exception {

        ModelAndView mv = new ModelAndView();

        mv.addObject("role", "1");
        mv.addObject("action", "farmer");

        mv.setViewName("signup");

        return mv;
    }

    @RequestMapping("/registe")
    public CodeVo registe(HttpSession session, Farmer farmer, String vCode) throws Exception {

        //简单校验
        if (isNull(farmer) || isNull(vCode)){
            return CodeVoFactory.getVo(Code.ATTRIBUTECANNOTNULL);
        }

        String realCode = (String) session.getAttribute("realCode");
        CodeVo vo = farmerService.registe(farmer, vCode, realCode);
        return vo;
    }

    @RequestMapping("/sendCode")
    public void sendCode(HttpSession session, String phone) throws Exception{

        String realCode = KeyFactory.generateVCode();
        String s = (String) session.getAttribute("realCode");
        session.setAttribute("realCode", realCode);

        //发送短信
        //SMSUtil.sendMsg(phone, realCode);

        //开始计时
        SMSUtil.timing(session);

    }


    @RequestMapping("/index")
    public void index() {

        ModelAndView mv = new ModelAndView();

        mv.addObject("role", "1");
        mv.addObject("action", "farmer");

        mv.setViewName("index");
    }


    /**
     * 主要用于校验farm对象是否为null，
     * 并且phone和psw都不能为null
     * @param farmer
     * @return
     */
    private boolean isNull(Farmer farmer) {
        if (farmer == null) {
            return true;
        } else if (isNull(farmer.getPhone()) || isNull(farmer.getPsw())) {
            return true;
        }
        return false;
    }


    private boolean isNull(String attr) {
        if (attr == null || "".equals(attr)) {
            return true;
        }
        return false;
    }
}
    