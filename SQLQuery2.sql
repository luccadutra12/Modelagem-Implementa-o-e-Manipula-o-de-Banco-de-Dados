-- ============================================
-- ATIVIDADE 7
-- AUTOTECHNOLOGY EXPRESS
-- ============================================

-- 1. CRIAÇÃO DO BANCO
DROP DATABASE IF EXISTS oficina_mecanica_db;
GO

CREATE DATABASE oficina_mecanica_db;
GO

USE oficina_mecanica_db;
GO


-- ============================================
-- 2. CRIAÇÃO DAS TABELAS
-- ============================================

CREATE TABLE cliente (
    id_cliente INT IDENTITY(1,1) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    telefone VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL,
    endereco VARCHAR(150) NOT NULL,
    cidade VARCHAR(60) NOT NULL
);
GO

CREATE TABLE veiculo (
    id_veiculo INT IDENTITY(1,1) PRIMARY KEY,
    id_cliente INT NOT NULL,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    ano_fabricacao INT NOT NULL,
    chassi VARCHAR(30) NOT NULL UNIQUE,
    placa VARCHAR(10) NOT NULL UNIQUE,

    FOREIGN KEY (id_cliente)
        REFERENCES cliente(id_cliente)
);
GO

CREATE TABLE mecanico (
    id_mecanico INT IDENTITY(1,1) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    telefone VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL,
    data_contratacao DATE NOT NULL,
    funcao VARCHAR(100) NOT NULL
);
GO

CREATE TABLE ordem_servico (
    id_ordem INT IDENTITY(1,1) PRIMARY KEY,
    id_veiculo INT NOT NULL,
    id_mecanico INT NOT NULL,
    data_abertura DATETIME NOT NULL,
    estimativa_entrega DATETIME NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL,
    status VARCHAR(20) NOT NULL,

    FOREIGN KEY (id_veiculo)
        REFERENCES veiculo(id_veiculo),

    FOREIGN KEY (id_mecanico)
        REFERENCES mecanico(id_mecanico)
);
GO


-- ============================================
-- 3. CLIENTES
-- ============================================

INSERT INTO cliente
(nome, cpf, telefone, email, endereco, cidade)
VALUES
('João da Silva',
 '123.456.789-00',
 '(14) 99876-1234',
 'joao.silva@email.com',
 'Rua das Flores, 100',
 'Botucatu'),

('Mariana de Oliveira',
 '987.654.321-00',
 '(14) 99123-4567',
 'mariana.oliveira@email.com',
 'Rua Central, 200',
 'Pardinho'),

('Carlos Menezes',
 '321.987.654-11',
 '(14) 99654-3210',
 'carlos.mennezis@email.com',
 'Rua São Paulo, 300',
 'São Manuel'),

('Ana Beatriz de Souza',
 '456.789.123-22',
 '(14) 99444-8899',
 'ana.souza@email.com',
 'Rua Principal, 400',
 'Botucatu');

SELECT * FROM cliente;
GO


-- ============================================
-- 4. VEÍCULOS
-- ============================================

INSERT INTO veiculo
(id_cliente, marca, modelo, ano_fabricacao, chassi, placa)
VALUES
(1,
 'Fiat',
 'Uno',
 2015,
 '9BWZZZ377VT004251',
 'ABC1A23'),

(2,
 'Chevrolet',
 'Onix',
 2020,
 '9BG116GW04C400001',
 'XYZ9Z99'),

(3,
 'Toyota',
 'Corolla',
 2018,
 '8AJZZZ123J1234567',
 'JKL3D45'),

(4,
 'Honda',
 'Fit',
 2017,
 '93HGE8850EZ500123',
 'QWE7E77');

SELECT * FROM veiculo;
GO


-- ============================================
-- 5. MECÂNICOS
-- ============================================

INSERT INTO mecanico
(nome, cpf, telefone, email, data_contratacao, funcao)
VALUES
('Rafael dos Santos',
 '888.999.000-11',
 '(14) 99777-1234',
 'rafael.santos@autotechnology.com',
 '2025-01-01',
 'Mecânico Geral'),

('Luciana Fernandes',
 '777.888.999-22',
 '(14) 99666-4567',
 'luciana.fernandes@autotechnology.com',
 '2025-06-15',
 'Especialista em Freios'),

('Pedro Almeida',
 '666.777.888-33',
 '(14) 99555-7890',
 'pedro.almeida@autotechnology.com',
 '2023-09-10',
 'Eletricista Automotivo'),

('Carla Monteiro',
 '555.666.777-44',
 '(14) 99444-3210',
 'carla.monteiro@autotechnology.com',
 '2024-06-01',
 'Mecânica de Veículos Leves');

SELECT * FROM mecanico;
GO


-- ============================================
-- 6. ORDENS DE SERVIÇO
-- ============================================

INSERT INTO ordem_servico
(id_veiculo, id_mecanico, data_abertura,
 estimativa_entrega, descricao,
 valor_total, status)
VALUES
(1,
 1,
 '2025-09-20 08:30:00',
 '2025-09-21 08:30:00',
 'Troca de óleo e filtro',
 150.00,
 'Concluída'),

(2,
 2,
 '2025-09-21 10:00:00',
 '2025-09-23 10:00:00',
 'Substituição de pastilhas de freio dianteiras',
 300.00,
 'Em Andamento'),

(3,
 3,
 '2025-09-22 14:15:00',
 '2025-09-23 08:00:00',
 'Diagnóstico de falha no sistema elétrico',
 120.00,
 'Aberta'),

(4,
 4,
 '2025-09-23 09:45:00',
 '2025-09-24 09:45:00',
 'Alinhamento e balanceamento',
 100.00,
 'Cancelada');

SELECT * FROM ordem_servico;
GO


-- ============================================
-- 7. ATUALIZAR FIT PARA CIVIC
-- ============================================

UPDATE veiculo
SET modelo = 'Civic'
WHERE placa = 'QWE7E77';

SELECT * FROM veiculo;
GO


-- ============================================
-- 8. CORRIGIR E-MAIL DO CARLOS
-- ============================================

UPDATE cliente
SET email = 'carlos.menezes@email.com'
WHERE cpf = '321.987.654-11';

SELECT * FROM cliente;
GO


-- ============================================
-- 9. EXCLUIR ORDEM DE SERVIÇO CANCELADA
-- ============================================

DELETE FROM ordem_servico
WHERE id_veiculo = 4;

SELECT * FROM ordem_servico;
GO


-- ============================================
-- 10. CONSULTAS FINAIS
-- ============================================

SELECT * FROM cliente;
SELECT * FROM veiculo;
SELECT * FROM mecanico;
SELECT * FROM ordem_servico;