<script type="text/javascript">
    function desvincular_Menu(idMenu, nome, idPerfil){
        if(confirm("Deseja desvincular o ( "+ nome +" )?")){
           location.href="gerenciarMenuPerfil?acao=desvincular&idMenu="+idMenu+"&idPerfil="+idPerfil;
        }
    }
</script>