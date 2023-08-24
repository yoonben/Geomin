package com.geomin.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.geomin.vo.HelloVO;

@Service
public interface HelloService {

	List<HelloVO> getList();
	
}
