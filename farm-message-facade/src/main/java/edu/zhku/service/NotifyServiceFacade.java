package edu.zhku.service;

/**
 * @author chujian
 * @ClassName NotifyServiceFacade
 * @Description 功能描述
 * @date 2019/2/16 18:29
 */
public interface NotifyServiceFacade {

    /**
     * 这里只能单个通知
     * @param role
     * @param destination
     * @param content
     * @return
     */
    boolean notify(String role, String destination, String content);

}
