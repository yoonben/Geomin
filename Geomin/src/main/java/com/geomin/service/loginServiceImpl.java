package com.geomin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.geomin.VO.memberVO;
import com.geomin.mapper.loginMapper;

@Service
public class loginServiceImpl implements loginService {

	@Autowired
	loginMapper loginMapper;
	
	
	@Override
	 public int idCheck(String memberid) {
	        return loginMapper.idCheck(memberid);
	    }

	@Override
	public String register(memberVO memberVo) {
		return loginMapper.register(memberVo);
	}

	@Override
	public memberVO login(memberVO memberVo) {
		return loginMapper.login(memberVo);
	}

	@Override
	public memberVO getOne(String memberid) {
		return loginMapper.getOne(memberid);
	}

}
