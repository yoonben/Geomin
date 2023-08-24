package com.geomin.mapper;

import java.util.List;

import org.springframework.ui.Model;

import com.geomin.VO.Criteria;
import com.geomin.VO.packageVO;

public interface ManagerMapper {
	
	public int packageInsert(packageVO vo);
	
	public List<packageVO> packageList(Criteria cri);
	
	public int totalCnt(Criteria cri);
}
