package com.qf.filter;

import com.qf.entity.User;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.apache.shiro.web.util.WebUtils;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @author weimin
 * @ClassName MyFormAuthenticationFilter
 * @Description TODO
 * @date 2019/10/15 21:03
 */
public class MyFormAuthenticationFilter extends FormAuthenticationFilter {

    @Override
    protected boolean onLoginSuccess(AuthenticationToken token, Subject subject, ServletRequest request, ServletResponse response) throws Exception {
        WebUtils.getAndClearSavedRequest(request);
        WebUtils.redirectToSavedRequest(request, response, "/common/LoginFailed");
        return false;
    }

    @Override
    protected boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue) {
        if (isLoginRequest(request, response))
        {
            if (isLoginSubmission(request, response))
            {
                //本次用户登陆账号
                String account = this.getUsername(request);

                Subject subject = this.getSubject(request, response);
                //之前登陆的用户
                User user = (User) subject.getPrincipal();
                //如果两次登陆的用户不一样，则先退出之前登陆的用户,（有问题，相同用户无法跳转页面）解决：可以不判断，都退出之前的登录，再重新登录
                if (account != null && user != null && !account.equals(user.getUsername()))
                {
                    //获取session，获取验证码
                    HttpServletRequest httpServletRequest=(HttpServletRequest) request;
                    HttpSession session= httpServletRequest.getSession();
                    String sRand = (String) session.getAttribute("CAPTCHA_KEY");
                    //注销登录，同时会使session失效
                    subject.logout();
                    //所以重新设置session
                    HttpSession session1= httpServletRequest.getSession();
                    session1.setAttribute("CAPTCHA_KEY", sRand);
                }
            }
        }
        return super.isAccessAllowed(request, response, mappedValue);
    }
}
