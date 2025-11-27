package persistence;

import factory.ConexaoFactory;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import model.Menu;    

public class MenuDao {
    Connection conexao; // Variavel para receber a conexao
    PreparedStatement ps; // Variavel que ira prepara a conexao
    ResultSet rs;
    String sql = "";
       
    public ArrayList<Menu> getListarMenu() throws SQLException{
        ArrayList<Menu> menus = new ArrayList<>();     
        sql = "SELECT idMenu, nome, link, exibir, status FROM menu";   
      
        conexao = ConexaoFactory.conectar(); 
        ps = conexao.prepareStatement(sql);
        rs = ps.executeQuery();
                 
        while(rs.next()){             
            Menu menu = new Menu();
            menu.setIdMenu(rs.getInt("idMenu"));
            menu.setNome(rs.getString("nome"));  
            String link = rs.getString("link");  // Para tratamento do link           
            menu.setExibir(rs.getInt("exibir"));
            menu.setStatus(rs.getInt("status"));            

            if (link != null) {
                link = link.replace("gerenciar", "gerenciar ")  // Atualiza o Treho "gerenciar" para "Gerenciar"               
                .replace("?acao", "")          // remove apenas "?acao"
                .replace("=", "")              // remove o "="
                .replace("listar", "")         // remove apenas "listar"                        
                .trim();                       // remove espaços extras
            }
            menu.setLink(link);
            menus.add(menu);              
        }
                 
        ConexaoFactory.close(conexao);
        return menus;
    }
    
    //==========================================================================
    public Menu getCarregarMenu(int idMenu) throws SQLException{
        Menu menu = new Menu();
        sql = "SELECT idMenu, nome, link, exibir, status FROM menu WHERE idMenu = ?";        
        conexao = ConexaoFactory.conectar();
        ps = conexao.prepareStatement(sql);        
        ps.setInt(1, idMenu);
        rs = ps.executeQuery();
        
        if(rs.next()){
            menu.setIdMenu(rs.getInt("idMenu"));
            menu.setNome(rs.getString("nome"));
            menu.setLink(rs.getString("link"));
            menu.setExibir(rs.getInt("exibir"));
            menu.setStatus(rs.getInt("status"));            
        }
        ConexaoFactory.close(conexao);
        return menu;        
    }
        
    //==========================================================================    
    public boolean registarMenu(Menu menu) throws SQLException{
        conexao = ConexaoFactory.conectar();
        
        if(menu.getIdMenu() <= 0){
            sql = "INSERT INTO menu(nome, link, exibir, status) VALUES(?, ?, ?, ?)";            
            ps = conexao.prepareStatement(sql);            
            ps.setString(1, menu.getNome());
            ps.setString(2, menu.getLink());
            ps.setInt(3, menu.getExibir());
            ps.setInt(4, menu.getStatus());
            
        }else{
            sql = "UPDATE menu SET nome = ?, link = ?, exibir = ?, status = ? WHERE idMenu = ?";
            ps = conexao.prepareStatement(sql);            
            ps.setString(1, menu.getNome());
            ps.setString(2, menu.getLink());
            ps.setInt(3, menu.getExibir());
            ps.setInt(4, menu.getStatus());
            ps.setInt(5, menu.getIdMenu());
        }
        ps.executeUpdate();
        ConexaoFactory.close(conexao);
        return true;
    }
    
    //==========================================================================    
    public boolean ativarMenu(Menu menu) throws SQLException{
        sql = "UPDATE menu SET status = 1 WHERE idMenu = ?";
        conexao = ConexaoFactory.conectar();
        ps = conexao.prepareStatement(sql);        
        ps.setInt(1, menu.getIdMenu());
        ps.executeUpdate();
        
        ConexaoFactory.close(conexao);
        return true;
    }    
    
    public boolean desativarMenu(Menu menu) throws SQLException{
        sql = "UPDATE menu SET status = 0 WHERE idMenu = ?";
        conexao = ConexaoFactory.conectar();
        ps = conexao.prepareStatement(sql);
        ps.setInt(1, menu.getIdMenu());
        ps.executeUpdate();
        
        ConexaoFactory.close(conexao);
        return true;        
    }    
    
  
    
}
