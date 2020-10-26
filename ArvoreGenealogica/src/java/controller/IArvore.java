package controller;

public interface IArvore {
    
    public boolean isEmpty();
    
    public int size(Nodo atual);
    
    public String toString(Nodo atual);
    
    public boolean add(Integer mae, Integer pai, Nodo atual);
    
    public boolean remove(int chave);
}
