package edu.zhku.dao;

import edu.zhku.pojo.*;
import edu.zhku.vo.BillDTO;
import edu.zhku.vo.ItemDTO;

import java.util.List; /**
 * @author chujian
 * @ClassName BillDao
 * @Description 功能描述
 * @date 2019/2/21 19:12
 */

//todo
public interface BillDao {

    /**
     * 创建订单
     * @param bill
     * @return
     * @throws Exception
     */
    int createBill(Bill bill) throws Exception;

    /**
     * 订单和商品的第三张表，批量插入相关记录
     * @param billItems
     * @return
     */
    int insertBillItemForList(List<BillItem> billItems);


    /**
     * 根据订单id来更新，其实一般更新订单就是对订单的状态进行更新
     * @param bill
     * @return
     * @throws Exception
     */
    int updateBillById(Bill bill) throws Exception;

    /**
     * 条件查询订单，农户和商户都使用
     * 所以这里非常重要和紧密才可
     * @param condition
     * @return
     * @throws Exception
     */
    BillDTO queryBill(BillCondition condition) throws Exception;

    /**
     * 根据订单-商品，这第三张表来对商品进行查询，并设置对应的数量
     * @param billItems  订单-商品
     * @return   商品Item类的子类（采用继承方式），里面包含num字段，也就是商品的数量
     * @throws Exception
     */
    List<ItemDTO> queryItemAndSetNum(List<BillItem> billItems) throws Exception;


    /**
     * 根据 订单-机手 这第三张表来查询某一订单负责的机手信息
     * @param billOperators
     * @return  机手信息的集合
     * @throws Exception
     */
    List<Operator> queryOperator(List<BillOperator> billOperators) throws Exception;

    /**
     * 批量插入BillOperator第三张表，商户负责调配相应机手负责某一订单
     * @param billOperators
     * @return
     */
    int insertBillOperatorsForList(List<BillOperator> billOperators);

    /**
     * 根据订单id查询订单信息
     * @param bid
     * @return
     * @throws Exception
     */
    Bill queryBillById(String bid) throws Exception;

    /**
     * 根据机手的id集合，批量查询机手信息
     * @param ids  机手的id集合
     * @return   机手信息集合
     */
    List<Operator> queryOperatorForIDList(List<String> ids);
}
