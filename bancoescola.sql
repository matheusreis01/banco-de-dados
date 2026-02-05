-- 1. Criação do Banco de Dados
CREATE DATABASE Escola;
USE Escola;

-- 2. Tabela de Professores
CREATE TABLE Professores (
    id_professor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    especialidade VARCHAR(50)
);

-- 3. Tabela de Disciplinas (Relacionada ao Professor)
CREATE TABLE Disciplinas (
    id_disciplina INT PRIMARY KEY AUTO_INCREMENT,
    nome_disciplina VARCHAR(100) NOT NULL,
    id_professor INT,
    FOREIGN KEY (id_professor) REFERENCES Professores(id_professor)
);

-- 4. Tabela de Alunos
CREATE TABLE Alunos (
    id_aluno INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE,
    matricula VARCHAR(20) UNIQUE
);

-- 5. Tabela de Notas (Relaciona Aluno e Disciplina)
CREATE TABLE Notas (
    id_nota INT PRIMARY KEY AUTO_INCREMENT,
    id_aluno INT,
    id_disciplina INT,
    valor_nota DECIMAL(4,2),
    FOREIGN KEY (id_aluno) REFERENCES Alunos(id_aluno),
    FOREIGN KEY (id_disciplina) REFERENCES Disciplinas(id_disciplina)
);
