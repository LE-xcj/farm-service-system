package edu.zhku.mapper;

import edu.zhku.pojo.Evaluation;
import edu.zhku.pojo.EvaluationDTO;

import java.util.List;

public interface EvaluationMapper {
    int deleteByPrimaryKey(Integer id) throws Exception;

    int insert(Evaluation record) throws Exception;

    int insertSelective(Evaluation record) throws Exception;

    Evaluation selectByPrimaryKey(Integer id) throws Exception;

    int updateByPrimaryKeySelective(Evaluation record) throws Exception;

    int updateByPrimaryKey(Evaluation record) throws Exception;


    /**
     * 根据条件查询
     * @param condition
     * @return
     * @throws Exception
     */
    List<Evaluation> selectByCondition(EvaluationDTO condition) throws Exception;

    /**
     * 计算总数
     * @param condition
     * @return
     * @throws Exception
     */
    int countEvaluation(Evaluation condition) throws Exception;

    /**
     * 计算平均评分
     * @param iid
     * @return
     * @throws Exception
     */
    float avgLevel(Integer iid) throws Exception;

    /**
     * 批量插入评论
     * @param evaluations
     * @return
     * @throws Exception
     */
    int evaluateForList(List<Evaluation> evaluations) throws Exception;
}