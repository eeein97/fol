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
		log.info("����ȯ��");
	}
	
	@GetMapping("/join")
	public void registerMember() {
		log.info("ȸ������");
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

	// ���̵� �ߺ� �˻�
	@RequestMapping(value = "/memberIdChk", method = RequestMethod.POST)
	@ResponseBody
	public String memberIdChkPOST(String userid){
		log.info("memberIdChk() ���� "+userid);
		int result = service.idCheck(userid);
		log.info("����� = " + result);
		if(result != 0) {
			return "fail";	// �ߺ� ���̵� ����
		} else {
			return "success";	// �ߺ� ���̵� x

		}	

	} // memberIdChkPOST() ����


	 @GetMapping({"/mypage", "/modify"})
	 @PreAuthorize("isAuthenticated()")
	  public void getMyInfo(@RequestParam("userid") String userid, Model model){
		 model.addAttribute("mypage", service.getMy(userid));
	 }
	 
}