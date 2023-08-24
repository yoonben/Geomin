package com.geomin.mapper;

import java.util.List;

import com.geomin.VO.Criteria;
import com.geomin.VO.packageVO;

public interface ManagerMapper {
	public int packageInsert(packageVO vo);
	
	public List<packageVO> packageList(Criteria vo);
}
