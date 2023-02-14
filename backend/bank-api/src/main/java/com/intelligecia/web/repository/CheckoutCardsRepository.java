/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.intelligecia.web.repository;

import com.intelligecia.web.models.CheckoutCards;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 *
 * @author intelligencia
 */
public interface CheckoutCardsRepository  extends  JpaRepository<CheckoutCards, Integer>{
    
}
