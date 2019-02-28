package edu.zhku.controller;

import edu.zhku.constant.Path;
import edu.zhku.pojo.Item;
import edu.zhku.pojo.ItemCondition;
import edu.zhku.pojo.ItemConditionForMerchant;
import edu.zhku.pojo.ItemUpdateDTO;
import edu.zhku.service.ItemService;
import edu.zhku.util.FileUtil;
import edu.zhku.vo.ItemVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
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
    public int addItem(Item item, MultipartFile file) throws Exception {

        setPicture(item, file);

        int flag = itemService.insertItem(item);

        return flag;
    }


    /**
     * 分页查询商品信息（农户使用）
     * @param condition
     * @return
     * @throws Exception
     */
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


    /**
     * 分页查询商品信息（商户用的）
     * @param condition
     * @return
     * @throws Exception
     */
    @RequestMapping("/queryItemForMerchant")
    public ItemVo queryItemForMerchant(ItemConditionForMerchant condition) throws Exception {
        ItemVo itemVo = itemService.selectByItem(condition);


        return itemVo;

    }

    /**
     * 根据商品id查询指定商品信息
     * @param id
     * @return
     * @throws Exception
     */
    @RequestMapping("/queryItemById")
    public Item queryItemById(Integer id) throws Exception {
        Item item = itemService.selectItemById(id);


        return item;
    }



    /**
     * 更新商品信息，这里是以id更新信息
     * @param item
     * @return
     * @throws Exception
     */
    @RequestMapping("/updateItem")
    public int updateItem(Item item, MultipartFile file) throws Exception {

        setPicture(item, file);

        int flag = itemService.updateItemById(item);

        return flag;

    }


    @RequestMapping("/updateItemStatus")
    public int updateItemStatus(ItemUpdateDTO dto) throws Exception {
        List<Integer> ids = dto.getIds();
        int status = dto.getStatus();
        int num = itemService.updateItemStatus(ids, status);
        return num;
    }

    /**
     * 设置图片资源
     * @param item
     * @param file
     * @throws IOException
     */
    private void setPicture(Item item, MultipartFile file) throws IOException {
        if (null != file) {
            String url = FileUtil.saveImg(file, Path.ITEM);
            item.setMedia(url);
        }
    }

}
    