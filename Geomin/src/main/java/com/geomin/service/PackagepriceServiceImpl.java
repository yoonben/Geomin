package com.geomin.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.geomin.VO.Criteria;
import com.geomin.VO.PackagepriceVO;

@Service
public interface PackagepriceServiceImpl {
	
	public List<PackagepriceVO> yearPrice(PackagepriceVO vo);
	
	public List<PackagepriceVO> monthPrice(PackagepriceVO vo);
	
	public List<PackagepriceVO> dayPrice(PackagepriceVO vo);
	
	public List<PackagepriceVO> priceList(Criteria cri);
	
	public int totalCnt(Criteria cri);
	
	public PackagepriceVO totalChart(PackagepriceVO vo);
	
	public PackagepriceVO yearChart(PackagepriceVO vo);
	
	public PackagepriceVO dayChart(PackagepriceVO vo);
}
