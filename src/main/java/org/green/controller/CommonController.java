package org.green.controller;

import org.green.service.MemberService;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Controller
@Log4j
@AllArgsConstructor
public class CommonController {
	private MemberService service;
	
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {
		log.info("���ٰź� : " + auth);
		model.addAttribute("msg","���ٰź�");

	}
	@GetMapping("/Login")
	public void logininput(String error,String logout, Model model) {
		log.info("���� : "+ error);
		log.info("�α׾ƿ� : "+ logout);
		

		//���� �������
		if(error != null) {
			model.addAttribute("error","�α��ο���");
		}
		if(logout != null) {
			model.addAttribute("logout","�α׾ƿ�!");
		}
	}	
	@GetMapping("/Logout")
	public void logoutGet() {
		log.info("�α׾ƿ�");
	}
	
}
