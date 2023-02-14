/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.intelligecia.web.models;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author intelligencia
 */
@Entity
@Table(name = "users", catalog = "intelli1_api", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Users.findAll", query = "SELECT u FROM Users u"),
    @NamedQuery(name = "Users.findById", query = "SELECT u FROM Users u WHERE u.id = :id"),
    @NamedQuery(name = "Users.findByFirstname", query = "SELECT u FROM Users u WHERE u.firstname = :firstname"),
    @NamedQuery(name = "Users.findByLastname", query = "SELECT u FROM Users u WHERE u.lastname = :lastname"),
    @NamedQuery(name = "Users.findByEmail", query = "SELECT u FROM Users u WHERE u.email = :email"),
    @NamedQuery(name = "Users.findByPassword", query = "SELECT u FROM Users u WHERE u.password = :password"),
    @NamedQuery(name = "Users.findByRole", query = "SELECT u FROM Users u WHERE u.role = :role")})
public class Users  {

    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id", nullable = false)
    private Integer id;
    @Basic(optional = false)
    @Column(name = "firstname", nullable = false, length = 255)
    private String firstname;
    @Basic(optional = false)
    @Column(name = "lastname", nullable = false, length = 255)
    private String lastname;
    @Basic(optional = false)
    @Column(name = "email", nullable = false, length = 255)
    private String email;
    @Basic(optional = false)
    @Column(name = "password", nullable = false, length = 255)
    private String password;
    @Basic(optional = false)
    @Column(name = "role", nullable = false, length = 255)
    private String role;
    @Basic(optional = false)
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idUser")
    private Collection<CheckoutCards> checkoutCardsCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idUser")
    private Collection<CheckoutCheque> checkoutChequeCollection;

    public Users() {
    }

    public Users(Integer id) {
        this.id = id;
    }

    public Users(Integer id, String firstname, String lastname, String email, String password, String role, String fistname) {
        this.id = id;
        this.firstname = firstname;
        this.lastname = lastname;
        this.email = email;
        this.password = password;
        this.role = role;
        
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }



    @XmlTransient
    public Collection<CheckoutCards> getCheckoutCardsCollection() {
        return checkoutCardsCollection;
    }

    public void setCheckoutCardsCollection(Collection<CheckoutCards> checkoutCardsCollection) {
        this.checkoutCardsCollection = checkoutCardsCollection;
    }

    @XmlTransient
    public Collection<CheckoutCheque> getCheckoutChequeCollection() {
        return checkoutChequeCollection;
    }

    public void setCheckoutChequeCollection(Collection<CheckoutCheque> checkoutChequeCollection) {
        this.checkoutChequeCollection = checkoutChequeCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Users)) {
            return false;
        }
        Users other = (Users) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.intelligecia.web.models.Users[ id=" + id + " ]";
    }
    
}
