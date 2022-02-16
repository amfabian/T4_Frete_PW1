package classes;

import java.io.Serializable;
import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import dao.ClienteDAO;
import dao.PessoaDAO;
import dao.UsuarioDAO;

@Entity
public class Usuario {
	
	private static final long serialVersionUID = 1L;
    @Id 
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long idUsuario;
	private String email;
	private String senha;
	
	
	
	public Usuario() {
		super();
	}
	
	
	public Usuario(String email, String senha) {
		super();
		this.email = email;
		this.senha = senha;
	}


	public Long getIdUsuario() {
		return idUsuario;
	}
	public void setIdUsuario(Long idUsuario) {
		this.idUsuario = idUsuario;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	@Override
	public int hashCode() {
		return Objects.hash(email, idUsuario, senha);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Usuario other = (Usuario) obj;
		return Objects.equals(email, other.email) && Objects.equals(idUsuario, other.idUsuario)
				&& Objects.equals(senha, other.senha);
	}
	@Override
	public String toString() {
		return "Usuario [idUsuario=" + idUsuario + ", email=" + email + ", senha=" + senha + "]";
	}

	public boolean valida () {
		
		return new UsuarioDAO().buscarPassword(this.getEmail(), this.getSenha());
	}
	
	
	
	public boolean atualizar(){
		return new UsuarioDAO().atualizar(this);
	}
	public boolean remover(){
		return new UsuarioDAO().remover(this.getIdUsuario());
	}
	public Usuario buscarID(){
		return new UsuarioDAO().buscarID(this.getIdUsuario());
	}


	public List<Usuario> buscarTodos(){
		return new UsuarioDAO().buscarTodos();
	}
	
}
