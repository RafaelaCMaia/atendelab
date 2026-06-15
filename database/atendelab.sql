CREATE DATABASE IF NOT EXISTS atendelab
CHARACTER SET utf8mb4
COLLATE utf8mb4_general_ci;
USE atendelab;

CREATE TABLE `usuarios` (
  `id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) UNIQUE NOT NULL,
  `senha` varchar(255) NOT NULL,
  `perfil` enum('admin','aluno', 'atendente') DEFAULT 'atendente',
  `status` enum('ativo','inativo') DEFAULT 'ativo',
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `pessoas` (
  `id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `documento` varchar(20) NOT NULL UNIQUE,
  `telefone` varchar(20) NOT NULL,
  `curso` varchar(100) NOT NULL,
  `periodo` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `tipos_atendimentos` (
  `id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `descricao` TEXT NOT NULL,
  `status` ENUM('ativo', 'inativo') DEFAULT 'ativo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `atendimentos` (
  `id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `pessoa_id` int(11), 
  `tipo_atendimento_id` int(11) NOT NULL,
  `usuario_id` int(11),
  `data_atendimento` DATE NOT NULL DEFAULT (CURRENT_DATE),
  `hora_atendimento` TIME NOT NULL DEFAULT (CURRENT_TIME),
  `descricao` TEXT NOT NULL,
  `observacao` TEXT,
  `status` ENUM('ativo', 'inativo') DEFAULT 'ativo',
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  CONSTRAINT `fk_atendimentos_pessoas` FOREIGN KEY (`pessoa_id`) REFERENCES `pessoas` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_atendimentos_tipos` FOREIGN KEY (`tipo_atendimento_id`) REFERENCES `tipos_atendimentos` (`id`),
  CONSTRAINT `fk_atendimentos_usuarios` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO usuarios (nome, email, senha, perfil, status)
VALUES (
 'Mariana Costa',
 'mariana.atendente@atendelab.com',
 '$2y$10$e0myL.86B4913mGv1S.nFe8oZlyXyYn8vH5oZl8yv9W8zXq2Y3K4e', 
 'atendente',
 'ativo'
);

INSERT INTO pessoas (nome, documento, telefone, curso, periodo, status)
VALUES (
 'Ana Beatriz Souza',
 '987.654.321-11',
 '(21) 99988-7766',
 'Engenharia de Software',
 '2º Período',
 'Regular'
);

INSERT INTO tipos_atendimentos (nome, descricao, status)
VALUES (
 'Instalação de Software',
 'Solicitação para instalação de IDEs, compiladores ou softwares específicos utilizados nas aulas práticas.',
 'ativo'
);

INSERT INTO atendimentos (pessoa_id, tipo_atendimento_id, usuario_id, descricao, observacao, status)
VALUES (
 1,
 1,
 1,
 'Aluna solicitou suporte para configurar o ambiente do Docker e VS Code na máquina 07.',
 'Ambiente configurado com sucesso. Extensões necessárias para a disciplina de Banco de Dados foram instaladas.',
 'ativo'
);
