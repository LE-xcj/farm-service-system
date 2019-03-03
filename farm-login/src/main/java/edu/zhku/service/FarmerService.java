package edu.zhku.service;


import edu.zhku.pojo.Farmer;
import edu.zhku.vo.CodeVo;
import edu.zhku.vo.FarmerVo;

import java.util.List;

/**
 * @author chujian
 * @ClassName FarmerService
 * @Description 功能描述
 * @date 2019/2/13 11:24
 */
public interface FarmerService {

    CodeVo login(Farmer farmer) throws Exception;

    CodeVo registe(Farmer farmer, String vCode, String realCode) throws Exception;

    Farmer selectById(String fid) throws Exception;
    List<Farmer> selectByCondition(Farmer condition) throws Exception;

    CodeVo updateFarmer(Farmer farmer) throws Exception;

    CodeVo updatePsw(FarmerVo vo) throws Exception;

    CodeVo updatePhone(Farmer farmer) throws Exception;
}
