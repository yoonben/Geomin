package com.geomin.service;

import java.util.List;
import org.springframework.stereotype.Service;
import com.geomin.VO.contentVO;

@Service
public interface contentService {

	List<contentVO> getList();

	List<contentVO> getSubList();

	List<contentVO> addSubContent(List<contentVO> checked_Data);

	List<contentVO> regSubinfo();
	
}
