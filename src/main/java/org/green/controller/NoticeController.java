package org.green.controller;

import org.green.domain.AuthVO;
import org.green.domain.Criteria;
import org.green.domain.NoticeVO;
import org.green.domain.PageDTO;
import org.green.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/notice/*")
@AllArgsConstructor
public class NoticeController {
	@Setter(onMethod_ = {@Autowired})
	private NoticeService service;

	@GetMapping("/list")
	//Model타입은 view로 데이터를 전달(자동)
	public void list(Criteria cri, Model model) {
		model.addAttribute("list",service.getList(cri));
		int total = service.getTotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	//게시글 등록 페이지 이동
	@GetMapping("/register")
	@PreAuthorize("isAuthenticated()")
	public void register() {

	}

	//게시글 등록 처리
	@PostMapping("/register")
	@PreAuthorize("isAuthenticated()")
	public String postregister(NoticeVO nvo, RedirectAttributes rttr) {
		log.info("=============================");
		log.info("register : " + nvo);
		log.info("=============================");
		service.register(nvo);
		rttr.addAttribute("result", nvo.getNno());
		return "redirect:/notice/list";
	}

	//게시글 조회
	@GetMapping({"/view", "/modify"})
	public void get(@RequestParam("nno") Long nno,
			@ModelAttribute("cri") Criteria cri, Model model) {
		model.addAttribute("notice", service.get(nno));
	}

	//게시글 삭제 요청처리
	@PostMapping("/remove")
	@PreAuthorize("isAuthenticated()")
	public String remove(Long nno, RedirectAttributes rttr) {
		log.info("remove : " + nno);
		if(service.remove(nno)) {
			//파일 삭제 메소드 호출
			rttr.addAttribute("result", "삭제");
		}
		return "redirect:/notice/list";
	}

	//수정하기
	@PostMapping("/modify")
	@PreAuthorize("isAuthenticated()")
	public String postmodify(NoticeVO nvo, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		if(service.modify(nvo)) {
			rttr.addAttribute("result", "수정");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		return "redirect:/notice/list";
	}	
}
