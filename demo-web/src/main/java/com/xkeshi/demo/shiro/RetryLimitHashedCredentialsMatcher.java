package com.xkeshi.demo.shiro;

import com.xkeshi.core.utils.RedisUtils;
import com.xkeshi.demo.shiro.exception.ShiroExceptionHandler;
import com.xkeshi.webkits.validatecode.RandomValidateCode;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SaltedAuthenticationInfo;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


/**
 * Created by zacard on 14-8-8.
 * 密码重试次数限制:
 * 输错3次，则显示验证码
 */
public class RetryLimitHashedCredentialsMatcher extends HashedCredentialsMatcher {

    protected final Logger logger = LoggerFactory.getLogger(getClass());

//    @Value("${shiro.retryLimitNum}")
//    private int retryLimit;//密码重试锁定次数

//    @Value("${shiro.authCodeLoginEnabled}")
//    private boolean authCodeEnabled;//是否开启授权码登录

//    @Value("${shiro.isCheckCaptcha}")
//    private boolean isCheckCaptcha;//是否验证验证码

    private static final String FIX_SALT = "xkeshi.com.salt";//密码加盐

    private static final int EXPIRE_TIME = 10 * 60;//缓存默认过期时间10分钟

//    @Autowired
//    private XCardUserService xCardUserService;

//    @Autowired
//    private WechatUserService wechatUserService;


    /**
     * 密码是否匹配，在次验证扩展。
     * 这里暂时只是扩展匹配密码的时候，判断是否重复试验密码多次，以防止暴力破解
     * <p>
     * 逻辑改为：密码输错3次出现验证码
     */
    @Override
    public boolean doCredentialsMatch(AuthenticationToken token, AuthenticationInfo info) {

        logger.info("开始验证密码重试次数...");

        try {
            UserToken userToken = (UserToken) token;

            // 1、判断是否微信授权码登录 add 2015-07-23
            if (isWXAuthCodeLogin(userToken)) {
                return checkWXAuthCode(userToken.getCode());
            }

            // 2、判断密码是否匹配
            boolean isMatch = doMatch(userToken, info);
//            if (retryLimit == 0 || retryLimit < 0) {//没有限制次数,直接返回密码匹配结果
//                return isMatch;
//            }

            // 3、判断密码重试次数和验证码
//            if (checkIsExcessRetryCount(userToken.getUsername(), isMatch)) {//如果超出，直接抛出异常
//                //判断验证码是否为空，为空前端就显示验证码
//                if (StringUtils.isBlank(userToken.getCaptcha())) {
//                    throw ShiroExceptionHandler.SHOW_CAPTCHA_EXCEPTION;
//                }
//                // 先判断验证码
//                if (!checkCaptcha(userToken)) {
//                    throw ShiroExceptionHandler.CAPTCHA_EXCEPTION;
//                }
//                // 再判断重试的密码
//                if (!isMatch) {
//                    throw ShiroExceptionHandler.INCORRECT_REPEAT_PASSWORD_EXCEPTION;
//                }
//            }
            /*if (isCheckCaptcha && !checkCaptcha(userToken)) {
                throw ShiroExceptionHandler.CAPTCHA_EXCEPTION;
            }*/

            // 4、密码正确时，清除用户的重试次数
            if (isMatch) {
                RedisUtils.remove(userToken.getUsername());
                //清除验证码
                clearCaptcha();
                //登陆绑定微信openId
                // checkWXAuthCode(userToken.getCode());
            } else {
                throw ShiroExceptionHandler.INCORRECT_PASSWORD_EXCEPTION;
            }
            // 5、返回密码匹配结果
            return isMatch;
        } catch (Exception e) {
            logger.error("doCredentialsMatch fail", e);
            throw ShiroExceptionHandler.buildUnifiedException(e);
        }
    }

    //检查验证码是否正确
    private boolean checkCaptcha(UserToken userToken) {
        //获取生成的验证码
        Object code = SecurityUtils.getSubject().getSession().getAttribute(RandomValidateCode.VALIDATE_CODE_NAME);

        if (StringUtils.isNotBlank(userToken.getCaptcha())) {
            return code != null && StringUtils.equalsIgnoreCase(userToken.getCaptcha(), (String) code);
        }

        return code == null || StringUtils.isBlank((String) code) || (StringUtils.isNotBlank(userToken.getCaptcha())
                && StringUtils.equalsIgnoreCase(userToken.getCaptcha(), (String) code));
    }

    //清除验证码
    private void clearCaptcha() {
        if (SecurityUtils.getSubject() != null && SecurityUtils.getSubject().getSession() != null) {
            SecurityUtils.getSubject().getSession().removeAttribute(RandomValidateCode.VALIDATE_CODE_NAME);
        }
    }

    //检查密码重试次数是否超过设定值
//    private boolean checkIsExcessRetryCount(String username, boolean isMatch) {
//        if (StringUtils.isBlank(username)) {
//            return false;
//        }
//        Long retryCount = null;
//        try {
//            retryCount = RedisUtils.incr(username);
//        } catch (Exception e) {
//            logger.error("RedisUtils.incr fail", e);
//        }
//        if (retryCount == null) {
//            return false;
//        }
//        //首次在redis设置值
//        if (retryCount == 1) {
//            //设置key的有效期:5分钟
//            RedisUtils.setExpire(username, 5 * 60);
//        }
//        return retryCount > retryLimit || (retryCount == retryLimit && !isMatch);
//    }

    //匹配密码
    private boolean doMatch(UserToken userToken, AuthenticationInfo info) {
        //对表单的密码先一层md5加密加盐（私盐）
        ByteSource privateSalt = (info instanceof SaltedAuthenticationInfo) ?
                ((SaltedAuthenticationInfo) info).getCredentialsSalt() : ByteSource.Util.bytes(StringUtils.EMPTY);
        SimpleHash hash = new SimpleHash("md5", userToken.getPassword(), privateSalt);
        return StringUtils.equals(hash.toString(), (String) info.getCredentials());
    }

    //检查是否是微信授权码登录
    private boolean isWXAuthCodeLogin(UserToken userToken) {
        return StringUtils.isNotBlank(userToken.getCode());
    }

    //检查微信授权码是否合法
    private boolean checkWXAuthCode(String code) {
        /*授权码登录方式如下。username和authCode一定要正确才会登录*/
        /*UserToken loginUserToken = new UserToken("username", "", false, "host", "authCode");
        SecurityUtils.getSubject().login(userToken);*/
        if (StringUtils.isBlank(code)) {
            return false;
        }
        //TODO 查询数据库或者是redis，判断授权码
//        XCardInfoRequest xCardInfoRequest = RedisUtils.get(code, XCardInfoRequest.class);
//        //判断openId是否注册成会员
//        if (xCardInfoRequest != null) {
//            WechatUser xCardUserWechat = wechatUserService.getXCardWechatUserByOpenId(xCardInfoRequest.getOpenId(), xCardInfoRequest.getAppId());
//            if (xCardUserWechat != null) {
//                XCardUser xCardUser = xCardUserService.getXCardUserByXCardUserId(xCardUserWechat.getxCardUserId());
//                if (xCardUser != null) {
//                    SecurityUtils.getSubject().getSession().setAttribute(MyFormAuthenticationFilter.X_CARD_SESSION, xCardUser.getxCardUserId());
//                    return true;
//                }
//            }
//        }
        return false;
    }

}
