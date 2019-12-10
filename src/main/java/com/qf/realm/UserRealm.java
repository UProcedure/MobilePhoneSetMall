package com.qf.realm;
import	java.util.HashSet;

import com.qf.entity.User;
import com.qf.service.IUserService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Set;

/**
 * @ClassName UserRealm
 * @Description TODO
 * @author weimin
 * @date 2019/9/29 16:25
 */
public class UserRealm extends AuthorizingRealm {



    @Autowired
    private IUserService userService;

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        System.out.println("授权管理");
        Set<String> permissionSet = new HashSet<> ();
        User user = (User) principalCollection.getPrimaryPrincipal();
        int isAdmin = user.getIsAdmin();
        if(isAdmin==1){
            permissionSet.add("admin");
        }
        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
        authorizationInfo.setStringPermissions(permissionSet);
        authorizationInfo.setRoles(permissionSet);
        return authorizationInfo;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        System.out.println("认证管理");

        UsernamePasswordToken token = (UsernamePasswordToken) authenticationToken;
        String username = token.getUsername();

        User user = userService.getUserByusername(username);
        System.out.println("xxx"+user);
        if(user!=null){
            ByteSource bytes = ByteSource.Util.bytes(user.getUsername());
            SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(user,user.getPassword(),bytes, getName());
            return authenticationInfo;
        }
        return null;
    }
}
