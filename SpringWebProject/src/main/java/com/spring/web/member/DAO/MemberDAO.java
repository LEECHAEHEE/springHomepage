package com.spring.web.member.DAO;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.spring.web.member.DTO.MemberDTO;

@Repository("memberDao")
public class MemberDAO {
	@Autowired SqlSession sqlSession;
	
	@Transactional
	public int joinMember(MemberDTO member) {
		return sqlSession.insert("joinMember", member);
	}
	
	@Transactional
	public int deleteAll() {
		return sqlSession.delete("deleteAll");
	}
	
	public int idCheck(String id) {
		return sqlSession.selectOne("idCheck", id);
	}
	
	public MemberDTO loginOK(MemberDTO member) {
		return sqlSession.selectOne("loginOK", member);
	}
	
	public MemberDTO findMemberByIdEmail(MemberDTO member) {
		return sqlSession.selectOne("findMemberByIdEmail", member);
	}
	
	public MemberDTO findPwByNameId(MemberDTO member) {
		return sqlSession.selectOne("findPwByNameId", member);
	}
	
	public int changePwOK(HashMap<String, Object> hmap) {
		return sqlSession.update("changePwOK",hmap);
	}
}
