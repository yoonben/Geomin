package com.geomin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.geomin.VO.contentVO;
import com.geomin.VO.memberVO;

public interface contentMapper {

	//1. 모든 학습 컨텐츠 출력
	List<contentVO> getList();
	
	//2. 구독한 모든 학습 컨텐츠 출력
	List<contentVO> getSubList(String memberId);
	
	//3. 구독한  모든 학습 컨텐츠 아이디 가져오기
	List<contentVO> getpkgId();
	
	//4. 학습 컨텐츠 구독
	int addSubContent(List<contentVO> checked_Data);
	
	//5.
	List<contentVO> getSubMatchingList(String pkgName);
	
}
