-- =================================================================
-- REPOSITÓRIO: SISTEMA DE VIAGENS (SQL REFATORADO E CORRIGIDO)
-- =================================================================

-- Garante a criação e seleção correta do banco de dados (Resolve Erro #1046)
CREATE DATABASE IF NOT EXISTS viagens;
USE viagens;

-- 1. CRIAÇÃO DA TABELA DE USUÁRIOS
-- Já criada com a estrutura correta de colunas de endereço da Aula 4-1
CREATE TABLE IF NOT EXISTS usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    data_nascimento DATE NOT NULL,
    rua VARCHAR(100),
    numero VARCHAR(10),
    cidade VARCHAR(50),
    estado VARCHAR(50)
);

-- 2. CRIAÇÃO DA TABELA DE DESTINOS
CREATE TABLE IF NOT EXISTS destinos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT NOT NULL
);

-- 3. CRIAÇÃO DA TABELA DE RESERVAS
-- Chave primária e Auto Incremento configurados para liberar edição visual no phpMyAdmin
CREATE TABLE IF NOT EXISTS reservas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    id_destino INT,
    data DATE NOT NULL,
    status VARCHAR(20) DEFAULT 'pendente',
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id) ON DELETE CASCADE,
    FOREIGN KEY (id_destino) REFERENCES destinos(id)
);

-- =================================================================
-- CARGA DE DADOS INICIAIS (MASSA DE TESTE - AULAS 3-5, 5-1 E 5-3)
-- =================================================================

-- Inserção de Usuários de Teste
INSERT INTO usuarios (nome, email, data_nascimento, rua, numero, cidade, estado) VALUES
('João Maria', 'joaomaria@example.com', '1990-01-01', 'Rua A', '123', 'Belo Horizonte', 'MG'),
('Usuario sem reservas', 'semreservar@teste.com', '1990-10-10', 'Rua','123','cidade','estado');

-- Massa de dados textuais para teste de performance
INSERT INTO usuarios (nome, email, data_nascimento, rua) VALUES
('João Silva', 'joao.silva@example.com', '1990-01-01', 'Rua A'),
('Maria Santos', 'maria.santos@example.com', '1992-03-15', 'Rua B'),
('Pedro Almeida', 'pedro.almeida@example.com', '1985-07-10', 'Rua C'),
('Ana Oliveira', 'ana.oliveira@example.com', '1998-12-25', 'Rua D'),
('Carlos Pereira', 'carlos.pereira@example.com', '1991-06-05', 'Rua E');

-- Inserção de Destinos de Teste
INSERT INTO destinos (nome, descricao) VALUES
('Praia Teste', 'Destino paradisíaco com belas praias.'),
('Deestino sem reserva', 'Uma bela praia com areias brancas e mar cristalino'),
('Praia das Tartarugas', 'Uma bela praia com areias brancas e mar cristalino'),
('Cachoeira do Vale Verde', 'Uma cachoeira exuberante cercada por natureza'),
('Cidade Histórica de Pedra Alta', 'Uma cidade rica em história e arquitetura');

-- Inserção de Reservas de Teste
INSERT INTO reservas (id_usuario, id_destino, data, status) VALUES
(1, 2, '2023-07-10', 'confirmada'),
(2, 1, '2023-08-05', 'pendente'),
(3, 1, '2026-08-09', 'pendente'),
(4, 4, '2023-07-01', 'pendente');

-- =================================================================
-- OTIMIZAÇÃO (AULA 5-3)
-- =================================================================
CREATE INDEX idx_nome ON usuarios (nome);
