/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.intelligecia.web.repository.services;

import com.intelligecia.web.models.Articles;
import com.intelligecia.web.models.Cards;
import com.intelligecia.web.models.Cheques;
import com.intelligecia.web.models.Users;
import java.util.List;
import java.util.Optional;
import lombok.AllArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import com.intelligecia.web.repository.UserRepository;

/**
 *
 * @author intelligencia
 */
@Service
@AllArgsConstructor
public class UserServiceImplement implements UserService {

    private final UserRepository userrepository;

    
      @Override
    public Boolean existe(String email) {
       Users user = userrepository.findByEmail(email);
        if (user!=null) {
          return true;  
        }
        return false;
    }
    
    
    @Override
    public Users register(Users users){
        if (!existe(users.getEmail())) {
             users.setPassword(bCryptPasswordEncoder().encode(users.getPassword()));
        return userrepository.save(users);
        }else{
         users= null;
         return users;
        
        }
       
    }

    @Override

    public List<Users> findAll() {
        return userrepository.findAll();
    }

  

    
    @Override
    public Users update(Integer id, Users users){
        return userrepository.findById(id)
                .map(p -> {
                    p.setFirstname(users.getFirstname());
                    p.setLastname(users.getLastname());
                    p.setRole(users.getRole());
                    p.setPassword(bCryptPasswordEncoder().encode(users.getRole()));

                    return userrepository.save(p);

                }).orElseThrow(() -> new RuntimeException("User not fund"));
    }



    @Override
    public Boolean checkoutCard(Articles article, Cards card, Integer idUser) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Boolean checkoutCheques(Articles article, Cheques cheque, Integer idUser) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Integer login(String email, String Password) {
        Integer pass = 0;
        Users user = userrepository.findByEmail(email);

        if (user != null) {
            if (bCryptPasswordEncoder().matches(Password, user.getPassword())) {
                pass = user.getId();
            }
        }
        return pass;
    }

    @Override
    public Optional<Users> findUser(Integer id) {
        return userrepository.findById(id);

    }

    public BCryptPasswordEncoder bCryptPasswordEncoder() {
        return new BCryptPasswordEncoder();
    }

}
