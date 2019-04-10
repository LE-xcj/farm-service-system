package edu.zhku.controller;

import edu.zhku.constant.Role;
import edu.zhku.pojo.Farmer;
import edu.zhku.pojo.Item;
import edu.zhku.pojo.Merchant;
import edu.zhku.service.FarmerService;
import edu.zhku.service.MerchantService;
import edu.zhku.util.ViewNameUtil;
import edu.zhku.vo.ItemVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author chujian
 * @ClassName BillController
 * @Description 功能描述
 * @date 2019/2/21 16:49
 */
@RestController
@RequestMapping("/bill")
public class BillController {

    @Autowired
    private FarmerService farmerService;

    @Autowired
    private MerchantService merchantService;

    @Autowired
    private ViewNameUtil viewNameUtil;

    @RequestMapping("/createBillView")
    public ModelAndView createBillView (HttpSession session, ItemVo itemVo) throws Exception {

        ModelAndView mv = new ModelAndView();
        List<Item> items = itemVo.getItems();

        if (isNull(items)) {
            mv.setViewName("redirect:/item/shoppingCart");
            return mv;
        }

        String fid = (String) session.getAttribute(Role.FARMER.getPref());
        Farmer farmer = farmerService.selectById(fid);

        String mid = getMid(items);
        Merchant merchant = merchantService.selectById(mid);

        mv.addObject("farmer", farmer);
        mv.addObject("merchant", merchant);
        mv.addObject("items", items);
        mv.setViewName("farmer/createBill");

        return mv;
    }


    /**
     * 商户的订单视图
     * @param session
     * @return
     */
    @RequestMapping("/merchantBillList")
    public ModelAndView merchantBillList(HttpSession session) throws Exception {

        ModelAndView mv = new ModelAndView();
        String mid = (String) session.getAttribute(Role.MERCHANT.getPref());

        mv.addObject("mid", mid);
        //mv.setViewName("merchant/billManager");
        viewNameUtil.setViewName(mv, mid, "merchant/billManager");
        return mv;
    }

    /**
     * 商户的进行中订单视图
     * @param session
     * @return
     */
    @RequestMapping("/merchantProcessingBill")
    public ModelAndView merchantProcessingBill(HttpSession session) throws Exception {

        ModelAndView mv = new ModelAndView();
        String mid = (String) session.getAttribute(Role.MERCHANT.getPref());

        mv.addObject("mid", mid);
        //mv.setViewName("merchant/processBill");
        viewNameUtil.setViewName(mv, mid, "merchant/processBill");
        return mv;
    }

    @RequestMapping("/farmerBillList")
    public ModelAndView farmerBillList(HttpSession session) {
        ModelAndView mv = new ModelAndView();
        String fid = (String) session.getAttribute(Role.FARMER.getPref());

        mv.addObject("fid", fid);
        mv.setViewName("farmer/billManager");
        return mv;
    }

    /**
     * 获取mid
     * @param items
     * @return
     * @throws Exception
     */
    private String getMid(List<Item> items) throws Exception {

        Item item = items.get(0);
        if (item == null) {
            throw new Exception("item is null");
        }

        return item.getMid();

    }


    /**
     * 判断list是否为null
     * @param items
     * @return
     */
    public boolean isNull(List<Item> items) {

        if (items == null || items.isEmpty()) {
            return true;
        }

        return false;
    }
}
    