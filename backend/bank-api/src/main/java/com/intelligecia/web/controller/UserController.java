/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.intelligecia.web.controller;

import com.intelligecia.web.models.Articles;
import com.intelligecia.web.models.Cards;
import com.intelligecia.web.models.CheckoutCards;
import com.intelligecia.web.models.Users;
import com.intelligecia.web.repository.services.ArticlesServices;
import com.intelligecia.web.repository.services.CardsServices;
import com.intelligecia.web.repository.services.CheckoutCardsServices;
import java.util.List;
import java.util.Optional;
import lombok.AllArgsConstructor;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.intelligecia.web.repository.services.UserService;

/**
 *
 * @author intelligencia
 */
@RestController
@RequestMapping("/users")
@AllArgsConstructor
public class UserController {
    
    private final UserService userservices;
    private final CardsServices cardsService;
    private final ArticlesServices articlesService;
    private final CheckoutCardsServices checkoutcardsservices;
 
    
    @PostMapping("/register")
    public Users register(@RequestBody Users users){
        
        return userservices.register(users);
    }
    
    @PostMapping("/update")
    public Users update(@RequestBody Users users){
        return userservices.update(users.getId(), users);
    }
    
    @GetMapping("/{id}")
    public Optional<Users> allUsers(@PathVariable Integer id) {
        return userservices.findUser(id);
        
    }
    
     @GetMapping("exist/{email}")
    public Boolean exist(@PathVariable String email) {
        return userservices.existe(email);
        
    }
    
    @GetMapping("/allusers")
    public List<Users> getallUsers() {
        return userservices.findAll();
        
    }
    
   
    
    @PostMapping("/login")
    public Integer login(@RequestBody Users user) {
        return userservices.login(user.getEmail(), user.getPassword());
    }
    
    
    @PostMapping("/savecard")
    public Cards savecard(@RequestBody Cards card) {
        return cardsService.saveCard(card);
    }
    
    
     @GetMapping("/getcard/{number}")
    public Cards getCard(@PathVariable String number) {
        return cardsService.getCard(number);
        
    }
    
      
        @PostMapping("/updatecard")
    public Cards update(@RequestBody Cards card){
        return cardsService.editCard(card.getId(),card);
    }
    
    @PostMapping("/savearticle")
    public Articles savearticle (@RequestBody Articles articles) {
        return articlesService.saveArticles(articles);
    }
    
    @PostMapping("/checkoutcard")
    public CheckoutCards checkoutcard(@RequestBody CheckoutCards checkoutcard) {
        return checkoutcardsservices.saveCheckoutCards(checkoutcard);
    }
    

    
}
