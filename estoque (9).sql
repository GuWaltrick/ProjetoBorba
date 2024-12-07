-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 06/12/2024 às 22:59
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `estoque`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `almoxarifados`
--

CREATE TABLE `almoxarifados` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `almoxarifados`
--

INSERT INTO `almoxarifados` (`id`, `nome`) VALUES
(1, 'Almoxarifado Principal'),
(2, 'Almoxarifado Secundário');

-- --------------------------------------------------------

--
-- Estrutura para tabela `estoque`
--

CREATE TABLE `estoque` (
  `id` int(11) NOT NULL,
  `data_validade` date DEFAULT NULL,
  `localizacao_id` int(11) DEFAULT NULL,
  `quantidade` int(11) NOT NULL DEFAULT 0,
  `produto_id` int(11) NOT NULL,
  `data_movimentacao` datetime DEFAULT current_timestamp(),
  `tipo_movimentacao` enum('entrada','saida','uso_interno') NOT NULL,
  `lote` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `estoque`
--

INSERT INTO `estoque` (`id`, `data_validade`, `localizacao_id`, `quantidade`, `produto_id`, `data_movimentacao`, `tipo_movimentacao`, `lote`) VALUES
(44, NULL, 1, 0, 20, '2024-11-30 10:22:55', 'entrada', NULL),
(45, NULL, 1, 50, 21, '2024-11-30 10:22:55', 'entrada', NULL),
(46, NULL, 1, 145, 22, '2024-11-30 10:22:55', 'entrada', NULL),
(47, NULL, 1, 0, 23, '2024-11-30 10:22:55', 'entrada', NULL),
(48, NULL, 1, 0, 24, '2024-11-30 10:22:55', 'entrada', NULL),
(49, NULL, 1, 0, 25, '2024-11-30 10:22:55', 'entrada', NULL),
(50, NULL, 1, -23, 26, '2024-11-30 10:22:55', 'entrada', NULL),
(51, NULL, 1, 0, 27, '2024-11-30 10:22:55', 'entrada', NULL),
(53, NULL, 2, 151, 24, '2024-11-30 10:22:55', 'entrada', NULL),
(55, NULL, 3, 10, 27, '2024-11-30 10:22:55', 'entrada', NULL),
(56, NULL, 3, 24, 26, '2024-11-30 10:22:55', 'entrada', NULL),
(58, NULL, 2, 45, 23, '2024-11-30 10:22:55', 'entrada', NULL),
(60, NULL, 2, 80, 20, '2024-11-30 10:22:55', 'entrada', NULL),
(61, NULL, 3, 115, 20, '2024-11-30 10:22:55', 'entrada', NULL),
(62, NULL, 2, 50, 21, '2024-11-30 10:22:55', 'entrada', NULL),
(63, NULL, 2, 463, 22, '2024-11-30 10:22:55', 'entrada', NULL),
(64, NULL, 3, 50, 21, '2024-11-30 10:22:55', 'entrada', NULL),
(70, NULL, 3, 10, 22, '2024-11-30 11:24:47', 'entrada', NULL),
(71, NULL, 1, 150, 28, '2024-11-30 14:45:06', 'entrada', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `itens_solicitados`
--

CREATE TABLE `itens_solicitados` (
  `id` int(11) NOT NULL,
  `solicitacao_id` int(11) NOT NULL,
  `produto_id` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `quantidade_enviada` int(11) DEFAULT 0,
  `status` enum('pendente','enviado','confirmado') DEFAULT 'pendente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `localizacao`
--

CREATE TABLE `localizacao` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `descricao` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `localizacao`
--

INSERT INTO `localizacao` (`id`, `nome`, `descricao`) VALUES
(1, NULL, 'Estoque Principal'),
(2, NULL, 'Almoxarifado 1'),
(3, NULL, 'Almoxarifado 2'),
(4, 'Estoque Principal', 'Local onde são mantidos os produtos principais.'),
(5, 'Almoxarifado 1', 'Primeiro almoxarifado para armazenamento de produtos.'),
(6, 'Almoxarifado 2', 'Segundo almoxarifado para armazenamento de produtos.');

-- --------------------------------------------------------

--
-- Estrutura para tabela `lotes`
--

CREATE TABLE `lotes` (
  `id` int(11) NOT NULL,
  `produto_id` int(11) DEFAULT NULL,
  `numero_lote` varchar(50) DEFAULT NULL,
  `data_fabricacao` date DEFAULT NULL,
  `data_validade` date DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `lotes`
--

INSERT INTO `lotes` (`id`, `produto_id`, `numero_lote`, `data_fabricacao`, `data_validade`, `quantidade`) VALUES
(1, 20, 'Lote000', NULL, '2024-12-03', 60),
(2, 20, 'Lote000', NULL, '2024-12-07', 10),
(3, 20, 'Lote000', NULL, '2024-12-07', 10),
(4, 20, 'Lote000', NULL, '2024-12-07', 10),
(5, 20, 'Lote000', NULL, '2024-12-07', 10),
(6, 20, 'Lote000', NULL, '2024-12-07', 10),
(7, 21, 'lote500', NULL, '2024-12-02', 50);

-- --------------------------------------------------------

--
-- Estrutura para tabela `movimentacoes`
--

CREATE TABLE `movimentacoes` (
  `id` int(11) NOT NULL,
  `nf` varchar(50) NOT NULL,
  `produto_id` int(11) NOT NULL,
  `lote` varchar(50) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `tipo` enum('entrada','saida','transferencia') NOT NULL,
  `motivo` varchar(255) DEFAULT NULL,
  `usuario` varchar(50) NOT NULL,
  `numero_nf` int(11) NOT NULL,
  `data_movimentacao` timestamp NOT NULL DEFAULT current_timestamp(),
  `estoque_origem_id` int(11) DEFAULT NULL,
  `estoque_destino_id` int(11) DEFAULT NULL,
  `observacao` varchar(255) DEFAULT NULL,
  `status` enum('pendente','concluida') DEFAULT 'pendente',
  `lote_id` int(11) DEFAULT NULL,
  `data_validade` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `movimentacoes`
--

INSERT INTO `movimentacoes` (`id`, `nf`, `produto_id`, `lote`, `quantidade`, `tipo`, `motivo`, `usuario`, `numero_nf`, `data_movimentacao`, `estoque_origem_id`, `estoque_destino_id`, `observacao`, `status`, `lote_id`, `data_validade`) VALUES
(49, '', 22, '', 1000, 'entrada', NULL, 'admin', 0, '2024-11-23 15:10:47', NULL, 1, '', 'pendente', NULL, NULL),
(50, '', 20, '', 200, 'entrada', NULL, 'admin', 0, '2024-11-23 18:36:22', NULL, 1, '', 'pendente', NULL, NULL),
(51, '', 22, '', 10, 'saida', NULL, 'Array', 0, '2024-11-30 15:24:38', 1, 3, NULL, 'pendente', NULL, NULL),
(52, '', 22, '', 10, 'entrada', NULL, 'Array', 0, '2024-11-30 15:24:47', NULL, 3, NULL, 'pendente', NULL, NULL),
(53, '', 28, '', 50, 'entrada', NULL, 'Array', 0, '2024-11-30 17:45:06', NULL, 1, '', 'pendente', NULL, NULL),
(54, '', 28, '', 50, 'entrada', NULL, 'Array', 0, '2024-11-30 18:04:31', NULL, 1, '', 'pendente', NULL, NULL),
(55, '', 28, '', 50, 'entrada', NULL, 'Array', 0, '2024-11-30 18:14:21', NULL, 1, '', 'pendente', NULL, NULL),
(56, '', 22, '', 63, 'saida', NULL, 'Array', 0, '2024-11-30 18:29:58', 1, 2, NULL, 'pendente', NULL, NULL),
(57, '', 22, '', 63, 'entrada', NULL, 'Array', 0, '2024-11-30 18:30:33', NULL, 2, NULL, 'pendente', NULL, NULL),
(58, '', 20, '', 5, 'saida', 'Uso Interno', 'Array', 0, '2024-12-06 14:27:09', 2, NULL, NULL, 'pendente', NULL, NULL),
(59, '', 22, '', 100, 'saida', 'Uso Interno', 'Array', 0, '2024-12-06 14:38:53', 2, NULL, NULL, 'pendente', NULL, NULL),
(60, '', 22, '', 100, 'saida', 'Uso Interno', 'Array', 0, '2024-12-06 14:39:52', 1, NULL, NULL, 'pendente', NULL, NULL),
(61, '', 22, '', 50, 'saida', 'Uso Interno', 'Array', 0, '2024-12-06 15:26:09', 1, NULL, NULL, 'pendente', NULL, NULL),
(62, '', 22, '', 5, 'saida', 'Uso Interno', 'Array', 0, '2024-12-06 20:31:35', 1, NULL, NULL, 'pendente', NULL, NULL),
(63, '', 20, '', 10, 'entrada', NULL, '4', 0, '2024-12-06 20:37:09', NULL, 1, '0', 'pendente', 6, '2024-12-07'),
(64, '', 21, '', 50, 'entrada', NULL, '4', 0, '2024-12-06 20:37:38', NULL, 1, '0', 'pendente', 7, '2024-12-02'),
(65, '', 19, '', 0, '', 'Produto inativado', 'Admin', 0, '2024-12-06 20:49:39', NULL, NULL, NULL, 'pendente', NULL, NULL),
(66, '', 20, '', 10, 'saida', 'Uso Interno', 'Array', 0, '2024-12-06 21:12:24', 1, NULL, NULL, 'pendente', NULL, NULL),
(67, '', 20, '', 15, 'saida', 'Uso Interno', 'Array', 0, '2024-12-06 21:12:37', 1, NULL, NULL, 'pendente', NULL, NULL),
(68, '', 20, '', 10, 'saida', 'Uso Interno', 'Array', 0, '2024-12-06 21:22:35', 1, NULL, NULL, 'pendente', NULL, NULL),
(69, '', 20, '', 5, 'saida', 'Uso Interno', 'Lucas', 0, '2024-12-06 21:28:54', 1, NULL, NULL, 'pendente', NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `notas_fiscais`
--

CREATE TABLE `notas_fiscais` (
  `id` int(11) NOT NULL,
  `numero_nf` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `notas_fiscais`
--

INSERT INTO `notas_fiscais` (`id`, `numero_nf`) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 3),
(5, 4),
(6, 5),
(7, 6),
(8, 7),
(9, 8),
(10, 9),
(11, 10),
(12, 11),
(13, 12),
(14, 13),
(15, 14),
(16, 15),
(17, 16),
(18, 17);

-- --------------------------------------------------------

--
-- Estrutura para tabela `permissoes_usuarios`
--

CREATE TABLE `permissoes_usuarios` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `funcionalidade` varchar(50) NOT NULL,
  `permitido` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtos`
--

CREATE TABLE `produtos` (
  `id` int(11) NOT NULL,
  `estoque_id` int(11) DEFAULT NULL,
  `nome` varchar(100) NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `descricao` text DEFAULT NULL,
  `preco` decimal(10,2) DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  `lote` varchar(50) DEFAULT NULL,
  `data_validade` date DEFAULT NULL,
  `status_demandas` varchar(10) DEFAULT NULL,
  `categorias` varchar(50) DEFAULT NULL,
  `fornecedor` varchar(100) DEFAULT NULL,
  `status` enum('Alta','Baixa','Normal') DEFAULT NULL,
  `estoque_minimo` int(11) DEFAULT NULL,
  `estoque_maximo` int(11) DEFAULT NULL,
  `ponto_de_pedido` int(11) DEFAULT NULL,
  `almoxarifado_id` int(11) DEFAULT NULL,
  `localizacao_id` int(11) DEFAULT NULL,
  `quantidade_estoque_principal` int(11) DEFAULT 0,
  `quantidade_almoxarifado1` int(11) DEFAULT 0,
  `quantidade_almoxarifado2` int(11) DEFAULT 0,
  `ativo` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `produtos`
--

INSERT INTO `produtos` (`id`, `estoque_id`, `nome`, `codigo`, `descricao`, `preco`, `quantidade`, `lote`, `data_validade`, `status_demandas`, `categorias`, `fornecedor`, `status`, `estoque_minimo`, `estoque_maximo`, `ponto_de_pedido`, `almoxarifado_id`, `localizacao_id`, `quantidade_estoque_principal`, `quantidade_almoxarifado1`, `quantidade_almoxarifado2`, `ativo`) VALUES
(19, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'quimica', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0),
(20, NULL, 'Anador', '', 'Comprimido', 10.00, NULL, 'Lote001', '2024-12-01', NULL, NULL, 'quimica', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(21, NULL, 'Naridrin', '', 'Gotas', 20.00, NULL, 'Lote002', '2023-05-20', NULL, NULL, 'quimica', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(22, NULL, 'Pomada', '', 'Base', 15.00, NULL, 'Lote003', '2024-11-15', NULL, NULL, 'quimica', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(23, NULL, 'Colírio', '', 'Gotas', 33.00, NULL, 'Lote004', '2025-06-30', NULL, NULL, 'quimica', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(24, NULL, 'Dipirona', '', 'Gotas', 10.00, NULL, 'Lote005', '2024-09-10', NULL, NULL, 'quimica', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(25, NULL, 'Dor Flex', '', 'Comprimido', 8.00, NULL, 'Lote006', '2023-08-15', NULL, NULL, 'quimica', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(26, NULL, 'Alginac', '', 'Comprimido', 100.00, NULL, 'Lote007', '2025-01-01', NULL, NULL, 'quimica', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(27, NULL, 'Aspirina', '', 'Comprimido', 23.00, NULL, 'Lote008', '2024-10-10', NULL, NULL, 'quimica', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(28, NULL, 'buscopan', '', 'Pílula', 19.99, NULL, NULL, NULL, NULL, NULL, 'quimica', NULL, 10, 60, 15, NULL, NULL, 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `solicitacoes`
--

CREATE TABLE `solicitacoes` (
  `id` int(11) NOT NULL,
  `produto_id` int(11) NOT NULL,
  `almoxarifado_origem` int(11) NOT NULL,
  `almoxarifado_destino` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `quantidade_enviada` int(11) DEFAULT 0,
  `status` enum('pendente','aprovada','confirmada','aguardando_envio','em_transito','aguardando_entrada','concluida') DEFAULT 'aguardando_envio',
  `data_solicitacao` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `solicitacoes`
--

INSERT INTO `solicitacoes` (`id`, `produto_id`, `almoxarifado_origem`, `almoxarifado_destino`, `quantidade`, `quantidade_enviada`, `status`, `data_solicitacao`) VALUES
(71, 20, 1, 3, 5, 0, '', '2024-11-23 14:45:38'),
(72, 21, 1, 3, 50, 0, '', '2024-11-23 15:08:50'),
(73, 20, 1, 3, 6, 0, '', '2024-11-23 15:13:57'),
(74, 21, 1, 3, 40, 0, '', '2024-11-23 15:13:57'),
(75, 22, 1, 3, 500, 0, '', '2024-11-23 15:13:57'),
(76, 23, 1, 3, 7, 0, '', '2024-11-23 15:13:57'),
(77, 24, 1, 3, 5, 0, '', '2024-11-23 15:13:57'),
(78, 25, 1, 3, 8, 0, '', '2024-11-23 15:13:57'),
(79, 26, 1, 3, 10, 0, '', '2024-11-23 15:13:57'),
(80, 27, 1, 3, 20, 0, '', '2024-11-23 15:13:57'),
(81, 20, 1, 3, 4, 0, '', '2024-11-23 15:38:19'),
(82, 21, 1, 3, 10, 0, '', '2024-11-23 15:38:19'),
(83, 22, 1, 3, 500, 0, '', '2024-11-23 15:38:19'),
(84, 23, 1, 3, 40, 0, '', '2024-11-23 15:38:19'),
(85, 24, 1, 3, 40, 0, '', '2024-11-23 15:38:19'),
(86, 25, 1, 3, 10, 0, '', '2024-11-23 15:38:19'),
(87, 26, 1, 3, 8, 0, '', '2024-11-23 15:38:19'),
(88, 27, 1, 3, 27, 0, '', '2024-11-23 15:38:19'),
(89, 20, 1, 3, 5, 0, '', '2024-11-23 16:44:44'),
(90, 24, 1, 3, 50, 0, '', '2024-11-23 18:23:43'),
(91, 20, 1, 3, 10, 0, '', '2024-11-23 21:22:20'),
(92, 20, 1, 3, 30, 0, '', '2024-11-23 21:31:13'),
(93, 20, 1, 2, 8, 0, '', '2024-11-23 22:23:19'),
(94, 21, 1, 2, 8, 0, '', '2024-11-23 22:23:19'),
(95, 22, 1, 2, 8, 0, '', '2024-11-23 22:23:19'),
(96, 23, 1, 2, 8, 0, '', '2024-11-23 22:23:19'),
(97, 24, 1, 2, 5, 0, '', '2024-11-23 22:23:19'),
(98, 25, 1, 2, 5, 0, '', '2024-11-23 22:23:19'),
(99, 26, 1, 2, 5, 0, '', '2024-11-23 22:23:19'),
(100, 27, 1, 2, 10, 0, '', '2024-11-23 22:23:19'),
(101, 21, 4, 6, 80, 0, '', '2024-11-25 03:58:29'),
(102, 20, 1, 2, 100, 0, 'concluida', '2024-11-25 04:01:15'),
(103, 21, 1, 2, 50, 0, 'concluida', '2024-11-25 04:01:15'),
(104, 22, 1, 2, 500, 0, 'concluida', '2024-11-25 04:01:15'),
(105, 23, 1, 2, 45, 0, 'concluida', '2024-11-25 04:01:15'),
(106, 24, 1, 2, 141, 0, 'concluida', '2024-11-25 04:01:15'),
(107, 25, 1, 2, 5, 0, '', '2024-11-25 04:01:15'),
(108, 26, 1, 2, 8, 0, '', '2024-11-25 04:01:15'),
(109, 27, 1, 2, 20, 0, '', '2024-11-25 04:01:15'),
(110, 20, 2, 3, 15, 0, 'concluida', '2024-11-25 20:11:48'),
(111, 26, 1, 3, 12, 0, 'concluida', '2024-11-25 20:12:03'),
(112, 27, 1, 3, 10, 0, 'concluida', '2024-11-25 20:20:40'),
(113, 26, 1, 3, 12, 0, 'concluida', '2024-11-25 20:28:18'),
(114, 21, 1, 3, 50, 0, 'concluida', '2024-11-25 21:31:05'),
(115, 20, 1, 3, 100, 0, 'concluida', '2024-11-25 21:57:35'),
(116, 22, 1, 3, 10, 0, 'concluida', '2024-11-30 15:24:29'),
(117, 22, 1, 2, 63, 0, 'concluida', '2024-11-30 18:29:37'),
(118, 22, 1, 3, 10, 0, 'aguardando_envio', '2024-12-06 15:28:24'),
(119, 22, 1, 3, 10, 0, 'aguardando_envio', '2024-12-06 16:01:46');

-- --------------------------------------------------------

--
-- Estrutura para tabela `transferencias`
--

CREATE TABLE `transferencias` (
  `id` int(11) NOT NULL,
  `produto_id` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `tipo` enum('entrada','saida') NOT NULL,
  `data_transferencia` datetime DEFAULT current_timestamp(),
  `almoxarifado_origem` int(11) NOT NULL,
  `almoxarifado_destino` int(11) NOT NULL,
  `status` enum('Pendente','Em trânsito','Concluída','Rejeitada') DEFAULT 'Pendente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `tipo` enum('admin','usuario') DEFAULT 'usuario',
  `estoque_id` int(11) DEFAULT NULL,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  `permissoes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `email`, `senha`, `tipo`, `estoque_id`, `criado_em`, `permissoes`) VALUES
(4, 'Admin', 'admin@example.com', '$2y$10$LSLaUzElDSPZOXjXkgTCwuevmUR7FPOQUJf/PNerkBZzxEvTvObCW', 'admin', NULL, '2024-11-29 20:58:30', '{\"cadastrar_usuario\": true, \"cadastrar_produto\": true, \"cadastrar_fornecedor\": true, \"entrada_produtos\": true, \"relatorios\": true}'),
(7, 'Lucas', 'lucasmartinsfranca@gmail.com', '$2y$10$htZdFS9XfexmMiF3vm.h6.d9RUVoewD7gUp3jR/ZHh3pYGBgW9jRS', 'usuario', 1, '2024-11-30 03:25:43', '0'),
(9, 'Wagner', 'wagner@example.com', '$2y$10$MxOTBHP4tohQsXpkCuaTE.zCWn/9Kj8u/.Kwq3oI7NcOWnPHvIify', 'usuario', 3, '2024-12-06 15:38:40', '{\"relatorios\":\"1\"}');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `almoxarifados`
--
ALTER TABLE `almoxarifados`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `estoque`
--
ALTER TABLE `estoque`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_produto_localizacao` (`produto_id`,`localizacao_id`),
  ADD KEY `localizacao_id` (`localizacao_id`),
  ADD KEY `fk_produto_id` (`produto_id`);

--
-- Índices de tabela `itens_solicitados`
--
ALTER TABLE `itens_solicitados`
  ADD PRIMARY KEY (`id`),
  ADD KEY `solicitacao_id` (`solicitacao_id`),
  ADD KEY `produto_id` (`produto_id`);

--
-- Índices de tabela `localizacao`
--
ALTER TABLE `localizacao`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `lotes`
--
ALTER TABLE `lotes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produto_id` (`produto_id`);

--
-- Índices de tabela `movimentacoes`
--
ALTER TABLE `movimentacoes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produto_id` (`produto_id`),
  ADD KEY `estoque_origem_id` (`estoque_origem_id`),
  ADD KEY `estoque_destino_id` (`estoque_destino_id`);

--
-- Índices de tabela `notas_fiscais`
--
ALTER TABLE `notas_fiscais`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `permissoes_usuarios`
--
ALTER TABLE `permissoes_usuarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Índices de tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `solicitacoes`
--
ALTER TABLE `solicitacoes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produto_id` (`produto_id`),
  ADD KEY `almoxarifado_origem` (`almoxarifado_origem`),
  ADD KEY `almoxarifado_destino` (`almoxarifado_destino`);

--
-- Índices de tabela `transferencias`
--
ALTER TABLE `transferencias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produto_id` (`produto_id`),
  ADD KEY `almoxarifado_origem` (`almoxarifado_origem`),
  ADD KEY `almoxarifado_destino` (`almoxarifado_destino`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `fk_localizacao` (`estoque_id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `almoxarifados`
--
ALTER TABLE `almoxarifados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `estoque`
--
ALTER TABLE `estoque`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT de tabela `itens_solicitados`
--
ALTER TABLE `itens_solicitados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `localizacao`
--
ALTER TABLE `localizacao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `lotes`
--
ALTER TABLE `lotes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `movimentacoes`
--
ALTER TABLE `movimentacoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT de tabela `notas_fiscais`
--
ALTER TABLE `notas_fiscais`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de tabela `permissoes_usuarios`
--
ALTER TABLE `permissoes_usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de tabela `solicitacoes`
--
ALTER TABLE `solicitacoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT de tabela `transferencias`
--
ALTER TABLE `transferencias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `estoque`
--
ALTER TABLE `estoque`
  ADD CONSTRAINT `estoque_ibfk_1` FOREIGN KEY (`localizacao_id`) REFERENCES `localizacao` (`id`),
  ADD CONSTRAINT `fk_localizacao_id` FOREIGN KEY (`localizacao_id`) REFERENCES `localizacao` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_produto_id` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `itens_solicitados`
--
ALTER TABLE `itens_solicitados`
  ADD CONSTRAINT `itens_solicitados_ibfk_1` FOREIGN KEY (`solicitacao_id`) REFERENCES `solicitacoes` (`id`),
  ADD CONSTRAINT `itens_solicitados_ibfk_2` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`);

--
-- Restrições para tabelas `lotes`
--
ALTER TABLE `lotes`
  ADD CONSTRAINT `lotes_ibfk_1` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`);

--
-- Restrições para tabelas `movimentacoes`
--
ALTER TABLE `movimentacoes`
  ADD CONSTRAINT `movimentacoes_ibfk_1` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`),
  ADD CONSTRAINT `movimentacoes_ibfk_2` FOREIGN KEY (`estoque_origem_id`) REFERENCES `localizacao` (`id`),
  ADD CONSTRAINT `movimentacoes_ibfk_3` FOREIGN KEY (`estoque_destino_id`) REFERENCES `localizacao` (`id`);

--
-- Restrições para tabelas `permissoes_usuarios`
--
ALTER TABLE `permissoes_usuarios`
  ADD CONSTRAINT `permissoes_usuarios_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `solicitacoes`
--
ALTER TABLE `solicitacoes`
  ADD CONSTRAINT `solicitacoes_ibfk_1` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`),
  ADD CONSTRAINT `solicitacoes_ibfk_2` FOREIGN KEY (`almoxarifado_origem`) REFERENCES `localizacao` (`id`),
  ADD CONSTRAINT `solicitacoes_ibfk_3` FOREIGN KEY (`almoxarifado_destino`) REFERENCES `localizacao` (`id`);

--
-- Restrições para tabelas `transferencias`
--
ALTER TABLE `transferencias`
  ADD CONSTRAINT `transferencias_ibfk_1` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`),
  ADD CONSTRAINT `transferencias_ibfk_2` FOREIGN KEY (`almoxarifado_origem`) REFERENCES `almoxarifados` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transferencias_ibfk_3` FOREIGN KEY (`almoxarifado_destino`) REFERENCES `almoxarifados` (`id`);

--
-- Restrições para tabelas `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_localizacao` FOREIGN KEY (`estoque_id`) REFERENCES `localizacao` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
