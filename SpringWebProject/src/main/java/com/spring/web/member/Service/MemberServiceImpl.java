package com.spring.web.member.Service;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Random;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
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

	@Override
	public HashMap<String, Object> findMemberByIdEmail(MemberDTO member) throws Exception {
		/*데이터를 자동으로 JSON형식으로 매핑해주는 객체.
		 * 아직 사용방법 모르겠다.*/
		//ObjectMapper mapper = new ObjectMapper();
		
		HashMap<String, Object> hmap = new HashMap<String,Object>();
		MemberDTO DBmember = memberDao.findMemberByIdEmail(member);
		
		if(DBmember!=null) {
			String certiNum = createCertiNum();
			/*이메일 전송*/
			//sendEmail(DBmember,certiNum);
			hmap.put("name", DBmember.getName());
			hmap.put("id", DBmember.getId());
			hmap.put("certiNum", certiNum);
		}
		return hmap;
	}
	
	@Override
	public HashMap<String, Object> findPwByNameId(MemberDTO member) throws Exception {
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		MemberDTO DBmember = memberDao.findPwByNameId(member);
		if(DBmember!=null) {
			String certiNum = createCertiNum();
			//sendEmail(DBmember, certiNum);
			hmap.put("certiNum", certiNum);
			hmap.put("id", DBmember.getId());
		}
		return hmap;
	}

	@Override
	public void changePwOK(HashMap<String, Object> hmap, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;utf-8");
		PrintWriter out = response.getWriter();
		
		if(memberDao.changePwOK(hmap)==1) {
			out.println("<script>");
			out.println("alert('비밀번호가 변경되었습니다.\r\n다시 로그인 하세요');");
			out.println("location.href='loginForm.do'");
			out.println("</script>");
			out.close();
		}else {
			out.println("<script>");
			out.println("alert('비밀번호 변경 중 오류발생.');");
			out.println("</script>");
		}
	}
	
	private void sendEmail(MemberDTO member,String certiNum) {
		//Mail 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com";
		String hostSMTPid = "leechaehee";
		String hostSMTPpwd= "Cogml33##";
		
		//보내는 사람 Email, 제목, 내용
		String fromEmail = "leechaehee@naver.com";
		String fromName = "homepage admin";
		String subject = "";
		String msg = "";

		subject = "인증번호 안내";
		msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
		msg += "<h3 style='color: blue;'>";
		msg += member.getName() + "님 아이디 찾기 인증번호 입니다.</h3>";
		msg += "<div style='font-size: 130%'>";
		msg += certiNum;
		msg += "</div><br/>";

		// 받는 사람 E-Mail 주소
		String mail = member.getEmail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSLOnConnect(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(465);

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setStartTLSEnabled(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}

	}

	public String createCertiNum(){
		String certiNum = "";
		Random rd = new Random();
		for(int i=0;i<6;i++) {
			certiNum += rd.nextInt(10);
		}
		return certiNum;
	}


	
}
