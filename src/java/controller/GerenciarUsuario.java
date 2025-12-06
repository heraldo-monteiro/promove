
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Date;
import java.util.*;
import java.text.SimpleDateFormat;
import java.text.ParseException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Perfil;
import model.Usuario;
import persistence.UsuarioDao;

@WebServlet(name = "GerenciarUsuario", urlPatterns = {"/gerenciarUsuario"})
public class GerenciarUsuario extends HttpServlet {
    UsuarioDao udao = null;
    Usuario usuario = null;   
    RequestDispatcher despachar = null;
    Date dataSql = null;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        response.setCharacterEncoding("utf-8");
        String acao = request.getParameter("acao");
        String idUsuario = request.getParameter("idUsuario");
        String message = "";        
        udao = new UsuarioDao();
        usuario = new Usuario();
        
        try {
            if(acao.equals("listar")){
                ArrayList<Usuario> usuarios = new ArrayList<>();
                usuarios = udao.getListarUsuario();
                despachar = getServletContext().getRequestDispatcher("/listarUsuario.jsp");
                request.setAttribute("usuarios", usuarios);
                despachar.forward(request, response);
                
            }else if(acao.equals("alterar")){                
                usuario = udao.getCarregarUsuario(Integer.parseInt(idUsuario));
                if(usuario.getIdUsuario() > 0){
                    despachar = getServletContext().getRequestDispatcher("/cadastrarUsuario.jsp");
                    request.setAttribute("usuario", usuario);
                    despachar.forward(request, response);
                    exibirMensage(request, response);
                }else{
                    message = "Usuário não encontrado!";
                }     
            //Ativar
            }else if(acao.equals("ativar")){
                usuario.setIdUsuario(Integer.parseInt(idUsuario));
                if(udao.ativarUsuario(usuario)){
                    response.sendRedirect("gerenciarUsuario?acao=listar");
                }else{
                    message = "Falha ao ativar o Usuário!";
                }
                
            //Desativar
            }else if(acao.equals("desativar")){
                usuario.setIdUsuario(Integer.parseInt(idUsuario));
                if(udao.desativarUsuario(usuario)){
                     response.sendRedirect("gerenciarUsuario?acao=listar");
                }else{
                    message = "Falha ao Desativar o Usuário!";
                }                
            }else{
                response.sendRedirect("index.jsp");
            }
            
            
        } catch (SQLException erro) {
            message = "Erro!"+erro.getMessage();
            erro.printStackTrace();
        }
           /*     
        out.print(
            "<script type='text/javascript'>"+
                "alert('"+message+"');"+
                "location.href='gerenciarUsuario?acao=listar';"+
            "</script>"
        ); 
       */
    }    
    
    @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {    
    response.setContentType("text/html;charset=UTF-8");
    PrintWriter out = response.getWriter(); 
    String idUsuario = request.getParameter("idUsuario");
    String dataCadastro = request.getParameter("dataCadastro");
    String nome = request.getParameter("nome");
    String login = request.getParameter("login");
    String senha = request.getParameter("senha");
    String status = request.getParameter("status");
    String idPerfil = request.getParameter("idPerfil");

    usuario = new Usuario();
    udao = new UsuarioDao();

    // 
    if (idUsuario != null && !idUsuario.isEmpty()) {
        usuario.setIdUsuario(Integer.parseInt(idUsuario));
    }

    //  Nome
    if (nome == null || nome.trim().isEmpty()) {
        request.setAttribute("msg", "Nome do usuário não informado!");
        exibirMensage(request, response);
        return;
    } else {
        usuario.setNome(nome);
    }

    // Data de Cadastro
    java.sql.Date dataSql;
    if (dataCadastro == null || dataCadastro.isEmpty()) {
        // cria data atual
        dataSql = new java.sql.Date(System.currentTimeMillis());
    } else {
        // tenta converter a data do formulário (se vier)
        try {
            java.util.Date utilDate = java.sql.Date.valueOf(dataCadastro);
            dataSql = new java.sql.Date(utilDate.getTime());
        } catch (IllegalArgumentException e) {
            // se formato inválido, usa data atual
            dataSql = new java.sql.Date(System.currentTimeMillis());
        }
    }
    usuario.setDataCadastro(dataSql);

    // Login
    if (login == null || login.trim().isEmpty()) {
        request.setAttribute("msg", "Login não informado!");
        exibirMensage(request, response);
        return;
    } else {
        usuario.setLogin(login);
    }

    // Senha
    if (senha == null || senha.trim().isEmpty()) {
        request.setAttribute("msg", "Senha não informada!");
        exibirMensage(request, response);
        return;
    } else {
        usuario.setSenha(senha);
    }

    // Status
    if (status == null || status.trim().isEmpty()) {
        request.setAttribute("msg", "Status não informado!");
        exibirMensage(request, response);
        return;
    } else {
        usuario.setStatus(Integer.parseInt(status));
    }

    // Perfil
    Perfil perfil = new Perfil();
    if (idPerfil == null || idPerfil.trim().isEmpty()) {
        request.setAttribute("msg", "Perfil não informado!");
        exibirMensage(request, response);
        return;
    } else {
        perfil.setIdPerfil(Integer.parseInt(idPerfil));
        usuario.setPerfil(perfil);
    }

   
    String message;
    try {
        if (udao.registrarUsuario(usuario)) {
            message = "Usuário registrado com sucesso!";
        } else {
            message = "Falha ao registrar o usuário. Tente novamente mais tarde.";
        }
    } catch (SQLException erro) {
        message = "Erro ao salvar: " + erro.getMessage();
        erro.printStackTrace();
    }

    out.print(
        "<script type='text/javascript'>" +
        "alert('" + message + "');" +
        "location.href='gerenciarUsuario?acao=listar';" +
        "</script>"
    );
}

    
    
    //==========================================================================
    private void exibirMensage(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        despachar = getServletContext().getNamedDispatcher("/cadastrarUsuario.jsp");
        despachar.forward(request, response);        
    }

}
