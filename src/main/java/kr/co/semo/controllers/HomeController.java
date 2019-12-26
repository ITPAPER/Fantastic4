package kr.co.semo.controllers;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import kr.co.semo.service.Co_memberService;
import kr.co.semo.service.Ge_memberService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired Ge_memberService ge_memberService;
	@Autowired Co_memberService co_memberService;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute("userType", 100);
		
		return "index";
	}
	
	// 인덱스 페이지
	@RequestMapping(value = "index.do")
	public String index(Locale locale, Model model, HttpServletRequest request) {
		
		
		return "index";
	}

	
	  // Login 페이지
	  
	  @RequestMapping(value = "Login.do") public String login(Locale locale, Model
	  model) {
	  
	  return "Login"; }
	  
	  // Admin 페이지
	  
	  @RequestMapping(value = "Admin.do") public String admin(Locale locale, Model
	  model) {
	  
	  
	  return "Admin"; }
	 
	// Admin_infochange 페이지
	@RequestMapping(value = "Admin_infochange.do")
	public String adminInfochange(Locale locale, Model model) {
		
		return "Admin_infochange";
	}
	
	// Bigdata 페이지
	@RequestMapping(value = "Bigdata.do")
	public String bigdata(Locale locale, Model model) {
		
		return "Bigdata";
	}
	
	// Joinus_company 페이지
	@RequestMapping(value = "Joinus_company.do")
	public String joinusCompany(Locale locale, Model model) {
		
		return "Joinus_company";
	}
	
	// Joinus_general 페이지
	@RequestMapping(value = "Joinus_general.do")
	public String joinusGeneral(Locale locale, Model model) {
		
		return "Joinus_general";
	}
	
	// Joinus_select 페이지
	@RequestMapping(value = "Joinus_select.do")
	public String joinusSelect(Locale locale, Model model) {
		
		return "Joinus_select";
	}
	
	// Maemul_register 페이지
	@RequestMapping(value = "Maemul_register.do")
	public String maemulRegister(Locale locale, Model model) {
		
		return "Maemul_register";
	}
	
	// Maemul.detailed 페이지
	@RequestMapping(value = "Maemul.detailed.do")
	public String maemulDetailed(Locale locale, Model model) {
		
		return "Maemul.detailed";
	}
	
	// Maemul.interest 페이지
	@RequestMapping(value = "Maemul.interest.do")
	public String maemulInterest(Locale locale, Model model) {
		
		return "Maemul.interest";
	}
	
	// Maemul.manage 페이지
	   @RequestMapping(value = "Maemul.manage.do")
	   public String maemulManage(Locale locale, Model model) {
	      
	      return "Maemul.manage";
	   }
	
	// Register_change 페이지
	@RequestMapping(value = "Register_change.do")
	public String registerChange(Locale locale, Model model) {
		
		return "Register_change";
	}
}
