<%-- 
    Document   : script_ativar_desativar_menu
    Created on : 29 de out. de 2023, 15:40:26
    Author     : Heraldo
--%>

   <script type="text/javascript">
        function confirmDesativar(id){        
            location.href="gerenciarMenu?acao=desativar&idMenu="+id;
        }                                    
        function confirmAtivar(id){           
            location.href="gerenciarMenu?acao=ativar&idMenu="+id;              
        }                                    
    </script>   