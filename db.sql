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