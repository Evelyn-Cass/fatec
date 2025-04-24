-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 04-Dez-2024 às 13:42
-- Versão do servidor: 10.4.21-MariaDB
-- versão do PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `receita`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `chef`
--

CREATE TABLE `chef` (
  `idchef` int(10) UNSIGNED NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `especialidade` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `chef`
--

INSERT INTO `chef` (`idchef`, `nome`, `especialidade`) VALUES
(1, 'Renata Alencar', 'Doces'),
(2, 'João Riaga', 'Massas'),
(3, 'Yuri Hagamoto', 'Comidas Japonesas');

-- --------------------------------------------------------

--
-- Estrutura da tabela `receita`
--

CREATE TABLE `receita` (
  `idreceita` int(10) UNSIGNED NOT NULL,
  `idchef` int(10) UNSIGNED NOT NULL,
  `nome` varchar(80) DEFAULT NULL,
  `descricao` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `receita`
--

INSERT INTO `receita` (`idreceita`, `idchef`, `nome`, `descricao`) VALUES
(2, 3, 'Sushi', 'Sushi de Cream Cheese'),
(3, 1, 'Choux Cream', 'Recheio de creme patisserie'),
(4, 2, 'Macarrão', 'Macarrão ao molho sugo'),
(8, 1, 'Brigadeiro', 'Brigadeiro de leite ninho'),
(9, 2, 'Nhoque', 'Nhoque ao molho madeira'),
(10, 3, 'Temaki', 'Temaki Frito');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `chef`
--
ALTER TABLE `chef`
  ADD PRIMARY KEY (`idchef`);

--
-- Índices para tabela `receita`
--
ALTER TABLE `receita`
  ADD PRIMARY KEY (`idreceita`),
  ADD KEY `receita_FKIndex1` (`idchef`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `chef`
--
ALTER TABLE `chef`
  MODIFY `idchef` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `receita`
--
ALTER TABLE `receita`
  MODIFY `idreceita` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `receita`
--
ALTER TABLE `receita`
  ADD CONSTRAINT `receita_ibfk_1` FOREIGN KEY (`idchef`) REFERENCES `chef` (`idchef`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
