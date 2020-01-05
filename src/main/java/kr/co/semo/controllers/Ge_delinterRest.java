package kr.co.semo.controllers;

import org.springframework.web.bind.annotation.RestController;

@RestController
public class Ge_delinterRest {
	/*
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
		
		return "Success";
	}
	*/
}
