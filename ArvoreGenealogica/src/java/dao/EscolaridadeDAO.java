package dao;

import model.Escolaridade;

/**
 *
 * @author icaro
 */
public class EscolaridadeDAO extends GenericDAO<Escolaridade, Integer>{
    
    public EscolaridadeDAO(){
        super(Escolaridade.class);
    }
}
