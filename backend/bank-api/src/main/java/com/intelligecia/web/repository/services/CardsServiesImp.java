/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.intelligecia.web.repository.services;

import com.intelligecia.web.models.Cards;
import com.intelligecia.web.repository.CardsRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

/**
 *
 * @author intelligencia
 */
@Service
@AllArgsConstructor
public class CardsServiesImp implements CardsServices{
     private final CardsRepository cardsrepo;
    @Override
    public Cards saveCard(Cards card) {
        return cardsrepo.save(card);
    }

    @Override
    public Cards getCard(String number) {
       return cardsrepo.findByNumber(number);
    }

    @Override
    public Cards editCard(Integer id,Cards card) {
   
        return cardsrepo.findById(id)
                .map(p->{
                    p.setBalance(card.getBalance());
                    p.setCvv(card.getCvv());
                    p.setDate(card.getDate());
                    p.setName(card.getName());
                    p.setNumber(card.getNumber());
                    return cardsrepo.save(p);

                }).orElseThrow(() -> new RuntimeException("Card not fund"));
        
    }
    
}
