package com.spring.web.member.Service;

import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import com.spring.web.member.DAO.MemberDAO;
import com.spring.web.member.DTO.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService{
	@Inject MemberDAO memberDao;
	
	@Override
	public void joinMember(MemberDTO member, HttpServletResponse response) throws Exception {
		System.out.println("joinMember()");
		System.out.println(memberDao.deleteAll() + "row(s) deleted.");
		int result = memberDao.joinMember(member);
	}

	@Override
	public void idCheck(String id, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		/*중복된 아이디 있음*/
		if(memberDao.idCheck(id)==1) {
			out.println(1);
		}else {
			out.println(0);
		}
	}
}
