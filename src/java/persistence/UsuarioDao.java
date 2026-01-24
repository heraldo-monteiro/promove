
package persistence;

import factory.ConexaoFactory;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.sql.Date;
import model.Perfil;
import model.Usuario;

public class UsuarioDao {
    Connection conexao;
    PreparedStatement ps;
    ResultSet rs;
    String sql = "";
    
    public ArrayList<Usuario> getListarUsuario() throws SQLException{
        ArrayList<Usuario> usuarios = new ArrayList<>();
        sql = "SELECT p.idPerfil, p.nome, u.idUsuario, u.dataCadastro, u.nome, u.login, u.senha, u.status, u.idPerfil "+
                "FROM perfil p "+
                "INNER JOIN usuario u "+
                "ON p.idPerfil = u.idPerfil ";
        conexao = ConexaoFactory.conectar();
        ps = conexao.prepareStatement(sql);
        rs = ps.executeQuery();
        
        while(rs.next()){
            Usuario usuario = new Usuario();
            usuario.setIdUsuario(rs.getInt("u.idUsuario"));
            usuario.setDataCadastro(rs.getDate("u.dataCadastro"));
            usuario.setNome(rs.getString("u.nome"));
            usuario.setLogin(rs.getString("u.login"));
            usuario.setSenha(rs.getString("u.senha"));
            usuario.setStatus(rs.getInt("u.status"));
            
            Perfil perfil = new Perfil();
            perfil.setIdPerfil(rs.getInt("p.idPerfil"));
            perfil.setNome(rs.getString("p.nome"));
            
            usuario.setPerfil(perfil);
            usuarios.add(usuario);            
        }
        ConexaoFactory.close(conexao);
        return usuarios;
    }
    
    //==========================================================================
    public Usuario getCarregarUsuario(int idUsuario) throws SQLException{
        Usuario usuario = new Usuario();
        Perfil perfil = new Perfil();
        sql = "SELECT p.idPerfil, p.nome, u.idUsuario, u.dataCadastro, u.nome, u.login, u.senha, u.status, u.idPerfil "+
                "FROM perfil p "+
                "INNER JOIN usuario u "+
                "ON p.idPerfil = u.idPerfil "+
                "WHERE idUsuario = ?";
        conexao = ConexaoFactory.conectar();
        ps = conexao.prepareStatement(sql);
        ps.setInt(1, idUsuario);
        rs = ps.executeQuery();
        
        if(rs.next()){
            usuario.setIdUsuario(rs.getInt("u.idUsuario"));
            usuario.setDataCadastro(rs.getDate("u.dataCadastro"));
            usuario.setNome(rs.getString("u.nome"));
            usuario.setLogin(rs.getString("u.login"));
            usuario.setSenha(rs.getString("u.senha"));
            usuario.setStatus(rs.getInt("u.status"));
            perfil.setIdPerfil(rs.getInt("p.idPerfil"));
            perfil.setNome(rs.getString("p.nome"));            
            usuario.setPerfil(perfil);  
        }
        ConexaoFactory.close(conexao);
        return usuario;        
    }
    
     
    //==========================================================================
    public Usuario getRecuperarUsuario(String login) throws SQLException{
        Usuario usuario = new Usuario();
        Perfil perfil = new Perfil();
        PerfilDao pdao = new PerfilDao();
        
        sql = "SELECT u.idUsuario, u.nome, u.login, u.senha, u.status, u.idPerfil "+
                "FROM usuario AS u "+
                "WHERE u.login = ?";
        conexao = ConexaoFactory.conectar();
        ps = conexao.prepareStatement(sql);
        ps.setString(1, login);
        rs = ps.executeQuery();
        
        if(rs.next()){
            usuario.setIdUsuario(rs.getInt("u.idPerfil"));
            usuario.setNome(rs.getString("u.nome"));
            usuario.setLogin(rs.getString("u.login"));
            usuario.setSenha(rs.getString("u.senha"));
            usuario.setStatus(rs.getInt("u.status"));            
            usuario.setPerfil(pdao.getCarregarPerfil(rs.getInt("u.idPerfil")));           
        }
        ConexaoFactory.close(conexao);
        return usuario;  
    }
    
    //==========================================================================
    public boolean registrarUsuario(Usuario usuario) throws SQLException{
        conexao = ConexaoFactory.conectar();
        
        if(usuario.getIdUsuario() == 0){
            sql = "INSERT INTO usuario(dataCadastro, nome, login, senha, status, idPerfil)"+
                   "VALUES(?, ?, ?, ?, ?, ?)";
            ps = conexao.prepareStatement(sql);
            
            java.util.Date dataCadastro = usuario.getDataCadastro();
            if (dataCadastro == null){
                dataCadastro = new java.util.Date(); // data atual
                usuario.setDataCadastro(dataCadastro);
            }

            ps.setDate(1, new java.sql.Date(dataCadastro.getTime()));
            //ps.setDate(1, new Date(usuario.getDataCadastro().getTime()));
            ps.setString(2, usuario.getNome());
            ps.setString(3, usuario.getLogin());
            ps.setString(4, usuario.getSenha());
            ps.setInt(5, usuario.getStatus());
            ps.setInt(6, usuario.getPerfil().getIdPerfil());    
        }else{
            sql = "UPDATE usuario SET nome = ?, login = ?, senha = ?, status = ?, idPerfil = ? WHERE idUsuario = ? ";           
            ps = conexao.prepareStatement(sql);            
           
            ps.setString(1, usuario.getNome());
            ps.setString(2, usuario.getLogin());
            ps.setString(3, usuario.getSenha());
            ps.setInt(4, usuario.getStatus());
            ps.setInt(5, usuario.getPerfil().getIdPerfil());  
            ps.setInt(6, usuario.getIdUsuario());  
        } 
        ps.executeUpdate();
        ConexaoFactory.close(conexao);
        return true;
    }
    
    //==========================================================================
    public boolean ativarUsuario(Usuario usuario) throws SQLException{
        sql = "UPDATE usuario SET status = 1 WHERE idUsuario = ?";
        conexao = ConexaoFactory.conectar();
        ps = conexao.prepareStatement(sql);
        ps.setInt(1, usuario.getIdUsuario());        
        ps.executeUpdate();
        
        ConexaoFactory.close(conexao);
        return true;
        
    }
    
     public boolean desativarUsuario(Usuario usuario) throws SQLException{
         sql = "UPDATE usuario SET status = 0 WHERE idUsuario = ?";
        conexao = ConexaoFactory.conectar();
        ps = conexao.prepareStatement(sql);
        ps.setInt(1, usuario.getIdUsuario());        
        ps.executeUpdate();
        
        ConexaoFactory.close(conexao);
        return true;
    }
    
}
