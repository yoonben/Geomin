package com.geomin.service;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.geomin.VO.packageVO;
import com.geomin.mapper.studentMapper;

@Service
public class studentServiceImpl implements studentService {

	@Autowired
	studentMapper studentmapper;
	
	@Override
	public List<packageVO> groupList() {
		return studentmapper.groupList();
	}
	
	
	@Override
	public List<packageVO> getGroup(packageVO pkg) {
		return studentmapper.getGroup(pkg);
	}


	@Override
	public packageVO groupOne(packageVO pkg) {
		return studentmapper.groupOne(pkg);
	}






}
