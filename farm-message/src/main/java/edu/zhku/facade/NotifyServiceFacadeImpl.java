package edu.zhku.facade;


import edu.zhku.service.NoticeService;
import edu.zhku.service.NotifyServiceFacade;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author chujian
 * @ClassName MessageFacadeImpl
 * @Description 功能描述
 * @date 2019/2/19 20:02
 */
public class NotifyServiceFacadeImpl implements NotifyServiceFacade {

    @Autowired
    private NoticeService noticeService;

    @Override
    public boolean notify(String role, String destination, String content) {
        boolean result = false;
        try {
            result = noticeService.tryNotify(role, destination, content);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;

    }

}
    