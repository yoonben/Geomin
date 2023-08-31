package com.geomin.mapper;

import java.util.List;

import com.geomin.VO.Hello2VO;
import com.geomin.VO.HelloVO;

public interface HelloMapper {

	List<HelloVO> getList();
	
	List<HelloVO> getSubList();
	
	List<Hello2VO> addSubContent(List<Hello2VO> checked_Data);
}
