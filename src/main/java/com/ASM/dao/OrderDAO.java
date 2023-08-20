package com.ASM.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ASM.entity.Order;

public interface OrderDAO extends JpaRepository<Order, Long> {

}
