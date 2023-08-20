package com.ASM.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ASM.dao.OrderDetailDAO;
import com.ASM.entity.OrderDetail;

@Service
public class OrderDetailService {
	@Autowired
	OrderDetailDAO dao;
	
	public void create(OrderDetail detail) {
		dao.save(detail);
	}
}
