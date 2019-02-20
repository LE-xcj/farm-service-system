package edu.zhku.controller;

import edu.zhku.pojo.Notice;
import net.sf.json.JSONObject;

import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

/**
 * <p>Title: ChatInRoomServer.java</p>
 * <p>Description: </p>
 *
 * @author xcj
 * @date 2019年2月19日
 */

//注意这里，这里使用了resful的形式传递房间名
@ServerEndpoint("/notice/{id}")
public class NoticeServer {


    //格式化日期
    private static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd HH:mm");   // 日期格式化

    // 使用map来收集session，key为用户id，value为不同的连接
    // concurrentMap的key不存在时报错，不是返回null
    private static final Map<String, Set<Session>> users = new ConcurrentHashMap();


    /**
     * 连接建立成功调用的方法
     *
     * @param session
     * 可选的参数。session为与某个客户端的连接会话，需要通过它来给客户端发送数据
     */
    @OnOpen
    public void onOpen(@PathParam("id") String id, Session session) {

        // 将session按照用户id来存储
        if (!users.containsKey(id)) {

            // 创建
            Set<Session> sets = new HashSet<Session>();

            // 添加用户
            sets.add(session);

            //添加
            users.put(id, sets);
        } else {

            // 已存在，直接添加用户到相应的地方
            users.get(id).add(session);
        }
        System.out.println("a client has connected!");
    }

    /**
     * 连接关闭调用的方法
     */
    @OnClose
    public void onClose(@PathParam("roomName") String id, Session session) {

        removeSession(session);
        System.out.println("一个客户断开连接");
    }

    /**
     * 根据房间，群发消息
     * 收到客户端消息后调用的方法
     *
     * @param id
     *                房间名
     * @param message
     *            客户端发送过来的消息
     * @param session
     *            可选的参数
     * @throws IOException
     */
    @OnMessage
    public void getMessage(@PathParam("id") String id,
                           String message, Session session) throws IOException {
        System.out.println("来自客户端的消息:" + message);

        // 把客户端的消息解析为JSON对象
        JSONObject jsonObject = JSONObject.fromObject(message);

        // 在消息中添加发送日期
        jsonObject.put("date", DATE_FORMAT.format(new Date()));

        //获取特定房间的所有会话，也就是所有群聊用户
        Set<Session> sessions = users.get(id);

        //遍历所有会话
        for(Session s : sessions) {

            //判断是不是自己发的，这是为了方便前端知道这条信息的显示
            if(session == s) {
                jsonObject.put("isSelf", true);
            }else {
                jsonObject.put("isSelf", false);
            }

            //群发消息
            sendMessage(s, jsonObject.toString());
        }
    }

    /**
     * 发生错误时调用
     *
     * @param session
     * @param error
     */
    @OnError
    public void onError(@PathParam("id")String id, Session session, Throwable error) {
        removeSession(session);
        System.out.println("发生错误");
    }



    public void removeSession( Session session) {
        Set<Map.Entry<String, Set<Session>>> entries = users.entrySet();

        for (Map.Entry<String, Set<Session>> entry : entries) {
            Set<Session> sets = entry.getValue();
            if (sets.contains(session)) {
                sets.remove(session);
                return;
            }
        }
    }

    /**
     * 这个方法与上面几个方法不一样。没有用注解，是根据自己需要添加的方法。
     *
     * @param message
     * @throws IOException
     */
    public void sendMessage(Session session, String message) throws IOException {
        session.getBasicRemote().sendText(message);
    }

    public static boolean notice(Notice notice) throws IOException {

        Set<Session> sessions = users.get(notice.getDestination());

        JSONObject jsonObject = JSONObject.fromObject(notice);

        // 在消息中添加发送日期
        jsonObject.put("date", DATE_FORMAT.format(new Date()));

        if (null == sessions || sessions.isEmpty()) {
            return false;
        }

        //通知
        for (Session session : sessions) {
            session.getBasicRemote().sendText(jsonObject.toString());
        }

        return true;

    }

}