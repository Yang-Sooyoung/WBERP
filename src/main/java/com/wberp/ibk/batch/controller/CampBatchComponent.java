package com.wberp.ibk.batch.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.forwardedUrl;

import java.io.Console;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.commons.collections4.functors.IfClosure;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.wberp.ibk.batch.service.ICampBatchService;

@Component
public class CampBatchComponent {

	@Autowired
	public ICampBatchService iCampBatchService;
	// 초 분 시 일 월 요일
		// * - 모든
		// ? - 월, 요일에 사용. 신경안씀이라는 의미
		// 월은 1 - 12
		// 요일은 1(일) - 7(토). ,(컴마)로 복수지정가능. 예)월수금 - 2,4,6
		// 숫자1/숫자2의 경우 숫자1에서 시작하여 매 숫자2마다 실행. 예) 분에 0/5이면 0분부터 5분마다 실행
		// 일에서 L은 달의 마지막날. W는 지정일자가 휴일(토, 일)이면 인접한 평일에 수행.
		// 예) 25W인경우 25일이 일요일이면 26일 월요일 실행.
		// LW는 마지막 평일
		// 요일에서 숫자1#숫자2의경우 숫자2번째 주의 숫자1번 요일에 실행.
		// 예) 2#4 - 4번째주 월요일에 실행.
	
	
	/*
	 * 조건1. 현재날짜:발송일 비교 후 같으면 전송(println으로 대체)
	 * 조건2. 전송 후 반응여부,실 반응여부 50%  랜덤값 update 1:yes 0:no
	 * 조건3. 반응여부 yes일 때, 실반응여부 0or1 50%
	 * 조건4. 반응여부 no일때 , 실반응여부 1 100% 
	 * 조건5. 정기구분코드를 이용해서 비정기일때는 한번만 보내는걸로
	 * 조건6. 정기일 시 보낸 후 발송일 +7 업데이트
	 * 조건7. 캠페인번호를 이용하여 해당 캠페인의 상태코드가 4(진행) 일 경우 발송
	 * 조건8. 아침9시 마다 보내는걸로 설정
	 * 
	 * 데이터
	 * 기타1 : 캠페인번호
	 * 기타2:  해당 캠페인 상태코드
	 * */
	
