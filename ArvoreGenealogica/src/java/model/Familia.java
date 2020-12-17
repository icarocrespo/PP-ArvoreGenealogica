/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author icaro
 */
@Entity
@Table(name = "familia")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Familia.findAll", query = "SELECT f FROM Familia f")
    , @NamedQuery(name = "Familia.findById", query = "SELECT f FROM Familia f WHERE f.id = :id")
    , @NamedQuery(name = "Familia.findByNome", query = "SELECT f FROM Familia f WHERE f.nome = :nome")
    , @NamedQuery(name = "Familia.findByMembros", query = "SELECT f FROM Familia f WHERE f.membros = :membros")
    , @NamedQuery(name = "Familia.findByHistoria", query = "SELECT f FROM Familia f WHERE f.historia = :historia")
    , @NamedQuery(name = "Familia.findByUriBrasao", query = "SELECT f FROM Familia f WHERE f.uriBrasao = :uriBrasao")})
public class Familia implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @Column(name = "nome")
    private String nome;
    @Column(name = "membros")
    private Integer membros;
    @Column(name = "historia")
    private String historia;
    @Column(name = "uri_brasao")
    private String uriBrasao;

    public Familia() {
    }

    public Familia(Integer id) {
        this.id = id;
    }

    public Familia(Integer id, String nome) {
        this.id = id;
        this.nome = nome;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Integer getMembros() {
        return membros;
    }

    public void setMembros(Integer membros) {
        this.membros = membros;
    }

    public String getHistoria() {
        return historia;
    }

    public void setHistoria(String historia) {
        this.historia = historia;
    }

    public String getUriBrasao() {
        return uriBrasao;
    }

    public void setUriBrasao(String uriBrasao) {
        this.uriBrasao = uriBrasao;
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
        if (!(object instanceof Familia)) {
            return false;
        }
        Familia other = (Familia) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Familia[ id=" + id + " ]";
    }
    
}
