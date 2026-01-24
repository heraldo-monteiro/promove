
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

@WebServlet(name = "GerenciarCadastro", urlPatterns = {"/gerenciarCadastro"})
public class GerenciarCadastro extends HttpServlet {
    UsuarioDao udao = null;
    Usuario usuario = null;   
    RequestDispatcher despachar = null;
    Date dataSql = null;

    
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
        usuario.setStatus(1);  
    } else {
        usuario.setStatus(Integer.parseInt(status));
    }

    // Perfil
    Perfil perfil = new Perfil();
    if (idPerfil == null || idPerfil.trim().isEmpty()) {          
        perfil.setIdPerfil(5);
        usuario.setPerfil(perfil);      
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
        "location.href='home.jsp';" +
        "</script>"
    );
}

    
    
    //==========================================================================
    private void exibirMensage(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        despachar = getServletContext().getNamedDispatcher("/cadastrarUsuario.jsp");
        despachar.forward(request, response);        
    }

}
