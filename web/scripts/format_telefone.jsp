  
<script type="text/javascript">
    function format_telefone(telefone) {       
        
        let value = telefone.value.replace(/\D/g, '');
        
        // Telefone fixo
        if (value.length <= 10) {
            let g = value.match(/(\d{0,2})(\d{0,4})(\d{0,4})/);
            
            telefone.value =                
                (g[1] ? '(' + g[1] + ')': '')+  /*(DDD)*/
                (g[2] ? ''  + g[2] : '') +             // 1°  4 Dig
                (g[3] ? '-' + g[3] : '');        // 2°  4 Dig
                
        // Telefone Celular        
        }else{
            let g = value.match(/(\d{0,2})(\d{0,5})(\d{0,4})/);
            telefone.value = 
            (g[1]?  '(' + g[1] + ')' : '')+  // (DDD)
            (g[2] ? ''  + g[2] : '') +            // 1º 4 Dig + 9° Dig
            (g[3] ? '-' + g[3] : '' );     // 2º 4 Dig                    
        }
    }
</script>