package com.geomin.service;

import java.awt.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.geomin.VO.packageVO;
import com.geomin.mapper.studentMapper;

@Service
public class studentServiceImpl implements studentService {

	@Autowired
	studentMapper studentmapper;
	
	@Override
	public List groupSearch(String groupid) {
		return studentmapper.groupSearch(groupid);
	}
	
	
	@Override
	public packageVO getGroup(packageVO pkg) {
		return studentmapper.getGroup(pkg);
	}






}
