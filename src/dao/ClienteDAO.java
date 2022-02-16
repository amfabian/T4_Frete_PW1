package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import classes.Cliente;


public class ClienteDAO {
	

	private EntityManager em;

	public ClienteDAO() {
			}
	
	public boolean salvar(Cliente client) {
		try {
			em = JPAUtil.getEntityManager();
			em.getTransaction().begin();
			em.persist(client);
			em.getTransaction().commit();
			return true;
		} catch (RuntimeException e) {
			if (em.getTransaction().isActive()) {
				em.getTransaction().rollback();
			}
			return false;
		}
	}

	public boolean atualizar(Cliente client) {
		try {
			em = JPAUtil.getEntityManager();
			em.getTransaction().begin();
			em.merge(client);
			em.getTransaction().commit();
			return true;
		} catch (RuntimeException e) {
			if (em.getTransaction().isActive()) {
				em.getTransaction().rollback();
			}
			return false;
		} 
	}

	public boolean remover(Long id) {
		try {
			em = JPAUtil.getEntityManager();
			em.getTransaction().begin();
			Cliente entity = em.find(Cliente.class, id);
			em.remove(entity);
			em.getTransaction().commit();
			return true;
		} catch (RuntimeException e) {
			if (em.getTransaction().isActive()) {
				em.getTransaction().rollback();
			}
			return false;
		} 
	}

	public Cliente buscarID(Long id) {
		try {
			em = JPAUtil.getEntityManager();
			Cliente cliente = em.find(Cliente.class, id);
			return cliente;
		} catch (RuntimeException e) {
			if (em.getTransaction().isActive()) {
				em.getTransaction().rollback();
			}
			return null;
		} 
	}

	
	public List<Cliente> listarTodos() {
		try {
			em = JPAUtil.getEntityManager();
			TypedQuery<Cliente> query = em.createQuery("SELECT obj FROM Cliente obj", Cliente.class);
			List<Cliente> clientes = query.getResultList();
			return clientes;
		} catch (RuntimeException e) {
			//e.printStackTrace();
			return null;
		} 
	}
	
	

}



