package com.geomin.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.geomin.VO.contentVO;
import com.geomin.VO.memberVO;
import com.geomin.mapper.contentMapper;

@Service
public class contentServiceImpl implements contentService{

	@Autowired
	private contentMapper helloMapper;
	
	@Override
	public List<contentVO> getList(/* String memberId */) {
		// TODO Auto-generated method stub
		return helloMapper.getList(/* memberId */);
	}

	@Override
	public List<contentVO> getSubList(String memberId) {
		// TODO Auto-generated method stub
		return helloMapper.getSubList(memberId);
	}

	@Override
	public int addSubContent(List<contentVO> checked_Data) {
		// TODO Auto-generated method stub
		return helloMapper.addSubContent(checked_Data);
		
	}

	@Override
	public List<contentVO> getpkgId() {
		// TODO Auto-generated method stub
		return helloMapper.getpkgId();
	}

	@Override
	public List<contentVO> getSubMatchingList(String pkgName, String memberID) {
		// TODO Auto-generated method stub
		return helloMapper.getSubMatchingList(pkgName, memberID);
	}

}
