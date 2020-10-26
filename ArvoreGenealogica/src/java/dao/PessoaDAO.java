package dao;

import model.Pessoa;

/**
 *
 * @author icaro
 */
public class PessoaDAO extends GenericDAO<Pessoa, Integer>{
    
    public PessoaDAO(){
        super(Pessoa.class);
    }
}
