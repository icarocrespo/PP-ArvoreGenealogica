/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
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
 * @author icaro
 */
@Entity
@Table(name = "escolaridade")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Escolaridade.findAll", query = "SELECT e FROM Escolaridade e")
    , @NamedQuery(name = "Escolaridade.findById", query = "SELECT e FROM Escolaridade e WHERE e.id = :id")
    , @NamedQuery(name = "Escolaridade.findByGrau", query = "SELECT e FROM Escolaridade e WHERE e.grau = :grau")})
public class Escolaridade implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @Column(name = "grau")
    private String grau;
    @OneToMany(mappedBy = "escolaridade")
    private List<Pessoa> pessoaList;

    public Escolaridade() {
    }

    public Escolaridade(Integer id) {
        this.id = id;
    }

    public Escolaridade(Integer id, String grau) {
        this.id = id;
        this.grau = grau;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getGrau() {
        return grau;
    }

    public void setGrau(String grau) {
        this.grau = grau;
    }

    @XmlTransient
    public List<Pessoa> getPessoaList() {
        return pessoaList;
    }

    public void setPessoaList(List<Pessoa> pessoaList) {
        this.pessoaList = pessoaList;
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
        if (!(object instanceof Escolaridade)) {
            return false;
        }
        Escolaridade other = (Escolaridade) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Escolaridade[ id=" + id + " ]";
    }
    
}
