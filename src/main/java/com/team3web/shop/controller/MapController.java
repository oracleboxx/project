package com.team3web.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MapController {
	
    @RequestMapping("/shopmap")
    public ModelAndView index() {
        ModelAndView mv = new ModelAndView("shopmap");
        return mv;
    }
}
