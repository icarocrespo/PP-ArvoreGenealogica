package dao;

import model.Usuario;

/**
 *
 * @author icaro
 */
public class UsuarioDAO extends GenericDAO<Usuario, Integer> {

    public UsuarioDAO() {
        super(Usuario.class);
    }
}
