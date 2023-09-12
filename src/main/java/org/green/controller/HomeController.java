package org.green.controller;

import java.util.Locale;

import org.green.domain.ReviewVO;
import org.green.service.ReviewService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.Setter;


@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Setter(onMethod_ = {@Autowired})
	private ReviewService service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(ReviewVO rvo, Model model) {
		model.addAttribute("list",service.homeList(rvo));
		return "home";
	}
}