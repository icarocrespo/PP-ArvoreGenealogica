package dao;

import java.util.List;
import model.Pessoa;

/**
 *
 * @author icaro
 */
public class PessoaDAO extends GenericDAO<Pessoa, Integer>{
    
    public PessoaDAO(){
        super(Pessoa.class);
    }
    
    public List<Pessoa> ordemLocalidade(String localidade) throws Exception {
        return em.createNamedQuery(Pessoa.class + ".findFilter").setParameter("localidade", "%" + localidade + "%").getResultList();
    }
    
    public List<Pessoa> ordemEscolaridade(String escolaridade) throws Exception {
        return em.createNamedQuery(Pessoa.class + ".findFilter").setParameter("escolaridade", "%" + escolaridade + "%").getResultList();
    }
}
