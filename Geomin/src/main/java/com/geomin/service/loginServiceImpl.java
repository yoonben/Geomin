package com.geomin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.geomin.VO.memberVO;
import com.geomin.mapper.loginMapper;

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


	/*
	//비밀번호 찾기 이메일발송
	@Override
	public void sendEmail(memberVO vo, String div) throws Exception {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com"; //네이버 이용시 smtp.naver.com / 구글이용시 smtp.gmail.com
		String hostSMTPid = "tmdwiswkd@naver.com";//"서버 이메일 주소(보내는 사람 이메일 주소)"
		String hostSMTPpwd = "gksvudtod2@";//서버 이메일 비번(보내는 사람 이메일 비번)

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "tmdwiswkd@naver.com";//보내는 사람 이메일주소(받는 사람 이메일에 표시됨)
		String fromName = "거민시스템";
		String subject = "===이메일 발송 테스트===";
		String msg = "";

		String div1 = vo.getMemberid();
		
		if(div1.equals(vo.getMemberid())) {
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
			email.setSmtpPort(587); //네이버 이용시 587 / 구글이용시 465
			
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
		
		System.out.println("member========================= " + member.getMemberid());
		memberVO ck = loginMapper.getOne(member.getMemberid());
		System.out.println("ck========================= " + ck);
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
			for (int i = 0; i < 10; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			pw += "1!";
			member.setMpassword(pw);
			System.out.println("pw========================= " + pw);
			// 비밀번호 변경
			loginMapper.updatePw(member);
			
			// 비밀번호 변경 메일 발송
			sendEmail(member, ck.getMemail());

			out.print("이메일로 임시 비밀번호를 발송하였습니다.");
			out.close();
		}
	}
*/

	@Override
	public int updatePw(memberVO member) throws Exception {
		return loginMapper.updatePw(member);
	}

	@Override
	public int InfoUpdate(memberVO vo) {
		
		return loginMapper.InfoUpdate(vo);
	}

	@Override
	public int loginCheck(String studentid) {
		return loginMapper.loginCheck(studentid);
	}




	
	

}
