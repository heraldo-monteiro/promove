package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Cliente;
import persistence.ClienteDao;

@WebServlet(name = "GerenciarCliente", urlPatterns = {"/gerenciarCliente"})
public class GerenciarCliente extends HttpServlet {

    RequestDispatcher dispatcher = null;
    ClienteDao cdao = null;
    Cliente cliente = null;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        response.setCharacterEncoding("utf-8");

        String acao = request.getParameter("acao");
        String idCliente = request.getParameter("idCliente");
        String message = "";

        cdao = new ClienteDao();
        cliente = new Cliente();

        try {
            // Listar ----------------------------------------------------------
            if (acao.equals("listar")) {
                ArrayList<Cliente> clientes = new ArrayList<>();
                clientes = cdao.getListarCliente();
                dispatcher = getServletContext().getRequestDispatcher("/listarCliente.jsp");
                request.setAttribute("clientes", clientes);
                dispatcher.forward(request, response);

                // Alterar ---------------------------------------------------------
            } else if (acao.equals("alterar")) {
                cliente = cdao.getCarregarCliente(Integer.parseInt(idCliente));
                if (cliente.getIdCliente() > 0) {
                    dispatcher = getServletContext().getRequestDispatcher("/cadastrarCliente.jsp");
                    request.setAttribute("cliente", cliente);
                    dispatcher.forward(request, response);

                } else {
                    message = "Cliente não encontrado na base de dados!";
                }

                // Ativar ----------------------------------------------------------
            } else if (acao.equals("ativar")) {
                cliente.setIdCliente(Integer.parseInt(idCliente));
                if (cdao.ativarCliente(cliente)) {
                    message = "Cliente ativado com sucesso!";
                } else {
                    message = "Falha ao ativar este cliente!";
                }

                // Desativar -------------------------------------------------------
            } else if (acao.equals("desativar")) {
                cliente.setIdCliente(Integer.parseInt(idCliente));
                if (cdao.desativarCliente(cliente)) {
                    message = "Cliente desativado com sucesso!";
                } else {
                    message = "Falha ao desativar este cliente!";
                }

                //------------------------------------------------------------------                    
            } else {
                response.sendRedirect("index.jsp");
            }

        } catch (SQLException erro) {
            message = "Erro!:" + erro.getMessage();
            erro.printStackTrace();
        }

        out.println(
            "<script type='text/javascript'>"+
                 "alert('" + message + "');"+
                 "location.href='gerenciarCliente?acao=listar';"+
            "</script>"
        );
    }

    //==========================================================================
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        response.setCharacterEncoding("utf-8");

        String idCliente = request.getParameter("idCliente");
        String nome = request.getParameter("nome");
        String cpf_cnpj = request.getParameter("cpf_cnpj");
        String email = request.getParameter("email");
        String telefone = request.getParameter("telefone");
        String status = request.getParameter("status");
        String message = "";
        String msg = "";

        cliente = new Cliente();
        cdao = new ClienteDao();

        // idCliente
        if (!idCliente.isEmpty()) {
            cliente.setIdCliente(Integer.parseInt(idCliente));
        }

        /*----------------------------------------------------------------------
          - Nome */
        if (nome.equals("") || nome.isEmpty()) {
            request.setAttribute("msg", "Informe o nome do cliente!");
            exibirMessage(request, response);

        } else {
            cliente.setNome(nome);
        }

        /*----------------------------------------------------------------------
          - Cpf_Cnpj */
        if (cpf_cnpj.equals("") || cpf_cnpj.isEmpty()) {
            request.setAttribute("msg", "Informe o CPF ou CNPJ do cliente!");
            exibirMessage(request, response);
        } else {
            cliente.setCpf_cnpj(cpf_cnpj);
        }

        /*----------------------------------------------------------------------
          - Email */
        if (email.equals("") || email.isEmpty()) {
            request.setAttribute("msg", "Informe o endereço de email!");
            exibirMessage(request, response);
        } else {
            cliente.setEmail(email);
        }

        /*----------------------------------------------------------------------
          - Telefone */
        if (telefone.equals("") || telefone.isEmpty()) {
            request.setAttribute("msg", "Informe um mumero de contato!");
            exibirMessage(request, response);
        } else {
            cliente.setTelefone(telefone);
        }

        /*----------------------------------------------------------------------
          - Status */
        if (status.equals("") || status.isEmpty()) {
            request.setAttribute("msg", "Preencha o status do cliente");
            exibirMessage(request, response);
        } else {
            cliente.setStatus(Integer.parseInt(status));
        }

        /*======================================================================
        - CADASTRO DE CLIENTE    */
        try {
            if (cdao.registrarCliente(cliente)) {
                message = "Registro salvo com sucesso!";
            } else {
                message = "Erro!:  Falha ao salvar o registro!";
            }

        } catch (SQLException erro) {
            message = "Erro!: " + erro.getMessage();
            erro.printStackTrace();
        }

        out.println(
                "<script type='text/javascript'>"
                + "alert('" + message + "');"
                + "location.href='gerenciarCliente?acao=listar';"
                + "</script>"
        );
    }

    /*==========================================================================
    - MENSSAGENS
     */
    private void exibirMessage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/cadastrarCliente.jsp");
        dispatcher.forward(request, response);

    }

}
