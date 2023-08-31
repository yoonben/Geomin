package com.geomin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.geomin.VO.Hello2VO;
import com.geomin.VO.HelloVO;
import com.geomin.mapper.HelloMapper;

@Service
public class HelloServiceImpl implements HelloService{

	@Autowired
	private HelloMapper helloMapper;
	
	@Override
	public List<HelloVO> getList() {
		// TODO Auto-generated method stub
		return helloMapper.getList();
	}

	@Override
	public List<HelloVO> getSubList() {
		// TODO Auto-generated method stub
		return helloMapper.getSubList();
	}

	@Override
	public List<Hello2VO> addSubContent(List<Hello2VO> checked_Data) {
		// TODO Auto-generated method stub
		return helloMapper.addSubContent(checked_Data);
		
	}

}
