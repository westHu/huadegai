package com.hup.handler;

import com.hup.server.WebSocketServerInitializer;
import io.netty.buffer.ByteBuf;
import io.netty.buffer.Unpooled;
import io.netty.channel.ChannelHandler;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.ChannelInboundHandlerAdapter;
import io.netty.handler.codec.http.*;
import io.netty.util.CharsetUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.List;
import java.util.Map;

import static io.netty.handler.codec.http.HttpMethod.GET;
import static io.netty.handler.codec.http.HttpResponseStatus.*;
import static io.netty.handler.codec.http.HttpVersion.HTTP_1_1;

/**
 * WebSocket连接请求的token校验
 *
 * @author guoqw
 * @since 2016-12-02 10:36
 */
@Component
@ChannelHandler.Sharable
public class WebSocketTokenValidator extends ChannelInboundHandlerAdapter {

    private final Logger logger = LoggerFactory.getLogger(WebSocketTokenValidator.class);

    private static final String HTTP_REQUEST_TOKEN = "token";

    private final String webSocketPath = WebSocketServerInitializer.WEBSOCKET_PATH;

//    @Autowired
//    private TokenService tokenService;

//    @Value("${web.dubbo.protocol.port}")
//    private Integer port;

    @Override
    public void channelRead(final ChannelHandlerContext ctx, Object msg) throws Exception {
        if (msg instanceof FullHttpRequest) {
            FullHttpRequest req = (FullHttpRequest) msg;
            // Handle a bad request.
            if (!req.decoderResult().isSuccess()) {
                sendHttpResponse(ctx, req, new DefaultFullHttpResponse(HTTP_1_1, BAD_REQUEST));
                return;
            }

            // Allow only GET methods.
            if (req.method() != GET) {
                sendHttpResponse(ctx, req, new DefaultFullHttpResponse(HTTP_1_1, FORBIDDEN));
                return;
            }

            // 只接受websocket握手http请求
            QueryStringDecoder decoder = new QueryStringDecoder(req.uri());
            String uri = decoder.path();
            // 去掉"?token=xxx..."
            req.setUri(decoder.path());
            if (!webSocketPath.equals(uri)) {
                sendNotFund(ctx, req);
            }

            // 开始校验token
            Map<String, List<String>> parameters = decoder.parameters();
            String token;
            if (parameters == null || parameters.size() == 0 || !parameters.containsKey(HTTP_REQUEST_TOKEN)
                    || (token = parameters.get(HTTP_REQUEST_TOKEN).get(0)) == null || "".equals(token)) {
                logger.warn("WebSocket握手请求缺少必要的参数->[{}]", HTTP_REQUEST_TOKEN);
                sendUnauthorized(ctx, req);
                return;
            }
            System.out.println("token == " + token);
            // 从数据库校验token
//            TokenDto tokenDto = tokenService.findByToken(token);
//            if (tokenDto == null || tokenService.checkIsExpired(tokenDto)) {
//                logger.warn("token校验未通过或者已经过期");
//                sendUnauthorized(ctx, req);
//                return;
//            }
//            logger.info("token校验成功！");
//            WsTokenChannelHolder.setThreadToken(tokenDto);
            // 添加channel到缓存
            CommonProtoBufServerHandler.addChannel(ctx.channel());
            //将用户token和当前机器ip存入redis，解决socket负载均衡问题
//            persistenceRelation(token);
//            req.retain();
        }
        ctx.fireChannelRead(msg);
    }

    /**
     * 将clientId和当前机器ip持久化
     *
     * @param
     */
//    private void persistenceRelation(String token) {
//        String hostAddress = null;
//        try {
//            hostAddress = InetAddress.getLocalHost().getHostAddress();
//        } catch (UnknownHostException e) {
//            logger.error("获取机器ip出错", e);
//        }
//        RegisterFactory.getRegister(RegisterConstant.REDIS_TYPE).register(RegisterConstant.MESSAGE_PLATFORM_DUBBO_ROUTER, token, hostAddress,port);
//    }


    private static void sendNotFund(ChannelHandlerContext ctx, FullHttpRequest req) {
        sendHttpResponse(ctx, req, new DefaultFullHttpResponse(HTTP_1_1, NOT_FOUND));
    }

    private static void sendUnauthorized(ChannelHandlerContext ctx, FullHttpRequest req) {
        sendHttpResponse(ctx, req, new DefaultFullHttpResponse(HTTP_1_1, UNAUTHORIZED));
    }

    private static void sendHttpResponse(ChannelHandlerContext ctx, FullHttpRequest req, FullHttpResponse res) {
        // Generate an error page if response getStatus code is not OK (200).
        if (res.status().code() != 200) {
            ByteBuf buf = Unpooled.copiedBuffer(res.status().toString(), CharsetUtil.UTF_8);
            res.content().writeBytes(buf);
            buf.release();
            HttpUtil.setContentLength(res, res.content().readableBytes());
        }
    }
}
