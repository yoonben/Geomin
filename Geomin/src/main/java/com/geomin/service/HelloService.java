package com.geomin.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.geomin.VO.Hello2VO;
import com.geomin.VO.HelloVO;

@Service
public interface HelloService {

	List<HelloVO> getList();

	List<HelloVO> getSubList();

	List<Hello2VO> addSubContent(List<Hello2VO> checked_Data);
	
}
