<%-- 
    Document   : altivar_desativar_perfil
    Created on : 07 de nov. de 2025
    Author     : Heraldo
--%>

    <script type="text/javascript">
        function confirmDesativar(id, nome){
            if(confirm('Deseja desativar  o Menu ' +
                    nome + '?')){
                location.href="gerenciarMenu?acao=desativar&idMenu="+id;
                setTimeout(() => location.reload(), 500);
            } 
        }                                    
        function confirmAtivar(id, nome){
            if(confirm('Deseja Ativar o Menu ' +
                nome+ '?')){
            location.href="gerenciarMenu?acao=ativar&idMenu="+id;      
            setTimeout(() => location.reload(), 500);
            }                                        
        }                                    
    </script>     