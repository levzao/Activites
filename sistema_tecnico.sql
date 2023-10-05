CREATE DATABASE IF NOT EXISTS sistema_tecnico CHARSET utf8;

USE sistema_tecnico;

CREATE TABLE IF NOT EXISTS Cursos(
CursoID INT PRIMARY KEY AUTO_INCREMENT,
NomeCurso VARCHAR(255) NOT NULL,
Professor VARCHAR(255) NOT NULL,
DataInicio DATE NOT NULL,
DataFim DATE NOT NULL
)DEFAULT CHARSET utf8;

CREATE TABLE IF NOT EXISTS Alunos(
Matricula INT PRIMARY KEY,
NomeAluno VARCHAR(255),
DataNascimento DATE,
Endereco TEXT,
Telefone VARCHAR(23)
)DEFAULT CHARSET utf8;


 CREATE TABLE IF NOT EXISTS Inscricoes(
 InscricaoID INT PRIMARY KEY,
 MatriculaAluno INT,
 FOREIGN KEY(MatriculaAluno) REFERENCES Alunos(Matricula)
 )DEFAULT CHARSET utf8;
 
 
INSERT INTO Cursos(CursoID, NomeCurso, Professor, DataInicio, DataFim)
VALUES ('1', 'Análise e Desenvolvimento de Sistemas', 'Carlos Santos', '2022-08-01', '2023-12-15'),
('2', 'Redes e Computadores', 'Diogo Silva', '2023-05-03', '2025-05-03'),
('3', 'Engenheiro de Dados', 'Juan Brito', '2022-03-12', '2024-03-30'),
('4', 'Ciência de Dados', 'Kailan Veloso', '2023-08-15', '2025-08-25'),
('5', 'Engenheiro de Software', 'Raissa Souza', '2022-08-17', '2025-08-30');


INSERT INTO Alunos(Matricula, NomeAluno, DataNascimento, Endereco, Telefone)
VALUES('209', 'Robert Sanchez', '2001-02-10', 'Rua Avenida Brasil, 160 - Salvador', '(71) 99614-2357'),
('210', 'Bruno Alves', '1999-01-30', 'Rua Dendezeiros, 421 - Barreiras', '(42) 98301-9434'),
('211', 'Laura Lima', '1989-06-24', 'Avenida Cnsl Zacarias, 133 - Salvador', '(71) 98495-9421'),
('212', 'Sabrina Souza', '2004-07-15', 'Rua das Árvores, 164 - Sergipe', '(75) 99412-6785'),
('213', 'Gabriel Silva', '2002-08-25', 'Avenida Rafael Norte 314 - São Paulo', '(11) 99864-5378');


INSERT INTO Inscricoes(InscricaoID, MatriculaAluno)
VALUES(1, 209),
('2', '210'),
('3', '211'),
('4', '212'),
('5', '213');

ALTER TABLE Inscricoes
ADD CursoID INT,
ADD FOREIGN KEY(CursoID) REFERENCES Cursos(CursoID);

UPDATE Inscricoes SET CursoID = 1 WHERE InscricaoID = 1;
UPDATE Inscricoes SET CursoID = 2 WHERE InscricaoID = 2;
UPDATE Inscricoes SET CursoID = 3 WHERE InscricaoID = 3;
UPDATE Inscricoes SET CursoID = 4 WHERE InscricaoID = 4;
UPDATE Inscricoes SET CursoID = 5 WHERE InscricaoID = 5;

SELECT Alunos.NomeAluno, Cursos.NomeCurso, Inscricoes.InscricaoID
FROM Alunos
INNER JOIN Inscricoes ON Alunos.Matricula = Inscricoes.MatriculaAluno
INNER JOIN Cursos ON Inscricoes.CursoID = Cursos.CursoID;