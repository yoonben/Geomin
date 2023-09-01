package com.geomin.mapper;

import java.util.List;

import com.geomin.VO.Criteria;
import com.geomin.VO.PackagepriceVO;

public interface PackagepriceMapper {

	public List<PackagepriceVO> yearPrice(PackagepriceVO vo);
	
	public List<PackagepriceVO> monthPrice(PackagepriceVO vo);
	
	public List<PackagepriceVO> dayPrice(PackagepriceVO vo);
	
	public List<PackagepriceVO> priceList(Criteria cri);
	
	public int totalCnt(Criteria cri);
	
	public PackagepriceVO totalChart(PackagepriceVO vo);
	
	public PackagepriceVO yearChart(PackagepriceVO vo);
	
	public PackagepriceVO dayChart(PackagepriceVO vo);
}
