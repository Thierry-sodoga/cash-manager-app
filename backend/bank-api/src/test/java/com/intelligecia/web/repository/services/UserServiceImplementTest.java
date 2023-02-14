/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit5TestClass.java to edit this template
 */
package com.intelligecia.web.repository.services;

import com.intelligecia.web.models.Users;
import java.util.Optional;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

/**
 *
 * @author intelligencia
 */
@SpringBootTest
public class UserServiceImplementTest {

    @Autowired
    private UserService userservices;

    public UserServiceImplementTest() {
    }

    @BeforeAll
    public static void setUpClass() {
    }

    @AfterAll
    public static void tearDownClass() {
    }

    @BeforeEach
    public void setUp() {
    }

    @AfterEach
    public void tearDown() {
    }

    /**
     * Test of register method, of class UserServiceImplement.
     */
    @Test
    public void testRegister() {
        System.out.println("register test ");

        Users user = new Users();
        user.setFirstname("Lewis-es");
        user.setLastname("GBOYOU");
        user.setRole("Client");
        user.setPassword("monmotdepasse");
        user.setEmail("gglewis94@gmail.com");

        Users getUser = userservices.register(user);

         if(getUser!=null){

        assertEquals(user.getLastname(), getUser.getLastname(), " Lastname ok");
        assertEquals(user.getFirstname(), getUser.getFirstname(), "Firstname ok");
        assertEquals(user.getEmail(), getUser.getEmail(), " E-mail ok");
        assertEquals(user.getRole(), getUser.getRole(), " Role ok");
        
         }

    }
    
    
    
    /**
     * Test of login method, of class UserServiceImplement.
     */
    @Test
    public void testLogin() {
   
        
        System.out.println("Login test ");
        Integer id = userservices.login("gglewis94@gmail.com", "lewsi001");
         assertEquals(id, 4," testLogin ok");


    }
      @Test
    public void testLoginFailled() {
        
         System.out.println("Login test ");
        Integer id = userservices.login("lewisguillaumelewis.com", "2e?5678");
        assertEquals(id, 0," testLoginFailled ok");

     

    }

    /**
     * Test of findAll method, of class UserServiceImplement.
     */
 

    /**
     * Test of existe method, of class UserServiceImplement.
     */
    @Test
    public void testExiste() {
       Optional<Users> user = userservices.findUser(3);
        String  email  =  user.get().getEmail();
       Boolean stat = userservices.existe(email);
        
       assertEquals(stat, true, "Exist  ok ");
        
    }
    
    
    
     @Test
    public void testExiste_deux() {
      
        boolean stat = userservices.existe("gglewis94@gmail.com");
        
        assertEquals(stat, true, "Exist  ok ");
        
    }
    
    
     @Test
    public void testNotExiste() {
      
        Boolean stat = userservices.existe("notexiteindata@bj.com");
        
        assertEquals(stat, false, "Not exist  ok ");
        
    }

    /**
     * Test of update method, of class UserServiceImplement.
     */
    @Test
    public void testUpdate() {
        System.out.println("update");

    }

   

  


 
  

}
