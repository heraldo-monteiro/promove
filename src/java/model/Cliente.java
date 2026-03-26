package model;
    import lombok.Getter;
    import lombok.Setter;
    import lombok.AllArgsConstructor;
    import lombok.NoArgsConstructor;
    @Getter
    @Setter
    @AllArgsConstructor
    @NoArgsConstructor
    
public class Cliente {
   private int idCliente;
   private String nome;
   private String cpf_cnpj;
   private String email;
   private String telefone;
   private int status;
   private Usuario usuario;
        
}
