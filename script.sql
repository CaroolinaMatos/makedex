-- Script MySQL (InnoDB, utf8mb4)
-- Remove tabelas se já existirem (ordem respeitando FK)
DROP TABLE IF EXISTS `Maquiagem`;
DROP TABLE IF EXISTS `Tipo`;

-- Tabela Tipo
CREATE TABLE `Tipo` (
  `Id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(30) NOT NULL,
  `Cor` VARCHAR(25),
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tabela Maquiagem
CREATE TABLE `Maquiagem` (
  `Numero` INT UNSIGNED NOT NULL,
  `Nome` VARCHAR(30) NOT NULL,
  `Descricao` VARCHAR(1000),
  `TipoId` INT UNSIGNED NOT NULL,
  `valor` DOUBLE(7,3) NOT NULL,
  `Imagem` VARCHAR(200),
  PRIMARY KEY (`Numero`),
  INDEX `IX_Maquiagem_TipoId` (`TipoId`),
  CONSTRAINT `FK_Maquiagem_Tipo`
    FOREIGN KEY (`TipoId`) REFERENCES `Tipo` (`Id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Popula Tipo
INSERT INTO `Tipo` (`Id`, `Nome`, `Cor`) VALUES
(1, 'Batom', 'Vermelho'),
(2, 'Base', 'Bege'),
(3, 'Rímel', 'Preto'),
(4, 'Sombra', 'Marrom'),
(5, 'Delineador', 'Preto'),
(6, 'Blush', 'Rosado');

-- Popula Maquiagem (Numero não é auto-increment -- valores explícitos)
INSERT INTO `Maquiagem` (`Numero`, `Nome`, `Descricao`, `TipoId`, `valor`, `Imagem`) VALUES
(1001, 'Batom Cremoso Classic', 'Batom com acabamento cremoso e alta cobertura.', 1, 29.990, 'batom_classic.jpg'),
(1002, 'Base Líquida Fit', 'Base líquida oil-free com acabamento matte e FPS 15.', 2, 49.900, 'base_fit.jpg'),
(1003, 'Rímel Volume Max', 'Máscara para cílios que dá volume extremo.', 3, 35.500, 'rímel_volume_max.jpg'),
(1004, 'Paleta Terra Nude', 'Paleta 12 cores neutras perfeita para dia a dia.', 4, 79.990, 'paleta_terra_nude.jpg'),
(1005, 'Delineador Precision', 'Delineador com ponta fina e longa duração.', 5, 24.750, 'delineador_precision.jpg'),
(1006, 'Blush Compact Rosé', 'Blush compacto com pigmentação suave.', 6, 22.300, 'blush_rose.jpg'),
(1007, 'Batom Matte Longa Duração', 'Batom matte com ótima fixação e alta pigmentação.', 1, 34.990, 'batom_matte_ld.jpg'),
(1008, 'Base Hidratante', 'Base com efeito hidratante para peles secas.', 2, 55.125, 'base_hidratante.jpg');

-- Exemplos de consulta
SELECT m.Numero, m.Nome, t.Nome AS Tipo, m.valor
FROM Maquiagem m
JOIN Tipo t ON m.TipoId = t.Id
ORDER BY m.Numero;
