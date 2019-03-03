package edu.zhku.dao.impl;

import edu.zhku.constant.Table;
import edu.zhku.dao.FarmerDao;
import edu.zhku.mapper.FarmerMapper;
import edu.zhku.pojo.Farmer;
import edu.zhku.util.RedisUtil;
import javafx.scene.control.Tab;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @author chujian
 * @ClassName FarmerDaoImpl
 * @Description 功能描述
 * @date 2019/2/15 15:07
 */

/**
 * 实现redis 与 mysql 的读写分离
 * 原则：
 * 读：从redis读，无则再从mysql读，并将读到的数据写到redis
 * 写：写到mysql，然后更新到redis中
 */

//todo 这里还需要解决更新同步的问题
@Component
public class FarmerDaoImpl implements FarmerDao{

    @Autowired
    private FarmerMapper farmerMapper;

    @Autowired
    private RedisUtil redisUtil;

    @Override
    public int insertSelective(Farmer farmer) throws Exception {

        int flag = farmerMapper.insertSelective(farmer);

        if (flag == 1) {

            insertOrUpdate(farmer);
        }

        return flag;
    }

    @Override
    public Farmer selectByPrimaryKey(String fid) throws Exception {

        Farmer farmer = getFarmer(fid);

        if (farmer == null) {
            farmer = farmerMapper.selectByPrimaryKey(fid);
            insertOrUpdate(farmer);
        }

        return farmer;
    }

    @Override
    public List<Farmer> selectFarmerByCondition(Farmer condition) throws Exception {

        List<Farmer> farmers = farmerMapper.selectFarmerByCondition(condition);
        return farmers;
    }

    @Override
    public int updateByPrimaryKeySelective(Farmer farmer) throws Exception {

        int flag = farmerMapper.updateByPrimaryKeySelective(farmer);
        if (flag == 1) {
            insertOrUpdate(farmer);
            //farmer = farmerMapper.selectByPrimaryKey(farmer.getFid());
        }

        return flag;
    }

    private Farmer getFarmer(String fid) {
        Farmer farmer = (Farmer) redisUtil.hmGet(Table.FARMERTABLE.name(), fid);
        return farmer;
    }

    private void insertOrUpdate(Farmer farmer) {
        redisUtil.hmSet(Table.FARMERTABLE.name(), farmer.getFid(), farmer);
    }

}
    