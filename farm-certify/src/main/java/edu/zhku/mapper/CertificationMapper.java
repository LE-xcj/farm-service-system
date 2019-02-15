package edu.zhku.mapper;

import edu.zhku.pojo.Certification;

public interface CertificationMapper {


    int deleteByPrimaryKey(Integer id);

    int insert(Certification record);

    int insertSelective(Certification record);


    Certification selectByPrimaryKey(Integer id);


    int updateByPrimaryKeySelective(Certification record);

    int updateByPrimaryKeyWithBLOBs(Certification record);

    int updateByPrimaryKey(Certification record);
}