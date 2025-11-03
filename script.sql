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
(7, 'Pó', 'Trsnlucido');
(8, 'Iluminador', 'Rosa');
(9, 'Corretivo', 'Nude');
(10, 'Primer', 'Glow');

-- Popula Maquiagem (Numero não é auto-increment -- valores explícitos)
INSERT INTO `Maquiagem` (`Numero`, `Nome`, `Descricao`, `TipoId`, `valor`, `Imagem`) VALUES
(1001, 'Batom Cremoso  - Natura Faces', 'Batom com acabamento cremoso e alta cobertura.', 1, 29.990, 'batom_classic.jpeg'),
(1002, 'Base Líquida - Oceane', 'Base líquida oil-free com acabamento matte.', 2, 49.900, 'base_fit.jpeg'),
(1003, 'Rímel Oceane - Volume Lash', 'Máscara para cílios que dá volume extremo.', 3, 35.500, 'rímel_volume_max.jpeg'),
(1004, 'Paleta Huda Beauty - Nude', 'Paleta 18 cores neutras perfeita para dia a dia.', 4, 79.990, 'paleta_terra_nude.jpeg'),
(1005, 'Delineador Nath Capelo', 'Delineador com ponta fina e longa duração.', 5, 24.750, 'delineador_precision.jpeg'),
(1006, 'Blush Orgasm - Nars', 'Blush compacto com pigmentação suave.', 6, 22.300, 'blush_rose.jpeg'),
(1007, 'Batom Matte - Natura', 'Batom matte com ótima fixação e alta pigmentação.', 1, 34.990, 'batom_matte_ld.jpeg'),
(1008, 'Base Quem Disse, Berenice?', 'Base com efeito hidratante para peles secas.', 2, 55.125, 'base_hidratante.jpeg');
(1009, 'Pó Translucido - Laura Mercier', 'cabamento impecável, controlando a oleosidade e deixando a pele com uma aparência matte e natural. Ideal para todos os tons de pele, ele não altera a cor da maquiagem, mas proporciona a fixação necessária para que ela permaneça intacta durante horas..', 7, 220,00, 'po_translucido.jpeg');
(1010, 'Iluminador Rare Bauty', 'Desenvolvido para realçar a beleza natural de todas as peles, este blush oferece uma fórmula inovadora e desempenho excepcional..', 8, 215,00, 'rare_iluminador.jpeg');
(1011, 'Corretivo All Hours', 'Corretivo fluído cremoso, sem vincos e edificável para cobertura total de até 24H* e acabamento fosco luminoso.', 9, 339,00, 'corretivo.jpeg');
(1012, 'Primer Niina Secrets', 'O Primer Hidra Glow de Niina Secrets, proporciona uma pele iluminada instantaneamente. A exclusiva Tecnologia Secrets, possui uma combinação de diferentes ativos que auxiliam na melhora da aparência da pele, disfarçando poros, linhas de expressão, sensação de pele hidratada e radiante sem pesar ou deixar a pele oleosa. Um Glow irresistível à sua pele!.', 10, 60,00, 'primer.jpeg');
