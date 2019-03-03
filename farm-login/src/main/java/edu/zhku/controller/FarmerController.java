package edu.zhku.controller;

import edu.zhku.constant.Code;
import edu.zhku.constant.Literal;
import edu.zhku.constant.Role;
import edu.zhku.pojo.Farmer;
import edu.zhku.service.FarmerService;
import edu.zhku.util.CodeVoFactory;
import edu.zhku.util.KeyFactory;
import edu.zhku.util.RedisUtil;
import edu.zhku.util.SMSUtil;
import edu.zhku.vo.CodeVo;
import edu.zhku.vo.FarmerVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

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

    @Autowired
    RedisUtil redisUtil;

    /**
     * 登录视图
     * action是用于识别url中的farmer和merchant
     * @return
     */
    @RequestMapping("/signIn")
    public ModelAndView signIn() {

        ModelAndView mv = new ModelAndView();

        mv.addObject("role", "1");
        mv.addObject("action", "farmer");

        mv.setViewName("signin");
        return mv;
    }


    /**
     * 登录接口
     * 登录之后需要到redis和服务器这边进行注册信息
     * @param session
     * @param farmer
     * @return
     * @throws Exception
     */
    @RequestMapping("/login")
    public CodeVo login(HttpSession session, Farmer farmer) throws Exception {
        //手机号和密码不能为空
        if (isNull(farmer)) {
            return CodeVoFactory.getVo(Code.ATTRIBUTECANNOTNULL);
        }
        CodeVo vo = farmerService.login(farmer);

        setSession(session, farmer, vo);
        return vo;
    }


    /**
     * 注册视图
     * @return
     * @throws Exception
     */
    @RequestMapping("/signUp")
    public ModelAndView signUp() throws Exception {

        ModelAndView mv = new ModelAndView();

        mv.addObject("role", "1");
        mv.addObject("action", "farmer");

        mv.setViewName("signup");

        return mv;
    }

    /**
     * 注册接口
     * @param session
     * @param farmer
     * @param vCode
     * @return
     * @throws Exception
     */
    @RequestMapping("/registe")
    public CodeVo registe(HttpSession session, Farmer farmer, String vCode) throws Exception {

        //简单校验
        if (isNull(farmer) || isNull(vCode)){

            //不能为空
            return CodeVoFactory.getVo(Code.ATTRIBUTECANNOTNULL);

        }

        String realCode = (String) session.getAttribute(Literal.FARMERREALCODE);
        CodeVo vo = farmerService.registe(farmer, vCode, realCode);
        setSession(session, farmer, vo);

        return vo;
    }


    /**
     * 发送短信验证码
     * @param session
     * @param phone
     * @throws Exception
     */
    @RequestMapping("/sendCode")
    public void sendCode(HttpSession session, String phone) throws Exception{


        //测试
        System.out.println(session.getAttribute(Literal.FARMERREALCODE));

        String realCode = KeyFactory.generateVCode();
        session.setAttribute(Literal.FARMERREALCODE, realCode);

        //发送短信
        SMSUtil.sendMsg(phone, realCode);

        //开始计时
        SMSUtil.timing(session, Literal.FARMERREALCODE);

    }


    /**
     * 农户主界面视图
     */
    @RequestMapping("/index")
    public ModelAndView index(HttpSession session) throws Exception {

        ModelAndView mv = new ModelAndView();

        String fid = (String) session.getAttribute(Role.FARMER.getPref());
        Farmer farmer = farmerService.selectById(fid);

        mv.addObject("role", "1");
        mv.addObject("action", "farmer");
        mv.addObject("self", farmer);

        mv.setViewName("farmer/index");
        return mv;
    }


    /**
     * 更新农户信息
     * @param farmer
     * @return
     * @throws Exception
     */
    @RequestMapping("/updateFarmer")
    public CodeVo updateFarmer(Farmer farmer) throws Exception {
        CodeVo vo = farmerService.updateFarmer(farmer);
        return vo;
    }

    /**
     * 更新农户视图
     * @param session
     * @return
     * @throws Exception
     */
    @RequestMapping("/updateFarmerView")
    public ModelAndView updateFarmerView(HttpSession session) throws Exception {

        ModelAndView mv = new ModelAndView();

        String fid = (String) session.getAttribute(Role.FARMER.getPref());
        Farmer farmer = farmerService.selectById(fid);

        mv.addObject("self", farmer);
        mv.setViewName("farmer/personal");

        return mv;

    }



    @RequestMapping("/selectFarmer")
    public Farmer selectFarmer(HttpSession session) throws Exception {

        String fid = (String) session.getAttribute(Role.FARMER.getPref());
        Farmer farmer = farmerService.selectById(fid);

        return farmer;
    }


    /**
     * 更新手机号
     * @param farmer
     * @return
     * @throws Exception
     */
    @RequestMapping("/updatePhone")
    public CodeVo updatePhone(Farmer farmer) throws Exception {
        CodeVo codeVo = farmerService.updatePhone(farmer);
        return codeVo;
    }

    /**
     * 更新密码
     * @param vo
     * @return
     * @throws Exception
     */
    @RequestMapping("/updatePsw")
    public CodeVo updatePsw(FarmerVo vo) throws Exception {
        CodeVo codeVo = farmerService.updatePsw(vo);
        return codeVo;
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

    /**
     * 登录或注册成功，就在redis设置session obj键值对
     * @param session
     * @param farmer
     * @param vo
     */
    private void setSession(HttpSession session, Farmer farmer, CodeVo vo) {

        if (vo.getCode() == Code.SUCCESS.getCode()){

            //会话id
            String sessionId = session.getId();

            //农户id
            String fid = farmer.getFid();

            //设置当前的登录的用户，因为一个会话可能登录两种角色，所以需要加上前缀
            session.setAttribute(Role.FARMER.getPref(), fid);

            //redis那边也是
            redisUtil.set(fid, sessionId);

        }
    }


}
    