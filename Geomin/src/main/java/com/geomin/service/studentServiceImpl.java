package com.geomin.service;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.geomin.VO.groupstudentVO;
import com.geomin.VO.memberVO;
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
	public List<packageVO> teacherGroupList(String memberid) {
		return studentmapper.teacherGroupList(memberid);
	}



	@Override
	public packageVO groupOne(packageVO pkg) {
		return studentmapper.groupOne(pkg);
	}


	@Override
	public int groupjoin(groupstudentVO groupstudent) {
		return studentmapper.groupjoin(groupstudent);
	}

	@Override
	public memberVO teacherSearch(String mname) {
		
		return studentmapper.teacherSearch(mname);
	}






}
