package com.geomin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.geomin.VO.PackagepriceVO;
import com.geomin.mapper.PackagepriceMapper;

@Service
public class PackagepriceService implements PackagepriceServiceImpl{

	@Autowired
	PackagepriceMapper mapper;
	
	@Override
	public PackagepriceVO dayPrice(PackagepriceVO vo) {
		
		PackagepriceVO packageprice = mapper.dayPrice(vo);
		
		return packageprice;
	}

}
