package com.geomin.service;

import org.springframework.stereotype.Service;

import com.geomin.VO.PackagepriceVO;

@Service
public interface PackagepriceServiceImpl {
	
	public PackagepriceVO dayPrice(PackagepriceVO vo);
}
