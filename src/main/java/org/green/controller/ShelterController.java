package org.green.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import org.green.domain.Criteria;
import org.green.domain.PageDTO;
import org.green.domain.ShelterVO;
import org.green.service.ShelterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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
	
//	@Setter(onMethod_ = {@Autowired})
//	private checkService chservice;
	
	@GetMapping("/list")
	//ModelŸ���� view�� �����͸� ����(�ڵ�)
	public void list(Criteria cri, Model model) {
		model.addAttribute("list",service.getList(cri));
		int total = service.getTotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	@GetMapping("/myList")
	//ModelŸ���� view�� �����͸� ����(�ڵ�)
	public void myList(Criteria cri, Model model) {
		model.addAttribute("list",service.myShelList(cri));
		int total = service.getTotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	//�Խñ� ��� ������ �̵�
	@GetMapping("/register")
	@PreAuthorize("isAuthenticated()")
	public void register() {
		
	}
	//�Խñ� ��� ó��
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
	
	//�Խñ� ��ȸ
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("sno") Long sno,
			@ModelAttribute("cri") Criteria cri, Model model) {
		model.addAttribute("shelter", service.get(sno));
	}
	
	//�Խñ� ���� ��ûó��
	@PostMapping("/remove")
	public String remove(Long sno, RedirectAttributes rttr) {
		log.info("remove : " + sno);
		if(service.remove(sno)) {
			//���� ���� �޼ҵ� ȣ��
			rttr.addAttribute("result", "����");
		}
		return "redirect:/shelter/list";
	}
	
	//�����ϱ�
	@PostMapping("/modify")
	public String postmodify(ShelterVO svo, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		if(service.modify(svo)) {
			rttr.addAttribute("result", "����");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		return "redirect:/shelter/list";
	}
	
	
	//�����ϱ�� �̵�
	@GetMapping("/add")
	@PreAuthorize("isAuthenticated()")
	public void add() {
		
	}
	//�����ϱ�
	@PostMapping("/add")
	@PreAuthorize("isAuthenticated()")
	public String add(ShelterVO svo, RedirectAttributes rttr) {
		log.info("=============================");
		log.info("register : " + svo);
		log.info("=============================");
		service.register(svo);
		rttr.addAttribute("result", svo.getSno());
		return "redirect:/shelter/list";
	}
	//���� �ߺ� �˻�
	@RequestMapping(value = "/chAdd", method = RequestMethod.POST)
	@ResponseBody
	public String chAdd(String chdate, String chtime){
		log.info("chADd() ���� "+ chdate + chtime);
//		int result = service.chDate(chdate);
//		log.info("����� = " + result);
//		if(result != 0) {
//			return "fail";	// �ߺ� ���̵� ����
//		} else {
			return "success";	// �ߺ� ���̵� x

			

	} // memberIdChkPOST() ����
	
	//���ϻ��� �޼ҵ�
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
