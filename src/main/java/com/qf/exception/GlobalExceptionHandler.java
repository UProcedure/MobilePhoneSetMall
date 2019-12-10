package com.qf.exception;

import org.apache.shiro.ShiroException;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authz.UnauthorizedException;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

/**
 * @author weimin
 * @ClassName GlobalExceptionHandler
 * @Description TODO
 * @date 2019/9/30 10:57
 */
@ControllerAdvice
public class GlobalExceptionHandler {
    @ExceptionHandler({UnauthorizedException.class})
    public String handleUnauthorizedException(UnauthorizedException e, Model model){
        System.out.println("异常处理");
        model.addAttribute("msg","4");
        return "common/common_prompt";
    }

    @ExceptionHandler({IncorrectCredentialsException.class})
    public String x(IncorrectCredentialsException e,Model model){
        System.out.println("异常处理");
        model.addAttribute("msg","4");
        return "common/common_prompt";
    }

}
