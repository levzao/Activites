CREATE DATABASE IF NOT EXISTS sistema_funcionarios CHARSET utf8;

USE sistema_funcionarios;


CREATE TABLE IF NOT EXISTS Departamentos(
DepartamentosID INT PRIMARY KEY AUTO_INCREMENT,
Nome VARCHAR(155) NOT NULL
)DEFAULT CHARSET utf8;

CREATE TABLE IF NOT EXISTS Funcionarios(
FuncionarioID INT PRIMARY KEY AUTO_INCREMENT,
Nome VARCHAR(155) NOT NULL,
Cargo VARCHAR(155) NOT NULL,
DataContratacao DATE NOT NULL,
Salario DECIMAL(10,2) NOT NULL,
Departamentos INT,
FOREIGN KEY (Departamentos) REFERENCES Departamentos(DepartamentosID)
)DEFAULT CHARSET utf8;


CREATE TABLE IF NOT EXISTS Dependentes(
DependentesID INT PRIMARY KEY AUTO_INCREMENT,
Nome VARCHAR(155) NOT NULL,
DataNascimento DATE,
Funcionario INT,
FOREIGN KEY (Funcionario) REFERENCES Funcionarios(FuncionarioID)
)DEFAULT CHARSET utf8;




-- Inserindo dados na tabela "Departamentos"
INSERT INTO Departamentos (Nome) VALUES
('TI'),
('Recursos Humanos'),
('Financeiro'),
('Vendas'),
('Logística');

-- Inserindo dados na tabela "Funcionarios"
INSERT INTO Funcionarios (Nome, Cargo, DataContratacao, Salario, Departamentos) VALUES
('João', 'Programador', '2023-05-10', 5000.00, 1), -- Funcionário pertence ao departamento de TI (ID 1)
('Maria', 'Recrutadora', '2023-05-11', 4500.00, 2), -- Funcionário pertence ao departamento de Recursos Humanos (ID 2)
('Carlos', 'Analista Financeiro', '2023-05-12', 5500.00, 3), -- Funcionário pertence ao departamento Financeiro (ID 3)
('Ana', 'Vendedor', '2023-05-13', 4000.00, 4), -- Funcionário pertence ao departamento de Vendas (ID 4)
('Pedro', 'Gerente de Logística', '2023-05-14', 6000.00, 5); -- Funcionário pertence ao departamento de Logística (ID 5)

-- Inserindo dados na tabela "Dependentes"
INSERT INTO Dependentes (Nome, DataNascimento, Funcionario) VALUES
('Lucas', '2010-03-15', 1), -- Dependente do Funcionário João (ID 1)
('Sophia', '2015-07-22', 2), -- Dependente da Funcionária Maria (ID 2)
('Luis', '2008-12-10', 3), -- Dependente do Funcionário Carlos (ID 3)
('Mariana', '2017-05-05', 4), -- Dependente da Funcionária Ana (ID 4)
('Rafael', '2019-11-30', 5); -- Dependente do Funcionário Pedro (ID 5)


SELECT F.Nome AS 'Nome do Funcionário',
D.Nome AS 'Nome do Dependente',
Dep.Nome AS 'Departamento'
FROM Funcionarios AS F
INNER JOIN Dependentes AS D ON F.FuncionarioID = D.Funcionario
INNER JOIN Departamentos AS Dep ON F.Departamentos = Dep.DepartamentosID;

