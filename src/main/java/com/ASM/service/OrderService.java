package com.ASM.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ASM.dao.OrderDAO;
import com.ASM.entity.Order;

@Service
public class OrderService {
	@Autowired
	OrderDAO dao;

	public void create(Order order) {
		dao.save(order);
	}

	public Order findById(Long id) {
		return dao.findById(id).get();
	}
}
