
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Menu;
import model.Perfil;
import persistence.PerfilDao;



@WebServlet(name = "GerenciarMenuPerfil", urlPatterns = {"/gerenciarMenuPerfil"})
public class GerenciarMenuPerfil extends HttpServlet {
    RequestDispatcher despachar = null;
    Menu menu = null;
    Perfil perfil = null;
    PerfilDao pdao = null;    
    
  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        response.setCharacterEncoding("utf-8");
        String acao = request.getParameter("acao");
        String idPerfil = request.getParameter("idPerfil");
        String message = "";
        perfil = new Perfil();
        pdao = new PerfilDao();
 
        
        try {
            if(acao.equals("vincular")){
                perfil = pdao.getCarregarPerfil(Integer.parseInt(idPerfil));
                if(perfil.getIdPerfil() > 0){ 
                    despachar = getServletContext().getRequestDispatcher("/cadastrarMenuPerfil.jsp");
                    request.setAttribute("vincularP", perfil);
                    despachar.forward(request, response);
                }else{
                    message = "Falha! Perfil não encontrado";
                }
            
            //=== Desvincula ===================================================   
            }else if(acao.equals("desvincular")){
               String idMenu = request.getParameter("idMenu");
               if(idMenu.isEmpty() || idMenu.equals("")){
                   message = "Selecione um Menu!";
               }else{
                   if(pdao.desvincularMenu(Integer.parseInt(idMenu), Integer.parseInt(idPerfil))){
                       message = " Perfil desvinculado!";
                   }else{
                       message = "Falha! Perfil não encontrado!";
                   }
               }                                 
            }else{
                  response.sendRedirect("index.jsp");
            }                        
        } catch (SQLException erro) {
            message = "Erro!"+erro.getMessage();
            erro.printStackTrace();
        }  
        
        out.print(
                "<script type='text/javascript'>"+                       
                        "location.href='gerenciarMenuPerfil?acao=vincular&idPerfil="+ idPerfil+ "';"+
                "</script>"        
        );
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        response.setCharacterEncoding("utf-8");
        String idMenu = request.getParameter("idMenu");
        String idPerfil = request.getParameter("idPerfil");
        String message = "";
        
        if(idMenu.equals("") || idPerfil.equals("")){
            message = "Todos são de peenchimento obrigatórios!";            
        }else{
            try {
                if(pdao.vincularMenu(Integer.parseInt(idMenu), Integer.parseInt(idPerfil))){
                    message = "Menu vinculado com sucesso!";
                }else{
                    message = "Falha ao vincular o menu!";
                }                
            } catch (SQLException erro) {
                message = "Erro!"+erro.getMessage();
                erro.printStackTrace();
            }
            out.print(
            "<script type='text/javascript'>"+                    
                    "location.href='gerenciarMenuPerfil?acao=vincular&idPerfil="+idPerfil+"';"+
            "</script>"
            );
        } 
    }
}
