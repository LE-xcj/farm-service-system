package edu.zhku.controller;

import edu.zhku.constant.Role;
import edu.zhku.pojo.Farmer;
import edu.zhku.service.FarmerService;
import edu.zhku.service.MerchantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

/**
 * @author chujian
 * @ClassName ItemController
 * @Description 功能描述
 * @date 2019/2/17 18:22
 */
@RestController
@RequestMapping("/item")
public class ItemController {

    @Autowired
    private MerchantService merchantService;

    @RequestMapping("/addItemView")
    public ModelAndView addItemView(HttpSession session) throws Exception {

        ModelAndView mv = new ModelAndView();
        String mid = (String) session.getAttribute(Role.MERCHANT.getPref());
        mv.addObject("mid", mid);

        boolean certify = merchantService.isCertify(mid);
        if (certify) {
            mv.setViewName("merchant/addItem");
        } else {
            mv.setViewName("merchant/certify");
        }

        return mv;

    }


    /**
     * 商户使用的
     * @return
     */
    @RequestMapping("/itemListView")
    public ModelAndView itemListView(HttpSession session) {
        ModelAndView mv = new ModelAndView();
        String mid = (String) session.getAttribute(Role.MERCHANT.getPref());
        mv.addObject("mid", mid);
        mv.setViewName("merchant/itemList");
        return mv;
    }


    @Autowired
    private FarmerService farmerService;
    /**
     * 农户用的
     * @return
     * @throws Exception
     */
    @RequestMapping("/queryItemByPageView")
    public ModelAndView queryItemByPageView(HttpSession session) throws Exception {

        ModelAndView mv = new ModelAndView();

        String fid = (String) session.getAttribute(Role.FARMER.getPref());
        Farmer farmer = farmerService.selectById(fid);
        mv.addObject("farmer", farmer);

        mv.setViewName("farmer/itemList");
        return mv;
    }


    @RequestMapping("/shoppingCart")
    public ModelAndView shoppingCart(HttpSession session) throws Exception {

        ModelAndView mv = new ModelAndView();
        String fid = (String) session.getAttribute(Role.FARMER.getPref());
        Farmer farmer = farmerService.selectById(fid);
        mv.addObject("farmer", farmer);

        //这里还需从redis那边获取农户的购物车信息
        //todo

        mv.setViewName("farmer/shoppingCart");
        return mv;

    }


}
    