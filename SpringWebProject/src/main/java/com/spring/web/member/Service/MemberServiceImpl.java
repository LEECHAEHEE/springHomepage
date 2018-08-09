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
			out.close();
		}else {
			out.println(0);
			out.close();
		}
	}

	@Override
	public int loginOK(MemberDTO member, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		MemberDTO DBmember = memberDao.loginOK(member);
		if(DBmember==null) {
			/*아이디없음*/
			out.println(0);
			out.close();
			return 0;
		}else {
			if(!DBmember.getPw().equals(member.getPw())) {
				/*비밀번호 틀림*/
				out.println(0);
				out.close();
				return 0;
			}else {
				out.println(1);
				out.close();
				return 1;
			}
		}
	}
}
