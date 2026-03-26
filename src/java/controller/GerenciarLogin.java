
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
import javax.servlet.http.HttpSession;
import model.Menu;
import model.Usuario;
import persistence.UsuarioDao;

@WebServlet(name = "GerenciarLogin", urlPatterns = {"/gerenciarLogin"})
public class GerenciarLogin extends HttpServlet {    
    RequestDispatcher despachar = null;
    Usuario usuario = null;
    UsuarioDao udao = null;
    private  static  HttpServletResponse resposta;    
   
    //==== doGET ===============================================================
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {    
        String acao = request.getParameter("acao");
        HttpSession  sessao = request.getSession(false);         
                      
        if(sessao != null && sessao.getAttribute("usuarioLogado") != null){
            sessao.removeAttribute("usuarioLogado");
            sessao.invalidate();
            response.sendRedirect("login.jsp");                
        }else{
            response.sendRedirect("login.jsp");                  
        }
    }
    
    //==== doPOST ==============================================================
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        response.setCharacterEncoding("utf-8");               
        String login = request.getParameter("login");
        String senha = request.getParameter("senha");
        String message = "";      
        String msg = "";;
        
        usuario = new Usuario();
        udao = new UsuarioDao();
        GerenciarLogin.resposta = response;        
        
         // === Validação Login ===
        if(login.equals("") || login.isEmpty()){
            request.setAttribute(msg, "Usuário ou senha invalido!");
            request.setAttribute("loginDigitado", login);
            despachar = request.getRequestDispatcher("login.jsp");      // Teste
            despachar.forward(request, response);                       // Teste
            return; // Teste 
        }else{
            usuario.setLogin(login);
        }
        
        // === Validação Senha ===
        if(senha.equals("") || senha.isEmpty()){
            request.setAttribute(msg, "Campo usuário ou senha invalido!");
            request.setAttribute("loginDigitado", login);
            despachar = request.getRequestDispatcher("login.jsp");      // Teste
            despachar.forward(request, response);                       // Teste
            return; // Teste   
        }else{
            usuario.setSenha(senha);
        }
        
        //Buscar Usuario 
        try {
            usuario = udao.getRecuperarUsuario(login);
            if((usuario.getIdUsuario() > 0) && (usuario.getSenha().equals(senha))){  
                // Login Valido
                HttpSession sessao = request.getSession();
                sessao.setAttribute("usuarioLogado", usuario);
                response.sendRedirect("index.jsp");                
            }else{
                // Usuário ou senha inválido
                request.setAttribute("msg", "Usuário ou senha inválido!");  // Teste
                request.setAttribute("loginDigitado", login);               // Teste
                despachar = request.getRequestDispatcher("login.jsp");      // Teste
                despachar.forward(request, response);                       // Teste
            }
        } catch (SQLException erro) {
            // Erro no banco de dados
            request.setAttribute("msg", "Erro: "+erro.getMessage());    // Teste
            request.setAttribute("loginDigitado", login);               // Teste
            despachar = request.getRequestDispatcher("home.jsp");      // Teste
            despachar.forward(request, response);                       // Teste
            erro.printStackTrace(); 
        }              
    }         

    //==========================================================================
    public static Usuario verificarAcesso( HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        GerenciarLogin.resposta = response; 
        Usuario usuario = null;
               
        try {
            HttpSession sessao = request.getSession();
            
            if(sessao.getAttribute("usuarioLogado") == null){
                request.setAttribute("msg", "Usuário não altenticado!");
                response.sendRedirect("login.jsp");
            }else{
                String uri = request.getRequestURI(); // idenciticador universal de recursos
                String queryString = request.getQueryString(); // retorna tudo apos o sinal de ' ? '.
                if(queryString == null){
                    uri += "?" + queryString;                   
                }
                
                usuario = (Usuario)request.getSession().getAttribute("usuarioLogado");
                if(usuario == null){
                    request.setAttribute("msg", "Usuário não altenticado!");
                    response.sendRedirect("login.jsp");
                }else{
                    boolean possuiAcesso = false;
                    for(Menu menu: usuario.getPerfil().getMenus()){
                        if(uri.contains(menu.getLink())){
                            possuiAcesso = true;
                            break;
                        }
                    }                    
                    if(!possuiAcesso){
                        request.setAttribute("msg", "Usuário não altorizado!");
                    }
                }                
            }
                
        } catch (Exception erro) {
            System.out.println("Erro! "+ erro.getMessage());
            erro.printStackTrace();
        }        
        return usuario;        
    } 
    
    //==========================================================================
    //Metodo verifica se um Usuário possui acesso 
    public static boolean verificarPermissao(HttpServletRequest request, HttpServletResponse response)throws IOException, ServletException{
        GerenciarLogin.resposta = response;
        Usuario usuario = new Usuario();
        boolean possuiAcesso = false;
        
        try {
            HttpSession sessao = request.getSession();
            if(sessao.getAttribute("usuarioLogado") == null){
                sessao.setAttribute("msg", "Usuário não altenticado!");
                response.sendRedirect("login.jsp");                
            }else{
                String uri = request.getRequestURI();
                String queryString = request.getQueryString();
                if(queryString != null){
                    uri = uri + "?" + queryString;
                }
                usuario = (Usuario)request.getSession().getAttribute("usuarioLogado");
                if(usuario == null){
                    sessao.setAttribute("msg", "Usuário não altenticado!");
                    response.sendRedirect("login.jsp");
                }else{
                    for(Menu menu: usuario.getPerfil().getMenus()){
                        if(uri.contains(menu.getLink())){
                            possuiAcesso = true;
                            break;
                        }
                    }
                }
            }                       
        } catch (Exception erro) {
            System.out.println("Erro!" +erro.getMessage());
            erro.printStackTrace();
        }
        return possuiAcesso;
    }    
    
    //--------------------------------------------------------------------------
    private void exibirMensage(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        despachar = getServletContext().getNamedDispatcher("/login.jsp");
        despachar.forward(request, response);        
    }    
}
