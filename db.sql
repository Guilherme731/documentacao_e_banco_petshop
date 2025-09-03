CREATE DATABASE petshop_db;

USE petshop_db;

CREATE TABLE Cliente(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(65) NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    telefone VARCHAR(13) NULL,
    email VARCHAR(100) NULL
);

CREATE TABLE Pet(
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    nome VARCHAR(65) NOT NULL,
    especie ENUM('Pastor Alemão', 'Poodle', 'Husky', 'Beagle', 'Golden Retriever', 'Pug', 'Outros') NOT NULL,
    porte ENUM('Pequeno', 'Médio', 'Grande') NOT NULL,
    nascimento DATE NOT NULL,
    CONSTRAINT fk_pet_cliente FOREIGN KEY (cliente_id) REFERENCES Cliente(id)
);

CREATE TABLE Servico(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(65) NOT NULL,
    preco DECIMAL NOT NULL CHECK (preco>=0),
    duracao_min INT NULL CHECK (duracao_min>0)
);

CREATE TABLE Agendamento(
    id INT AUTO_INCREMENT PRIMARY KEY,
    pet_id INT NOT NULL,
    servico_id INT NOT NULL,
    data_hora DATETIME NOT NULL,
    status ENUM('Agendado','Cancelado', 'Concluido'),
    observacoes VARCHAR(200),
    CONSTRAINT fk_agendamento_pet FOREIGN KEY (pet_id) REFERENCES Pet(id),
    CONSTRAINT fk_agendamento_servico FOREIGN KEY (servico_id) REFERENCES Servico(id)
    
);

-- Inserindo clientes
INSERT INTO Cliente (nome, cpf, telefone, email) VALUES
('Maria Silva', '12345678901', '9999999999999', 'maria.silva@email.com'),
('João Pereira', '98765432100', '9999999999999', 'joao.pereira@email.com'),
('Ana Souza', '45678912345', '9999999999999', 'ana.souza@email.com');

-- Inserindo pets (relacionados aos clientes)
INSERT INTO Pet (cliente_id, nome, especie, porte, nascimento) VALUES
(1, 'Rex', 'Pastor Alemão', 'Grande', '2019-05-10'),
(2, 'Luna', 'Poodle', 'Pequeno', '2021-08-15'),
(3, 'Thor', 'Husky', 'Médio', '2020-11-30');

-- Inserindo serviços
INSERT INTO Servico (nome, preco, duracao_min) VALUES
('Banho e Tosa', 80.00, 60),
('Consulta Veterinária', 150.00, 40),
('Vacinação', 90.00, 20);

-- Inserindo agendamentos (relacionados aos pets e serviços)
INSERT INTO Agendamento (pet_id, servico_id, data_hora, status, observacoes) VALUES
(1, 1, '2025-09-05 10:00:00', 'Agendado', NULL),
(2, 2, '2025-09-06 14:00:00', 'Concluido', 'Consulta de rotina'),
(3, 3, '2025-09-07 09:30:00', 'Cancelado', NULL);
