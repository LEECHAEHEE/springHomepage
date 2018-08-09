package com.spring.web.member.Controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.ws.RequestWrapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.web.member.DTO.MemberDTO;
import com.spring.web.member.Service.MemberServiceImpl;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	@Autowired MemberServiceImpl service;
	
	@RequestMapping(value="/home.do")
	public String home() {
		return "member/home";
	}
	
	@RequestMapping(value="/loginForm.do")
	public String loginForm() {
		return "member/loginForm";
	}
	
	@RequestMapping(value="/joinForm.do")
	public String joinForm() {
		return "member/joinForm";
	}
	
	@RequestMapping(value="/findForm.do")
	public String findForm() {
		return "member/findForm";
	}
	
	@RequestMapping(value="/findIdForm.do")
	public String findIdForm() {
		return "member/findIdForm";
	}
	
	@RequestMapping(value="/findPwForm.do")
	public String findPwForm() {
		return "member/findPwForm";
	}
	
	@RequestMapping(value="/idCheck.do", method=RequestMethod.POST)
	public void idChceck(@RequestParam("id") String id, HttpServletResponse response) throws Exception {
		service.idCheck(id,response);
	}
	
	@RequestMapping(value="/joinOK.do", method=RequestMethod.POST)
	public String joinOK(@ModelAttribute("member") MemberDTO member, HttpServletResponse response) throws Exception {
		service.joinMember(member, response);
		return "redirect:home.do";
	}
	
	@RequestMapping(value="/loginOK.do", method=RequestMethod.POST)
	public void loginOK(@ModelAttribute("member") MemberDTO member, HttpSession session, HttpServletResponse response) throws Exception{
		if(service.loginOK(member, response)==1) {
			session.setAttribute("loginMember", member);
		}
	}	
}
