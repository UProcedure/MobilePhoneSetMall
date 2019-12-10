package com.qf.controller;

import java.util.HashMap;
import java.util.List;

import com.google.gson.Gson;
import com.qf.entity.Page;
import com.qf.entity.User;
import com.qf.entity.UserInfo;
import com.qf.realm.UserRealm;
import com.qf.service.IUserInfoService;
import com.qf.service.IUserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.mgt.RealmSecurityManager;
import org.apache.shiro.subject.SimplePrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("user")
public class UserController {
    @Autowired
    private IUserService userService;
    @Autowired
    private IUserInfoService userInfoService;


    @RequestMapping("login")
    public String login(User user, ModelMap map, boolean RememberMe,HttpSession session){
        Subject currentUser = SecurityUtils.getSubject();
        //currentUser.logout();
        if(true){
            //!currentUser.isAuthenticated()
            UsernamePasswordToken token = new UsernamePasswordToken(user.getUsername(),user.getPassword());
            token.setRememberMe(RememberMe);
            try {
                currentUser.login(token);
            }catch (AuthenticationException e){
                System.out.println("认证失败！");
                return  "login";
            }
        }
        user = (User) currentUser.getPrincipal();
        session.setAttribute("user",user);
        return "redirect:../brand/brandIndex";
    }

    @RequestMapping("regis")
    public String register(User user, ModelMap map, HttpSession session){
        User user1 = (User) session.getAttribute("user");
        System.out.println("======");
        Object salt = ByteSource.Util.bytes(user.getUsername());
        SimpleHash simpleHash = new SimpleHash("MD5", user.getPassword(), salt, 1024);
        user.setPassword(simpleHash.toString());
        int result = userService.toRgister(user);
        if (result>0){
            map.put("user",user);
            return "forward:login";
        }
        return "redirect: index.jsp";
    }

    @RequestMapping("isOldPassword")
    @ResponseBody
    public boolean isOldPassword(String oldPassword){
        Subject subject = SecurityUtils.getSubject();
        User user = (User) subject.getPrincipal();
        Object salt = ByteSource.Util.bytes(user.getUsername());
        SimpleHash simpleHashOld = new SimpleHash("MD5", oldPassword, salt, 1024);
        if(simpleHashOld.toString().equals(user.getPassword())){
            return true;
        }
        return false;
    }

    @RequestMapping("updatePassword/{id}")
    public String updatePassword(@PathVariable int id, ModelMap map,String newPassword){
        RealmSecurityManager rsm = (RealmSecurityManager) SecurityUtils.getSecurityManager();
        UserRealm shiroRealm = (UserRealm) rsm.getRealms().iterator().next();
        Subject subject = SecurityUtils.getSubject();
        User user = (User) subject.getPrincipal();
        Object salt = ByteSource.Util.bytes(user.getUsername());
        SimpleHash simpleHash = new SimpleHash("MD5", newPassword, salt, 1024);
        user.setPassword(simpleHash.toString());
        int i = userService.updateByPrimaryKeySelective(user);
        if(i>0){
            Cache<Object, AuthenticationInfo> authenticationCache = shiroRealm.getAuthenticationCache();
            AuthenticationInfo remove1 = authenticationCache.remove(user.getUsername());
            System.out.println("清空缓存返回=="+remove1);
            subject.releaseRunAs();
            subject.logout();
            map.put("msg",6);
            return "common/common_prompt";
        }
        return "common/common_prompt";
    }


    @RequestMapping("check")
    @ResponseBody
    public boolean check(String username,HttpSession session){
        User user1 = (User) session.getAttribute("user");
        User userByusername = userService.getUserByusername(username);
        if(userByusername == null){
            return true;
        }
        return false;
    }

    @RequestMapping("userList")
    @RequiresPermissions("admin")
    public String userList(Page<User> page,ModelMap modelMap){
        page = userService.getAllUser(page);
        page.setUrl("user/userList");
        modelMap.put("page",page);
        return "backend/admin-user";
    }


    @RequestMapping("toUpdate/{id}")
    @RequiresPermissions("admin")
    public String toUpdate(@PathVariable int id,ModelMap modelMap){
        User user = userService.selectByPrimaryKey(id);
        UserInfo userInfo = userInfoService.getByUserId(id);
        modelMap.put("user",user);
        modelMap.put("userInfo",userInfo);
        return "backend/admin_user_update";
    }

    @RequestMapping("update")
    @RequiresPermissions("admin")
    public String update(User user,UserInfo userInfo,ModelMap modelMap){
        boolean x = userService.update(user,userInfo);
        modelMap.put("msg","修改成功！！！");
        return "common/ok";
    }

    @RequestMapping("delUser")
    @RequiresPermissions("admin")
    @ResponseBody
    public boolean delUser(int userId){
        return userService.delete(userId);
    }


    @RequestMapping("selectByCondition")
    @RequiresPermissions("admin")
    public String selectByCondition(Page<User> page,String byUserName,ModelMap modelMap){
        page = userService.getUserByusernameList(page,byUserName);
        page.setUrl("user/selectByCondition");
        modelMap.put("page",page);
        modelMap.put("rs",byUserName);
        HashMap<String,String> map = new HashMap<>();
        map.put("byUserName",byUserName);
        modelMap.put("conditions",new Gson().toJson(map));
        return "backend/admin-user";
    }

    @RequestMapping("batchDel")
    @RequiresPermissions("admin")
    @ResponseBody
    public int batchDel(@RequestParam  List<Integer> ids){
        System.out.println(ids);
        return userService.deleteBatch(ids);
    }


}
