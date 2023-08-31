package com.geomin.mapper;

import java.util.List;

import com.geomin.VO.PackagepriceVO;

public interface PackagepriceMapper {

	public List<PackagepriceVO> yearPrice(PackagepriceVO vo);
	
	public List<PackagepriceVO> monthPrice(PackagepriceVO vo);
	
	public List<PackagepriceVO> dayPrice(PackagepriceVO vo);
}
