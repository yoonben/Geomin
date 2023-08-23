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
	public int idCheck(memberVO memberVo) {
		return loginMapper.idCheck(memberVo);
	}

}
