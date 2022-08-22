-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 22/08/2022 às 11:54
-- Versão do servidor: 5.6.41-84.1
-- Versão do PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `stark316_pr`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `Clientes`
--

CREATE TABLE `Clientes` (
  `Cli_Codigo` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Cli_Nome` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Cli_Cpf` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Cli_Rg` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Cli_Mae` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Cli_Pai` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Despejando dados para a tabela `Clientes`
--

INSERT INTO `Clientes` (`Cli_Codigo`, `Cli_Nome`, `Cli_Cpf`, `Cli_Rg`, `Cli_Mae`, `Cli_Pai`) VALUES
('2', '1', '1', '1', '1', '1'),
('3', '1', '1', '1', '1', '1'),
('4', '1', '1', '1', '1', '1'),
('teste', '1', '1', '1', '1', '1');

-- --------------------------------------------------------

--
-- Estrutura para tabela `Enderecos`
--

CREATE TABLE `Enderecos` (
  `Endereco_CliCodigo` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Endereco_Cep` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `Endereco_Endereco` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Endereco_Numero` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Endereco_Cidade` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Endereco_Estado` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Despejando dados para a tabela `Enderecos`
--

INSERT INTO `Enderecos` (`Endereco_CliCodigo`, `Endereco_Cep`, `Endereco_Endereco`, `Endereco_Numero`, `Endereco_Cidade`, `Endereco_Estado`) VALUES
('teste', '09812480', 'Rua Tereza Breda Marson', '20', 'São Bernardo do Campo', 'SP');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `Clientes`
--
ALTER TABLE `Clientes`
  ADD PRIMARY KEY (`Cli_Codigo`);

--
-- Índices de tabela `Enderecos`
--
ALTER TABLE `Enderecos`
  ADD KEY `Enderecos_1` (`Endereco_CliCodigo`);

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `Enderecos`
--
ALTER TABLE `Enderecos`
  ADD CONSTRAINT `Enderecos_1` FOREIGN KEY (`Endereco_CliCodigo`) REFERENCES `Clientes` (`Cli_Codigo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
