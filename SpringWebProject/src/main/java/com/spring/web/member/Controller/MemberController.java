package com.spring.web.member.Controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
	
	@RequestMapping(value="/findIdsendEmail.do", method=RequestMethod.POST)
	@ResponseBody 
	public Map<String, Object> findIdsendEmail(@ModelAttribute("member") MemberDTO member, HttpServletResponse response) throws Exception {
		return service.findMemberByIdEmail(member); 
	}
	
	@RequestMapping(value="/findIdOK.do", method=RequestMethod.POST)
	public ModelAndView findIdOK(Model model, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("name",request.getParameter("paramName"));
		mv.addObject("id",request.getParameter("paramId"));
		mv.setViewName("member/findIdOK");
		return mv;
	}
	
}
