<%-- 
    Document   : exibir_senha
    Created on : 26 de mar. de 2026
    Author     : Heraldo
--%>
<script>
function exibirSenha(icon) {
    const input = icon.previousElementSibling;

    if (input.type === "password") {
        input.type = "text";
        icon.classList.replace("fa-eye", "fa-eye-slash");
    } else {
        input.type = "password";
        icon.classList.replace("fa-eye-slash", "fa-eye");
    }
}
</script>