package com.geomin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.geomin.VO.PackagepriceVO;
import com.geomin.mapper.PackagepriceMapper;

@Service
public class PackagepriceService implements PackagepriceServiceImpl{

	@Autowired
	PackagepriceMapper mapper;

	@Override
	public List<PackagepriceVO> yearPrice(PackagepriceVO vo) {
		List<PackagepriceVO> list = mapper.yearPrice(vo);
		return list;
	}

	@Override
	public List<PackagepriceVO> monthPrice(PackagepriceVO vo) {
		List<PackagepriceVO> list = mapper.monthPrice(vo);
		return list;
	}

	@Override
	public List<PackagepriceVO> dayPrice(PackagepriceVO vo) {
		List<PackagepriceVO> list = mapper.dayPrice(vo);
		return list;
	}
	


}
