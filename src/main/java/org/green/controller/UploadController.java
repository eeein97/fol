package org.green.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import java.text.SimpleDateFormat;

import org.green.domain.AttachFileDTO;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j
public class UploadController {
	// ��/��/�� ���� �����ϱ�
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);	//2023-07-27�� str�� �������
		//�ü������ ���� ��� �����ڰ� �ٸ�
		//OS�� ���� ��� ���̸� �Ű澲�� �ʰ� ���� ��θ� ���� File.separator
		return str.replace("-", File.separator);	//2027-07-27 -> 2023/07/27
			//replace : "-"���ڸ� "/"�� �ٲ���
	}
	//������ �̹��� �������� Ȯ���ϱ�
	private boolean checkImageType(File file) {
		try {
			String contentType = Files.probeContentType(file.toPath());
			return contentType.startsWith("image");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	@GetMapping("/uploadForm")
	public void uploadForm() {
		log.info("upload form");
	}
	//���ε��ϴ� ������ ó��, �������� ���ε� �� ���� �־ []Ÿ������ ó��
		@PostMapping("/uploadFormAction")
		public void uploadFormpost(MultipartFile[] uploadFile, Model model) {
			//���� ��ġ
			String uploadFolder = "C:\\upload";
			for(MultipartFile multipartfile : uploadFile) {
				log.info("------------------------------");
				log.info("���� �̸� : "+ multipartfile.getOriginalFilename());
				log.info("���� ũ�� : "+ multipartfile.getSize());

				//uploadFolder(���)�� multipartfile.getOriginalFilename()(����� �̸�)���� �����ϰڴ�.
				File saveFile = new File(uploadFolder, multipartfile.getOriginalFilename());
				try {
					multipartfile.transferTo(saveFile); //transferTo() ����� �����
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
	@GetMapping("/uploadAjax")
	public void uploadAjax() {
		log.info("upload ajax");
	}
	
	@PostMapping("/uploadAjaxAction")
				//��ü Ÿ������ ����					 //������		
	public ResponseEntity<List<AttachFileDTO>> uploadAjaxpost (MultipartFile[] uploadFile) {
		List<AttachFileDTO> list = new ArrayList<AttachFileDTO>();
		log.info("===============================================");
		log.info("upload ajax post..................");
		String uploadFolder = "C:\\upload";

		String uploadFolderPath = getFolder();	//2023/07/27�� ���ڿ��� �޾ƿ�
		//���� �����ϱ�
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		log.info("uploadPath : " + uploadPath);
			
		// ������ ������ ����
		//~.exists() : ~�� �ִ��� Ȯ��
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		for(MultipartFile multipartfile : uploadFile) {
			AttachFileDTO attachDTO = new AttachFileDTO();
			log.info("------------------------------");
			log.info("���� �̸� : "+ multipartfile.getOriginalFilename());
			log.info("���� ũ�� : "+ multipartfile.getSize());
			
			String uploadFileName = multipartfile.getOriginalFilename();
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
			log.info("only file name : " + uploadFileName);
			//�����̸� �ʵ忡 �Ҵ�
			attachDTO.setFileName(uploadFileName);
			//�ߺ����� UUID ���
			//������ ���� ����
			UUID uuid = UUID.randomUUID();
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			
			//uploadFolder(���)�� multipartfile.getOriginalFilename()(����� �̸�)���� �����ϰڴ�.
			File saveFile = new File(uploadPath, uploadFileName);
			try {
				multipartfile.transferTo(saveFile);
				//������ �̹��� �����̶�� ����� �̹��� �����ϱ�
				if(checkImageType(saveFile)) { //�̹����� true����
					attachDTO.setImage(true);
					FileOutputStream thumbnail = new FileOutputStream(new File(
							uploadPath, "s_" + uploadFileName ));
					Thumbnailator.createThumbnail(multipartfile.getInputStream(),thumbnail, 100, 100);
																						//�̹��� ũ�� 100*100
					thumbnail.close();
				}
				//uuid �ʵ忡 �Ҵ�
				attachDTO.setUuid(uuid.toString());
				log.info("uuid : " + attachDTO.getUuid());
				//�̹��� ��� �ʵ忡 �Ҵ�
				attachDTO.setUploadPath(uploadFolderPath);
				//����Ʈ ���·� �̹��� ���� �߰�
				list.add(attachDTO);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return new ResponseEntity<List<AttachFileDTO>>(list, HttpStatus.OK);
	}
	
	//����� ������ �����ϱ�
	//fileName�� ���޹ް� byte��������
	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName) {
		log.info("filename : "+ fileName);
		File file = new File("C:\\upload\\" + fileName);
		ResponseEntity<byte[]> result = null;
		HttpHeaders header = new HttpHeaders();
		try {
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<byte[]>	(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return result;
	}
	
	//÷������ ����
	@PostMapping("/deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName, String type) {
		log.info("deleteFile : " + fileName);
		File file;
		try {
			file = new File("C:\\upload\\"+ URLDecoder.decode(fileName,"UTF-8"));
			file.delete();
			//�̹��� �����̶�� ���� �̹����� ���� 
			if(type.equals("image")) {
				String largeFileName = file.getAbsolutePath().replace("s_","");
				log.info("largeFileName : " + largeFileName);
				file = new File(largeFileName);
				file.delete();
			}
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
}

