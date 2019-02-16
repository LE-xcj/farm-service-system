package edu.zhku.mapper;

import edu.zhku.pojo.Certification;

import java.util.List;

public interface CertificationMapper {


    int deleteByPrimaryKey(Integer id) throws Exception;

    int insert(Certification record) throws Exception;

    int insertSelective(Certification record) throws Exception;

    Certification selectByPrimaryKey(Integer id) throws Exception;
    List<Certification> selecetByCondition(Certification certification) throws Exception;

    int updateByPrimaryKeySelective(Certification record) throws Exception;
    int updateByPrimaryKey(Certification record) throws Exception;
}