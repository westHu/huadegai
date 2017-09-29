package com.hup.shiro.realm;

import com.hup.api.UserService;
import com.hup.entity.User;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Set;

/**
 * <p>User: hup
 * <p>Date: 17-1-28
 * <p>Version: 1.0
 */
public class EmailRealm extends AuthorizingRealm {

    Logger logger = LoggerFactory.getLogger(EmailRealm.class);

    @Autowired
    private UserService userService;

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        logger.info(" ======== 开始授权 email 登录 ========");
        String email = (String)principals.getPrimaryPrincipal();
        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
        Set<String> roles = userService.findRolesByEmail(email);
        authorizationInfo.setRoles(roles);
        logger.info(email + " 拥有角色 ： " + roles);
        Set<String> permissions = userService.findPermissionsByEmail(email);
        authorizationInfo.setStringPermissions(permissions);
        logger.info(email + " 拥有权限 ： "+ permissions);
        return authorizationInfo;
    }

    /**
     * <p>@Description:  如果要多个凭证（即用户名、邮箱、手机都可以登录，则使用多个realm，AtLeastOneSuccessfulStrategy ）
     * <p>@Author: hupj
     * <p>@Date: 2017/9/28
     * <p>@Param:
     * <p>@return:
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        logger.info(" ======== 开始认证 email 登录 ========");
        String email = (String)token.getPrincipal();
        logger.info("email = " + email);
        User user = userService.findByEmail(email);
        if(user == null) {
            throw new UnknownAccountException();//没找到帐号
        }
        if(Boolean.TRUE.equals(user.getLocked())) {
            throw new LockedAccountException(); //帐号锁定
        }

        //交给AuthenticatingRealm使用CredentialsMatcher进行密码匹配，如果觉得人家的不好可以自定义实现
        SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(
                user.getUsername(), //用户名
                user.getPassword(), //密码
                ByteSource.Util.bytes(user.getCredentialsSalt()),//salt=username+salt
                getName()  //realm name
        );
        return authenticationInfo;
    }

    @Override
    public void clearCachedAuthorizationInfo(PrincipalCollection principals) {
        super.clearCachedAuthorizationInfo(principals);
    }

    @Override
    public void clearCachedAuthenticationInfo(PrincipalCollection principals) {
        super.clearCachedAuthenticationInfo(principals);
    }

    @Override
    public void clearCache(PrincipalCollection principals) {
        super.clearCache(principals);
    }

    public void clearAllCachedAuthorizationInfo() {
        getAuthorizationCache().clear();
    }

    public void clearAllCachedAuthenticationInfo() {
        getAuthenticationCache().clear();
    }

    public void clearAllCache() {
        clearAllCachedAuthenticationInfo();
        clearAllCachedAuthorizationInfo();
    }

}
