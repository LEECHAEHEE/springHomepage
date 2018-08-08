package com.spring.web.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.web.DTO.MemberDTO;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
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
	
	@RequestMapping(value="/idCheck.do", method=RequestMethod.POST)
	public void idChceck() {
	
	}
	
	@RequestMapping(value="/joinOK.do", method=RequestMethod.POST)
	public String joinOK(@ModelAttribute("member") MemberDTO member, HttpServletResponse response) {
		System.out.println(member);
		return "redirect:home.do";
	}
	
}
