package fretes;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Objects;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import classes.Cliente;
import dao.ClienteDAO;
import dao.FreteDAO;
import fretes.ItemFrete;
import util.Situacao;


@Entity
public class Frete implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id 
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long idFrete;

	private Double valor;
	private String cidadeOrigem;
	private String cidadeDestino;
	
	@OneToOne (optional=false, cascade= CascadeType.PERSIST)
	@JoinColumn (name="idCliente")
	private Cliente cliente;
	
	@Enumerated(EnumType.ORDINAL)
	private Situacao situacao;
	
	@OneToMany (cascade= CascadeType.PERSIST)
	@JoinColumn(name="idItemFrete")
	private List<ItemFrete> itens;
	

	 @Temporal(TemporalType.TIMESTAMP)
	 @Column(name = "data", nullable = false)
	 private Date data;


	 
	 
	public Frete(long idFrete, Double valor, String cidadeOrigem, String cidadeDestino, Cliente cliente,
			Situacao situacao, List<ItemFrete> itens, Date data) {
		super();
		this.idFrete = idFrete;
		this.valor = valor;
		this.cidadeOrigem = cidadeOrigem;
		this.cidadeDestino = cidadeDestino;
		this.cliente = cliente;
		this.situacao = situacao;
		this.itens = itens;
		this.data = data;
	}


	public Frete() {
		super();
		// TODO Auto-generated constructor stub
	}


	public long getIdFrete() {
		return idFrete;
	}


	public void setIdFrete(long idFrete) {
		this.idFrete = idFrete;
	}


	public Double getValor() {
		return valor;
	}


	public void setValor(Double valor) {
		this.valor = valor;
	}


	public String getCidadeOrigem() {
		return cidadeOrigem;
	}


	public void setCidadeOrigem(String cidadeOrigem) {
		this.cidadeOrigem = cidadeOrigem;
	}


	public String getCidadeDestino() {
		return cidadeDestino;
	}


	public void setCidadeDestino(String cidadeDestino) {
		this.cidadeDestino = cidadeDestino;
	}


	public Cliente getCliente() {
		return cliente;
	}


	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}


	public Situacao getSituacao() {
		return situacao;
	}


	public void setSituacao(Situacao situacao) {
		this.situacao = situacao;
	}


	public List<ItemFrete> getItens() {
		return itens;
	}


	public void setItens(List<ItemFrete> itens) {
		this.itens = itens;
	}


	public Date getData() {
		return data;
	}


	public void setData(Date data) {
		this.data = data;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	@Override
	public int hashCode() {
		return Objects.hash(cidadeDestino, cidadeOrigem, cliente, data, idFrete, itens, situacao, valor);
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Frete other = (Frete) obj;
		return Objects.equals(cidadeDestino, other.cidadeDestino) && Objects.equals(cidadeOrigem, other.cidadeOrigem)
				&& Objects.equals(cliente, other.cliente) && Objects.equals(data, other.data)
				&& idFrete == other.idFrete && Objects.equals(itens, other.itens) && situacao == other.situacao
				&& Objects.equals(valor, other.valor);
	}


	@Override
	public String toString() {
		return "Frete [idFrete=" + idFrete + ", valor=" + valor + ", cidadeOrigem=" + cidadeOrigem + ", cidadeDestino="
				+ cidadeDestino + ", cliente=" + cliente + ", situacao=" + situacao + ", itens=" + itens + ", data="
				+ data + "]";
	}
	 
	 
	public List<Frete> listarTodos(){
		return new FreteDAO().listarTodos();
	}
	public boolean atualizar(){
		return new FreteDAO().atualizar(this);
	}
	public boolean remover(){
		return new FreteDAO().excluir(this.getIdFrete());
	}
	public Frete buscarID(){
		return new FreteDAO().pesquisarKey(this.getIdFrete());
	}
}
