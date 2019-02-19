package edu.zhku.facade;

import com.alibaba.fastjson.JSON;
import edu.zhku.pojo.Farmer;
import edu.zhku.service.FarmerService;
import edu.zhku.service.FarmerServiceFacade;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author chujian
 * @ClassName FarmerServiceFacadeImpl
 * @Description 功能描述
 * @date 2019/2/18 19:25
 */
public class FarmerServiceFacadeImpl implements FarmerServiceFacade {

    @Autowired
    private FarmerService farmerService;

    @Override
    public String queryFarmerById(String fid) {

        String data = null;
        try {
            Farmer farmer = farmerService.selectById(fid);
            data = JSON.toJSONString(farmer);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return data;
    }
}
    