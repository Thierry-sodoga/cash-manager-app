/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.intelligecia.web.repository.services;

import com.intelligecia.web.models.CheckoutCards;
import com.intelligecia.web.repository.CheckoutCardsRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

/**
 *
 * @author intelligencia
 */
@Service
@AllArgsConstructor
public class CheckoutCardsServicesImp implements CheckoutCardsServices{
    
    private final CheckoutCardsRepository checkoutCardRepo;

    @Override
    public CheckoutCards saveCheckoutCards(CheckoutCards checkoutCards){
        return checkoutCardRepo.save(checkoutCards);
}
    
}
