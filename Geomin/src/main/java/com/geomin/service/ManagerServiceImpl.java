package com.geomin.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.geomin.VO.Criteria;
import com.geomin.VO.packageVO;

@Service
public interface ManagerServiceImpl {
	
	public int packageInsert(packageVO vo);
	
	public List<packageVO> packageList(Criteria cri, Model model);
	
	public int totalCnt(Criteria cri);
}
