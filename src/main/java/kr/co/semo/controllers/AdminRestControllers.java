package kr.co.semo.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.RestController;


import kr.co.semo.helper.PageData;
import kr.co.semo.helper.RegexHelper;
import kr.co.semo.helper.WebHelper;
import kr.co.semo.model.Co_member;

import kr.co.semo.service.Co_memberService;


@RestController
public class AdminRestControllers {
	@Autowired WebHelper webHelper;
	@Autowired RegexHelper regexHelper;
	@Autowired Co_memberService co_memberService;
	
	/** 증개사 목록 출력 */
	@RequestMapping(value = "/Co_admin",method = RequestMethod.POST)
	public Map<String, Object> get_list() {
		System.out.println("########################## 중개사 목록 출력  컨트롤러 start ###########################");
		Co_member input = new Co_member();
		List<Co_member> output = null;
		
		int nowPage = webHelper.getInt("co_page",1);			// 페이지 번호
		int totalCount = 0;									// 전체 게시글 수
		int listCount = 12;									// 한 페이지당 표시할 목록 수
		int pageCount =5;									// 한 그룹당 표시할 페이지 번호 수
		
		PageData pageData = null;
		
		try {
			// 전체 게시글 수 조회
			totalCount = co_memberService.getCo_memberCount(input);
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);
			
			Co_member.setOffset(pageData.getOffset());
			Co_member.setListCount(pageData.getListCount());
			
			//데이터 조회하기
			output = co_memberService.getCo_memberList(input);
		} catch (Exception e) {
			e.getLocalizedMessage();
		}
		
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("output", output);
		data.put("pageData", pageData);
		System.out.println("########################## 중개사 목록 출력  컨트롤러 END ###########################");
		return data;
	}
	
	
	/**중개사 검색 컨트롤러*/
	@RequestMapping(value = "/co_search",method = RequestMethod.POST)
	public Map<String, Object> search_keyword() {
		String co_keyword = webHelper.getString("co_keyword");	// 검색어
		
		
		/**데이터 조회*/
		Co_member co_input = new Co_member ();
		co_input.setCo_name(co_keyword);

		List<Co_member> co_output = null;
		//PageData co_pageData =null;
		
		//검색
		try {
			co_output = co_memberService.getCo_searchList(co_input);
		} catch (Exception e) {
			e.getLocalizedMessage();
		}
	
		/**3) View 처리*/
	Map<String,Object> data = new HashMap<String, Object>();
	data.put("co_keyword", co_keyword);
	data.put("co_userinfo", co_output);
	//data.put("co_pageData", co_pageData);
	//model.addAttribute("data", data);
	System.out.println("########################## co_search 컨트롤러 END ###########################");
	return data;
	}
	
	
	
	/**상세 페이지*/
	@RequestMapping(value ="/Co_admin/{co_name}", method= RequestMethod.POST)
	public Map<String, Object>get_item(@PathVariable("id") int id) {
		
		Co_member co_input = new Co_member();
		Co_member co_output = null;
		
		try {
			co_output = co_memberService.getCo_memberItem(co_input);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}
		
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("co_userinfo", co_output);
		
		return webHelper.getJsonData(data);
	}
}
	

	