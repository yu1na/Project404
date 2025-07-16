package com.pj.springboot;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

    @GetMapping("/")
    public String home(Model model) {
        // model.addAttribute("contentPage", "home"); // base.jsp를 사용하지 않으므로 필요 없음
        // model.addAttribute("pageSpecificJs", ""); // base.jsp를 사용하지 않으므로 필요 없음
        return "home"; // home.jsp를 직접 반환
    }
}