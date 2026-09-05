<%-- 
    Document   : ativar_desativar_usuario
    Created on : 5 de dez. de 2025
    Author     : Heraldo
--%>

    
    <script type="text/javascript">
        function confirmAtivar(id){           
            location.href="gerenciarUsuario?acao=ativar&idUsuario="+id;   
        }                                        
                 
        function confirmDesativar(id){            
            location.href="gerenciarUsuario?acao=desativar&idUsuario="+id;
        }                                        
    </script>     