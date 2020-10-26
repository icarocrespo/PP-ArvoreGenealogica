package controller;

import java.util.List;
import model.Pessoa;

public class Nodo {

    private Pessoa pessoa;
    private List<Nodo> filhos;
    private Integer chave;

    public Nodo() {
        this.pessoa = new Pessoa();
        this.filhos = null;
    }

    public Nodo(Pessoa pessoa) {
        this.pessoa = pessoa;
        this.filhos = null;
    }

    public Pessoa getPessoa() {
        return pessoa;
    }

    public void setPessoa(Pessoa pessoa) {
        this.pessoa = pessoa;
    }

    public List<Nodo> getFilhos() {
        return filhos;
    }

    public void setFilhos(List<Nodo> filhos) {
        this.filhos = filhos;
    }

    public int getChave() {
        return chave;
    }

    public void setChave(int chave) {
        this.chave = chave;
    }
}
