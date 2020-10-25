/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 *
 * @author icaro
 */
@Embeddable
public class GaleriaPK implements Serializable {

    @Basic(optional = false)
    @Column(name = "foto")
    private long foto;
    @Basic(optional = false)
    @Column(name = "pessoa")
    private int pessoa;

    public GaleriaPK() {
    }

    public GaleriaPK(long foto, int pessoa) {
        this.foto = foto;
        this.pessoa = pessoa;
    }

    public long getFoto() {
        return foto;
    }

    public void setFoto(long foto) {
        this.foto = foto;
    }

    public int getPessoa() {
        return pessoa;
    }

    public void setPessoa(int pessoa) {
        this.pessoa = pessoa;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) foto;
        hash += (int) pessoa;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof GaleriaPK)) {
            return false;
        }
        GaleriaPK other = (GaleriaPK) object;
        if (this.foto != other.foto) {
            return false;
        }
        if (this.pessoa != other.pessoa) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.GaleriaPK[ foto=" + foto + ", pessoa=" + pessoa + " ]";
    }
    
}
