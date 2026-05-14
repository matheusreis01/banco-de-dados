-- Criação da tabela LIVROS
CREATE TABLE LIVROS (
    id INT PRIMARY KEY,
    titulo VARCHAR(100),
    autor VARCHAR(100),
    ano INT,
    genero VARCHAR(50)
);

-- Inserção de dados fora de ordem
INSERT INTO LIVROS (titulo, ano, autor, id, genero)
VALUES ('Dom Casmurro', 1899, 'Machado de Assis', 1, 'Romance');

INSERT INTO LIVROS (autor, titulo, genero, ano, id)
VALUES ('George Orwell', '1984', 'Distopia', 1949, 2);

INSERT INTO LIVROS (id, genero, titulo, ano, autor)
VALUES (3, 'Fantasia', 'O Hobbit', 1937, 'J.R.R. Tolkien');

-- Exibir a tabela completa
SELECT * FROM LIVROS;

