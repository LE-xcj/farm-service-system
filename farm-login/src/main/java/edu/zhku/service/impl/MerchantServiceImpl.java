package edu.zhku.service.impl;

import edu.zhku.constant.Code;
import edu.zhku.constant.Role;
import edu.zhku.dao.MerchantDao;
import edu.zhku.pojo.Merchant;
import edu.zhku.service.MerchantService;
import edu.zhku.util.AMapUtil;
import edu.zhku.util.CodeVoFactory;
import edu.zhku.util.KeyFactory;
import edu.zhku.vo.CodeVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @author chujian
 * @ClassName MerchantServiceImpl
 * @Description 功能描述
 * @date 2019/2/13 12:26
 */
@Service
public class MerchantServiceImpl implements MerchantService{

    @Autowired
    private MerchantDao merchantDao;

    /**
     * 登录
     * @param merchant
     * @return
     * @throws Exception
     */
    @Override
    public CodeVo login(Merchant merchant) throws Exception {

        //该手机号还没注册
        if (!exist(merchant)) {
            return CodeVoFactory.getVo(Code.PHONENOTEXIST);
        }

        //查询密码和用户名是否匹配
        List<Merchant> list = selectByCondition(merchant);
        if (list.size() == 1){

            replaceMerchant(merchant, list.get(0));
            return CodeVoFactory.getVo(Code.SUCCESS);
        } else {
            return CodeVoFactory.getVo(Code.MISMATCH);
        }


    }

    private void replaceMerchant(Merchant source, Merchant target) {
        if (source == null || target == null)
            return;

        source.setMid(target.getMid());
        source.setMname(target.getMname());
        source.setPsw(target.getPsw());
        source.setPhone(target.getPhone());
        source.setAddress(target.getAddress());
        source.setLocation(target.getLocation());
        source.setPicture(target.getPicture());
        source.setDescription(target.getDescription());
        source.setIsverify(target.getIsverify());
    }


    /**
     * 注册
     * @param merchant
     * @param vCode  用户输入的验证码
     * @param realCode  实际验证码
     * @return
     * @throws Exception
     */
    @Override
    public CodeVo registe(Merchant merchant, String vCode, String realCode) throws Exception {

        //验证码错误
        if (realCode == null || !realCode.equals(vCode)){
            return CodeVoFactory.getVo(Code.WRONGVERIFYCODE);
        }

        //该手机号已经注册了
        if (exist(merchant)) {
            return CodeVoFactory.getVo(Code.PHONEEXIST);
        }

        //自动产生主键
        String id = KeyFactory.generateRoleKey(Role.MERCHANT);
        merchant.setMid(id);

        setLocation(merchant);

        //注册
        int flag = merchantDao.insertSelective(merchant);
        if (flag == 1){
            return CodeVoFactory.getVo(Code.SUCCESS);
        }
        return CodeVoFactory.getVo(Code.FAIL);
    }

    /**
     * 设置location信息
     * @param merchant
     */
    private void setLocation(Merchant merchant) {

        String address = merchant.getAddress();
        if (address == null) {
            return;
        }
        String location = AMapUtil.geoCode(address);
        merchant.setLocation(location);
    }

    /**
     * 根据商户id查询信息
     * @param mid
     * @return
     * @throws Exception
     */
    @Override
    public Merchant selectById(String mid) throws Exception {
        if (null == mid || "".equals(mid)){
            return null;
        }
        Merchant merchant = merchantDao.selectByPrimaryKey(mid);
        return merchant;
    }

    /**
     * 根据条件查询商户信息
     * @param condition
     * @return
     * @throws Exception
     */
    @Override
    public List<Merchant> selectByCondition(Merchant condition) throws Exception {
        if (condition == null) {
            return null;
        }
        List<Merchant> merchants = merchantDao.selectMerchantByCondition(condition);
        return merchants;
    }

    /**
     * 根据商户id更新信息
     * @param merchant
     * @return
     * @throws Exception
     */
    @Override
    public CodeVo updateMerchant(Merchant merchant) throws Exception {
        if (null == merchant || null == merchant.getMid() || "".equals(merchant.getMid())){
            return CodeVoFactory.getVo(Code.FAIL);
        }

        setLocation(merchant);
        int flag = merchantDao.updateByPrimaryKeySelective(merchant);
        if (flag == 1) {
            return CodeVoFactory.getVo(Code.SUCCESS);
        }
        return CodeVoFactory.getVo(Code.FAIL);
    }

    @Override
    public List<Merchant> queryByAddress(String address) throws Exception {

        //返回一个长度0的集合
        if (null == address)
            return new ArrayList<>();

        Merchant condition = new Merchant();
        condition.setAddress(address);
        List<Merchant> merchants = merchantDao.selectMerchantByCondition(condition);

        return merchants;
    }


    /**
     * 判断商户是否已经注册，根据手机号
     * @param merchant
     * @return
     * @throws Exception
     */
    private boolean exist(Merchant merchant) throws Exception {

        Merchant condition = new Merchant();
        condition.setPhone(merchant.getPhone());
        List<Merchant> list = selectByCondition(condition);

        if (list.isEmpty()) {
            return false;
        }

        return true;
    }
}
    