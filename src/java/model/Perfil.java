package model;
    import java.util.ArrayList;
    import lombok.Getter;
    import lombok.Setter;
    import lombok.AllArgsConstructor;
    import lombok.NoArgsConstructor;
    @Getter
    @Setter
    @AllArgsConstructor
    @NoArgsConstructor

public class Perfil {
    private int idPerfil;
    private String nome; 
    private int status;
    private ArrayList<Menu> menus;
    private ArrayList<Menu> naoMenus;
    
}
