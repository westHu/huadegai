package com.hup.server;

import com.google.protobuf.MessageLite;
import io.netty.bootstrap.ServerBootstrap;
import io.netty.channel.Channel;
import io.netty.channel.EventLoopGroup;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.nio.NioServerSocketChannel;
import io.netty.handler.logging.LogLevel;
import io.netty.handler.logging.LoggingHandler;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import java.util.Map;

/**
 * WebSocket Server
 *
 * @author
 * @since 2017-11-18 13:36
 */
public class WebSocketServer {

    private final Logger logger = LoggerFactory.getLogger(WebSocketServer.class);

    @Value("${websocket.server.ssl:false}")
    private boolean ssl;

    private static final int SSH_PORT = 8443;

    /**
     * websocket绑定的端口
     */
    @Value("${websocket.server.port:8881}")
    private int port;

    @Autowired
    private WebSocketServerInitializer webSocketServerInitializer;

    //private Map<Class<MessageLite>, ProtoBufListener> listenerMap;

    private EventLoopGroup bossGroup, workerGroup;

    public void init() throws Exception {
        if (ssl) {
            port = SSH_PORT;
        }

        // 注册protoBuf类型
        /*if (listenerMap != null && listenerMap.size() > 0) {
            CommonProtoBufConfig.registerByMap(listenerMap, ProtoBufConstants.WEB);
        }*/

        bossGroup = new NioEventLoopGroup(1);
        workerGroup = new NioEventLoopGroup();

        ServerBootstrap b = new ServerBootstrap();
        b.group(bossGroup, workerGroup)
                .channel(NioServerSocketChannel.class)
                .handler(new LoggingHandler(LogLevel.INFO))
                .childHandler(webSocketServerInitializer);

        Channel ch = b.bind(port).sync().channel();

        System.out.println("WebSocket Server已经启动，连接地址：{http}://127.0.0.1:{"+port+"}/");
        logger.info("WebSocket Server已经启动，连接地址：{}://127.0.0.1:{}/", (ssl ? "https" : "http"), port);
    }

    public void destroy() {
        if (bossGroup != null) {
            bossGroup.shutdownGracefully();
        }
        if (workerGroup != null) {
            workerGroup.shutdownGracefully();
        }
    }

    /*public XWebSocketServer setListenerMap(Map<Class<MessageLite>, ProtoBufListener> listenerMap) {
        this.listenerMap = listenerMap;
        return this;
    }*/
}
