
<header>
    <button onclick="abrirLogin()">Agendar</button>
    <div id="overlay"></div>

    <div id="loginBox">
        <form action="gerenciarLogin" method="POST">
            <div class="rs">  
            <h2>Acesso à Conta</h2>
            <button class="fechar" onclick="fecharLogin()"> X </button>
            </div>

            <input type="text" 
                   name="login" 
                   value="${loginDigitado}"
                   placeholder="Usuário ou Email" />
            
            <input type="password" 
                   name="senha"                  
                   placeholder="Digite sua senha!" />
            <button>Entrar</button>   
      </form>
    </div>
</header>


