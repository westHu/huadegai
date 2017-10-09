package com.hup.server;


import com.hup.decode.CommonProtoBufDecoder;
import com.hup.handler.CommonProtoBufServerHandler;
import com.hup.handler.WebSocketChannelTokenHandler;
import com.hup.handler.WebSocketTokenValidator;
import io.netty.channel.ChannelInitializer;
import io.netty.channel.ChannelPipeline;
import io.netty.channel.socket.SocketChannel;
import io.netty.handler.codec.http.HttpObjectAggregator;
import io.netty.handler.codec.http.HttpServerCodec;
import io.netty.handler.codec.http.websocketx.WebSocketServerProtocolHandler;
import io.netty.handler.codec.http.websocketx.extensions.compression.WebSocketServerCompressionHandler;
import io.netty.handler.ssl.SslContext;
import io.netty.handler.ssl.SslContextBuilder;
import io.netty.handler.ssl.util.SelfSignedCertificate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

/**
 * @author guoqw
 * @since 2016-11-08 15:10
 */
@Component
public class WebSocketServerInitializer extends ChannelInitializer<SocketChannel> {

    public static final String WEBSOCKET_PATH = "/websocket";

    @Value("${websocket.server.ssl:false}")
    private boolean ssl;

    @Autowired
    private CommonProtoBufServerHandler commonProtoBufServerHandler;

    @Autowired
    private WebSocketTokenValidator webSocketTokenValidator;

    @Autowired
    private WebSocketChannelTokenHandler webSocketChannelTokenHandler;

    @Override
    public void initChannel(SocketChannel ch) throws Exception {
        ChannelPipeline pipeline = ch.pipeline();
        if (ssl) {
            SelfSignedCertificate ssc = new SelfSignedCertificate();
            SslContext sslCtx = SslContextBuilder.forServer(ssc.certificate(), ssc.privateKey()).build();
            pipeline.addLast(sslCtx.newHandler(ch.alloc()));
        }
        pipeline.addLast(new HttpServerCodec());
        pipeline.addLast(new HttpObjectAggregator(65536));
        pipeline.addLast(new WebSocketServerCompressionHandler()); //WebSocket数据压缩(可选)
        pipeline.addLast(webSocketTokenValidator);
        pipeline.addLast(new WebSocketServerProtocolHandler(WEBSOCKET_PATH, null, true));
        pipeline.addLast(webSocketChannelTokenHandler);

        pipeline.addLast(new CommonProtoBufDecoder());
        pipeline.addLast(commonProtoBufServerHandler);

    }

    public void setSsl(boolean ssl) {
        this.ssl = ssl;
    }
}
