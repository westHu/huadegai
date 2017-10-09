package com.hup.handler;

import com.google.protobuf.MessageLite;
import io.netty.channel.*;
import io.netty.channel.group.ChannelGroup;
import io.netty.channel.group.DefaultChannelGroup;
import io.netty.handler.timeout.IdleStateEvent;
import io.netty.util.ReferenceCountUtil;
import io.netty.util.concurrent.GlobalEventExecutor;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * 通用的protoBuf处理类
 *
 * @author guoqw
 * @since 2016-11-16 09:01
 */
@Component
@ChannelHandler.Sharable
public class CommonProtoBufServerHandler extends SimpleChannelInboundHandler<MessageLite> {

//    @Autowired
//    private ClientInfoService clientInfoService;

//    @Autowired
//    private ClientOperateLogService clientOperateLogService;

    @Value("${open.client.log:true}")
    private Boolean isOpenTcpClientLog;

    /**
     * netty提供的维护channel容器
     */
    private static ChannelGroup channels = new DefaultChannelGroup(GlobalEventExecutor.INSTANCE);

    private final Logger logger = LoggerFactory.getLogger(CommonProtoBufServerHandler.class);

    /**
     * 根据channelId获取channel
     *
     * @param channelId
     * @return
     */
    public static Channel findChannel(ChannelId channelId) {
        return channels.find(channelId);
    }

    /**
     * 添加channel，存在的话覆盖掉，使用最新的
     *
     * @param channel
     */
    public static void addChannel(Channel channel) {
        channels.add(channel);
    }

    @Override
    protected void channelRead0(ChannelHandlerContext ctx, MessageLite msg) throws Exception {
//        CommonProtoBufConfig.handler(msg, ctx);
        ReferenceCountUtil.release(msg);
    }

    /**
     * 出现异常，关闭连接。此时channels会自动异常掉异常的连接，不需要主动移除
     *
     * @param ctx
     * @param cause
     * @throws Exception
     */
    @Override
    public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) throws Exception {
        Channel channel = ctx.channel();
        if (channel.isActive() && isOpenTcpClientLog) {
//            String clientId = SendUtilMap.getClientId(ctx.channel().id());
//            // 如果是tcp类型的key，将error信息返还给客户端
//            if (TokenGenerateUtils.isTcpToken(clientId)) {
//                Error.XKSErrorMessageProto errorMessage = Error.XKSErrorMessageProto.newBuilder()
//                        .setContent(cause.getMessage())
//                        .setSendTime(System.currentTimeMillis())
//                        .build();
//                channel.writeAndFlush(errorMessage);
//            }
        }
        System.out.println("链接异常被关闭 " + channel.remoteAddress());
        logger.error("client:{}链接异常被关闭.", channel.remoteAddress(), cause);
        ctx.close();
    }

    @Override
    public void handlerRemoved(ChannelHandlerContext ctx) throws Exception {
        channels.remove(ctx.channel());
//        String clientId = SendUtilMap.remove(ctx.channel().id());
//        if (clientId != null && TokenGenerateUtils.isTcpToken(clientId)) {
//            recordClientLogout(clientId);
//        } else {
//            // remove WsTokenChannelHolder
//            clientId = WsTokenChannelHolder.remove(ctx.channel().id());
//        }
//        deleteRelation(RegisterConstant.MESSAGE_PLATFORM_DUBBO_ROUTER, clientId);
    }

    /**
     * 删除key和ip的关联关系
     *
     * @param operatorType
     * @param key
     */
//    private void deleteRelation(String operatorType, String key) {
//        if (StringUtils.isEmpty(operatorType) || StringUtils.isEmpty(key)) {
//            return;
//        }
//        RegisterFactory.getRegister(RegisterConstant.REDIS_TYPE).unregister(RegisterConstant.MESSAGE_PLATFORM_DUBBO_ROUTER, key);
//    }

    /**
     * 记录客户端的退出操作
     *
     * @param clientId
     */
//    private void recordClientLogout(String clientId) {
//        // 更新客户端连接信息
//        UpdateClientInfoDto updateClientInfoDto = new UpdateClientInfoDto();
//        updateClientInfoDto.setOfflineTime(new Date());
//        updateClientInfoDto.setClientId(clientId);
//        updateClientInfoDto.setConnected(false);
//        clientInfoService.updateClientInfo(updateClientInfoDto);
//
//        // 保存客户端下线信息
//        SaveClientOperateLogDto operateLogDto = new SaveClientOperateLogDto();
//        operateLogDto.setClientId(clientId);
//        operateLogDto.setOperateType(ClientOperateLogConstant.LOGOUT);
//        clientOperateLogService.saveClientOperateLog(operateLogDto);
//    }

    @Override
    public void channelInactive(ChannelHandlerContext ctx) throws Exception {
        Channel incoming = ctx.channel();
        System.out.println("client:" + incoming.remoteAddress() + "连接关闭");
        logger.debug("client:" + incoming.remoteAddress() + "连接关闭");
    }

    @Override
    public void userEventTriggered(ChannelHandlerContext ctx, Object evt) throws Exception {
        if (evt instanceof IdleStateEvent) {
            IdleStateEvent e = (IdleStateEvent) evt;
            switch (e.state()) {
                case READER_IDLE:
                    handleReaderIdle(ctx);
                    break;
                case ALL_IDLE:
                    handleAllIdle(ctx);
                    break;
                default:
                    break;
            }
        }
    }

    /**
     * 处理超过一定时间没有写操作,向client发送ping包
     *
     * @param ctx
     */
    private void handleAllIdle(ChannelHandlerContext ctx) {
//        String clientId = SendUtilMap.getClientId(ctx.channel().id());
//        String secret = clientInfoService.getAppSecretByClientId(clientId);
//        Long sendTime = System.currentTimeMillis();
//        String sign = SignFactory.buildSign(secret, new PingSendMessageParamBuild(sendTime));
//        Ping.XKSPingSendMessageProto request = Ping.XKSPingSendMessageProto.newBuilder()
//                .setSendTime(sendTime)
//                .setSign(sign)
//                .build();
//        ctx.channel().writeAndFlush(request);
    }

    /**
     * 处理超过一定时间没有读操作，移除channel
     *
     * @param ctx
     */
    private void handleReaderIdle(ChannelHandlerContext ctx) {
        boolean remove = channels.remove(ctx.channel());
        if (remove) {
            ctx.channel().close();
        }
    }
}
