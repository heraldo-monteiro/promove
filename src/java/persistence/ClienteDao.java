
package persistence;

import factory.ConexaoFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Cliente;


public class ClienteDao {
    Connection conexao;
    PreparedStatement ps;
    ResultSet rs;
    String sql = "";
    
    /*==========================================================================
        - Este metodo tem com objetivo listar todos os clientes
        - já registrados no banco de dados.
    */     
    public ArrayList<Cliente> getListarCliente() throws SQLException{
        ArrayList<Cliente> clientes = new ArrayList<>();
        
        sql = "SELECT idCliente, nome, cpf_cnpj, email, telefone, status FROM cliente";
        conexao  = ConexaoFactory.conectar();
        ps = conexao.prepareStatement(sql);
        rs = ps.executeQuery();
        
        while(rs.next()){
            Cliente cliente = new Cliente();
            cliente.setIdCliente(rs.getInt("idCliente"));
            cliente.setNome(rs.getString("nome"));
            cliente.setCpf_cnpj(rs.getString("cpf_cnpj"));
            cliente.setEmail(rs.getString("email"));
            cliente.setTelefone(rs.getString("telefone"));
            cliente.setStatus(rs.getInt("status"));
            clientes.add(cliente);            
        }
        ConexaoFactory.close(conexao);
        return clientes;
    }
    
      /*==========================================================================
        - Metodo Registrar Cliente
        - Este metodo tem a função de efetua o cadatros de novos clientes
        - no banco de dados.
    */
    public boolean registrarCliente(Cliente cliente ) throws SQLException{
        conexao =  ConexaoFactory.conectar();        
       
        if(cliente.getIdCliente() == 0){
             sql = "INSERT INTO cliente(nome, cpf_cnpj, email, telefone,status)"+
                  "VALUES(?, ?, ?, ?, ?)";
            ps = conexao.prepareStatement(sql);
            
            ps.setString(1, cliente.getNome());
            ps.setString(2, cliente.getCpf_cnpj());
            ps.setString(3, cliente.getEmail());
            ps.setString(4, cliente.getTelefone());
            ps.setInt(5, cliente.getStatus());  
        }else{
            sql = "UPDATE cliente SET nome = ?, cpf_cnpj = ?, email = ?, telefone = ?, status = ? WHERE idCliente = ? ";
            
            ps = conexao.prepareStatement(sql);
            ps.setString(1, cliente.getNome());
            ps.setString(2, cliente.getCpf_cnpj());
            ps.setString(3, cliente.getEmail());
            ps.setString(4, cliente.getTelefone());
            ps.setInt(5, cliente.getStatus());
            ps.setInt(6, cliente.getIdCliente());    
            
        }         
        ps.executeUpdate();       
        ConexaoFactory.close(conexao);
        return true;
    }
    
    
    /*==========================================================================
        - Este metodo tem como função de carregar todos os clientes
        - registrados na base de dados.
    */
    public Cliente getCarregarCliente(int idCliente) throws SQLException{
        Cliente cliente = new Cliente() ;
        sql = "SELECT idCliente, nome, cpf_cnpj, email, telefone, status FROM cliente WHERE idCliente =?";
        conexao = ConexaoFactory.conectar();
        ps = conexao.prepareStatement(sql);
        ps.setInt(1, idCliente);
        rs = ps.executeQuery();
        
        if(rs.next()){
            cliente.setIdCliente(rs.getInt("idCliente"));
            cliente.setNome(rs.getString("nome"));
            cliente.setCpf_cnpj(rs.getString("cpf_cnpj"));
            cliente.setEmail(rs.getString("email"));
            cliente.setTelefone(rs.getString("telefone"));
            cliente.setStatus(rs.getInt("status"));           
            
        }
        ConexaoFactory.close(conexao);
        return cliente;
        
    }

    public boolean ativarCliente(Cliente cliente) throws SQLException{
        sql = "UPDATE cliente SET satus = 1 WHERE idCliente = ?";
        conexao = ConexaoFactory.conectar();
        
        ps = conexao.prepareStatement(sql);
        ps.setInt(1, cliente.getIdCliente());
        ps.executeUpdate();
        
        ConexaoFactory.close(conexao);
        return true;
        
    } 
    
    public boolean desativarCliente(Cliente cliente)throws SQLException{
        sql = "UPDATE cliente SET status = 0 WHERE idCliente = ?";
        
        conexao = ConexaoFactory.conectar();
        ps = conexao.prepareStatement(sql);
        ps.setInt(1, cliente.getIdCliente());
        ps.executeUpdate();
        
        ConexaoFactory.close(conexao);
        return true;
        
    }
    
    
}
