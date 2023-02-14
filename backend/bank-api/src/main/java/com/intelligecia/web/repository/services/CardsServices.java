/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.intelligecia.web.repository.services;

import com.intelligecia.web.models.Cards;

/**
 *
 * @author intelligencia
 */
public interface CardsServices {
    
    Cards saveCard(Cards card);
    
    Cards getCard(String number);
    
    Cards editCard(Integer id, Cards card);
    
    
}
