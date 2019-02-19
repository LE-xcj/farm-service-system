package edu.zhku.controller;

import edu.zhku.constant.Code;
import edu.zhku.constant.Literal;
import edu.zhku.constant.Role;
import edu.zhku.pojo.Merchant;
import edu.zhku.service.CertifyServiceFacade;
import edu.zhku.service.MerchantService;
import edu.zhku.util.CodeVoFactory;
import edu.zhku.util.KeyFactory;
import edu.zhku.util.RedisUtil;
import edu.zhku.util.SMSUtil;
import edu.zhku.vo.CodeVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

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
    public void index(HttpSession session) {

        ModelAndView mv = new ModelAndView();
        Object mid = session.getAttribute(Role.MERCHANT.name());

        mv.addObject("mid", mid);
        mv.setViewName("index");
    }

    @RequestMapping("/updateMerchant")
    public CodeVo updateMerchant(Merchant merchant) throws Exception {
        CodeVo vo = merchantService.updateMerchant(merchant);
        return vo;
    }


    @RequestMapping("/selectMerchant")
    public Merchant selectMerchant(HttpSession session) throws Exception {
        String mid = (String) session.getAttribute(Role.MERCHANT.getPref());
        Merchant merchant = merchantService.selectById(mid);
        return merchant;
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

        }
    }


    @Autowired
    private CertifyServiceFacade certifyServiceFacade;
    @RequestMapping("/certify")
    public String certify(String mid) {
        certifyServiceFacade.certify(mid);
        return "invoke";
    }

}
    