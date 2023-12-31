package org.green.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import org.green.domain.CheckVO;
import org.green.domain.Criteria;
import org.green.domain.PageDTO;
import org.green.domain.ShelterVO;
import org.green.service.MemberService;
import org.green.service.ShelterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/shelter/*")
@AllArgsConstructor
public class ShelterController {
	@Setter(onMethod_ = {@Autowired})
	private ShelterService service;
	
	@Setter(onMethod_ = {@Autowired})
	private MemberService memService;
	
	
	@GetMapping("/list")
	//Model타입은 view로 데이터를 전달(자동)
	public void list(Criteria cri, Model model) {
		model.addAttribute("list",service.getList(cri));
		int total = service.getTotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	//내 예약목록
	@GetMapping("/myList")
	//Model타입은 view로 데이터를 전달(자동)
	public void myList(Criteria cri, Model model) {
		model.addAttribute("list",service.myShelList(cri));
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
	public String postregister(ShelterVO svo, RedirectAttributes rttr) {
		log.info("=============================");
		log.info("register : " + svo);
		log.info("=============================");
		service.register(svo);
		rttr.addAttribute("result", svo.getSno());
		return "redirect:/shelter/list";
	}
	
	//게시글 조회
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("sno") Long sno,
			@ModelAttribute("cri") Criteria cri, Model model) {
		model.addAttribute("shelter", service.get(sno));
	}
	
	//게시글 삭제 요청처리
	@PostMapping("/remove")
	public String remove(Long sno, RedirectAttributes rttr) {
		log.info("remove : " + sno);
		if(service.remove(sno)) {
			//파일 삭제 메소드 호출
			rttr.addAttribute("result", "삭제");
		}
		return "redirect:/shelter/list";
	}
	
	//수정하기
	@PostMapping("/modify")
	public String postmodify(ShelterVO svo, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		if(service.modify(svo)) {
			rttr.addAttribute("result", "수정");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		return "redirect:/shelter/list";
	}
	
	//예약하기
	 @GetMapping("/add")
	 @PreAuthorize("isAuthenticated()")
	  public void getMyInfo(@RequestParam("userid") String userid, @RequestParam("sno") Long sno, Model model){
		 model.addAttribute("myInfo", memService.getMy(userid));
		 model.addAttribute("shelter", service.get(sno));
	 }
	 
	//예약하기
	@PostMapping("/add")
	@PreAuthorize("isAuthenticated()")
	public String add(CheckVO cvo, RedirectAttributes rttr) {
		log.info("=============================");
		log.info("예약하기 : " + cvo);
		log.info("=============================");
		service.check(cvo);
		rttr.addAttribute("chno", cvo.getChno());
		return "redirect:/shelter/checkEnd";
	}
	//예약 확인
	 @GetMapping("/checkEnd")
	 @PreAuthorize("isAuthenticated()")
	  public void checkEnd(){
		
	 }
	
	//파일삭제 메소드
	private void deleteFile(String uploadPath, String fileName) {
		Path file = Paths.get("c:\\upload\\"+uploadPath+"\\"+fileName);
		try {
			Files.deleteIfExists(file);
			if(Files.probeContentType(file).startsWith("image")) {
			Path thumbNail = Paths.get("c:\\upload\\"+uploadPath+"\\s_"+fileName);
			Files.delete(thumbNail);
			}} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
