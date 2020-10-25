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
@Table(name = "localidade")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Localidade.findAll", query = "SELECT l FROM Localidade l")
    , @NamedQuery(name = "Localidade.findById", query = "SELECT l FROM Localidade l WHERE l.id = :id")
    , @NamedQuery(name = "Localidade.findByCidade", query = "SELECT l FROM Localidade l WHERE l.cidade = :cidade")
    , @NamedQuery(name = "Localidade.findByEndereco", query = "SELECT l FROM Localidade l WHERE l.endereco = :endereco")
    , @NamedQuery(name = "Localidade.findByPais", query = "SELECT l FROM Localidade l WHERE l.pais = :pais")
    , @NamedQuery(name = "Localidade.findByOutros", query = "SELECT l FROM Localidade l WHERE l.outros = :outros")})
public class Localidade implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @Column(name = "cidade")
    private String cidade;
    @Column(name = "endereco")
    private String endereco;
    @Basic(optional = false)
    @Column(name = "pais")
    private String pais;
    @Column(name = "outros")
    private String outros;
    @OneToMany(mappedBy = "localNasc")
    private List<Pessoa> pessoaList;
    @OneToMany(mappedBy = "localObito")
    private List<Pessoa> pessoaList1;

    public Localidade() {
    }

    public Localidade(Integer id) {
        this.id = id;
    }

    public Localidade(Integer id, String cidade, String pais) {
        this.id = id;
        this.cidade = cidade;
        this.pais = pais;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public String getPais() {
        return pais;
    }

    public void setPais(String pais) {
        this.pais = pais;
    }

    public String getOutros() {
        return outros;
    }

    public void setOutros(String outros) {
        this.outros = outros;
    }

    @XmlTransient
    public List<Pessoa> getPessoaList() {
        return pessoaList;
    }

    public void setPessoaList(List<Pessoa> pessoaList) {
        this.pessoaList = pessoaList;
    }

    @XmlTransient
    public List<Pessoa> getPessoaList1() {
        return pessoaList1;
    }

    public void setPessoaList1(List<Pessoa> pessoaList1) {
        this.pessoaList1 = pessoaList1;
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
        if (!(object instanceof Localidade)) {
            return false;
        }
        Localidade other = (Localidade) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Localidade[ id=" + id + " ]";
    }
    
}
