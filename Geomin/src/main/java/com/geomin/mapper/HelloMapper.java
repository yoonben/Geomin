package com.geomin.mapper;

import java.util.List;

import com.geomin.VO.HelloVO;

public interface HelloMapper {

	List<HelloVO> getList();
	
	List<HelloVO> getSubList();
	
	void addSubContent(HelloVO checked_Data);
}
