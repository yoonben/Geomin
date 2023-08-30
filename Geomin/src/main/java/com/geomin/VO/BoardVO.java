package com.geomin.VO;

import lombok.Data;

@Data
public class BoardVO {
	public String memberid;
	public String bno;
	public String boardtitle;
	public String boardcontent;
	public String boardnotice;
	public String regdate;
	public String writer;
	public String answer;
}
