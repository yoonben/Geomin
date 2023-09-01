package com.geomin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.geomin.VO.Criteria;
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

	@Override
	public List<PackagepriceVO> priceList(Criteria cri) {
		List<PackagepriceVO> list = mapper.priceList(cri);
		
		return list;
	}

	@Override
	public int totalCnt(Criteria cri) {
		int res = mapper.totalCnt(cri);
		return res;
	}

	@Override
	public PackagepriceVO totalChart(PackagepriceVO vo) {
		PackagepriceVO price = mapper.totalChart(vo);
		return price;
	}

	@Override
	public PackagepriceVO yearChart(PackagepriceVO vo) {
		PackagepriceVO price = mapper.yearChart(vo);
		return price;
	}

	@Override
	public PackagepriceVO dayChart(PackagepriceVO vo) {
		PackagepriceVO price = mapper.dayChart(vo);
		return price;
	}
	


}
