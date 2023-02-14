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
import javax.persistence.UniqueConstraint;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author intelligencia
 */
@Entity
@Table(name = "cards", catalog = "intelli1_api", schema = "", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"number"})})
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Cards.findAll", query = "SELECT c FROM Cards c"),
    @NamedQuery(name = "Cards.findById", query = "SELECT c FROM Cards c WHERE c.id = :id"),
    @NamedQuery(name = "Cards.findByName", query = "SELECT c FROM Cards c WHERE c.name = :name"),
    @NamedQuery(name = "Cards.findByNumber", query = "SELECT c FROM Cards c WHERE c.number = :number"),
    @NamedQuery(name = "Cards.findByDate", query = "SELECT c FROM Cards c WHERE c.date = :date"),
    @NamedQuery(name = "Cards.findByCvv", query = "SELECT c FROM Cards c WHERE c.cvv = :cvv"),
    @NamedQuery(name = "Cards.findByBalance", query = "SELECT c FROM Cards c WHERE c.balance = :balance")})
public class Cards implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id", nullable = false)
    private Integer id;
    @Basic(optional = false)
    @Column(name = "name", nullable = false, length = 255)
    private String name;
    @Basic(optional = false)
    @Column(name = "number", nullable = false, length = 255)
    private String number;
    @Basic(optional = false)
    @Column(name = "date", nullable = false, length = 255)
    private String date;
    @Basic(optional = false)
    @Column(name = "cvv", nullable = false)
    private int cvv;
    @Basic(optional = false)
    @Column(name = "balance", nullable = false)
    private int balance;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idCard")
    private Collection<CheckoutCards> checkoutCardsCollection;

    public Cards() {
    }

    public Cards(Integer id) {
        this.id = id;
    }

    public Cards(Integer id, String name, String number, String date, int cvv, int balance) {
        this.id = id;
        this.name = name;
        this.number = number;
        this.date = date;
        this.cvv = cvv;
        this.balance = balance;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getCvv() {
        return cvv;
    }

    public void setCvv(int cvv) {
        this.cvv = cvv;
    }

    public int getBalance() {
        return balance;
    }

    public void setBalance(int balance) {
        this.balance = balance;
    }

    @XmlTransient
    public Collection<CheckoutCards> getCheckoutCardsCollection() {
        return checkoutCardsCollection;
    }

    public void setCheckoutCardsCollection(Collection<CheckoutCards> checkoutCardsCollection) {
        this.checkoutCardsCollection = checkoutCardsCollection;
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
        if (!(object instanceof Cards)) {
            return false;
        }
        Cards other = (Cards) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.intelligecia.web.models.Cards[ id=" + id + " ]";
    }
    
}
