package com.hup.shiro;

import com.hup.api.UserService;
import com.hup.shiro.exception.ShiroExceptionHandler;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.List;
import java.util.Set;

/**
 * Created by hpj
 * 系统安全认证实现类
 */
public class SystemAuthorizingRealm extends AuthorizingRealm {

    protected final Logger logger = LoggerFactory.getLogger(getClass());

    @Autowired
    private UserService userService;

    /**
     * 认证回调函数, 登录时调用
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        UserToken token = (UserToken) authenticationToken;

        logger.info("shiro登录验证开始...");
        SimpleAuthenticationInfo info = null;
        try {
            //验证账号
//            List<User_User> users = userService.getUserByUserName(token.getUsername());

            /*if (users == null || users.size() == 0) {
                throw ShiroExceptionHandler.UNKNOWN_ACCOUNT_EXCEPTION;//用户名不存在
            }

            if (users.size() > 1) {//用户名必须唯一
                throw ShiroExceptionHandler.REPEAT_ACCOUNT_EXCEPTION;//用户名重复
            }

            User_User user = users.get(0);

            if (user == null) {
                throw ShiroExceptionHandler.UNKNOWN_ACCOUNT_EXCEPTION;//用户名不存在
            }

            if (!user.isEnable()) {
                throw ShiroExceptionHandler.LOCKED_ACCOUNT_EXCEPTION; //用户被锁定
            }*/

            //授权用户信息
            info = new SimpleAuthenticationInfo(
                    "",//用户登录名
                    "",//用户登录密码
                    getName()//realm name
            );

//            if (StringUtils.isNotBlank(xCardUser.getSalt())){
//                info.setCredentialsSalt(ByteSource.Util.bytes(xCardUser.getSalt()));
//            }else {
//                info.setCredentialsSalt(ByteSource.Util.bytes(""));
//            }
        } catch (Exception e) {
            logger.error("doGetAuthenticationInfo fail", e);
            throw ShiroExceptionHandler.buildUnifiedException(e);
        }

        /**
         * 交给AuthenticatingRealm使用CredentialsMatcher进行密码匹配.
         * 具体见CustomHashedCredentialsMatcher.java的doCredentialsMatch()方法
         */
        return info;
    }

    /**
     * 授权查询回调函数, 进行鉴权但缓存中无用户的授权信息时调用
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        if (principals == null) {
            throw new AuthorizationException("PrincipalCollection method argument cannot be null.");
        }
        Set<String> roleNames = null;
        try {
            /*String username = (String) getAvailablePrincipal(principals);
            User_User user = userService.getUserByUserName(username);
            roleNames = new HashSet<String>(Arrays.asList(user.getRoles().split(",")));*/
    //      Set<String> roleNames = user.getRoles().split(",");
        } catch (Exception e) {
            logger.error("获取用户权限发生异常" + e.getMessage());
        }
        return new SimpleAuthorizationInfo(roleNames);
    }
}
