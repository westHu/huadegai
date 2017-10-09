package com.hup.handler;

import io.netty.channel.ChannelHandler;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.ChannelInboundHandlerAdapter;
import io.netty.handler.codec.http.websocketx.WebSocketServerProtocolHandler;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


/**
 * 将校验通过的token与channel绑定
 *
 * @author guoqw
 * @since 2017-01-06 16:18
 */
@Component
@ChannelHandler.Sharable
public class WebSocketChannelTokenHandler extends ChannelInboundHandlerAdapter {

    private final Logger logger = LoggerFactory.getLogger(WebSocketChannelTokenHandler.class);

    private static final int NO_MESSAGE_ID = -1;

//    @Autowired
//    private WebsocketMessageService websocketMessageService;

    @Override
    public void userEventTriggered(ChannelHandlerContext ctx, Object evt) throws Exception {
        // 是否是WebSocket握手完成的而触发的
        if (evt == WebSocketServerProtocolHandler.ServerHandshakeStateEvent.HANDSHAKE_COMPLETE) {
            // 开始绑定token与channel
//            TokenDto threadToken = WsTokenChannelHolder.getThreadToken();
//            if (threadToken == WsTokenChannelHolder.DEFAULT_VALUE) {
//                throw new XBusinessException("token未正确获取,请检查netty是否正确设置。");
//            }
//            WsTokenChannelHolder.add(threadToken, ctx.channel().id());
//            // 绑定完成后移除线程绑定的token
//            WsTokenChannelHolder.clearThreadToken();
//            // 查询并推送当前用户的未读消息数量与一条最新的未读消息
//            LatestWebSocketMessageDto latestWebSocketMessage;
//            try {
//                latestWebSocketMessage = websocketMessageService.getLatestWebSocketMessage(
//                        threadToken.getUserId(), threadToken.getPlatform());
//            } catch (Exception e) {
//                // 这里出错应该是直推类型的消息，没有同步过用户信息，也就没有未读消息，直接返回
//                return;
//            }
//            if (latestWebSocketMessage == null || latestWebSocketMessage.getUnreadCount() == 0) {
//                return;
//            }
//            WebsocketMessageDto wsPushMessageDto = latestWebSocketMessage.getWebsocketMessageDto();
//            WsMessage.WsPushMessage.Builder builder = WsMessage.WsPushMessage.newBuilder()
//                    .setCount(latestWebSocketMessage.getUnreadCount());
//            if (wsPushMessageDto == null) {
//                builder.setMid(NO_MESSAGE_ID);
//            } else {
//                builder.setMid(wsPushMessageDto.getId())
//                        .setContent(wsPushMessageDto.getContent())
//                        .setCategoryName(wsPushMessageDto.getCategory().getCategoryName());
//                if (wsPushMessageDto.getCustomCategoryName() != null) {
//                    builder.setCustomCategoryName(wsPushMessageDto.getCustomCategoryName());
//                }
//                if (wsPushMessageDto.getCustomContent() != null) {
//                    builder.setCustomContent(wsPushMessageDto.getCustomContent());
//                }
//            }
//            ctx.writeAndFlush(WsMessageUtil.wrappedToWebSocket(builder.build()));
        }

        super.userEventTriggered(ctx, evt);
    }
}
