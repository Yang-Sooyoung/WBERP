package com.wberp.ibk.batch.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.wberp.ibk.batch.service.IAnulProdService;

@Component
public class AnulProdComponent {
	
	@Autowired
	public IAnulProdService iAnulService;
	
	@Scheduled(cron = "0 0 0 1 1 ?")
	public void anulTest() {
		System.out.println("연차생성완료");
		try {
			iAnulService.anulTest();
		} catch (Throwable e) {
			e.printStackTrace();
		}
	}
}
