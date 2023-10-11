package com.team3web.shop.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



// 주문 관련 컨트롤러
@Controller
@RequestMapping("/user/*")
public class OrderController {
	
	 private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	  @RequestMapping(value = "/cart", method = RequestMethod.GET)
	    public void getCart() throws Exception {
	        logger.info("get cart");
	    }

}
