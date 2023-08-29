package com.geomin.mapper;

import com.geomin.VO.memberVO;

public interface loginMapper {

	public int idCheck(String memberid);
	public int register(memberVO memberVo);
	
	public memberVO login(memberVO memberVo);
	
	public memberVO getOne(String memberid);
	
	public int nameCheck(memberVO member);
	public int phoneCheck(memberVO member);
	public memberVO findId(memberVO member);
	
	public int emailCheckPw(memberVO member);
	public int idCheckPw(memberVO member);
	public memberVO findPw(memberVO member);
	
	// 비밀번호 변경
	public int updatePw(memberVO vo) throws Exception;
	
}
