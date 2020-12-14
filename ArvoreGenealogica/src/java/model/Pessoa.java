/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
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
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author icaro
 */
@Entity
@Table(name = "pessoa")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Pessoa.findAll", query = "SELECT p FROM Pessoa p")
    , @NamedQuery(name = "Pessoa.findById", query = "SELECT p FROM Pessoa p WHERE p.id = :id")
    , @NamedQuery(name = "Pessoa.findByNome", query = "SELECT p FROM Pessoa p WHERE p.nome = :nome")
    , @NamedQuery(name = "Pessoa.findByDataNasc", query = "SELECT p FROM Pessoa p WHERE p.dataNasc = :dataNasc")
    , @NamedQuery(name = "Pessoa.findByDataObito", query = "SELECT p FROM Pessoa p WHERE p.dataObito = :dataObito")
    , @NamedQuery(name = "Pessoa.findByProfissao", query = "SELECT p FROM Pessoa p WHERE p.profissao = :profissao")
    , @NamedQuery(name = "Pessoa.findByTitulos", query = "SELECT p FROM Pessoa p WHERE p.titulos = :titulos")
    , @NamedQuery(name = "Pessoa.findByHistoria", query = "SELECT p FROM Pessoa p WHERE p.historia = :historia")
    , @NamedQuery(name = "Pessoa.findByOrigem", query = "SELECT p FROM Pessoa p WHERE p.origem = :origem")
    , @NamedQuery(name = "Pessoa.findByUriFoto", query = "SELECT p FROM Pessoa p WHERE p.uriFoto = :uriFoto")})
public class Pessoa implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @Column(name = "nome")
    private String nome;
    @Column(name = "data_nasc")
    @Temporal(TemporalType.DATE)
    private Date dataNasc;
    @Column(name = "data_obito")
    @Temporal(TemporalType.DATE)
    private Date dataObito;
    @Column(name = "profissao")
    private String profissao;
    @Column(name = "titulos")
    private String titulos;
    @Column(name = "historia")
    private String historia;
    @Column(name = "origem")
    private String origem;
    @Column(name = "uri_foto")
    private String uriFoto;
    @JoinColumn(name = "escolaridade", referencedColumnName = "id")
    @ManyToOne
    private Escolaridade escolaridade;
    @JoinColumn(name = "local_nasc", referencedColumnName = "id")
    @ManyToOne
    private Localidade localNasc;
    @JoinColumn(name = "local_obito", referencedColumnName = "id")
    @ManyToOne
    private Localidade localObito;
    @OneToMany(mappedBy = "irmao")
    private List<Pessoa> pessoaList;
    @JoinColumn(name = "irmao", referencedColumnName = "id")
    @ManyToOne
    private Pessoa irmao;
    @OneToMany(mappedBy = "mae")
    private List<Pessoa> pessoaList1;
    @JoinColumn(name = "mae", referencedColumnName = "id")
    @ManyToOne
    private Pessoa mae;
    @OneToMany(mappedBy = "pai")
    private List<Pessoa> pessoaList2;
    @JoinColumn(name = "pai", referencedColumnName = "id")
    @ManyToOne
    private Pessoa pai;

    public Pessoa() {
    }

    public Pessoa(Integer id) {
        this.id = id;
    }

    public Pessoa(Integer id, String nome) {
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

    public Date getDataNasc() {
        return dataNasc;
    }

    public void setDataNasc(Date dataNasc) {
        this.dataNasc = dataNasc;
    }

    public Date getDataObito() {
        return dataObito;
    }

    public void setDataObito(Date dataObito) {
        this.dataObito = dataObito;
    }

    public String getProfissao() {
        return profissao;
    }

    public void setProfissao(String profissao) {
        this.profissao = profissao;
    }

    public String getTitulos() {
        return titulos;
    }

    public void setTitulos(String titulos) {
        this.titulos = titulos;
    }

    public String getHistoria() {
        return historia;
    }

    public void setHistoria(String historia) {
        this.historia = historia;
    }

    public String getOrigem() {
        return origem;
    }

    public void setOrigem(String origem) {
        this.origem = origem;
    }

    public String getUriFoto() {
        return uriFoto;
    }

    public void setUriFoto(String uriFoto) {
        this.uriFoto = uriFoto;
    }

    public Escolaridade getEscolaridade() {
        return escolaridade;
    }

    public void setEscolaridade(Escolaridade escolaridade) {
        this.escolaridade = escolaridade;
    }

    public Localidade getLocalNasc() {
        return localNasc;
    }

    public void setLocalNasc(Localidade localNasc) {
        this.localNasc = localNasc;
    }

    public Localidade getLocalObito() {
        return localObito;
    }

    public void setLocalObito(Localidade localObito) {
        this.localObito = localObito;
    }

    @XmlTransient
    public List<Pessoa> getPessoaList() {
        return pessoaList;
    }

    public void setPessoaList(List<Pessoa> pessoaList) {
        this.pessoaList = pessoaList;
    }

    public Pessoa getIrmao() {
        return irmao;
    }

    public void setIrmao(Pessoa irmao) {
        this.irmao = irmao;
    }

    @XmlTransient
    public List<Pessoa> getPessoaList1() {
        return pessoaList1;
    }

    public void setPessoaList1(List<Pessoa> pessoaList1) {
        this.pessoaList1 = pessoaList1;
    }

    public Pessoa getMae() {
        return mae;
    }

    public void setMae(Pessoa mae) {
        this.mae = mae;
    }

    @XmlTransient
    public List<Pessoa> getPessoaList2() {
        return pessoaList2;
    }

    public void setPessoaList2(List<Pessoa> pessoaList2) {
        this.pessoaList2 = pessoaList2;
    }

    public Pessoa getPai() {
        return pai;
    }

    public void setPai(Pessoa pai) {
        this.pai = pai;
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
        if (!(object instanceof Pessoa)) {
            return false;
        }
        Pessoa other = (Pessoa) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Pessoa[ id=" + id + " ]";
    }
    
}
