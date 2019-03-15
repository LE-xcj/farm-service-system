package edu.zhku.service.impl;

import edu.zhku.controller.NoticeServer;
import edu.zhku.mapper.NoticeMapper;
import edu.zhku.pojo.Notice;
import edu.zhku.pojo.NoticeCondition;
import edu.zhku.pojo.NoticeDTO;
import edu.zhku.service.NoticeService;
import edu.zhku.util.RedisUtil;
import edu.zhku.vo.NoticeVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.List;

/**
 * @author chujian
 * @ClassName NoticeServiceImpl
 * @Description 功能描述
 * @date 2019/2/19 20:01
 */
@Service
public class NoticeServiceImpl implements NoticeService{

    @Resource(name = "redisUtil")
    private RedisUtil redisUtil;

    @Autowired
    private NoticeMapper noticeMapper;

    @Override
    public boolean tryNotify(String role, String destination, String content) throws Exception {

        if (null == destination) {
            return false;
        }

        //包装
        Notice notice = new Notice();
        int flag = roleAddapte(role);
        notice.setRole(flag);
        notice.setDestination(destination);
        notice.setContent(content);

        //消息推送
        boolean f = tryNotice(destination, notice);


        //向数据库插入通知记录
        insertNotice(notice);

        return f;
    }

    /**
     * 尝试消息推送
     * @param destination
     * @param notice
     * @return
     * @throws IOException
     */
    private boolean tryNotice(String destination, Notice notice) throws IOException {

        boolean f = false;

        //在线，或者是会话还没失效
        if (hasLogin(destination)) {

            //尝试通知（因为用户可能已经将关闭页面了
            f = NoticeServer.notice(notice);

        }

        return f;
    }


    /**
     * 判断用户是否在线
     * @param destination
     * @return
     */
    private boolean hasLogin(String destination) {

        boolean login = false;

        //判断是否在线，这里在线也是相对的。因为redis会对用户信息缓存2个小时
        Object online = redisUtil.get(destination);
        if (null != online){
            login = true;
        }

        return login;


    }

    @Override
    public int insertNotice(Notice notice) throws Exception {

        int num = 0;

        if (null == notice) {
            return 0;
        }
        num = noticeMapper.insertSelective(notice);

        return num;
    }

    @Override
    public NoticeVo selectNoticeByCondition(NoticeCondition condition) throws Exception {

        //分页查询
        List<Notice> notices = noticeMapper.selectByCondition(condition);


        //总数
        int count = count(condition);
        int pageSize = condition.getPageSize();

        //计算页数
        int totalPage = getTotalPage(count, pageSize);

        //包装成指定的视图
        NoticeVo vo = new NoticeVo();
        vo.setNotices(notices);
        vo.setTotalPage(totalPage);

        return vo;
    }

    /**
     * 根据条件查询满足条件的消息总数
     * @param condition
     * @return
     * @throws Exception
     */
    @Override
    public int count(Notice condition) throws Exception {

        if (condition == null) {
            return 0;
        }

        //包装
        NoticeCondition temp = new NoticeCondition();
        temp.setNotice(condition);

        int count = count(temp);

        return count;
    }

    /**
     * 计算总数
     * @param condition
     * @return
     * @throws Exception
     */
    public int count(NoticeCondition condition) throws Exception {
        //计算总数
        int count = noticeMapper.count(condition);
        return count;
    }

    /**
     * 更新一个notice的状态
     * @param notice
     * @return
     * @throws Exception
     */
    @Override
    public int updateNotice(Notice notice) throws Exception {
        if (null == notice){
            return 0;
        }
        int num = noticeMapper.updateByPrimaryKeySelective(notice);
        return num;
    }

    /**
     * 批量更新通知的状态
     * @param dto
     * @return
     * @throws Exception
     */
    @Override
    public int updateNoticeStatusForList(NoticeDTO dto) throws Exception {
        if (null == dto){
            return 0;
        }

        List<Integer> ids = dto.getIds();
        if (null == ids || ids.isEmpty()){
            return 0;
        }

        int num = noticeMapper.updateNoticeStatusForList(dto);
        return num;
    }


    /**
     * 计算总页数
     * @param count
     * @param pageSize
     * @return
     */
    private int getTotalPage(int count, int pageSize) {

        int totalPage = count / pageSize;

        if (count % pageSize != 0) {
            ++totalPage;
        }

        return totalPage;

    }

    /**
     * 适配
     * @param role
     * @return
     */
    private int roleAddapte(String role) {
        if (role.equals("farmer")) {
            return 1;
        } else if (role.equals("merchant")) {
            return 2;
        } else {
            return 3;
        }
    }


}
    