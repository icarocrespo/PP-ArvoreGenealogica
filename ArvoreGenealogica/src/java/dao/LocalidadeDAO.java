package dao;

import model.Localidade;

/**
 *
 * @author icaro
 */
public class LocalidadeDAO extends GenericDAO<Localidade, Integer> {

    public LocalidadeDAO() {
        super(Localidade.class);
    }
}
