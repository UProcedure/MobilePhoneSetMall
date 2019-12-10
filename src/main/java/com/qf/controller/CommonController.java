package com.qf.controller;

import cn.hutool.captcha.CaptchaUtil;
import cn.hutool.captcha.LineCaptcha;
import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @author weimin
 * @ClassName CommonController
 * @Description TODO
 * @date 2019/10/11 19:04
 */
@Controller
@RequestMapping("common")
public class CommonController {

    @RequestMapping("prompt/{msg}")
    public String prompt( Model model, @PathVariable String msg){
        model.addAttribute("msg",msg);
        return "common/common_prompt";
    }

    @RequestMapping("code")
    public void code(HttpServletResponse response, HttpSession session) throws IOException {
        LineCaptcha lineCaptcha = CaptchaUtil.createLineCaptcha(110, 50);
        response.setContentType("image/png");
        response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expire", 0);
        String x = lineCaptcha.getCode();
        session.setAttribute("CAPTCHA_KEY", x);
        System.out.println(x);
        lineCaptcha.write(response.getOutputStream());
    }

    @RequestMapping("checkCode")
    @ResponseBody
    public boolean checkCode(String code,HttpSession session){
        if(session.getAttribute("CAPTCHA_KEY").equals(code)){
            return true;
        }
        return false;
    }

    @RequestMapping("toLogout")
    public String toLogout(Model model){
        SecurityUtils.getSubject().logout();
        model.addAttribute("msg","2");
        return "common/common_prompt";
    }
    @RequestMapping("backLogout")
    public String backLogout(Model model){
        SecurityUtils.getSubject().logout();
        model.addAttribute("msg","3");
        return "common/common_prompt";
    }

    @RequestMapping("No")
    public String No(Model model){
        model.addAttribute("msg","4");
        return "common/common_prompt";
    }
    @RequestMapping("LoginFailed")
    public String LoginFailed(Model model){
        model.addAttribute("msg","5");
        return "common/common_prompt";
    }
}
