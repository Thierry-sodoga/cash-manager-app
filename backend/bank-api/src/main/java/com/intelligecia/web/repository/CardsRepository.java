/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.intelligecia.web.repository;

import com.intelligecia.web.models.Cards;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 *
 * @author intelligencia
 */
public interface CardsRepository extends JpaRepository<Cards, Integer> {
    Cards findByNumber(String number);
}
