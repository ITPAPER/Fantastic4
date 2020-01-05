package kr.co.semo.controllers;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.co.semo.helper.UploadItem;
import kr.co.semo.helper.WebHelper;
import kr.co.semo.model.Co_member;
import kr.co.semo.model.Member_file;
import kr.co.semo.service.Co_memberService;
import kr.co.semo.service.Member_fileService;

@RestController
public class Co_memberRestController {
	@Autowired WebHelper webHelper;
	@Autowired Co_memberService co_memberService;
	@Autowired Member_fileService member_fileService;
	@Value("#{servletContext.contextPath}")
	String contextPath;

	@RequestMapping(value="/addCo_member", method=RequestMethod.POST)
	private String adduser() throws IOException {

		try {
			webHelper.upload();
		} catch (Exception e) {
			e.printStackTrace();
			webHelper.redirect(null, "업로드 실패");
		}

		Map<String, String> paramMap = webHelper.getParamMap();

		//■■■■■■ 대표번호 조합 ■■■■■■■
		String telResult = paramMap.get("tel").toString();
		String[] telpiece = telResult.split(",");
		String telCombi = null;
		for (int i = 0; i < telpiece.length; i++) {
			if(telCombi == null  ) {
				telCombi = telpiece[i];
			} else {
				telCombi += telpiece[i];
			}
		}

		//■■■■■■■■■■■■■ 핸드폰 번호 조합 ■■■■■■■■■■■■■■■■■■
		String phoneResult = paramMap.get("phoneNum");
		String[] phonePiece = phoneResult.split(",");
		String phoneCombi = null;
		for (int i = 0; i < phonePiece.length; i++) {
			if (phoneCombi == null) {
				phoneCombi = phonePiece[i];
			} else {
				phoneCombi += phonePiece[i];
			}
		}

		//■■■■■■■■■■■■■ Email id 조합 ■■■■■■■■■■■■■■■■■■
		String mailIdResult = paramMap.get("user_email");
		String[] mailIdPiece = mailIdResult.split(",");
		String mailIdCombi = null;
		mailIdCombi = mailIdPiece[0] + "@" + mailIdPiece[1];
		System.out.println(mailIdCombi);

		//■■■■■■■■■■■■■ Position 분류 ■■■■■■■■■■■■■■
		String posi = paramMap.get("position2");
		if (posi == "대표공인중개사") {
			posi = "A";
		} else if (posi == "소속공인중개사") {
			posi = "B";
		} else {
			posi = "C";
		}

		//■■■■■■■■■■■■■ 현재 시간 ■■■■■■■■■■■■■■
		SimpleDateFormat nowTime = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
		String now = nowTime.format (System.currentTimeMillis());

		List<UploadItem> fileList = webHelper.getFileList();

		//■■■■■■■■■■■■■■■■■■■■■■■■■■ 대표 사진 저장 파일 이름 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
		String broker_img = fileList.get(2).getFilePath();

		String co_name = paramMap.get("co_name");
		String broker_num = paramMap.get("coe_number");
		String office_num = paramMap.get("co_number");
		String office_addr = paramMap.get("office_addr");
		String boss_name = paramMap.get("coe_name");
		String tel = telCombi;
		String tel_num = phoneCombi;
		String assi_name = paramMap.get("P_name");
		String position = posi;
		String email_id = mailIdCombi;
		String user_pw = paramMap.get("co_pw");
		String reg_date = now;
		String recent_date = now;
		String approval = "N";

		Co_member input = new Co_member();
		input.setCo_name(co_name);
		input.setBroker_num(broker_num);
		input.setOffice_num(office_num);
		input.setOffice_addr(office_addr);
		input.setTel_num(tel_num);
		input.setBoss_name(boss_name);
		input.setTel(tel);
		input.setAssi_name(assi_name);
		input.setPosition(position);
		input.setEmail_id(email_id);
		input.setUser_pw(user_pw);
		input.setApproval(approval);
		input.setReg_date(reg_date);
		input.setBroker_img(broker_img);
		input.setRecent_date(recent_date);

		try {
			co_memberService.addCo_member(input);
		} catch (Exception e) {
			System.out.println(e.getLocalizedMessage());
		}


		Member_file member_file = new Member_file();


		String file_dir = webHelper.getUploadDir();
		//■■■■■■■■■■■■■■■■■■■■■■■■ File type 중개사등록증, 사업자등록증 구분 ■■■■■■■■■■■■■■■■■■■■■■■■■
		System.out.println(fileList.size());
		for (int i = 0; i < fileList.size()-1; i++) {
			member_file.setOrigin_name(fileList.get(i).getOrginName());
			member_file.setCo_member_id(input.getId());
			member_file.setContent_type(fileList.get(i).getContentType());
			member_file.setEdit_date(now);
			member_file.setFile_dir(file_dir);
			member_file.setFile_size((int) fileList.get(i).getFileSize());
			member_file.setFile_name(fileList.get(i).getFilePath());
			if (i==0) {
				member_file.setFile_type("B");
			} else {
				member_file.setFile_type("O");
			}
			member_file.setReg_date(now);
			try {
				member_fileService.addMember_file(member_file);
			} catch (Exception e) {
				e.getLocalizedMessage();
			}
		}



		/*
		System.out.println("!11111111111111111111111111111111111111121jhfdcljsdhioj23459045948356243512354425345356466346");

		System.out.println(getfile.getName());
		System.out.println(getfile.getSize());
		System.out.println(getfile.getOriginalFilename());
		byte[] data = getfile.getBytes();
		System.out.println(data);
		*/
		/*

		Map<String, String> paramMap = webHelper.getParamMap();
		String co_name = paramMap.get("co_name");
		String broker_num = paramMap.get("broker_num");
		String office_num = paramMap.get("office_num");
		String office_addr = paramMap.get("office_addr");
		String boss_name = paramMap.get("boss_name");
		String tel = paramMap.get("tel");
		String tel_num = paramMap.get("tel_num");
		String assi_name = paramMap.get("assi_name");
		String position = paramMap.get("position");
		String email_id = paramMap.get("email_id");
		String user_pw = paramMap.get("user_pw");
		String reg_date = paramMap.get("reg_date");
		String recent_date = paramMap.get("recent_date");
		String approval = paramMap.get("approval");
		*/
		/*
		Co_member input = new Co_member();
		input.setCo_name(co_name);
		input.setBroker_num(broker_num);
		input.setOffice_num(office_num);
		input.setOffice_addr(office_addr);
		input.setTel_num(tel_num);
		input.setBoss_name(boss_name);
		input.setTel(tel);
		input.setAssi_name(assi_name);
		input.setPosition(position);
		input.setEmail_id(email_id);
		input.setUser_pw(user_pw);
		input.setApproval(approval);
		input.setReg_date(reg_date);
		input.setRecent_date(recent_date);
		*/
		//파일 정보 추출
		/*
		List<UploadItem> fileList = webHelper.getFileList();
		System.out.println(fileList);

		Map<String, Object> output = new HashMap<String, Object>();
		output.put("item", input);
		*/
		/*

		*/
		return "success";
	}
}
