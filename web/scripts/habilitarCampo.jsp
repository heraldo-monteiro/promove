<%-- 
    Document   : habilitaCampo
    Created on : 7 de nov. de 2025
    Author     : Heraldo
--%>

<script>
    function habilitarCampo(idCampo, checkbox) {
        const campo = document.getElementById(idCampo);
        const botao = document.getElementById('botao_nome');

        if (checkbox.checked) {
            campo.removeAttribute('readonly');
            botao.classList.add('ativo');
            botao.lastChild.textContent = ' Desabilitar';
        } else {
            campo.setAttribute('readonly', true);
            botao.classList.remove('ativo');
            botao.lastChild.textContent = ' Habilitar';
        }
    }
</script>

