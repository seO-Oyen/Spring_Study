package springweb.a02_mvc.a02_service;

import java.nio.charset.StandardCharsets;

import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import springweb.z01_vo.MailSender;

@Service
public class A06_MailSenderService {
	
	// container에서 메일을 발송하는 객체 로딩
	@Autowired(required = false)
	private JavaMailSender sender;
	
	// 메일발송 메서드
	public String sendMail(MailSender email) {
		String msg = "";
		
		// 1. 메일 발송 데이터 전송을 위한 객체 생성
		MimeMessage mmsg = sender.createMimeMessage();
		// 2. 해당 객체로 화면단에 입력된 내용 할당
		
		try {
			// 제목
			mmsg.setSubject(email.getTitle());
			// 수신자
			mmsg.setRecipient(RecipientType.TO, new InternetAddress(email.getReceiver()));
			// 내용
			mmsg.setText(email.getContent());

			// 발송 처리
			sender.send(mmsg);
			msg = "메일 발송 성공";
			
			/*
			# 회사 인사시스템에서 아이디 생성/임시비번 생성/메일 발송/인사기본 데이터저장
			1. 인사담당자 : 메일 : [	] 이름 : [	  ][클릭]
			2. 요청값을 받아서
				1) 회사사번생성 (DB sequence + 부서코드 + 회사코드 + 입사일 조합)
				2) 임시 비번 생성(숫자 + 알파벳 char 랜덤으로 자리수로 생성)
				3) 입력한 메일주소와 함께 DB(회사인사테이블)에 등록
				4) 메일 주소로 사번/비번을 타이틀과 내용을 발송 처리
			3. 메일을 받은사원은 생성된 사번과 임시 비번으로 로그인 하여, 개인 정보를 추가 등록처리한다.
			
			# 아이디와 비번을 잊었을때
			1. 등록한 메일 주소를 입력하세요. [		]
			2. 해당 메일 주소로 아이디와 비번을 메일로 발송 처리
			*/
			
		} catch (MessagingException e) {
			System.out.println("메시지 전송에러 발송 : " + e.getMessage());
			msg = "메일 발송 에러 발생 : " + e.getMessage();
		} catch (Exception e) {
			System.out.println("기타 에러 : " + e.getMessage());
			msg = "기타 에러 발생 : " + e.getMessage();
		}
		
		return msg;
	}

}
