package com.geomin.VO;

import java.sql.Date;

import lombok.Data;

@Data
public class KakaoPayReadyVO {
    
    //response
    private String tid, next_redirect_pc_url;
    private Date created_at;
    
}