	/* 발송기에 데이터 삽입시
	 * 1. 진행으로 변경시 발송 작동
	 * 2. 캠페인정보에 해당하는 고객 가져와서 발송기에 데이터 삽입
	 * 3. 발송된 데이터 삭제하면 안됨(시뮬레이션떄문에)
	 * 4. 상태코드를 확인 후 
	 */
			@Scheduled(cron = "0 0 9 * * *")
		public void CampSend() throws Throwable{
				//현재상태: 발송날짜만 적용함, 위의 조건들 일부적용
				//반응했을 시 반응값 유지 구현 필요
				try {
					//현재 날짜 가져오기 
					SimpleDateFormat format1 = new SimpleDateFormat ( "yy-MM-dd");
					Date time = new Date();
					String time1 = format1.format(time);
					//현재날짜에 해당하는 데이터 불러오기
					List<HashMap<String, String>> list = iCampBatchService.getKaKao(time1);
					List<HashMap<String, String>> list2 = iCampBatchService.getEmail(time1);
					List<HashMap<String, String>> list3 = iCampBatchService.getMsg(time1);
					
					//카카오 발송 및 업데이트
					for(int i = 0 ; i < list.size();i++) {
						String tempNo = String.valueOf(list.get(i).get("KAKAO_SEND_NO")); //불러온 데이터의 발송번호 확인
						HashMap<String, String> updatekakao = new HashMap<String, String>();
						updatekakao.put("tempNo", tempNo);
						int rand1 = (int)(Math.random()*2);	//1이면 반응값 yes 0이면 no
						int rand2 = (int)(Math.random()*2);	//반응값 1일때  rnad2가1이면 실반응값 yes 0이면 no
						System.out.println(list.get(i));
						if(rand1 == 1) {
							updatekakao.put("rectVAL","1");
							if(rand2 == 1) {
								updatekakao.put("real_rectVAL","1");
							} else {
								updatekakao.put("real_rectVAL","0");
							}
						} else {
							updatekakao.put("rectVAL","0");
							updatekakao.put("real_rectVAL","0");
						}
						System.out.println("카카오 발송 : "+ list.get(i));
						iCampBatchService.updateKakao(updatekakao);
					}
					
					//이메일 발송 및 업데이트
					for(int i = 0 ; i < list2.size();i++) {
						String tempNo = String.valueOf(list2.get(i).get("EMAIL_SEND_NO")); //불러온 데이터의 발송번호 확인
						HashMap<String, String> updateEmail = new HashMap<String, String>();
						updateEmail.put("tempNo", tempNo);
						
						int rand1 = (int)(Math.random()*2);	//0이면 반응값 yes 1이면 no
						int rand2 = (int)(Math.random()*2);	//반응값 0일때  rnad2가 0이면 실반응값 yes 1이면 no
						System.out.println(rand1);
						System.out.println(rand2);
						if(rand1 == 1) {
							updateEmail.put("rectVAL","1");
							if(rand2 == 1) {
								updateEmail.put("real_rectVAL","1");
							} else {
								updateEmail.put("real_rectVAL","0");
							}
						} else {
							updateEmail.put("rectVAL","0");
							updateEmail.put("real_rectVAL","0");
						}
						System.out.println("이메일 발송 : "+ list.get(i));
						iCampBatchService.updateEmail(updateEmail);
						
					}
					
					//문자 발송 및 업데이트
					for(int i = 0 ; i < list3.size();i++) {
						String tempNo = String.valueOf(list3.get(i).get("MSG_SEND_NO")); //불러온 데이터의 발송번호 확인
						HashMap<String, String> updateMsg = new HashMap<String, String>();
						updateMsg.put("tempNo", tempNo);
						
						int rand1 = (int)(Math.random()*2);	//0이면 반응값 yes 1이면 no
						int rand2 = (int)(Math.random()*2);	//반응값 0일때  rnad2가 0이면 실반응값 yes 1이면 no
						System.out.println(rand1);
						System.out.println(rand2);
						if(rand1 == 1) {
							updateMsg.put("rectVAL","1");
							if(rand2 == 1) {
								updateMsg.put("real_rectVAL","1");
							} else {
								updateMsg.put("real_rectVAL","0");
							}
						} else {
							updateMsg.put("rectVAL","0");
							updateMsg.put("real_rectVAL","0");
						}
						System.out.println("메세지 발송 : "+ list.get(i));
						iCampBatchService.updateMsg(updateMsg);
					}//포문종료시점
				
				} catch (Exception e) {
					e.printStackTrace();
				}
		}
			
			//캠페인 진행 및 종료 배치 0시 0분 0초에 변경(날이 지났을때)
		@Scheduled(cron = "0 0 0 * * *")
		public void CampStart() throws Throwable{
			SimpleDateFormat format1 = new SimpleDateFormat ( "yy-MM-dd");
			Date time = new Date();
			String time1 = format1.format(time);
			List<HashMap<String,String>> list = iCampBatchService.getCamp(time1);
			/* 상태코드
			 * 0 : 요청
			 * 1: 종료
			 * 2: 거부
			 * 3: 승인
			 * 4: 진행
			 * 5: 작성중
			 */
			for(int i = 0 ; i<list.size();i++) {
				//오늘날짜와 시작날짜 비교 및 승인상태일때 진행으로 변경
				if(time1.equals(list.get(i).get("START_PERD"))	&& String.valueOf(list.get(i).get("STAT_CODE")).equals("3")) { 
					HashMap<String, String> hashp = new HashMap<String, String>();
					System.out.println(String.valueOf(list.get(i).get("CAMP_NO")) + " 진행 변경됨 ");
					hashp.put("campno",String.valueOf(list.get(i).get("CAMP_NO")));
					hashp.put("statno","4");
					iCampBatchService.updateStat(hashp);
				}
				//오늘날짜와 종료날짜 비교 및 진행상태일때 종료상태로 변경
				if(time1.equals(list.get(i).get("END_PERD")) && String.valueOf(list.get(i).get("STAT_CODE")).equals("4")) {
					HashMap<String, String> hashp = new HashMap<String, String>();
					System.out.println(String.valueOf(list.get(i).get("CAMP_NO")) + " 종료 변경됨 ");
					hashp.put("campno",String.valueOf(list.get(i).get("CAMP_NO")));
					hashp.put("statno","1");
					hashp.put("table1","KAKAO_SEND");
					iCampBatchService.updateStat(hashp);
					iCampBatchService.finishSend(hashp);
					hashp.put("table1","MSG_SEND");
					iCampBatchService.finishSend(hashp);
					hashp.put("table1","EMAIL_SEND");
					iCampBatchService.finishSend(hashp);
				}
			}
		}
}
