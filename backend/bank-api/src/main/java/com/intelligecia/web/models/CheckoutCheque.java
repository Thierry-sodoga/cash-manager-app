/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.intelligecia.web.models;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author intelligencia
 */
@Entity
@Table(name = "checkoutCheque", catalog = "intelli1_api", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "CheckoutCheque.findAll", query = "SELECT c FROM CheckoutCheque c"),
    @NamedQuery(name = "CheckoutCheque.findById", query = "SELECT c FROM CheckoutCheque c WHERE c.id = :id"),
    @NamedQuery(name = "CheckoutCheque.findByDate", query = "SELECT c FROM CheckoutCheque c WHERE c.date = :date"),
    @NamedQuery(name = "CheckoutCheque.findByState", query = "SELECT c FROM CheckoutCheque c WHERE c.state = :state")})
public class CheckoutCheque implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id", nullable = false)
    private Integer id;
    @Basic(optional = false)
    @Column(name = "date", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date date;
    @Basic(optional = false)
    @Column(name = "state", nullable = false)
    private boolean state;
    @JoinColumn(name = "idUser", referencedColumnName = "id", nullable = false)
    @ManyToOne(optional = false)
    private Users idUser;
    @JoinColumn(name = "idCheque", referencedColumnName = "id", nullable = false)
    @ManyToOne(optional = false)
    private Cheques idCheque;
    @JoinColumn(name = "idArticles", referencedColumnName = "id", nullable = false)
    @ManyToOne(optional = false)
    private Articles idArticles;

    public CheckoutCheque() {
    }

    public CheckoutCheque(Integer id) {
        this.id = id;
    }

    public CheckoutCheque(Integer id, Date date, boolean state) {
        this.id = id;
        this.date = date;
        this.state = state;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public boolean getState() {
        return state;
    }

    public void setState(boolean state) {
        this.state = state;
    }

    public Users getIdUser() {
        return idUser;
    }

    public void setIdUser(Users idUser) {
        this.idUser = idUser;
    }

    public Cheques getIdCheque() {
        return idCheque;
    }

    public void setIdCheque(Cheques idCheque) {
        this.idCheque = idCheque;
    }

    public Articles getIdArticles() {
        return idArticles;
    }

    public void setIdArticles(Articles idArticles) {
        this.idArticles = idArticles;
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
        if (!(object instanceof CheckoutCheque)) {
            return false;
        }
        CheckoutCheque other = (CheckoutCheque) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.intelligecia.web.models.CheckoutCheque[ id=" + id + " ]";
    }
    
}
