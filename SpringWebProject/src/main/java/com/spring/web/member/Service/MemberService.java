package com.spring.web.member.Service;

import javax.servlet.http.HttpServletResponse;

import com.spring.web.member.DTO.MemberDTO;

public interface MemberService {
	public void joinMember(MemberDTO member, HttpServletResponse response) throws Exception;
	public void idCheck(String id, HttpServletResponse response) throws Exception;
}
