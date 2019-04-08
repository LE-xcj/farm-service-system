# farm-service-system
##系统架构
+ 系统拆分
整个系统根据功能拆分成四个子系统，分别是：
 1. 登录系统
 2. 订单系统
 3. 消息系统
 4. 认证系统    
+ 注册中心  
使用Dubbo + Zookeeper搭建“服务注册中心”    
+ 数据库      
使用Redis + MySQL实现大部分的读写分离，并且设定两个数据库的同步规则。Redis负责“读”请求，MySQL主要负责“写”请求。而且Redis还完成Session共享，实现单点登录。  
+ 静态资源加速  
使用Nginx作为静态服务器，处理所有静态资源的请求。  

--------------------------------
系统整个系统的架构如下图：
![alt](/resources/pics/architecture.png)
