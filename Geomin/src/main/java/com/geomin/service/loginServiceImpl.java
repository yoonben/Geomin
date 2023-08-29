package com.geomin.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.geomin.VO.memberVO;
import com.geomin.mapper.loginMapper;
import com.sun.mail.imap.protocol.Namespaces.Namespace;

@Service
public class loginServiceImpl implements loginService {

	@Autowired
	loginMapper loginMapper;
	
	
	@Override
	 public int idCheck(String memberid) {
	        return loginMapper.idCheck(memberid);
	    }

	@Override
	public int register(memberVO memberVo) {
		return loginMapper.register(memberVo);
	}

	@Override
	public memberVO login(memberVO memberVo) {
		return loginMapper.login(memberVo);
	}

	@Override
	public memberVO getOne(String memberid) {
		return loginMapper.getOne(memberid);
	}

	@Override
	public int nameCheck(memberVO member) {
		return loginMapper.nameCheck(member);
	}

	@Override
	public int phoneCheck(memberVO member) {
		return loginMapper.phoneCheck(member);
	}

	@Override
	public memberVO findId(memberVO member) {
		return loginMapper.findId(member);
	}

	@Override
	public memberVO findPw(memberVO member) {
		return loginMapper.findPw(member);
	}

	@Override
	public int idCheckPw(memberVO member) {
		return loginMapper.idCheckPw(member);
	}

	@Override
	public int emailCheckPw(memberVO member) {
		return loginMapper.emailCheckPw(member);
	}


	
	//비밀번호 찾기 이메일발송
	@Override
	public void sendEmail(memberVO vo, String div) throws Exception {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com"; //네이버 이용시 smtp.naver.com
		String hostSMTPid = "서버 이메일 주소(보내는 사람 이메일 주소)";
		String hostSMTPpwd = "서버 이메일 비번(보내는 사람 이메일 비번)";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "보내는 사람 이메일주소(받는 사람 이메일에 표시됨)";
		String fromName = "프로젝트이름 또는 보내는 사람 이름";
		String subject = "";
		String msg = "";

		if(div.equals("findPw")) {
			subject = "임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += vo.getMemberid() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += vo.getMpassword() + "</p></div>";
		}

		// 받는 사람 E-Mail 주소
		String mail = vo.getMemail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(465); //네이버 이용시 587

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}

	//비밀번호찾기
	@Override
	public void findPwEmail(HttpServletResponse response, memberVO member) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		memberVO ck = loginMapper.getOne(member.getMemberid());
		PrintWriter out = response.getWriter();
		// 가입된 아이디가 없으면
		if(loginMapper.getOne(ck.getMemberid()) == null) {
			out.print("등록되지 않은 아이디입니다.");
			out.close();
		}
		// 가입된 이메일이 아니면
		else if(!member.getMemail().equals(ck.getMemail())) {
			out.print("등록되지 않은 이메일입니다.");
			out.close();
		}else {
			// 임시 비밀번호 생성
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			member.setMpassword(pw);
			// 비밀번호 변경
			loginMapper.updatePw(member);
			// 비밀번호 변경 메일 발송
			sendEmail(member, "findpw");

			out.print("이메일로 임시 비밀번호를 발송하였습니다.");
			out.close();
		}
	}


	@Override
	public int updatePw(memberVO member) throws Exception {
		return loginMapper.updatePw(member);
	}
	
	

}
