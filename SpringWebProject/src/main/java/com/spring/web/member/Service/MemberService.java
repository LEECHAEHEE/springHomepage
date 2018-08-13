package com.spring.web.member.Service;

import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;

import com.spring.web.member.DTO.MemberDTO;

public interface MemberService {
	public void joinMember(MemberDTO member, HttpServletResponse response) throws Exception;
	public void idCheck(String id, HttpServletResponse response) throws Exception;
	public int loginOK(MemberDTO member, HttpServletResponse response) throws Exception;
	public HashMap<String, Object> findMemberByIdEmail(MemberDTO member) throws Exception;
	public HashMap<String, Object> findPwByNameId(MemberDTO member) throws Exception;
	public void changePwOK(HashMap<String, Object> hmap, HttpServletResponse response) throws Exception;
}
