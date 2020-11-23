package dao;

import model.Foto;

/**
 *
 * @author icaro
 */
public class FotoDAO extends GenericDAO<Foto, Integer> {

    public FotoDAO() {
        super(Foto.class);
    }
}
