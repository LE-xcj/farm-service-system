package edu.zhku.controller;

import edu.zhku.constant.Role;
import edu.zhku.pojo.Farmer;
import edu.zhku.pojo.Merchant;
import edu.zhku.service.FarmerService;
import edu.zhku.service.MerchantService;
import edu.zhku.util.ViewNameUtil;
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

    @Autowired
    private ViewNameUtil viewNameUtil;

    /**
     * 添加item
     * @param session
     * @return
     * @throws Exception
     */
    @RequestMapping("/addItemView")
    public ModelAndView addItemView(HttpSession session) throws Exception {

        ModelAndView mv = new ModelAndView();
        String mid = (String) session.getAttribute(Role.MERCHANT.getPref());
        mv.addObject("mid", mid);

        viewNameUtil.setViewName(mv, mid, "merchant/addItem");

        return mv;

    }




    /**
     * 商户使用的
     * @return
     */
    @RequestMapping("/itemListView")
    public ModelAndView itemListView(HttpSession session) throws Exception {
        ModelAndView mv = new ModelAndView();
        String mid = (String) session.getAttribute(Role.MERCHANT.getPref());
        mv.addObject("mid", mid);

        //mv.setViewName("merchant/itemList");
        viewNameUtil.setViewName(mv, mid, "merchant/itemList");
        return mv;
    }

    @RequestMapping("/itemListViewByMid")
    public ModelAndView itemListViewByMid(String mid) throws Exception {

        ModelAndView mv = new ModelAndView();

        if (null != mid) {
            Merchant merchant = merchantService.selectById(mid);
            mv.addObject("merchant", merchant);
        }

        mv.setViewName("farmer/merchantItemList");
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


    /**
     * 购物车
     * 从redis那边获取农户的购物车信息，交由订单系统负责
     * @param session
     * @return
     * @throws Exception
     */
    @RequestMapping("/shoppingCart")
    public ModelAndView shoppingCart(HttpSession session) throws Exception {

        ModelAndView mv = new ModelAndView();
        String fid = (String) session.getAttribute(Role.FARMER.getPref());
        Farmer farmer = farmerService.selectById(fid);
        mv.addObject("farmer", farmer);

        mv.setViewName("farmer/shoppingCart");
        return mv;

    }

    /**
     * 商品详情页面,get方式
     * @param iid
     * @return
     */
    @RequestMapping("/itemDetailView")
    public ModelAndView itemDetailView(HttpSession session, Integer iid, String mid) throws Exception {

        String fid = (String) session.getAttribute(Role.FARMER.getPref());

        ModelAndView mv = new ModelAndView();

        Merchant merchant = merchantService.selectById(mid);
        Farmer farmer = farmerService.selectById(fid);

        mv.addObject("iid", iid);
        mv.addObject("merchant", merchant);
        mv.addObject("farmer", farmer);

        mv.setViewName("farmer/itemDetail");

        return mv;
    }


    /**
     * 评论某一订单关联商品
     * @param bid
     * @return
     */
    @RequestMapping("/evaluateView")
    public ModelAndView evaluateView(String bid) {
        ModelAndView mv = new ModelAndView();

        mv.addObject("bid", bid);
        mv.setViewName("farmer/evalutation");

        return mv;
    }


}
    