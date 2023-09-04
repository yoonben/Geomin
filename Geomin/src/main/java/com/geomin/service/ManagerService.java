package com.geomin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.geomin.VO.Criteria;
import com.geomin.VO.PageDto;
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
	public List<packageVO> packageList(Criteria cri) {
		
		List<packageVO> list = manager.packageList(cri);
		
		return list;
	}

	@Override
	public int totalCnt(Criteria cri) {
		
		int totalCnt = manager.totalCnt(cri);
		
		return totalCnt;
	}

	@Override
	public int packDeleteUpdate(packageVO vo) {
		
		int res = manager.packDeleteUpdate(vo);
		
		return res;
	}

	@Override
	public int packUpdate(packageVO vo) {
		int res = manager.packUpdate(vo);
		return res;
	}

	@Override
	public packageVO getOnePack(packageVO vo) {
		packageVO pack = manager.getOnePack(vo);
		return pack;
	}

}
