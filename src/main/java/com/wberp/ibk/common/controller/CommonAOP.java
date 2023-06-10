package com.wberp.ibk.common.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.wberp.ibk.exception.NotAllowException;
import com.wberp.ibk.web.common.service.ICommonService;

@Aspect
public class CommonAOP {
	@Autowired
	public ICommonService iCommonService;
	
	//Pointcut -> 적용범위
	//@Pointcut(범위설정)
	/*
	 * 범위
	 * execution -> include필터
	 * !execution -> exclude필터
	 * * -> 모든것
	 * *(..) -> 모든 메소드
	 * .. -> 모든 경로
	 * && -> 필터 추가
	 */
	@Pointcut("execution(* com.wberp.ibk..*Controller.*(..))"
			+ "&&!execution(* com.wberp.ibk..*Controller.notAllow(..))"
			+ "&&!execution(* com.wberp.ibk..*Controller.*login*(..))"
			+ "&&!execution(* com.wberp.ibk..*Controller.header(..))"
			+ "&&!execution(* com.wberp.ibk..*Controller.bottom(..))"
			+ "&&!execution(* com.wberp.ibk..*Controller.topLeft(..))"
			+ "&&!execution(* com.wberp.ibk..*Controller.*Login*(..))"
			+ "&&!execution(* com.wberp.ibk..*Controller.*logout*(..))"
			+ "&&!execution(* com.wberp.ibk..*Controller.*Upload(..))"
			+ "&&!execution(* com.wberp.ibk..*Controller.*Ajax(..))")
	public void testAOP() {}
	
	//ProceedingJoinPoint -> 대상 적용 이벤트 필터
	/*
	 * @Before -> 메소드 실행 전
	 * @After -> 메소드 실행 후
	 * @After-returning -> 메소드 정상실행 후
	 * @After-throwing -> 메소드 예외 발생 후
	 * @Around -> 모든 동작시점
	 */
	@Around("testAOP()")
	public ModelAndView testAOP(ProceedingJoinPoint joinPoint)
														throws Throwable {
		ModelAndView mav = new ModelAndView();
		
		//Request 객체 취득
		HttpServletRequest request
		= ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		HttpSession session = request.getSession();
		
		
		if(session.getAttribute("sEmpNo") != null) {
			try {
				String athrTypeNo = iCommonService.menuAthrCheck(String.valueOf(session.getAttribute("sAthrNo")), 
						String.valueOf(request.getParameter("menuNo")));
				
				if(athrTypeNo == null || athrTypeNo.equals("0")) {
					mav.setViewName("redirect:notAllow");
				} else {
					mav = (ModelAndView) joinPoint.proceed(); //기존 이벤트 처리 행위를 이어서 진행
				}
			} catch (Exception e) {
				e.printStackTrace();
				mav.setViewName("redirect:notAllow");
			}
		} else {
			mav.setViewName("redirect:login");
		}
		
		return mav;
	}
}













