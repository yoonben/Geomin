package com.geomin.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.geomin.VO.Criteria;
import com.geomin.VO.packageVO;

@Service
public interface ManagerServiceImpl {
	public int packageInsert(packageVO vo);
	
	public List<packageVO> packageList(Criteria vo);
}
