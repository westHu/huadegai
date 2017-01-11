package com.xkeshi.demo.shiro;

import com.xkeshi.webkits.shiro.exception.ShiroExceptionHandler;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.cas.CasRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


/**
 * Created by ylc on 2017/1/11.
 * 单点登陆时使用该类
 */
public class SSOLoginAuthorizingRealm extends CasRealm{

    private static final Logger LOGGER = LoggerFactory.getLogger(SSOLoginAuthorizingRealm.class);

//    @Autowired
//    private UserService userService;
    /**
     * 权限验证-授权查询回调函数, 进行鉴权但缓存中无用户的授权信息时调用
     *
     * @param principals
     * @return
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        if (LOGGER.isInfoEnabled()) {
            LOGGER.info("shiro：获取用户权限...");
        }

//        if (principals == null) {
//            throw ShiroExceptionHandler.defaultException("没有有效的x授权认证用户.");
//        }
//        //这里的XPrincipal是在doGetAuthenticationInfo中存储进去的
//        XPrincipal xPrincipal = (XPrincipal) getAvailablePrincipal(principals);
//        try {
//            SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
//            Set<String> authorityString = new HashSet<>();
//            for (Permission permission : xPrincipal.getPermissions()) {
//                authorityString.add(permission.getPermissionCode());
//            }
//            info.setStringPermissions(authorityString);
//            if (LOGGER.isInfoEnabled()) {
//                LOGGER.info("账户1[" + xPrincipal.getLoginName() + "]:拥有权限{" + info.getStringPermissions().size() + "}个");
//            }
//            return info;
//        } catch (Exception e) {
//            LOGGER.error("UserRealm doGetAuthorizationInfo fail", e);
//            throw ShiroExceptionHandler.unifiedException(e);
//        }

        return null;
    }

    /**
     * 登陆验证-认证回调函数,登录时调用
     *
     * @param token
     * @return
     * @throws AuthenticationException
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        if (LOGGER.isInfoEnabled()) {
            LOGGER.info("shiro login:认证回调验证开始...");
        }
        AuthenticationInfo authc = super.doGetAuthenticationInfo(token);
//        try {
//            // 查询用户信息
//            String account = (String) authc.getPrincipals().getPrimaryPrincipal();
//
//            Map<String, String> attributes = (Map<String, String>) authc.getPrincipals().asList().get(1);
//            for (Map.Entry<String, String> entry : attributes.entrySet()) {
//                System.out.println(entry.getKey() + ":" + entry.getValue());
//            }
//            if(attributes.containsKey("accountGroups")){
//                String json = URLDecoder.decode(attributes.get("accountGroups"),"UTF-8");
//                System.out.println("group:"+json);
//
//            }
//
//            UserInfo user = userService.findByUserNameWithInfo(account);
//
//            // 校验账户
//            if (user == null || user.getId() == null) {
//                //账户不存在
//                throw ShiroExceptionHandler.UNKNOWN_ACCOUNT_EXCEPTION;
//            }
//            if (user.getLocked()) {
//                //账户被锁定
//                throw ShiroExceptionHandler.LOCKED_ACCOUNT_EXCEPTION;
//            }
//            if (!user.getEnable()) {
//                //账户未启用
//                throw ShiroExceptionHandler.DISABLED_ACCOUNT_EXCEPTION;
//            }
//
//            // 5.写用户会话
//            SecurityUtils.getSubject().getSession().setAttribute(WebConstants.CURRENT_USER_SESSION, user);
//
//        } catch (Exception e) {
//            LOGGER.error("UserRealm doGetAuthenticationInfo fail", e);
//            throw ShiroExceptionHandler.unifiedException(e);
//        }
        return authc;
    }


}
