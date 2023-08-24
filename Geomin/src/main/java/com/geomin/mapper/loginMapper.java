package com.geomin.mapper;

import com.geomin.VO.memberVO;

public interface loginMapper {

	public int idCheck(String memberid);
	public String register(memberVO memberVo);
	
	public memberVO login(memberVO memberVo);
}
