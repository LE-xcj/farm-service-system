package edu.zhku.controller;

import edu.zhku.pojo.Operator;
import edu.zhku.pojo.OperatorCondition;
import edu.zhku.service.OperatorService;
import edu.zhku.util.CRODUtil;
import edu.zhku.util.PageUtil;
import edu.zhku.vo.OperatorVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
    public String addOperator(Operator operator) throws Exception {
        int flag = operatorService.insertOperator(operator);

        String data = CRODUtil.getJsonp(flag);

        return data;

    }

    /**
     * 分页查询机手信息
     * 这里主要功能就是根据商户的id查询其对应的机手
     * @param condition
     * @return
     * @throws Exception
     */
    @RequestMapping("/queryOperatorByPage")
    public String queryOperatorByPage(OperatorCondition condition) throws Exception {

        OperatorVo vo = new OperatorVo();

        List<Operator> operators = operatorService.selectOperatorByCondition(condition);
        int count = operatorService.count(condition);
        int totalPage = PageUtil.count(count, condition.getPageSize());

        vo.setOperators(operators);
        vo.setTotalPage(totalPage);

        String data = CRODUtil.getJsonp(vo);

        //跨域
        return data;
    }

    /**
     * 根据id查询机手信息
     * @param oid
     * @return
     * @throws Exception
     */
    @RequestMapping("/queryOperatorById")
    public String queryOperatorById(String oid) throws Exception {

        Operator operator = operatorService.selectOperatorById(oid);

        String data = CRODUtil.getJsonp(operator);

        return data;

    }

    /**
     * 根据id更新机手信息
     * @param operator
     * @return
     * @throws Exception
     */
    @RequestMapping("/updateOperatorById")
    public String updateOperatorById(Operator operator) throws Exception {
        int flag = operatorService.updateOperatorById(operator);

        String data = CRODUtil.getJsonp(flag);

        return data;

    }

}
    