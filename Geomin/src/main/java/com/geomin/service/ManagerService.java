package com.geomin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.geomin.VO.Criteria;
import com.geomin.VO.packageVO;
import com.geomin.mapper.ManagerMapper;

@Service
public class ManagerService implements ManagerServiceImpl{
	
	@Autowired
	ManagerMapper  manager;
	
	@Override
	public int packageInsert(packageVO vo) {
		return manager.packageInsert(vo);
	}

	@Override
	public List<packageVO> packageList(Criteria vo) {
		List<packageVO> list = manager.packageList(vo);
		
		
		return list;
	}

}
