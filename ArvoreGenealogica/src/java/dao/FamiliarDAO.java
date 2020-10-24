package dao;

import model.Familiar;

public class FamiliarDAO extends GenericDAO<Familiar, Integer> {

    public FamiliarDAO() {
        super(Familiar.class);
    }
}