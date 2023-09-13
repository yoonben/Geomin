package com.geomin.VO;

import java.util.List;

import lombok.Data;

@Data
public class groupstudentVO {

    private String studentid;
    private String groupid;
    private String pkgid;
    private String memberid;
    private String sname;
    private String groupresdate;
    private String groupjoinstatus;
    
    private List<String> studentidList;
}
