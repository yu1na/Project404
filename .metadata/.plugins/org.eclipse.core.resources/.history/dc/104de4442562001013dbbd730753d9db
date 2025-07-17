package com.pj.springboot.calendar;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CalendarController {

    @GetMapping("/calendar")
    public String calendar(Model model) {
        // model.addAttribute("contentPage", "calendar/calendar"); // base.jsp를 사용하지 않으므로 필요 없음
        // model.addAttribute("pageSpecificJs", "includes/calendar_js"); // base.jsp를 사용하지 않으므로 필요 없음
        return "calendar/calendar"; // calendar/calendar.jsp를 직접 반환
    }
}