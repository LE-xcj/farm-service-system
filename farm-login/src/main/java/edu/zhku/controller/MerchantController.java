package edu.zhku.controller;

import com.sun.xml.internal.ws.api.message.ExceptionHasMessage;
import edu.zhku.constant.Code;
import edu.zhku.constant.Literal;
import edu.zhku.constant.Path;
import edu.zhku.constant.Role;
import edu.zhku.pojo.Merchant;
import edu.zhku.service.CertifyServiceFacade;
import edu.zhku.service.MerchantService;
import edu.zhku.util.*;
import edu.zhku.vo.CodeVo;
import edu.zhku.vo.MerchantVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * @author chujian
 * @ClassName MerchantController
 * @Description 功能描述
 * @date 2019/2/13 12:27
 */
@RestController
@RequestMapping("/merchant")
public class MerchantController {


    @Autowired
    private RedisUtil redisUtil;

    @Autowired
    private MerchantService merchantService;

    @RequestMapping("/signIn")
    public ModelAndView signIn() {

        ModelAndView mv = new ModelAndView();

        mv.addObject("role", "2");
        mv.addObject("action", "merchant");

        mv.setViewName("signin");
        return mv;
    }


    @RequestMapping("/login")
    public CodeVo login(HttpSession session, Merchant merchant) throws Exception {
        //手机号和密码不能为空
        if (isNull(merchant)) {
            return CodeVoFactory.getVo(Code.ATTRIBUTECANNOTNULL);
        }
        CodeVo vo = merchantService.login(merchant);

        setSession(session, merchant, vo);
        return vo;
    }

    @RequestMapping("/signUp")
    public ModelAndView signUp() throws Exception {

        ModelAndView mv = new ModelAndView();

        mv.addObject("role", "2");
        mv.addObject("action", "merchant");

        mv.setViewName("signup");

        return mv;
    }

    @RequestMapping("/registe")
    public CodeVo registe(HttpSession session, Merchant merchant, String vCode) throws Exception {

        //简单校验
        if (isNull(merchant) || isNull(vCode)){
            return CodeVoFactory.getVo(Code.ATTRIBUTECANNOTNULL);
        }

        String realCode = (String) session.getAttribute(Literal.MERCHANTREALCODE);
        CodeVo vo = merchantService.registe(merchant, vCode, realCode);

        setSession(session, merchant, vo);
        return vo;
    }

    @RequestMapping("/sendCode")
    public void sendCode(HttpSession session, String phone) throws Exception{


        String s = (String) session.getAttribute(Literal.MERCHANTREALCODE);

        String realCode = KeyFactory.generateVCode();
        session.setAttribute(Literal.MERCHANTREALCODE, realCode);

        //发送短信
        SMSUtil.sendMsg(phone, realCode);

        //开始计时
        SMSUtil.timing(session, Literal.MERCHANTREALCODE);

    }


    @RequestMapping("/index")
    public ModelAndView index(HttpSession session) throws Exception {

        ModelAndView mv = new ModelAndView();
        String mid = (String) session.getAttribute(Role.MERCHANT.getPref());

        Merchant merchant = merchantService.selectById(mid);
        mv.addObject("mid", mid);
        mv.addObject("merchant", merchant);
        mv.addObject("sid", session.getId());

        mv.setViewName("merchant/index");
        return  mv;
    }

    @RequestMapping("/selectMerchant")
    public Merchant selectMerchant(HttpSession session) throws Exception {
        String mid = (String) session.getAttribute(Role.MERCHANT.getPref());
        Merchant merchant = merchantService.selectById(mid);
        return merchant;
    }

    @RequestMapping("/updateMerchantView")
    public ModelAndView updateMerchantView(HttpSession session) throws Exception {
        ModelAndView mv = new ModelAndView();

        String mid = (String) session.getAttribute(Role.MERCHANT.getPref());

        Merchant merchant = merchantService.selectById(mid);
        mv.addObject("self", merchant);
        mv.setViewName("merchant/personal");

        return mv;
    }

    /**
     * 更新信息
     * @param merchant
     * @return
     * @throws Exception
     */
    @RequestMapping("/updateMerchant")
    public CodeVo updateMerchant(Merchant merchant, MultipartFile file) throws Exception {
        if (null != file) {
            String picture = FileUtil.saveImg(file, Path.MERCHANT);
            merchant.setPicture(picture);
        }
        CodeVo vo = merchantService.updateMerchant(merchant);
        return vo;
    }



    @Autowired
    private CertifyServiceFacade certifyServiceFacade;
    @RequestMapping("/certifyView")
    public ModelAndView certifyView(HttpSession session) throws Exception {

        ModelAndView mv = new ModelAndView();

        String mid = (String) session.getAttribute(Role.MERCHANT.getPref());

        boolean certify = merchantService.isCertify(mid);

        if (certify) {
            mv.addObject("certify", "1");
        } else {
            mv.addObject("certify", "0");
        }

        mv.setViewName("merchant/certify");

        return mv;
    }

    @RequestMapping("/certify")
    public int certify(HttpSession session, MultipartFile file) throws IOException {

        String mid = (String) session.getAttribute(Role.MERCHANT.getPref());
        int num = 0;
        if (null != file) {

            //保存图片
            String url = FileUtil.saveImg(file, Path.CERTIFY);

            //插入记录
            certifyServiceFacade.insertRecord(mid, url);

            //再验证
            certifyServiceFacade.certify(mid);
        }
        return num;
    }

    @RequestMapping("/updatePsw")
    public CodeVo updatePsw(MerchantVo vo) throws Exception {
        CodeVo flag = merchantService.updatePsw(vo);
        return flag;
    }

    @RequestMapping("/updatePhone")
    public CodeVo updatePhone(Merchant merchant) throws Exception {
        CodeVo flag = merchantService.updatePhone(merchant);
        return flag;
    }


    /**
     * 主要用于校验farm对象是否为null，
     * 并且phone和psw都不能为null
     * @param merchant
     * @return
     */
    private boolean isNull(Merchant merchant) {
        if (merchant == null) {
            return true;
        } else if (isNull(merchant.getPhone()) || isNull(merchant.getPsw())) {
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


    /**
     * 登录或注册成功，就在redis设置session obj键值对
     * @param session
     * @param merchant
     * @param vo
     */
    private void setSession(HttpSession session, Merchant merchant, CodeVo vo) {

        if (vo.getCode() == Code.SUCCESS.getCode()){

            String sessionId = session.getId();

            String mid = merchant.getMid();

            //服务器这边的会话
            session.setAttribute(Role.MERCHANT.getPref(), mid);

            //redis那边
            redisUtil.set(mid, sessionId);
            //redisUtil.hmSet(Literal.ONLINE, mid, sessionId);

        }
    }

}
    