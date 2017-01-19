package com.xkeshi.demo.shiro;

import com.xkeshi.core.utils.StringUtils;
import com.xkeshi.webkits.shiro.UserToken;
import com.xkeshi.webkits.shiro.XFormAuthenticationFilter;
import com.xkeshi.webkits.validatecode.RandomValidateCode;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.web.util.WebUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/**
 * 只记录用户名，密码时可以配置  com.xkeshi.webkits.shiro.XFormAuthenticationFilter
 * 需要自定义登录凭证时使用，请参照如下示例
 * Created by ylc on 2017/1/10.
 */
public class DemoFormAuthenticationFilter extends XFormAuthenticationFilter {

    private static final Logger LOGGER = LoggerFactory.getLogger(DemoFormAuthenticationFilter.class);

    private String captchaParam = RandomValidateCode.VALIDATE_CODE_NAME;

    /**
     * 示例方法，请结合实际情况
     * 默认保存不止用户名，密码之外的数据需要自定义此方法
     * 收集登录信息
     */
    @Override
    protected AuthenticationToken createToken(ServletRequest request, ServletResponse response) {
        if (LOGGER.isInfoEnabled()) {
            LOGGER.info("shiro start create token...");
        }

        // 收集登录信息
        String username = getUsername(request);
        String password = getPassword(request);
        String host = getHost(request);
        boolean rememberMe = isRememberMe(request);
        String captcha = WebUtils.getCleanParam(request, captchaParam);

        if (StringUtils.isBlank(password)) {
            password = "";
        }
        return new UserToken(username, password.toCharArray(), rememberMe, host, captcha);
    }
}
