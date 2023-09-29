CREATE DATABASE IF NOT EXISTS gerenciamento_escolar DEFAULT CHARSET utf8;

USE gerenciamento_escolar;

CREATE TABLE IF NOT EXISTS Escolas(
EscolaID INT PRIMARY KEY AUTO_INCREMENT,
NomeEscola VARCHAR(155) NOT NULL,
Endereco TEXT NOT NULL,
Telefone VARCHAR(23) NOT NULL
)DEFAULT CHARSET utf8;

CREATE TABLE IF NOT EXISTS Alunos(
Matricula INT PRIMARY KEY AUTO_INCREMENT,
NomeAluno VARCHAR(155) NOT NULL,
DataNascimento DATE NOT NULL, 
Endereco TEXT, 
Telefone VARCHAR(23),
EscolaID INT,
FOREIGN KEY (EscolaID) REFERENCES Escolas(EscolaID)
)DEFAULT CHARSET utf8;


INSERT INTO Escolas(NomeEscola, Endereco, Telefone)
VALUES ('Centro Educacional Wallon', 'Avenida Milton Bahia Ribeiro 248, Salvador', '(71) 3604-1380'),
('Escola Castro Alves', 'Rua Rua Barao de Cotegipe 153, Salvador', '(71) 3312-2639'),
('Escola Nova Era', 'Rua Francisco Souza 49, Salvador', '(71) 3313-5138');

INSERT INTO Alunos(NomeAluno, DataNascimento, Endereco, Telefone, EscolaID)
VALUES ('Kailan Brito', '2000-09-14', 'Rua das Estrelas, 222', '(11) 9876-5432', '1'),
('Diogo Veloso', '1999/07/22', 'Travessa do Bosque, 789', '(21) 8765-4321', '1'),
('Juan Silva', '2001/11/02', 'Rua das Flores, 123', '(31) 7654-3210', '2');


SELECT Escolas.NomeEscola, COUNT(Alunos.Matricula) AS "Número de Alunos"
FROM Escolas
INNER JOIN Alunos ON Escolas.EscolaID = Alunos.EscolaID
GROUP BY Escolas.NomeEscola;

SELECT * FROM Alunos