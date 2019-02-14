package edu.zhku.service.impl;

import edu.zhku.constant.Code;
import edu.zhku.constant.Role;
import edu.zhku.mapper.MerchantMapper;
import edu.zhku.pojo.Merchant;
import edu.zhku.service.MerchantService;
import edu.zhku.util.CodeVoFactory;
import edu.zhku.util.KeyFactory;
import edu.zhku.vo.CodeVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
    private MerchantMapper merchantMapper;

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
            return CodeVoFactory.getVo(Code.SUCCESS);
        } else {
            return CodeVoFactory.getVo(Code.MISMATCH);
        }

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

        //注册
        int flag = merchantMapper.insertSelective(merchant);
        if (flag == 1){
            return CodeVoFactory.getVo(Code.SUCCESS);
        }
        return CodeVoFactory.getVo(Code.FAIL);
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
        Merchant merchant = merchantMapper.selectByPrimaryKey(mid);
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
        List<Merchant> merchants = merchantMapper.selectMerchantByCondition(condition);
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

        int flag = merchantMapper.updateByPrimaryKey(merchant);
        if (flag == 1) {
            return CodeVoFactory.getVo(Code.SUCCESS);
        }
        return CodeVoFactory.getVo(Code.FAIL);
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
    