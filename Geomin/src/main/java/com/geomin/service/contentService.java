package com.geomin.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import com.geomin.VO.contentVO;
import com.geomin.VO.memberVO;

@Service
public interface contentService {
	
	//1. 모든 학습 컨텐츠 출력
	List<contentVO> getList(/* String memberId */);
	
	//2. 구독한 모든 학습 컨텐츠 출력
	List<contentVO> getSubList(String memberId);
	
	//3. 구독한  모든 학습 컨텐츠 아이디 가져오기
	List<contentVO> getpkgId();
	
	//4. 학습 컨텐츠 구독
	int addSubContent(List<contentVO> checked_Data);
	//int addSubContent(@Param("checked_Data") List<contentVO> checked_Data, @Param("memberId") String memberId);
	
	//5.
	List<contentVO> getSubMatchingList(String pkgName);


	
}
