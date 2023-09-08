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
		log.info("占쏙옙占쌕거븝옙 : " + auth);
		model.addAttribute("msg","접근거부");

	}
	@GetMapping("/Login")
	public void logininput(String error,String logout, Model model) {
		log.info("로그인 오류: "+ error);
		log.info("로그아웃 : "+ logout);
		

		//占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占�
		if(error != null) {
			model.addAttribute("error","아이디와 비밀번호를 확인해주세요.");
		}
		if(logout != null) {
			model.addAttribute("logout","로그아웃되었습니다");
		}
	}	
	@GetMapping("/Logout")
	public void logoutGet() {
		log.info("로그아웃 되었습니다.");
	}
	
	@GetMapping("/introduce")
	public void introduce() {
		log.info("소개페이지");
	}
}
