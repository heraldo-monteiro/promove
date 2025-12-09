<%-- 
    Document   : altivar_desativar_perfil
    Created on : 07 de nov. de 2025
    Author     : Heraldo
--%>

    <script type="text/javascript">
        function confirmDesativar(id, nome){
            if(confirm('Deseja desativar  o Perfil ' +nome + '?')){
                location.href="gerenciarPerfil?acao=desativar&idPerfil="+id;      
            } 
        }                                    
        function confirmAtivar(id, nome){
            if(confirm('Deseja Ativar o Perfil ' +nome+ '?')){
            location.href="gerenciarPerfil?acao=ativar&idPerfil="+id;     
            }                                        
        }                                    
    </script>     