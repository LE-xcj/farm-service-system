package edu.zhku.controller;

import edu.zhku.pojo.Operator;
import edu.zhku.pojo.OperatorCondition;
import edu.zhku.service.OperatorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

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


    @RequestMapping("/addOperator")
    public int addOperator(Operator operator) throws Exception {
        int flag = operatorService.insertOperator(operator);

        return flag;
    }

    @RequestMapping("/queryOperatorByPage")
    public ModelAndView queryOperatorByPage(OperatorCondition condition) throws Exception {
        List<Operator> operators = operatorService.selectOperatorByCondition(condition);

        ModelAndView mv = new ModelAndView();
        mv.addObject("operators", operators);

        //todo
        mv.setViewName("");

        return mv;
    }

    @RequestMapping("/queryOperatorById")
    public Operator queryOperatorById(String oid) throws Exception {

        Operator operator = operatorService.selectOperatorById(oid);
        return operator;

    }

    @RequestMapping("/updateOperatorById")
    public int updateOperatorById(Operator operator) throws Exception {
        int flag = operatorService.updateOperatorById(operator);
        return flag;

    }

}
    