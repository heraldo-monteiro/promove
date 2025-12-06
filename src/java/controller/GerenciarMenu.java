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
import java.util.ArrayList;
import model.Menu;
import persistence.MenuDao;

@WebServlet(name = "GerenciarMenu", urlPatterns = {"/gerenciarMenu"})
public class GerenciarMenu extends HttpServlet {
    Menu menu =  null;
    MenuDao mdao = null;
    RequestDispatcher despachar = null;   
    
//==============================================================================      
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        response.setCharacterEncoding("utf-8");        
        String acao = request.getParameter("acao");
        String idMenu = request.getParameter("idMenu");
        String message = "";
        
        menu = new Menu();
        mdao = new MenuDao();
        
        try {
            if(acao.equals("listar")){
                if(GerenciarLogin.verificarPermissao(request, response)){
                    ArrayList<Menu> menus = new ArrayList<>();
                    menus = mdao.getListarMenu();
                    despachar = getServletContext().getRequestDispatcher("/listarMenu.jsp");
                    request.setAttribute("menus", menus);
                    despachar.forward(request, response);  
                }else{
                    message = "Usuário não autirizado!";
                }                    
              
            //Alterar
            }else if(acao.equals("alterar")){
                if(GerenciarLogin.verificarPermissao(request, response)){
                    menu = mdao.getCarregarMenu(Integer.parseInt(idMenu));
                    if(menu.getIdMenu() > 0){
                        request.setAttribute("menu", menu);
                        exibirMessge(request, response);
                    }else{
                        message = "Menu não encontrado!";                    
                    } 
                }else{
                    message = "Usuário não autirizado!";
                }                      
                
            //Ativar    
            }else if(acao.equals("ativar")){  
                if(GerenciarLogin.verificarPermissao(request, response)){
                    menu.setIdMenu(Integer.parseInt(idMenu));
                    if(mdao.ativarMenu(menu)){
                        message = "Menu ativado!";     
                        response.sendRedirect("gerenciarMenu?acao=listar");
                    }else{
                        message = "Falha ao ativa menu!";                
                    }  
                }else{
                    message = "Usuário não autirizado!";
                }
                               
            //Desativar    
            }else if(acao.equals("desativar")){
                if(GerenciarLogin.verificarPermissao(request, response)){
                    menu.setIdMenu(Integer.parseInt(idMenu));
                    if(mdao.desativarMenu(menu)){
                        message = "Menu desativado!";
                        response.sendRedirect("gerenciarMenu?acao=listar");                        
                    }else{
                        message = "Falha ao desativar o menu!";                    
                    }   
                }else{
                    message = "Usuário não autirizado!";  
                }                
            }else{
                response.sendRedirect("gerenciarMenu?acao=listar");
            }   
        } catch (SQLException erro) {
            message = "Erro!:" +erro.getMessage();
            erro.printStackTrace();
        }
        
        out.print(
                "<script type='text/javascript'>"+                        
                    "alert('"+ message +"');"+
                    "location.href='gerenciarMenu?acao=listar';"+
                "</script>"
        ); 
    
    }
    
//==============================================================================
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String idMenu = request.getParameter("idMenu");
        String nome = request.getParameter("nome");
        String link = request.getParameter("link");
        String exibir = request.getParameter("exibir");
        String status = request.getParameter("status");
        String message = "";
        String msg = "";        
        menu = new Menu();
        mdao = new MenuDao();
        
        if(!idMenu.isEmpty()){menu.setIdMenu(Integer.parseInt(idMenu)); }
        
        if(nome.isEmpty() || nome.equals("")){
            request.setAttribute("smg", "O campo nome não foi preenchido!");
            exibirMessge(request, response);
        }else{
            menu.setNome(nome);
        }
        
        if(link.isEmpty() || link.equals("")){
            request.setAttribute("smg", "O Campo link não foi preenchido!");  
            exibirMessge(request, response);
        }else{
            menu.setLink(link);
        }
        
        if(exibir.isEmpty() || exibir.equals("")){
            request.setAttribute("smg", "O campo exibir não foi preenchido!");
            exibirMessge(request, response);
        }else{
            menu.setExibir(Integer.parseInt(exibir));  
        }
        
        if(status.isEmpty() || status.equals("")){
            request.setAttribute("smg", "O campo status não foi atribuido!");
            exibirMessge(request, response);
        }else{
            menu.setStatus(Integer.parseInt(status));
        }
        
        
        try {
            if(mdao.registarMenu(menu)){
                message = "Registro Concluido!";                
            }else{
                message = "Falha ao efetua o registro!";
            }
        } catch (SQLException erro) {
            message = "Erro!: "+ erro.getMessage();
            erro.printStackTrace();
        }
        
        out.print(
            "<script type='text/javascript'>"+
              "alert('"+ message +"');"+
              "location.href='gerenciarMenu?acao=listar';"+
            "</script>"        
        );
                
    }

    private void exibirMessge(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        despachar = getServletContext().getRequestDispatcher("/cadastrarMenu.jsp");
        despachar.forward(request, response);
    }
  

}
