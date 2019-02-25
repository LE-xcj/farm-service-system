package edu.zhku.controller;

import edu.zhku.pojo.Item;
import edu.zhku.pojo.ItemCondition;
import edu.zhku.pojo.ItemConditionForMerchant;
import edu.zhku.service.ItemService;
import edu.zhku.util.CRODUtil;
import edu.zhku.vo.ItemVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
    @Autowired
    private ItemService itemService;



    /**
     * 添加商品信息（商户使用）
     * @param item
     * @return
     * @throws Exception
     */
    @RequestMapping("/addItem")
    public String addItem(Item item) throws Exception {
        int flag = itemService.insertItem(item);

        String data = CRODUtil.getJsonp(flag);

        return data;
    }


    /**
     * 分页查询商品信息（农户使用）
     * @param condition
     * @return
     * @throws Exception
     */
    @RequestMapping("/queryItemByPage")
    public String queryItemByPage(ItemCondition condition) throws Exception{
        List<Item> items = itemService.selectByCondition(condition);

        int totalPage = 0;
        if (null != items && !items.isEmpty()) {
            totalPage = itemService.countForFarmer(condition);
        }

        ItemVo vo = new ItemVo();
        vo.setItems(items);
        vo.setTotalPage(totalPage);

        String data = CRODUtil.getJsonp(vo);

        return data;
    }


    /**
     * 分页查询商品信息（商户用的）
     * @param condition
     * @return
     * @throws Exception
     */
    @RequestMapping("/queryItemForMerchant")
    public String queryItemForMerchant(ItemConditionForMerchant condition) throws Exception {
        ItemVo itemVo = itemService.selectByItem(condition);

        String data = CRODUtil.getJsonp(itemVo);

        return data;

    }

    /**
     * 根据商品id查询指定商品信息
     * @param id
     * @return
     * @throws Exception
     */
    @RequestMapping("/queryItemById")
    public String queryItemById(Integer id) throws Exception {
        Item item = itemService.selectItemById(id);


        String data = CRODUtil.getJsonp(item);

        return data;
    }



    /**
     * 更新商品信息，这里是以id更新信息
     * @param item
     * @return
     * @throws Exception
     */
    @RequestMapping("/updateItem")
    public String updateItem(Item item) throws Exception {
        int flag = itemService.updateItemById(item);

        String data = CRODUtil.getJsonp(flag);

        return data;

    }



}
    