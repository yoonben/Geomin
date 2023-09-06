package com.geomin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.geomin.VO.contentVO;
import com.geomin.mapper.contentMapper;

@Service
public class contentServiceImpl implements contentService{

	@Autowired
	private contentMapper helloMapper;
	
	@Override
	public List<contentVO> getList() {
		// TODO Auto-generated method stub
		return helloMapper.getList();
	}

	@Override
	public List<contentVO> getSubList() {
		// TODO Auto-generated method stub
		return helloMapper.getSubList();
	}

	@Override
	public void addSubContent(List<contentVO> checked_Data) {
		// TODO Auto-generated method stub
		helloMapper.addSubContent(checked_Data);
		
	}

	@Override
	public List<contentVO> regSubinfo() {
		// TODO Auto-generated method stub
		return helloMapper.regSubinfo();
	}

}