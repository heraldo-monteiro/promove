package model;
import java.util.Date;
    import lombok.Getter;
    import lombok.Setter;
    import lombok.AllArgsConstructor;
    import lombok.NoArgsConstructor;
    @Getter
    @Setter
    @AllArgsConstructor
    @NoArgsConstructor

public class Usuario {
    private int idUsuario;
    private Date dataCadastro;
    private String nome;
    private String login;
    private String senha;
    private int status;
    private Perfil perfil;   
     
}
