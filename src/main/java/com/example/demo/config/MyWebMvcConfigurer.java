package com.example.demo.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.example.demo.interceptor.BeforActionInterceptor;
import com.example.demo.interceptor.NeedLoginInterceptor;
import com.example.demo.interceptor.NeedLogoutInterceptor;

@Configuration
public class MyWebMvcConfigurer implements WebMvcConfigurer {

	private BeforActionInterceptor beforeActionInterceptor;
	private NeedLoginInterceptor needLoginInterceptor;
	private NeedLogoutInterceptor needLogoutInterceptor;

	public MyWebMvcConfigurer(BeforActionInterceptor beforeActionInterceptor, NeedLoginInterceptor needLoginInterceptor,
			NeedLogoutInterceptor needLogoutInterceptor) {
		this.beforeActionInterceptor = beforeActionInterceptor;
		this.needLoginInterceptor = needLoginInterceptor;
		this.needLogoutInterceptor = needLogoutInterceptor;
	}

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		InterceptorRegistration ir;
		ir = registry.addInterceptor(beforeActionInterceptor);
		ir.addPathPatterns("/**");
		ir.addPathPatterns("/favicon.ico"); //이건 파비콘이니까 일단 보류
		ir.excludePathPatterns("/rosource/**");

		// 로그인이 필요한 곳 -> 엑셀 인터셉터 구분에서 주황색
		ir = registry.addInterceptor(needLoginInterceptor);
		// 유저관련
		ir.addPathPatterns("/usr/article/write"); // 칼럼 쓰기관련
		ir.addPathPatterns("/usr/article/doWrite"); // 칼럼 쓰기관련
		ir.addPathPatterns("/usr/article/modify"); // 칼럼 수정관련
		ir.addPathPatterns("/usr/article/doModify"); // 칼럼 수정관련
		ir.addPathPatterns("/usr/article/doDelete"); // 칼럼 삭제 관련
		ir.addPathPatterns("/usr/member/doLogout"); // 로그아웃
		ir.addPathPatterns("/usr/member/modify"); // 회원정보 수정 관련
		ir.addPathPatterns("/usr/member/doModify"); // 회원정보 수정 관련
		ir.addPathPatterns("/usr/member/withdraw"); // 회원 탈퇴 관련
		ir.addPathPatterns("/usr/member/dowithdraw"); // 회원 탈퇴 관련
		ir.addPathPatterns("/usr/customer/customercenter"); // 1:1 고객상담센터
		ir.addPathPatterns("/usr/discussion/createroom"); // 토론방 생성관련
		ir.addPathPatterns("/usr/discussion/chat"); // 채팅 토론방 생성관련
		ir.addPathPatterns("/usr/discussion/cam"); // 화상 토론방 생성 관련
		//관리자 관련
		ir.addPathPatterns("/admin/main");// 메인페이지
		ir.addPathPatterns("/admin/dologout");// 관리자 로그아웃
		ir.addPathPatterns("/admin/centerList");// 고객상담 리스트로 가는 로직
		ir.addPathPatterns("/admin/customercenter");// 고객상담 답변 양식
		ir.addPathPatterns("/admin/sendCustomerAnswer");// 고객상담 답변 이메일로 보내고 고객상담리스트
		ir.addPathPatterns("/admin/userlist");// 회원조회
		ir.addPathPatterns("/admin/marketing");// 관리자가 회원 강제탈퇴시키는거.
		ir.addPathPatterns("/admin/centerList");// 마케팅데이터가는 로직
		
		
// 댓글과 대댓글은  url이 따로 있는게 아니라 detail내에서 이뤄지므로 필요 없음.		

		// 로그아웃이여야하는곳-> 엑셀 인터셉터 구분에서 초록색
		ir = registry.addInterceptor(needLogoutInterceptor);
		ir.addPathPatterns("/usr/member/join");
		ir.addPathPatterns("/usr/member/doJoin");
		ir.addPathPatterns("/usr/member/login");
		ir.addPathPatterns("/usr/member/doLogin");
		ir.addPathPatterns("/usr/member/findId");
		ir.addPathPatterns("/usr/member/dofindId");
		ir.addPathPatterns("/usr/member/findPw");
		ir.addPathPatterns("/usr/member/dofindPw");
		ir.addPathPatterns("/usr/member/login");
		ir.addPathPatterns("/usr/member/doLogin");
	}

}