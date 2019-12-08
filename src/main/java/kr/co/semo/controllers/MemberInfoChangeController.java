package kr.co.semo.controllers;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.semo.helper.UploadItem;
import kr.co.semo.helper.WebHelper;
import kr.co.semo.model.Co_member;
import kr.co.semo.model.Ge_member;
import kr.co.semo.model.Member_file;
import kr.co.semo.service.Co_memberService;
import kr.co.semo.service.Ge_memberService;
import kr.co.semo.service.Member_fileService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MemberInfoChangeController {
	
	@Autowired
	Ge_memberService ge_memberService;
	@Autowired
	Co_memberService co_memberService;
	@Autowired
	Member_fileService member_fileService;
	@Autowired
	WebHelper webHelper;
	
	
	//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 기존 정보 페이지에 출력하기 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 
	
	@RequestMapping(value = "/ge_infochange")
	public ModelAndView ge_infochange (Model model, HttpServletResponse response, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		int memberId = (int) session.getAttribute("userNum"); 
		int userType = (int) session.getAttribute("userType");
		Ge_member geInput = new Ge_member();
		Ge_member geOutput = new Ge_member();
		Co_member coInput = new Co_member();
		Co_member coOutput = new Co_member();
		//대표번호 나누기
		String telNum;
		String num1;
		String num2;
		String num3;
		//핸드폰 번호 나누기
		String phoneNum;
		String firstNum;
		String secondNum;
		String lastNum;
		
		geInput.setId(memberId);
		coInput.setId(memberId);
		try {
			if (userType == 1) {
				try {
					geOutput = ge_memberService.getGe_memberItem(geInput);
					phoneNum = geOutput.getTel_num();
					firstNum = phoneNum.substring(0,3);
					secondNum = phoneNum.substring(3,7);
					lastNum = phoneNum.substring(7);
					
					String[] numCombi = new String[]{firstNum, secondNum, lastNum};
					model.addAttribute("userinfo", geOutput);
					model.addAttribute("numCombi", numCombi);
					
					return new ModelAndView("Ge_infochange");
				}
				catch (Exception e) {
					e.getLocalizedMessage();
					return new ModelAndView("index");
			 	}
			} else {
				try {
					coOutput = co_memberService.getCo_memberItem(coInput);
					
					// 대표번호 자르기 
					telNum = coOutput.getTel();
					num1 = telNum.substring(0,2);
					num2 = telNum.substring(2,5);
					num3 = telNum.substring(5);
					
					// 폰번호 자르기 
					phoneNum = coOutput.getTel_num();
					firstNum = phoneNum.substring(0,3);
					secondNum = phoneNum.substring(3,7);
					lastNum = phoneNum.substring(7);
					
					String[] telCombi = new String[]{num1,num2,num3};
					String[] numCombi = new String[]{firstNum, secondNum, lastNum};
					
					
					// position 분류
					String position = coOutput.getPosition();
					if (position == "A") {
						coOutput.setPosition("대표공인중개사"); 
					} else if (position == "B") {
						coOutput.setPosition("소속공인중개사");
					} else {
						coOutput.setPosition("중개보조원");
					}
					
					
					model.addAttribute("numCombi", numCombi);
					model.addAttribute("telCombi", telCombi);
					model.addAttribute("userinfo", coOutput);
					
					
					return new ModelAndView("Co_infochange");
				} catch (Exception e) {
					e.getLocalizedMessage();
					return new ModelAndView("index");
				}
			}
		} catch (Exception e) {
			e.getLocalizedMessage();
			return new ModelAndView("index");
		}
	}
	
	// ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 일반 회원 정보 수정 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	
	@RequestMapping(value = "/ge_infochange_ok", method=RequestMethod.POST)
	public ModelAndView ge_infochange_ok (Model model, HttpServletResponse response, HttpServletRequest request,
			@RequestParam(value="Npw") String user_pw,
			@RequestParam(value="user_name") String name  			
		) throws Exception {
		HttpSession session = request.getSession();
		int memberId = (int) session.getAttribute("userNum"); 
		Ge_member geInput = new Ge_member();
		
		geInput.setId(memberId);
		geInput.setUser_pw(user_pw);
		geInput.setName(name);
	
		System.out.println(geInput.getUser_pw());
		try {
			if (geInput.getUser_pw() == null || geInput.getUser_pw() == "") {
				ge_memberService.editGe_memberName(geInput);
				return new ModelAndView("index");
			} else {
				ge_memberService.editGe_member(geInput);
				return new ModelAndView("index");
			}
		} catch (Exception e) {
			e.getLocalizedMessage();
			return new ModelAndView("index");	
		}
	}
	
	
	// ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 중개사 회원 정보 수정 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	
	@RequestMapping(value = "/co_infochange_ok", method=RequestMethod.POST)
	public String co_infochange_ok (Model model, HttpServletResponse response, HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		int memberId = (int) session.getAttribute("userNum");
		
		try {
			webHelper.upload();
		} catch (Exception e) {
			e.printStackTrace();
			webHelper.redirect(null, "업로드에 실패했습니다.");
		}
		/** 업로든 된 정보 추출 */
		// 텍스트 데이터 추출
		Map<String, String> paramMap = webHelper.getParamMap();
		
		//  대표번호 조합 
		String telResult = paramMap.get("tel");
		String[] telpiece = telResult.split(",");
		String telCombi = null;
		for (int i = 0; i < telpiece.length; i++) {
			if(telCombi == null  ) {
				telCombi = telpiece[i];
			} else {
				telCombi += telpiece[i];
			}
		}
		
		// 핸드폰 번호 조합  
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
		
		// Position 분류
		String posi = paramMap.get("position2");
		if (posi == "대표공인중개사") {
			posi = "A";
		} else if (posi == "소속공인중개사") {
			posi = "B";
		} else {
			posi = "C";
		}
		
		// 현재 시간 
		SimpleDateFormat nowTime = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
		String now = nowTime.format (System.currentTimeMillis());
		
		List<UploadItem> fileList = webHelper.getFileList();
		
		Co_member input = new Co_member();
		// 대표 사진 저장 경로
		
		for (int i = 0; i < fileList.size(); i++) {
			if (fileList.get(i).getFieldName() == "best_image") {
				String broker_img = fileList.get(i).getFilePath();
				input.setBroker_img(broker_img);
				System.out.println("asdfsf");
			}
			System.out.println( "asdfsfasdfsf"+fileList.size() + "///" + fileList.get(i).getFilePath() + "///" + fileList.get(i).getFieldName());
		}
		String co_name = paramMap.get("co_name");
		String broker_num = paramMap.get("broker_num");
		String office_num = paramMap.get("office_num");
		String office_addr = paramMap.get("office_addr");
		String boss_name = paramMap.get("boss_name");
		String tel = telCombi;
		String tel_num = phoneCombi;
		String assi_name = paramMap.get("P_name");
		String position = posi;
		String user_pw = paramMap.get("newco_pw");
		String approval = "N";
		
		
		input.setId(memberId);
		input.setCo_name(co_name);
		input.setBroker_num(broker_num);
		input.setOffice_num(office_num);  
		input.setOffice_addr(office_addr);
		input.setTel_num(tel_num);
		input.setBoss_name(boss_name);
		input.setTel(tel);
		input.setAssi_name(assi_name);
		input.setPosition(position);
		input.setUser_pw(user_pw);
		input.setApproval(approval);
		
	
		
		// 비밀번호 미변경, 변경 구분
		try {
			if (input.getUser_pw() == null || input.getUser_pw() == "") {
				co_memberService.editCo_member(input);
				System.out.println(input.getUser_pw());
				
			} else {
				co_memberService.editCo_memberPw(input);
				System.out.println(input.getUser_pw());
			}
		} catch (Exception e) {
			e.getLocalizedMessage();
		}
		
		
		
		Member_file member_file = new Member_file();
		
		
		String file_dir= "D:/workspace/semoproject/Fantastic4/src/main/webapp/WEB-INF/views/assets/upload";
		// File type 중개사등록증, 사업자등록증 구분 
		if (fileList.size() >= 1);{
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
				try {
					member_fileService.editMember_file(member_file);
				} catch (Exception e) {
					e.getLocalizedMessage();
				}
			}
		}
			
		return "index";
	}
	
	// ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 일반 회원 삭제 컨트롤러 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	
	@RequestMapping(value = "/ge_delete")
	public String ge_delete (Model model, HttpServletResponse response, HttpServletRequest request)
	{
		
		HttpSession session = request.getSession();
		int memberId = (int) session.getAttribute("userNum");
		Ge_member input = new Ge_member();
		input.setId(memberId);
		
		try {
			ge_memberService.deleteGe_member(input);
		} catch (Exception e) {
			e.getLocalizedMessage();
		}
		
		session.invalidate();
		
		return "index";
	}
	
	// ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 중개사 회원 삭제 컨트롤러 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	@RequestMapping(value = "/co_delete", method=RequestMethod.POST)
	public String co_delete (Model model, HttpServletResponse response, HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		int memberId = (int) session.getAttribute("userNum");
		Co_member input = new Co_member();
		input.setId(memberId);
		
		try {
			co_memberService.deleteCo_member(input);
		} catch (Exception e) {
			e.getLocalizedMessage();
		}
		
		session.invalidate();
		
		return "index";
	}
}
