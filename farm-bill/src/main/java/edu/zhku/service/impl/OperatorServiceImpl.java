package edu.zhku.service.impl;

import edu.zhku.constant.ExceptionMessage;
import edu.zhku.dao.OperatorDao;
import edu.zhku.pojo.Operator;
import edu.zhku.pojo.OperatorCondition;
import edu.zhku.service.OperatorService;
import edu.zhku.util.KeyFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @author chujian
 * @ClassName OperatorServiceImpl
 * @Description 功能描述
 * @date 2019/2/17 17:27
 */
@Service
public class OperatorServiceImpl implements OperatorService {


    @Autowired
    private OperatorDao operatorDao;

    /**
     * 增加机手
     * id：程序负责产
     * @param operator
     * @return
     * @throws Exception
     */
    @Override
    public int insertOperator(Operator operator) throws Exception {

        if (isNull(operator)) {
            throw new Exception(ExceptionMessage.NAMENULL);
        }

        List<Operator> list = new ArrayList<>();
        list.add(operator);

        setID(list);

        int num = insertOperators(list);

        return num;
    }


    /**
     * 批量增加，要么全部插入成功，只要有一个不满足要求就抛出异常
     * 要求：
     *  机手对象不能为空，并且name不能为空
     * @param operators
     * @return
     * @throws Exception
     */
    @Override
    public int insertOperators(List<Operator> operators) throws Exception {

        if (isNull(operators)) {
            throw new Exception(ExceptionMessage.ATTRIBUTENULL);
        }

        setID(operators);

        int num = operatorDao.insertOperators(operators);

        return num;
    }


    /**
     * 根据id查询机手信息
     * @param oid
     * @return
     * @throws Exception
     */
    @Override
    public Operator selectOperatorById(String oid) throws Exception {
        if (isNull(oid)) {
            throw new Exception(ExceptionMessage.IDNULL);
        }

        Operator operator = operatorDao.selectByPrimaryKey(oid);
        return operator;
    }

    /**
     * 根据条件查询
     * 注意这里只是分页查询而已，将某个商户的机手分页显示
     * @param condition
     * @return
     * @throws Exception
     */
    @Override
    public List<Operator> selectOperatorByCondition(OperatorCondition condition) throws Exception {

        if (null == condition) {
            throw new Exception(ExceptionMessage.OBJNULL);
        }

        List<Operator> operators = operatorDao.selectOperatorByCondition(condition);

        return operators;
    }

    @Override
    public int count(OperatorCondition condition) throws Exception {
        int total = operatorDao.count(condition);
        return total;
    }

    /**
     * 根据id更新
     * 对象、name、id都不能为空，否则抛出异常
     * @param operator
     * @return
     * @throws Exception
     */
    @Override
    public int updateOperatorById(Operator operator) throws Exception {

        if (isNull(operator) || isNull(operator.getOid())) {
            throw new Exception(ExceptionMessage.ATTRIBUTENULL);
        }

        int num = operatorDao.updateByPrimaryKeySelective(operator);
        return num;
    }

    /**
     * 批量更新
     * 这里可能要用到replace关键字
     * 这里要求：list不能为null，长度不能为0
     * 其中的元素，也必须不能为null，并且name和id也是
     * @param operators
     * @return
     * @throws Exception
     */
    @Override
    public int updateOperatorsById(List<Operator> operators) throws Exception {

        if (isNull(operators)) {
            throw new Exception(ExceptionMessage.OBJNULL);
        }

        for (Operator operator : operators) {
            if (isNull(operator) || isNull(operator.getOid())) {
                throw new Exception(ExceptionMessage.ATTRIBUTENULL);
            }
        }

        int num = operatorDao.updateOperatorsById(operators);
        return num;
    }

    /**
     * 根据id删除机手
     * @param oid
     * @return
     * @throws Exception
     */
    @Override
    public int deleteOperatorById(String oid) throws Exception {

        if (isNull(oid)) {
            throw new Exception(ExceptionMessage.IDNULL);
        }

        int num = operatorDao.deleteByPrimaryKey(oid);

        return num;
    }

    /**
     * 更具id批量删除机手
     * 机手的id集合不能为null，并且长度大于0
     * @param oids
     * @return
     * @throws Exception
     */
    @Override
    public int deleteOperatorsById(List<String> oids) throws Exception {

        if (oids == null || oids.isEmpty()) {
            throw new Exception(ExceptionMessage.OBJNULL);
        }

        int num = operatorDao.deleteOperatorsById(oids);

        return num;
    }


    /**
     * 设置机手id
     * 这里要求，机手集合中的元素不能为null，并且name也不能为null
     * @param operators
     * @throws Exception
     */
    private void setID(List<Operator> operators) throws Exception {

        if (null == operators){
            return;
        }

        //开始遍历机手集合
        for (Operator operator : operators) {
            if (isNull(operator)){
                throw new Exception(ExceptionMessage.ATTRIBUTENULL);
            }
            operator.setOid(KeyFactory.generateKey());
        }

    }

    /**
     * 判断id是否为null
     * @param id
     * @return
     */
    private boolean isNull(String id) {
        if (null == id || "".equals(id.trim())) {
            return true;
        }
        return false;
    }


    /**
     * 判断机手对象是否为null，name是否也为null
     * 两者满足其一，可认为是为null
     * @param operator
     * @return
     */
    private boolean isNull(Operator operator) {
        if (null == operator ||
                operator.getOname() == null ||
                "".equals(operator.getOname().trim())){
            return true;
        }
        return false;
    }

    /**
     * 判断机手集合是否为null
     * 如果集合长度为0，也视为null
     * @param operators
     * @return
     */
    private boolean isNull(List<Operator> operators) {
        if (operators == null || operators.isEmpty()) {
            return true;
        }
        return false;
    }


}
    