package com.hup.service.message.send;

import com.hup.util.proxy.HttpClientUtils;
import com.hup.util.uuid.UUIDUtil;
import com.hup.entity.SmsMessage;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.http.HttpEntity;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

/**
 * Created
 *{"account":"zjaksyx","apiUrl":"http://223.68.139.178:9010/YidaInterface/SendSms.do","channelType":0,"comment":"","password":"111111","quitSubscriptionMsg":"","scorpId":""}
 *{"account":"zjaks","apiUrl":"http://223.68.139.178:9010/YidaInterface/SendSms.do","channelType":0,"password":"111111"}
 * @desc 易达网关
 */
@Service
public class HupOneGatewayService {

    private static final Logger logger = LoggerFactory.getLogger(HupOneGatewayService.class);

    private String account_yx  = "zjaksyx";
    private String apiUrl_yx = "http://223.68.139.178:9010/YidaInterface/SendSms.do";
    private String password_yx = "111111";
    private String account_yz  = "zjaks";
    private String apiUrl_yz = "http://223.68.139.178:9010/YidaInterface/SendSms.do";
    private String password_yz = "111111";



    /**单发*/
    public SmsMessage singleSend(SmsMessage smsMessage) {
        logger.info("=======HupOne通道单发");
        //发送短信
        String traceId = UUIDUtil.getRandomString(20);           //得到流水号 消息推送平台给运营商的流水号，运营商会根据流水号返回状态
        //smsMessage.setTraceId(traceId);
        String params = null;
        String apiUrl = "";
        if (smsMessage.getType().equals("marketing")){
            apiUrl = apiUrl_yx;
            params = generateParams(smsMessage.getMobile(), smsMessage.getContent(), traceId, account_yx, password_yx);
        }else if (smsMessage.getType().equals("notification")) {
            apiUrl = apiUrl_yz;
            params = generateParams(smsMessage.getMobile(), smsMessage.getContent(), traceId, account_yz, password_yz);
        }
        String result = null;
        try{
           /* result = HttpClientUtils.getInstance().postForm(apiUrl, params, (httpResponse, charset) -> {
                HttpEntity entity = httpResponse.getEntity();
                return IOUtils.toString(entity.getContent(), charset);
            });*/
        } catch (Exception e) {
            logger.error("HupOne通道发送异常：",e.getMessage());
            //smsMessage.setStatus("发送失败");
            //smsMessage.setContent("推送至HupOne通道Http异常");
            setMessage(smsMessage,"发送失败", "推送至HupOne通道Http异常!");
            return smsMessage;
        }
        logger.info("HupOne通道返回的结果： " + result);
        //返回结果为空
        if (StringUtils.isEmpty(result)){
            setMessage(smsMessage,"发送失败", "提交HupOne通道异常：返回值为空!");
            return smsMessage;
        }
        //返回结果不合理
        int code;
        try {
            code = Integer.parseInt(result.trim().split(",")[0]);
        }catch (Exception e){
            setMessage(smsMessage,"发送失败", "提交HupOne通道异常：返回值转化异常!");
            return smsMessage;
        }
        if (code == 0){
            //smsMessage.setStatus("到达通道");
            //smsMessage.setComment("成功推送至HupOne通道！");
            setMessage(smsMessage,"到达通道", "成功推送至HupOne通道!");
        }else {
            //smsMessage.setStatus("发送失败");
            //smsMessage.setComment("HupOne通道返回参数异常");
            setMessage(smsMessage,"发送失败", "HupOne通道返回参数异常!");
        }
        return smsMessage;
    }


    private void setMessage(SmsMessage smsMessage, String status, String comment) {
        smsMessage.setStatus(status);
        smsMessage.setComment(comment);
    }

    /**
     * @desc  获取发送参数
     */
    private String generateParams( String mobile, String smsContent, String msgIds, String account, String password) {
        StringBuffer params = new StringBuffer();
        params.append("sname="+account+"&spwd="+password+"&scorpid=");
        params.append("&sphones=" + mobile);
        params.append("&smsg=" + smsContent.replace("&","%26"));
        params.append("&msg_id=" + msgIds);
        return params.toString();
    }

    public static void main(String[] args) {
        SmsMessage smsMessage = new SmsMessage();
        smsMessage.setMobile("18258181557");
        smsMessage.setContent("【xkeshi】您的短信验证码是7632，运维管理平台。10分钟内有效");
        smsMessage.setType("notification");
        HupOneGatewayService service = new HupOneGatewayService();
        service.singleSend(smsMessage);
    }
}
