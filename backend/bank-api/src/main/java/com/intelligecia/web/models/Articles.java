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
@Table(name = "articles", catalog = "intelli1_api", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Articles.findAll", query = "SELECT a FROM Articles a"),
    @NamedQuery(name = "Articles.findById", query = "SELECT a FROM Articles a WHERE a.id = :id"),
    @NamedQuery(name = "Articles.findByName", query = "SELECT a FROM Articles a WHERE a.name = :name"),
    @NamedQuery(name = "Articles.findByPrix", query = "SELECT a FROM Articles a WHERE a.prix = :prix"),
    @NamedQuery(name = "Articles.findByCategorie", query = "SELECT a FROM Articles a WHERE a.categorie = :categorie")})
public class Articles implements Serializable {

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
    @Column(name = "prix", nullable = false)
    private int prix;
    @Basic(optional = false)
    @Column(name = "categorie", nullable = false, length = 255)
    private String categorie;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idArticles")
    private Collection<CheckoutCards> checkoutCardsCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idArticles")
    private Collection<CheckoutCheque> checkoutChequeCollection;

    public Articles() {
    }

    public Articles(Integer id) {
        this.id = id;
    }

    public Articles(Integer id, String name, int prix, String categorie) {
        this.id = id;
        this.name = name;
        this.prix = prix;
        this.categorie = categorie;
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

    public int getPrix() {
        return prix;
    }

    public void setPrix(int prix) {
        this.prix = prix;
    }

    public String getCategorie() {
        return categorie;
    }

    public void setCategorie(String categorie) {
        this.categorie = categorie;
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
        if (!(object instanceof Articles)) {
            return false;
        }
        Articles other = (Articles) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.intelligecia.web.models.Articles[ id=" + id + " ]";
    }
    
}
