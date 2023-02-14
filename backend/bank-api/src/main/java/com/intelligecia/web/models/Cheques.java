/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.intelligecia.web.models;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author intelligencia
 */
@Entity
@Table(name = "cheques", catalog = "intelli1_api", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Cheques.findAll", query = "SELECT c FROM Cheques c"),
    @NamedQuery(name = "Cheques.findById", query = "SELECT c FROM Cheques c WHERE c.id = :id"),
    @NamedQuery(name = "Cheques.findByOwner", query = "SELECT c FROM Cheques c WHERE c.owner = :owner"),
    @NamedQuery(name = "Cheques.findByBeneficiary", query = "SELECT c FROM Cheques c WHERE c.beneficiary = :beneficiary"),
    @NamedQuery(name = "Cheques.findByAmount", query = "SELECT c FROM Cheques c WHERE c.amount = :amount"),
    @NamedQuery(name = "Cheques.findByState", query = "SELECT c FROM Cheques c WHERE c.state = :state"),
    @NamedQuery(name = "Cheques.findByDate", query = "SELECT c FROM Cheques c WHERE c.date = :date")})
public class Cheques implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id", nullable = false)
    private Integer id;
    @Basic(optional = false)
    @Column(name = "owner", nullable = false, length = 255)
    private String owner;
    @Basic(optional = false)
    @Column(name = "beneficiary", nullable = false, length = 255)
    private String beneficiary;
    @Basic(optional = false)
    @Column(name = "amount", nullable = false)
    private int amount;
    @Basic(optional = false)
    @Column(name = "state", nullable = false)
    private boolean state;
    @Basic(optional = false)
    @Column(name = "date", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date date;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idCheque")
    private Collection<CheckoutCheque> checkoutChequeCollection;

    public Cheques() {
    }

    public Cheques(Integer id) {
        this.id = id;
    }

    public Cheques(Integer id, String owner, String beneficiary, int amount, boolean state, Date date) {
        this.id = id;
        this.owner = owner;
        this.beneficiary = beneficiary;
        this.amount = amount;
        this.state = state;
        this.date = date;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOwner() {
        return owner;
    }

    public void setOwner(String owner) {
        this.owner = owner;
    }

    public String getBeneficiary() {
        return beneficiary;
    }

    public void setBeneficiary(String beneficiary) {
        this.beneficiary = beneficiary;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public boolean getState() {
        return state;
    }

    public void setState(boolean state) {
        this.state = state;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
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
        if (!(object instanceof Cheques)) {
            return false;
        }
        Cheques other = (Cheques) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.intelligecia.web.models.Cheques[ id=" + id + " ]";
    }
    
}
