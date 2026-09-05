<%-- 
    Document   : habilitaCampo
    Created on : 7 de nov. de 2025
    Author     : Heraldo
--%>

<script>
    function habilitarCampo(id,checkbox) {
        const campo = document.getElementById(id);
        const botao = document.getElementById('nome');

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

