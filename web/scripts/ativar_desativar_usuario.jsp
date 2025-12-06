<%-- 
    Document   : ativar_desativar_usuario
    Created on : 5 de dez. de 2025
    Author     : Heraldo
--
    <script type="text/javascript">
        function confirmAtivar(id, nome){
            if(confirm('Deseja Ativar o Usuario ' +
                nome+ '?')){
            location.href="gerenciarUsuario?acao=ativar&idUsuario="+id;      
            setTimeout(() => location.reload(), 500);            }                                        
        }          
        function confirmDesativar(id, nome){
            if(confirm('Deseja desativar  o Usuario ' +
                    nome + '?')){
                location.href="gerenciarUsuario?acao=desativar&idUsuario="+id;
                setTimeout(() => location.reload(), 500);
            } 
        }                                 
    </script>     --%>
    
    <script type="text/javascript">
        function confirmAtivar(id){           
            location.href="gerenciarUsuario?acao=ativar&idUsuario="+id;      
            setTimeout(() => location.reload(), 500);  
        }                                        
                 
        function confirmDesativar(id){            
            location.href="gerenciarUsuario?acao=desativar&idUsuario="+id;
            setTimeout(() => location.reload(), 500);
        }                                        
    </script>     