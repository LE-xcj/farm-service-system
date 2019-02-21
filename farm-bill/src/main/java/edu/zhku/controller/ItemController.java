package edu.zhku.controller;

import edu.zhku.pojo.Item;
import edu.zhku.pojo.ItemCondition;
import edu.zhku.pojo.ItemConditionForMerchant;
import edu.zhku.service.ItemService;
import edu.zhku.vo.ItemVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author chujian
 * @ClassName ItemController
 * @Description 功能描述
 * @date 2019/2/17 18:22
 */
@RestController
@RequestMapping("/item")
public class ItemController {

    @RequestMapping("/addItemView")
    public ModelAndView addItemView(HttpSession session, String mid, String sid) {

        ModelAndView mv = new ModelAndView();
        setInfor(session, mid, sid);
        mv.setViewName("merchant/addItem");

        return mv;

    }


    @Autowired
    private ItemService itemService;

    @RequestMapping("/addItem")
    public int addItem(Item item) throws Exception {
        int flag = itemService.insertItem(item);
        return flag;
    }


    /**
     * 农户用的
     * @param condition
     * @return
     * @throws Exception
     */
    @RequestMapping("/queryItemByPageView")
    public ModelAndView queryItemByPageView(ItemCondition condition) throws Exception {
        List<Item> items = itemService.selectByCondition(condition);

        int totalPage = 0;
        if (null != items && !items.isEmpty()) {
            totalPage = itemService.countForFarmer(condition);
        }

        ModelAndView mv = new ModelAndView();
        mv.addObject("items", items);
        mv.addObject("totalPage", totalPage);

        //todo
        mv.setViewName("");
        return mv;
    }

    @RequestMapping("/queryItemByPage")
    public ItemVo queryItemByPage(ItemCondition condition) throws Exception{
        List<Item> items = itemService.selectByCondition(condition);

        int totalPage = 0;
        if (null != items && !items.isEmpty()) {
            totalPage = itemService.countForFarmer(condition);
        }

        ItemVo vo = new ItemVo();
        vo.setItems(items);
        vo.setTotalPage(totalPage);

        return vo;
    }


    @RequestMapping("/queryItemForMerchant")
    public ItemVo queryItemForMerchant(ItemConditionForMerchant condition) throws Exception {
        ItemVo itemVo = itemService.selectByItem(condition);
        return itemVo;

    }

    @RequestMapping("/queryItemById")
    public Item queryItemById(Integer id) throws Exception {
        Item item = itemService.selectItemById(id);
        return item;
    }

    @RequestMapping("/updateItem")
    public int updateItem(Item item) throws Exception {
        int flag = itemService.updateItemById(item);
        return flag;
    }



    private void setInfor(HttpSession session, String mid, String sid) {
        session.setAttribute("mid", mid);
        session.setAttribute("sid", sid);
    }

}
    