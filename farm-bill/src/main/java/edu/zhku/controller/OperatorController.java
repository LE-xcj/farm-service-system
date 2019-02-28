package edu.zhku.controller;

import edu.zhku.constant.Path;
import edu.zhku.pojo.Operator;
import edu.zhku.pojo.OperatorCondition;
import edu.zhku.service.OperatorService;
import edu.zhku.util.FileUtil;
import edu.zhku.util.PageUtil;
import edu.zhku.vo.OperatorVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

/**
 * @author chujian
 * @ClassName OperatorController
 * @Description 功能描述
 * @date 2019/2/17 18:22
 */
@RestController
@RequestMapping("/operator")
public class OperatorController {

    @Autowired
    private OperatorService operatorService;


    /**
     * 添加机手信息
     * @param operator
     * @return
     * @throws Exception
     */
    @RequestMapping("/addOperator")
    public int addOperator(Operator operator, MultipartFile file) throws Exception {

        setPicture(operator, file);

        int flag = operatorService.insertOperator(operator);


        return flag;

    }


    /**
     * 分页查询机手信息
     * 这里主要功能就是根据商户的id查询其对应的机手
     * @param condition
     * @return
     * @throws Exception
     */
    @RequestMapping("/queryOperatorByPage")
    public OperatorVo queryOperatorByPage(OperatorCondition condition) throws Exception {

        OperatorVo vo = new OperatorVo();

        List<Operator> operators = operatorService.selectOperatorByCondition(condition);
        int count = operatorService.count(condition);
        int totalPage = PageUtil.count(count, condition.getPageSize());

        vo.setOperators(operators);
        vo.setTotalPage(totalPage);

        return vo;
    }

    /**
     * 根据id查询机手信息
     * @param oid
     * @return
     * @throws Exception
     */
    @RequestMapping("/queryOperatorById")
    public Operator queryOperatorById(String oid) throws Exception {

        Operator operator = operatorService.selectOperatorById(oid);


        return operator;

    }

    /**
     * 根据id更新机手信息
     * @param operator
     * @return
     * @throws Exception
     */
    @RequestMapping("/updateOperatorById")
    public int updateOperatorById(Operator operator, MultipartFile file) throws Exception {
        setPicture(operator, file);

        int flag = operatorService.updateOperatorById(operator);
        return flag;

    }


    /**
     * 设置图片
     * @param operator
     * @param file
     * @throws IOException
     */
    private void setPicture(Operator operator, MultipartFile file) throws IOException {
        if (file != null) {
            String url = FileUtil.saveImg(file, Path.OPERATOR);
            operator.setPicture(url);
        }
    }

}
    