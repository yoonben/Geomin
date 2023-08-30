package com.geomin.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.geomin.VO.PackagepriceVO;

@Service
public interface PackagepriceServiceImpl {
	
	public List<PackagepriceVO> yearPrice(PackagepriceVO vo);
	
	public List<PackagepriceVO> monthPrice(PackagepriceVO vo);
}
