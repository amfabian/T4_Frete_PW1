package classes;

import java.io.Serializable;
import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;

import dao.PessoaDAO;

@Entity
@Inheritance (strategy = InheritanceType.JOINED)
public class Pessoa implements Serializable{
	private static final long serialVersionUID = 1L;
    @Id 
    @GeneratedValue(strategy = GenerationType.IDENTITY)
   // @Column(name="idPessoa")
	private Long idPessoa;
	private String nome;
	
	public Pessoa(){}
	public Pessoa(String nome){ 
		this.nome = nome; 
		}
	public Pessoa(Long idPessoa, String nome) {
		super();
		this.idPessoa = idPessoa;
		this.nome = nome;		
	}
	
	public void setNome(String nome){ 
		this.nome = nome; 
		}
	public String getNome(){
		return nome;
		}
	public Long getIdPessoa() {
		return idPessoa;
	}
	
	public void setIdPessoa(Long idPessoa) {
		this.idPessoa = idPessoa;
	}
	

	
	@Override
	public int hashCode() {
		return Objects.hash(idPessoa, nome);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Pessoa other = (Pessoa) obj;
		return Objects.equals(idPessoa, other.idPessoa) && Objects.equals(nome, other.nome);
	}
	@Override
	public String toString() {
		return "Pessoa [idPessoa=" + idPessoa + ", nome=" + nome + "]";
	}
	public boolean salvar() {
		return new PessoaDAO().salvar(this);
	}
	public List<Pessoa> buscarTodos(){
		return new PessoaDAO().buscarTodos();
	}
	public boolean atualizar(){
		return new PessoaDAO().atualizar(this);
	}
	public boolean remover(){
		return new PessoaDAO().remover(this.getIdPessoa());
	}
	public Pessoa buscarID(){
		return new PessoaDAO().buscarID(this.getIdPessoa());
	}
}
