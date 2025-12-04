SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS `menu`;
DROP TABLE IF EXISTS `menu_perfil`;
DROP TABLE IF EXISTS `usuario`;
DROP TABLE IF EXISTS `perfil`;

CREATE TABLE `menu` (
  `idMenu` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(64) NOT NULL,
  `link` varchar(128) NOT NULL,
  `exibir` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`idMenu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `menu` VALUES
	(1,'Menu','gerenciarMenu?acao=listar',1,1),
	(2,'Perfil','gerenciarPerfil?acao=listar',1,1),
	(3,'Usuario','gerenciarUsuario?acao=listar',1,1);

CREATE TABLE `perfil` (
  `idPerfil` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(64) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`idPerfil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `perfil` VALUES (1,'Administrador',1);

CREATE TABLE `menu_perfil` (
  `idMenu` int(11) NOT NULL,
  `idPerfil` int(11) NOT NULL,
  PRIMARY KEY (`idMenu`,`idPerfil`),
  CONSTRAINT `fk_Menu_has_Perfil_Menu`
      FOREIGN KEY (`idMenu`) REFERENCES `menu` (`idMenu`) ON UPDATE CASCADE,
  CONSTRAINT `fk_Menu_has_Perfil_Perfil1`
      FOREIGN KEY (`idPerfil`) REFERENCES `perfil` (`idPerfil`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `menu_perfil` VALUES
(1,1),(2,1),(3,1);

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `dataCadastro` date NOT NULL,
  `nome` varchar(128) NOT NULL,
  `login` varchar(32) NOT NULL,
  `senha` varchar(254) NOT NULL,
  `status` int(11) NOT NULL,
  `idPerfil` int(11) NOT NULL,
  PRIMARY KEY (`idUsuario`),
  KEY `fk_Usuario_Perfil1_idx` (`idPerfil`),
  CONSTRAINT `fk_Usuario_Perfil1`
      FOREIGN KEY (`idPerfil`) REFERENCES `perfil` (`idPerfil`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `usuario` VALUES
(1,'2025-10-10','Adm','admin','admin',1,1);

SET FOREIGN_KEY_CHECKS=1;
