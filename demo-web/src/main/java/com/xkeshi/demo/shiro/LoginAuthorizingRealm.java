package com.xkeshi.demo.shiro;

import com.xkeshi.webkits.shiro.UserToken;
import com.xkeshi.webkits.shiro.exception.ShiroExceptionHandler;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by zacard on 14-8-7.
 * 系统安全认证实现类
 * 非单点登陆时使用该类
 */
public class LoginAuthorizingRealm extends AuthorizingRealm {

    protected final Logger logger = LoggerFactory.getLogger(getClass());

    //TODO 这里引入你们自己的userDAO，来查询用户
//    @Autowired
//    private XCardUserService xCardUserService;

    //是否需要验证验证码
    //@Value("${security.needCheckValidCode}")
    private String needCheckValidCode = "false";

    /**
     * 认证回调函数, 登录时调用
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        UserToken token = (UserToken) authenticationToken;

        logger.info("shiro登录验证开始...");
        SimpleAuthenticationInfo info = null;
        try {
            //验证账号 TODO 查询用户操作
//            List<XCardUser> xCardUsers = xCardUserService.findXCardUserListByMobileNumber(token.getUsername());
//
//            if (xCardUsers == null || xCardUsers.size() == 0) {
//                //throw new UnknownAccountException(); //用户名错误
//                throw ShiroExceptionHandler.UNKNOWN_ACCOUNT_EXCEPTION;//用户名不存在
//            }
//
//            if (xCardUsers.size() > 1) {//用户名必须唯一
//                //throw new AuthenticationException("More than one user row found for user [" + token.getUsername() + "]. Usernames must be unique.");
//                throw ShiroExceptionHandler.REPEAT_ACCOUNT_EXCEPTION;//用户名重复
//            }
//
//            XCardUser xCardUser = xCardUsers.get(0);
//
//            if (xCardUser == null) {
//                //throw new UnknownAccountException(); //用户名错误
//                throw ShiroExceptionHandler.UNKNOWN_ACCOUNT_EXCEPTION;//用户名不存在
//            }
//
//            if (xCardUser.getStatus() != null && xCardUser.getStatus()== 3) {
//               // throw new DisabledAccountException(); //用户被锁定
//                throw ShiroExceptionHandler.LOCKED_ACCOUNT_EXCEPTION;
//            }
//
//            //授权用户信息
//            info = new SimpleAuthenticationInfo(
//                    xCardUser.getMobileNumber()//用户登录名
//                    , xCardUser.getPassword()//用户登录密码
//                    , getName()//realm name
//            );
//            if (StringUtils.isNotBlank(xCardUser.getSalt())){
//                info.setCredentialsSalt(ByteSource.Util.bytes(xCardUser.getSalt()));
//            }else {
//                info.setCredentialsSalt(ByteSource.Util.bytes(""));
//            }
        } catch (Exception e) {
            logger.error("doGetAuthenticationInfo fail", e);
            throw e;
        }


        /**
         * 交给AuthenticatingRealm使用CredentialsMatcher进行密码匹配.
         * 具体见RetryLimitHashedCredentialsMatcher.java的doCredentialsMatch()方法
         */
        return info;
    }

    /**
     * 授权查询回调函数, 进行鉴权但缓存中无用户的授权信息时调用
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {

        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
       /* try {
            info = new SimpleAuthorizationInfo();
            if (principalCollection == null) {
                throw new AuthorizationException("PrincipalCollection method argument cannot be null.");
            }

            String loginName = (String) getAvailablePrincipal(principalCollection);
            //查询用户和其拥有的权限（角色）
            User user = securityService.getUserWithPowers(loginName);

            if (user != null && user.getFunctions() != null && user.getFunctions().size() > 0) {
                //设置roles和functions
                //这里只设置functions，只根据function的权限控制
                if (!user.getFunctions().isEmpty()) {
                    logger.info("用户：【" + user.getLoginName() + "】拥有" + user.getFunctions().size() + "个权限！");
                    info.addStringPermissions(user.getFunctions());
                }
            } else {
                logger.info("用户异常或用户：【" + loginName + "】没有设置任何权限！");
            }
        } catch (Exception e) {
            String message = "doGetAuthorizationInfo fail";
            throw e
        }*/
        return info;
    }
}
