package edu.zhku.pojo;

import edu.zhku.constant.Size;

/**
 * @author chujian
 * @ClassName EvaluationDTO
 * @Description 功能描述
 * @date 2019/3/8 13:35
 */
public class EvaluationDTO extends Evaluation {

    private int page;

    private int begin;

    private int pageSize = Size.EVALUATIONSIZE;

    //评价时间升序
    private boolean createTimeDesc = true;

    private boolean less = true;


    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
        this.begin = (page - 1) * pageSize;
    }

    public int getBegin() {
        return begin;
    }

    public void setBegin(int begin) {
        this.begin = begin;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }


    public boolean isCreateTimeDesc() {
        return createTimeDesc;
    }

    public void setCreateTimeDesc(boolean createTimeDesc) {
        this.createTimeDesc = createTimeDesc;
    }
}
    