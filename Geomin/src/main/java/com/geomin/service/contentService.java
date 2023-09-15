package com.geomin.service;

import java.util.List;
import org.springframework.stereotype.Service;
import com.geomin.VO.contentVO;

@Service
public interface contentService {
	
	//1. 모든 학습 컨텐츠 출력
	List<contentVO> getList();
	
	//2. 구독한 모든 학습 컨텐츠 출력
	List<contentVO> getSubList();
	
	//3. 구독한  모든 학습 컨텐츠 아이디 가져오기
	List<contentVO> getpkgId();

	//List<contentVO> addSubContent(List<contentVO> checked_Data);
	int addSubContent(List<contentVO> checked_Data);

	List<contentVO> regSubinfo();

	List<contentVO> getSubMatchingList(String pkgName);

	
}
