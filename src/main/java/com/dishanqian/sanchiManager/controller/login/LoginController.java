package com.dishanqian.sanchiManager.controller.login;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by admin on 2018/12/4.
 */
@Controller
@RequestMapping("login")
public class LoginController {


    @RequestMapping("/to_login")
    public String tologin(){
        return "/system/login/login_index";
    }

    @RequestMapping("/login")
    public String login(){
        return "/system/login/login";
    }
}
