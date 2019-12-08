package kr.co.semo.service;

import java.util.List;

import kr.co.semo.model.Co_member;
import kr.co.semo.model.Ge_member;

public interface Co_memberService {
	public Co_member getCo_memberItem(Co_member input) throws Exception;

	public List<Co_member> getCo_memberList(Co_member input) throws Exception;

	public int getCo_memberCount(Co_member input) throws Exception;

	public int addCo_member(Co_member input) throws Exception;

	public int editCo_member(Co_member input) throws Exception;
	
	public int editCo_memberPw(Co_member input) throws Exception;

	public int deleteCo_member(Co_member input) throws Exception;
	
	public Co_member getLoginuser_item(Co_member input) throws Exception;
}
