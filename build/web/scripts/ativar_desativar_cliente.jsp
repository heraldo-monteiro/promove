<%-- 
    Document   : ativar_desativar_cliente
    Created on : 12 de jun. de 2026
    Author     : Heraldo
--%>
<script type="text/javascript">
    function confirmAtivar(id) {
        location.href="gerenciarCliente?acao=ativar&idCliente="+id;
    }
    
    function confirmDesativar(id){
        location.href="gerenciarCliente?acao=desativar&idCliente="+id;
    }

</script>