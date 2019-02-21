package edu.zhku.dao.impl;

import edu.zhku.dao.OperatorDao;
import edu.zhku.mapper.OperatorMapper;
import edu.zhku.pojo.Operator;
import edu.zhku.util.RedisUtil;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * @author chujian
 * @ClassName OperatorDaoImpl
 * @Description 功能描述
 * @date 2019/2/21 22:40
 */
public class OperatorDaoImpl implements OperatorDao {


    @Autowired
    private OperatorMapper operatorMapper;

    @Autowired
    private RedisUtil redisUtil;

    /**
     * 建议搭配redis来做
     * @param ids   机手的id集合
     * @return
     */
    @Override
    public List<Operator> queryOperatorForIDList(List<String> ids) {
        List<Operator> operators = operatorMapper.queryOperatorForIDList(ids);
        return operators;
    }

}
    