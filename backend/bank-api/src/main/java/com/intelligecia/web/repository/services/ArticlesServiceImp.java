/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.intelligecia.web.repository.services;

import com.intelligecia.web.models.Articles;
import com.intelligecia.web.repository.ArticlesRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

/**
 *
 * @author intelligencia
 */

@Service
@AllArgsConstructor
public class ArticlesServiceImp  implements  ArticlesServices{
    private final ArticlesRepository articleRepo;
    @Override
    public Articles saveArticles(Articles articles) {
        
        return articleRepo.save(articles);
       
    }
      
      
}
