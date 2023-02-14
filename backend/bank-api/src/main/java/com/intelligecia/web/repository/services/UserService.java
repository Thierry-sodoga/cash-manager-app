/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.intelligecia.web.repository.services;

import com.intelligecia.web.models.Articles;
import com.intelligecia.web.models.Cards;
import com.intelligecia.web.models.Cheques;
import com.intelligecia.web.models.Users;

import java.util.List;
import java.util.Optional;

/**
 *
 * @author intelligencia
 */
public interface UserService {

    Users register(Users users);

    List<Users> findAll();

    Optional<Users> findUser(Integer id);

    Boolean existe(String email);

    Users update(Integer id, Users users);

 

    Boolean checkoutCard(Articles article, Cards card, Integer idUser);

    Boolean checkoutCheques(Articles article, Cheques cheque, Integer idUser);

    Integer login(String email, String Password);

}
