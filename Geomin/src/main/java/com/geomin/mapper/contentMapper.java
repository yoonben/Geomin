package com.geomin.mapper;

import java.util.List;

import com.geomin.VO.contentVO;

public interface contentMapper {

	List<contentVO> getList();
	
	List<contentVO> getSubList();
	
	void addSubContent(List<contentVO> checked_Data);
	
	List<contentVO> regSubinfo();
}