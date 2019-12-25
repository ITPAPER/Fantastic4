package kr.co.semo.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.semo.helper.UploadItem;
import kr.co.semo.model.Maemul;
import kr.co.semo.service.MaemulFileService;
import kr.co.semo.service.MaemulService;

@Controller
public class Ge_maemulInterest {
	
	@Autowired MaemulService maemulservice;
	@Autowired MaemulFileService maemulFileService;
	
	@RequestMapping(value = "geMaemulInterest")
	public String geMaemulInterest(
			Model model, HttpServletRequest request, HttpServletResponse response) {
		
		Cookie[] cookie = request.getCookies();
		String maemulNums = null;
		
		if (cookie != null) {
			for (int i = 0; i < cookie.length; i++) {
				if (cookie[i].getName().equals("maemul_num")){
					maemulNums = cookie[i].getValue();
				}
			}
		}
		
		String[] maemulNum = null;
		//본 매물이있으면 split 으로 문자열 나누기 
		if (maemulNums != null) {
			maemulNum = maemulNums.split("A");
		//없다면 alert 띄우고 index로 넘어가기
		} else {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out;
			try {
				response.setCharacterEncoding("UTF-8");
				out = response.getWriter();
				out.println("<script>alert('보신 매물이 없습니다.');  location.href='index.do';</script>");
			} catch (IOException e) {
				e.getLocalizedMessage();
			}
		}
	
		
		//split으로 나눈 매물번호에 따른 매물 정보 가져오기
		List<Maemul> outputList = new ArrayList<Maemul>();
		for (int i = 0; i < maemulNum.length; i++) {
			Maemul input = new Maemul();
			Maemul output = new Maemul();
			input.setMaemul_num(Integer.parseInt(maemulNum[i]));
			try {
				output = maemulservice.getMaemulItem(input);
				outputList.add(output);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		for (int i = 0; i < outputList.size(); i++) {
			System.out.println(outputList.get(i));
		}
		
		
		//관심매물 리스트에 뿌려줄 매물 사진을 위한 매물파일 가져오기
		List<String> fileName = new ArrayList<String>();
		
		for (int i = 0; i < maemulNum.length; i++) {
			UploadItem input = new UploadItem();
			List<UploadItem> output = null;
			input.setMaemul_num(Integer.parseInt(maemulNum[i]));
			try {
				output = maemulFileService.getFileItem(input);
			} catch (Exception e) {
				e.getLocalizedMessage();
			}
			fileName.add(output.get(0).getFilePath());
		}
		
		System.out.println("------------------" + fileName + "---------------------------");
		
		model.addAttribute("fileName",fileName);
		model.addAttribute("output",outputList);
		
		return "Maemul.interest";
	}
	@RequestMapping(value = "delInter")
	public String delInter(
			Model model, HttpServletRequest request, HttpServletResponse response) {
		
		Cookie[] cookies = request.getCookies();
		
		//cookie name 이 maemul_num 인 쿠키만 제거
		if(cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				if (cookies[i].getName().equals("maemul_num")) {
					cookies[i].setMaxAge(0);
					response.addCookie(cookies[i]);
				}
			}
		}
		
		
		return "index";
	}
}
