package org.green.controller;

import org.green.domain.AuthVO;
import org.green.domain.MemberVO;
import org.green.service.MemberService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member/*")
@AllArgsConstructor
public class MemberController {
	private MemberService service;
	
	@GetMapping("/wellcom")
	public void wellcom() {
		log.info("가입환영");
	}
	
	@GetMapping("/join")
	public void registerMember() {
		log.info("회원가입");
	}

	@PostMapping("/join")
	public String registerMember(MemberVO mvo, AuthVO avo, RedirectAttributes rttr) {
		log.info("=======================================");
		log.info("mvo : "+ mvo );
		log.info("=======================================");
		log.info("avo : "+ avo );
		log.info("=======================================");
		service.register(mvo, avo);
		rttr.addAttribute("result", mvo.getUserid());
		return "redirect:/member/wellcom";
	}

	// 아이디 중복 검사
	@RequestMapping(value = "/memberIdChk", method = RequestMethod.POST)
	@ResponseBody
	public String memberIdChkPOST(String userid){
		log.info("memberIdChk() 진입 "+userid);
		int result = service.idCheck(userid);
		log.info("결과값 = " + result);
		if(result != 0) {
			return "fail";	// 중복 아이디가 존재
		} else {
			return "success";	// 중복 아이디 x

		}	

	} // memberIdChkPOST() 종료


	 @GetMapping({"/mypage", "/modify"})
	 @PreAuthorize("isAuthenticated()")
	  public void getMyInfo(@RequestParam("userid") String userid, Model model){
		 model.addAttribute("mypage", service.getMy(userid));
	 }
	 
}