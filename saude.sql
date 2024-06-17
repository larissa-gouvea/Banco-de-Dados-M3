-- Gabriel Toscano Jorge Rodrigues
-- Larissa de Sousa Gouvea
-- Criação do esquema
CREATE SCHEMA saude;
USE saude;

-- CRIAÇÃO DAS TABELAS
CREATE TABLE estado (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NULL,
    uf VARCHAR(2) NULL
);

CREATE TABLE cidade (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NULL,
    id_estado INT NOT NULL,
    FOREIGN KEY (id_estado) REFERENCES estado(id)
);

CREATE TABLE paciente_endereco (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_cidade INT NOT NULL,
    rua VARCHAR(100) NULL,
    cep INT NULL,
    numero INT NULL,
    complemento VARCHAR(50) NULL,
    FOREIGN KEY (id_cidade) REFERENCES cidade(id)
);

CREATE TABLE paciente (
    id INT PRIMARY KEY AUTO_INCREMENT,
    cpf INT NOT NULL,
    nome VARCHAR(100),
    id_endereco INT NOT NULL,
    FOREIGN KEY (id_endereco) REFERENCES paciente_endereco(id)
);

CREATE TABLE medico_endereco (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_cidade INT NOT NULL,
    rua VARCHAR(100) NULL,
    cep INT NULL,
    numero INT NULL,
    complemento VARCHAR(50) NULL,
    FOREIGN KEY (id_cidade) REFERENCES cidade(id)
);

CREATE TABLE especialidade (
	id INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(100) NULL
);

CREATE TABLE medico (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NULL,
    crmv INT NULL,
    id_endereco INT NOT NULL,
    id_especialidade INT NOT NULL,
    FOREIGN KEY (id_endereco) REFERENCES medico_endereco(id),
    FOREIGN KEY (id_especialidade) REFERENCES especialidade(id)
);

CREATE TABLE paciente_fone (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_paciente INT NOT NULL,
    numero INT NULL,
    tipo VARCHAR(20) NULL,
    FOREIGN KEY (id_paciente) REFERENCES paciente(id)
);
CREATE TABLE paciente_email (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_paciente INT NOT NULL,
    email VARCHAR(255) NULL,
    FOREIGN KEY (id_paciente) REFERENCES paciente(id)
);

CREATE TABLE medico_fone (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_medico INT NOT NULL,
    numero INT NULL,
    tipo VARCHAR(20) NULL,
    FOREIGN KEY (id_medico) REFERENCES medico(id)
);

CREATE TABLE medico_email (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_medico INT NOT NULL,
    email VARCHAR(255) NULL,
    FOREIGN KEY (id_medico) REFERENCES medico(id)
);

CREATE TABLE consulta (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_medico INT NOT NULL,
    id_paciente INT NOT NULL,
    data DATE,
    horario TIME,
    FOREIGN KEY (id_medico) REFERENCES medico(id),
    FOREIGN KEY (id_paciente) REFERENCES paciente(id)
);

CREATE TABLE procedimento (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_medico INT NOT NULL,
    id_paciente INT NOT NULL,
    data DATE,
    horario TIME,
    FOREIGN KEY (id_medico) REFERENCES medico(id),
    FOREIGN KEY (id_paciente) REFERENCES paciente(id)
);
