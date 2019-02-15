package edu.zhku.service.impl;

import edu.zhku.constant.Code;
import edu.zhku.constant.Role;
import edu.zhku.dao.FarmerDao;
import edu.zhku.pojo.Farmer;
import edu.zhku.service.FarmerService;
import edu.zhku.util.CodeVoFactory;
import edu.zhku.util.KeyFactory;
import edu.zhku.vo.CodeVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
 * @author chujian
 * @ClassName FarmerServiceImpl
 * @Description 功能描述
 * @date 2019/2/13 11:27
 */

@Service
public class FarmerServiceImpl implements FarmerService{

    @Autowired
    private FarmerDao farmerDao;

    /**
     * 登录
     * @param farmer
     * @return
     * @throws Exception
     */
    @Override
    public CodeVo login(Farmer farmer) throws Exception {

        //该手机号还没注册
        if (!exist(farmer)) {
            return CodeVoFactory.getVo(Code.PHONENOTEXIST);
        }

        //查询密码和用户名是否匹配
        List<Farmer> list = selectByCondition(farmer);
        if (list.size() == 1){

            replaceFarmer(farmer, list.get(0));

            return CodeVoFactory.getVo(Code.SUCCESS);
        } else {
            return CodeVoFactory.getVo(Code.MISMATCH);
        }

    }

    /**
     * 注册
     * @param farmer
     * @param vCode  用户输入的验证码
     * @param realCode  实际验证码
     * @return
     * @throws Exception
     */
    @Override
    public CodeVo registe(Farmer farmer, String vCode, String realCode) throws Exception {

        //验证码错误
        if (realCode == null || !realCode.equals(vCode)){
            return CodeVoFactory.getVo(Code.WRONGVERIFYCODE);
        }

        //该手机号已经注册了
        if (exist(farmer)) {
            return CodeVoFactory.getVo(Code.PHONEEXIST);
        }

        //自动产生主键
        String id = KeyFactory.generateRoleKey(Role.FARMER);
        farmer.setFid(id);

        //注册
        int flag = farmerDao.insertSelective(farmer);
        if (flag == 1){
            return CodeVoFactory.getVo(Code.SUCCESS);
        }
        return CodeVoFactory.getVo(Code.FAIL);
    }


    @Override
    public Farmer selectById(String fid) throws Exception {

        if (null == fid || "".equals(fid)){
            return null;
        }
        Farmer farmer = farmerDao.selectByPrimaryKey(fid);
        return farmer;
    }

    /**
     * 根据条件查询
     * @param condition
     * @return
     * @throws Exception
     */
    @Override
    public List<Farmer> selectByCondition(Farmer condition) throws Exception {

        if (condition == null){
            return null;
        }

        List<Farmer> farmers = farmerDao.selectFarmerByCondition(condition);
        return farmers;
    }

    /**
     * 根据id更新信息
     * @param farmer
     * @return
     * @throws Exception
     */
    @Override
    public CodeVo updateFarmer(Farmer farmer) throws Exception {

        if (null == farmer || null == farmer.getFid() || "".equals(farmer.getFid())){
            return CodeVoFactory.getVo(Code.FAIL);
        }

        int flag = farmerDao.updateByPrimaryKeySelective(farmer);
        if (flag == 1) {
            return CodeVoFactory.getVo(Code.SUCCESS);
        }
        return CodeVoFactory.getVo(Code.FAIL);
    }


    /**
     * 检验手机号是否存在
     * @param farmer
     * @return
     * @throws Exception
     */
    private boolean exist(Farmer farmer) throws Exception {

        Farmer condition = new Farmer();
        condition.setPhone(farmer.getPhone());
        List<Farmer> list = selectByCondition(condition);

        if (list.isEmpty()) {
            return false;
        }

        return true;
    }


    private void replaceFarmer(Farmer source, Farmer target) {

        if (source == null || target == null)
            return;

        source.setFid(target.getFid());
        source.setFname(target.getFname());
        source.setPsw(target.getPsw());
        source.setPhone(target.getPhone());
        source.setAddress(target.getAddress());
        source.setLocation(target.getLocation());
        source.setPicture(target.getPicture());
        source.setDecription(target.getDecription());


    }

}
    