package com.team3web.shop;

import java.util.Locale;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/")
public class IndexController {
    
    @RequestMapping(method = RequestMethod.GET)
    public String index(Locale locale, Model model) {
    	Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String name = authentication.getName(); // 현재 인증된 사용자의 이름

        model.addAttribute("name", name);
        
        return "index";
    }
    
}
