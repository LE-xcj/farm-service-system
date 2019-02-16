package edu.zhku.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Configuration;

/**
 * @author chujian
 * @ClassName MyBatisConfig
 * @Description 功能描述
 * @date 2019/2/13 11:10
 */
@Configuration
@MapperScan("edu.zhku.mapper")
public class MyBatisConfig {
}
    