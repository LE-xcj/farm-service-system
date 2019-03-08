package edu.zhku.vo;

import edu.zhku.pojo.Evaluation;

import java.util.List;

/**
 * @author chujian
 * @ClassName EvaluationVo
 * @Description 功能描述
 * @date 2019/3/8 14:14
 */
public class EvaluationVo {
    private List<Evaluation> evaluations;
    private int totalPage;
    private int total;
    private float avgLevel;

    public List<Evaluation> getEvaluations() {
        return evaluations;
    }

    public void setEvaluations(List<Evaluation> evaluations) {
        this.evaluations = evaluations;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public float getAvgLevel() {
        return avgLevel;
    }

    public void setAvgLevel(float avgLevel) {
        //四舍五入
        avgLevel = Math.round(avgLevel);
        this.avgLevel = avgLevel;
    }
}
    