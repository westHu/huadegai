package com.hup.decode;

import com.google.protobuf.MessageLite;
import io.netty.buffer.ByteBuf;
import io.netty.channel.ChannelHandlerContext;
import io.netty.handler.codec.MessageToMessageDecoder;
import io.netty.handler.codec.http.websocketx.BinaryWebSocketFrame;
import io.netty.handler.codec.http.websocketx.WebSocketFrame;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;

/**
 * @author guoqw
 * @since 2016-11-16 09:04
 */
public class CommonProtoBufDecoder extends MessageToMessageDecoder<WebSocketFrame> {

    private final Logger logger = LoggerFactory.getLogger(CommonProtoBufDecoder.class);

    private static final boolean HAS_PARSER;

    static {
        boolean hasParser = false;
        try {
            // MessageLite.getParsetForType() is not available until protobuf 2.5.0.
            MessageLite.class.getDeclaredMethod("getParserForType");
            hasParser = true;
        } catch (Throwable t) {
            // Ignore
        }

        HAS_PARSER = hasParser;
    }

    @Override
    protected void decode(ChannelHandlerContext ctx, WebSocketFrame frame, List<Object> out) throws Exception {
        logger.info("准备解码websocket协议信息到proto实体");
        if (frame instanceof BinaryWebSocketFrame) {
            ByteBuf msg = frame.content();

            // 0、先解析出proto类型，默认消息第1位为消息类型标示
            byte index = msg.readByte();
            //MessageLite prototype = CommonProtoBufConfig.getType(index, ProtoBufConstants.WEB);

            // 1、解析实体
            final byte[] array;
            final int offset;
            final int length = msg.readableBytes();
            if (msg.hasArray()) {
                array = msg.array();
                offset = msg.arrayOffset() + msg.readerIndex();
            } else {
                array = new byte[length];
                msg.getBytes(msg.readerIndex(), array, 0, length);
                offset = 0;
            }

            if (HAS_PARSER) {
                //out.add(prototype.getParserForType().parseFrom(array, offset, length));
            } else {
                //out.add(prototype.newBuilderForType().mergeFrom(array, offset, length).build());
            }
        } else {
            logger.error("不支持的数据类型=>{}", frame.getClass());
        }
    }

    @Override
    public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) throws Exception {
        logger.error("解码websocket协议信息到protoBuf实体出错", cause);
    }
}
