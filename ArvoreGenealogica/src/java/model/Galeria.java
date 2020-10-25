/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author icaro
 */
@Entity
@Table(name = "galeria")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Galeria.findAll", query = "SELECT g FROM Galeria g")
    , @NamedQuery(name = "Galeria.findByFoto", query = "SELECT g FROM Galeria g WHERE g.galeriaPK.foto = :foto")
    , @NamedQuery(name = "Galeria.findByPessoa", query = "SELECT g FROM Galeria g WHERE g.galeriaPK.pessoa = :pessoa")})
public class Galeria implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected GaleriaPK galeriaPK;

    public Galeria() {
    }

    public Galeria(GaleriaPK galeriaPK) {
        this.galeriaPK = galeriaPK;
    }

    public Galeria(long foto, int pessoa) {
        this.galeriaPK = new GaleriaPK(foto, pessoa);
    }

    public GaleriaPK getGaleriaPK() {
        return galeriaPK;
    }

    public void setGaleriaPK(GaleriaPK galeriaPK) {
        this.galeriaPK = galeriaPK;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (galeriaPK != null ? galeriaPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Galeria)) {
            return false;
        }
        Galeria other = (Galeria) object;
        if ((this.galeriaPK == null && other.galeriaPK != null) || (this.galeriaPK != null && !this.galeriaPK.equals(other.galeriaPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Galeria[ galeriaPK=" + galeriaPK + " ]";
    }
    
}
