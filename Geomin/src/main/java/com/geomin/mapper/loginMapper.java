package com.geomin.mapper;

import com.geomin.VO.memberVO;

public interface loginMapper {

	public int idCheck(String memberid);
	public int register(memberVO memberVo);
	
	public memberVO login(memberVO memberVo);
	
	public memberVO getOne(String memberid);
}
