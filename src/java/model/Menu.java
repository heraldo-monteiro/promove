package model;
    import lombok.Getter;
    import lombok.Setter;
    import lombok.AllArgsConstructor;
    import lombok.NoArgsConstructor;
    @Getter
    @Setter
    @AllArgsConstructor
    @NoArgsConstructor

public class Menu {
    private int idMenu;
    private String nome;
    private String link;
    private int exibir;
    private int status;
    
}
