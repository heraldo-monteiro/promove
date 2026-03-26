
package persistence;
    import factory.ConexaoFactory;
    import java.sql.Connection;
    import java.sql.PreparedStatement;
    import java.sql.ResultSet;
    import java.util.ArrayList;
    import java.sql.SQLException;
    import model.Menu;
import model.Perfil;
import org.eclipse.jdt.internal.compiler.impl.CompilerOptions;


public class PerfilDao {
    Connection conexao;
    PreparedStatement ps;
    ResultSet rs;
    String sql = "";
    
    //==========================================================================
    public ArrayList<Perfil> getListarPerfil() throws SQLException{
        ArrayList<Perfil> perfis = new ArrayList<>();        
        sql = "SELECT idPerfil, nome, status FROM  perfil";
        
        conexao = ConexaoFactory.conectar();
        ps = conexao.prepareStatement(sql);
        rs = ps.executeQuery();
        
        while(rs.next()){
            Perfil perfil = new Perfil();            
            perfil.setIdPerfil(rs.getInt("idPerfil"));
            perfil.setNome(rs.getString("nome"));           
            perfil.setStatus(rs.getInt("status"));
            perfis.add(perfil);            
        }        
        ConexaoFactory.close(conexao);
        return perfis;
    }    
    
    //==========================================================================    
    public  boolean  registrarPerfil(Perfil perfil) throws SQLException{
        conexao = ConexaoFactory.conectar();
        if(perfil.getIdPerfil() == 0){
            sql = "INSERT INTO perfil(nome, status) VALUES(?, ?)";
            
            ps = conexao.prepareStatement(sql);
            ps.setString(1, perfil.getNome());
            ps.setInt(2, perfil.getStatus());    
            
        }else{
            sql = "UPDATE perfil SET nome = ?, status = ? WHERE idPerfil = ?";
            
            ps = conexao.prepareStatement(sql);
            ps.setString(1, perfil.getNome());
            ps.setInt(2, perfil.getStatus());
            ps.setInt(3, perfil.getIdPerfil());
            
        }
        ps.executeUpdate();
        ConexaoFactory.close(conexao);
        return true;        
    }
    
    //==========================================================================
    public Perfil getCarregarPerfil(int idPerfil) throws SQLException{
        Perfil perfil = new Perfil(); 
        sql = "SELECT idPerfil, nome, status FROM perfil WHERE idPerfil = ?";
        
        conexao = ConexaoFactory.conectar();
        ps = conexao.prepareStatement(sql);
        ps.setInt(1, idPerfil);
        rs = ps.executeQuery();
        
        if(rs.next()){
            perfil.setIdPerfil(rs.getInt("idPerfil"));
            perfil.setNome(rs.getString("nome"));
            perfil.setStatus(rs.getInt("status"));
            perfil.setMenus(menusVinculados(idPerfil));
            perfil.setNaoMenus(menusDesvinculados(idPerfil));
        }
        ConexaoFactory.close(conexao);
        return perfil;
        
    }
    
    //==========================================================================    
    public boolean ativarPerfil(Perfil perfil) throws SQLException{
        sql = "UPDATE perfil SET status = 1 WHERE idPerfil = ?";
        
        conexao = ConexaoFactory.conectar();
        ps = conexao.prepareStatement(sql);
        ps.setInt(1, perfil.getIdPerfil());
        ps.executeUpdate();
        
        ConexaoFactory.close(conexao);
        return true;
    }
        
    public boolean desativarPerfil(Perfil perfil) throws SQLException{
        sql = "UPDATE perfil SET status = 0 WHERE isPerfil = ?";
        
        conexao = ConexaoFactory.conectar();
        ps = conexao.prepareStatement(sql);  
        ps.setInt(1, perfil.getIdPerfil());
        ps.executeUpdate();
        
        ConexaoFactory.close(conexao);
        return true;
    }    
    
    //==========================================================================    
    public ArrayList<Menu> menusVinculados(int idPerfil) throws SQLException{
        ArrayList<Menu> menus = new ArrayList<>();
        sql = "SELECT m.idMenu, m.nome, m.link, m.exibir, m.status "+
                "FROM menu_perfil AS mp "+
                "INNER JOIN menu AS m "+
                "ON mp.idMenu = m.idMenu "+
                "WHERE mp.idPerfil = ?";                
        conexao = ConexaoFactory.conectar();
        ps = conexao.prepareStatement(sql);
        ps.setInt(1, idPerfil);
        rs = ps.executeQuery();
        
        while(rs.next()){
            Menu menu = new Menu();  
            menu.setIdMenu(rs.getInt("m.idMenu"));
            menu.setNome(rs.getString("m.nome"));
            menu.setLink(rs.getString("m.link"));
            menu.setExibir(rs.getInt("m.exibir"));
            menu.setStatus(rs.getInt("m.status"));
            menus.add(menu);
        }
        ConexaoFactory.close(conexao);
        return menus;
    }
   
    public ArrayList<Menu> menusDesvinculados(int idPerfil) throws SQLException{
        ArrayList<Menu> menus = new ArrayList<>();
        sql = "SELECT m.idMenu, m.nome, m.link, m.exibir, m.status "+
                "FROM menu AS m "+
                "WHERE m.idMenu NOT IN(SELECT mp.idMenu FROM menu_perfil AS mp WHERE mp.idPerfil =?)";
                
        conexao = ConexaoFactory.conectar();
        ps = conexao.prepareStatement(sql);
        ps.setInt(1, idPerfil);
        rs = ps.executeQuery();
        
        while(rs.next()){
            Menu menu = new Menu();  
            menu.setIdMenu(rs.getInt("m.idMenu"));
            menu.setNome(rs.getString("m.nome"));
            menu.setLink(rs.getString("m.link"));
            menu.setExibir(rs.getInt("m.exibir"));
            menu.setStatus(rs.getInt("m.status"));
            menus.add(menu);
        }
        ConexaoFactory.close(conexao);
        return menus;
    }
    
    //==========================================================================    
    public boolean vincularMenu(int idMenu, int idPerfil) throws SQLException{
        sql = "INSERT INTO menu_perfil(idMenu, idPerfil)VALUES(?, ? )";
        conexao = ConexaoFactory.conectar();
        ps = conexao.prepareStatement(sql);
        ps.setInt(1, idMenu);
        ps.setInt(2, idPerfil);
        ps.executeUpdate();
        
        ConexaoFactory.close(conexao);
        return true;
    }
    
    public boolean desvincularMenu(int idMenu, int idPerfil) throws SQLException{
        sql = "DELETE FROM menu_perfil WHERE idMenu = ? AND idPerfil = ?";
        conexao = ConexaoFactory.conectar();
        ps = conexao.prepareStatement(sql);
        ps.setInt(1, idMenu);
        ps.setInt(2, idPerfil);
        ps.executeUpdate();
        
        ConexaoFactory.close(conexao);
        return true;
    }
        
    
}
