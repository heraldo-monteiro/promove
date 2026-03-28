
<script type="text/javascript">
    function format_cpf_cnpj(input) {
        let value = input.value.replace(/\D/g, '');
        
        //===== Formatar CPF ===================================================
        if (value.length <= 11) {
            let g = value.match(/(\d{0,3})(\d{0,3})(\d{0,3})(\d{0,2})/);
            input.value = 
                g[1]  +
                (g[2] ? '.' + g[2]: '') +
                (g[3] ? '.' + g[3]: '') + 
                (g[4] ? '-' + g[4]: '');            
        
        //===== Formatar CNPJ ==================================================
        }else {
            let g = value.match(/(\d{0,2})(\d{0,3})(\d{0,3})(\d{0,4})(\d{0,2})/);
            input.value = 
                g[1]  +
                (g[2] ? '.' + g[2]: '')+
                (g[3] ? '.' + g[3]: '')+
                (g[4] ? '/' + g[4]: '')+
                (g[5] ? '-' + g[5]: '');            
        }       
    }
</script>