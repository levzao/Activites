CREATE DATABASE IF NOT EXISTS gerenciamento_estoque CHARSET utf8;

USE gerenciamento_estoque;

CREATE TABLE IF NOT EXISTS Produtos(
ProdutoID INT PRIMARY KEY AUTO_INCREMENT,
NomeProduto VARCHAR(155) NOT NULL,
Descricao TEXT NOT NULL,
PrecoUnitario INT NOT NULL,
EstoqueMinimo INT NOT NULL
)DEFAULT CHARSET utf8;

CREATE TABLE IF NOT EXISTS Fornecedor(
FornecedorID INT PRIMARY KEY AUTO_INCREMENT,
NomeFornecedor VARCHAR(155) NOT NULL,
Endereco TEXT NOT NULL,
Telefone VARCHAR(23) NOT NULL,
Email VARCHAR(255) NOT NULL UNIQUE,
Produto_EstoqueID INT, 
FOREIGN KEY (Produto_EstoqueID) REFERENCES Produtos(ProdutoID)
)DEFAULT CHARSET utf8;

INSERT INTO Produtos(NomeProduto, Descricao, PrecoUnitario, EstoqueMinimo)
VALUES ('Cerave Loção Hidratante 473ml', 'A Loção Hidratante da Cerave é um produto que hidrata e nutre a pele do corpo', '27.90', '200'),
('Cimegripe Com 20 Comprimidos', 'Cimegripe é um medicamento indicado para o tratamento de gripes e resfriados', '11.00', '500'),
('Asseptcare Spray 50ml', 'Spray Antisséptico para curativos em geral', '49.90', '50'),
('Fita Cremer Protetora Para Os Pés C/1', 'Ideal para aplicar nos dedos, calcanhares e laterais dos pés que estão em atrito constante com calçados.', '30.90', '100'),
('Kuramed Spray 50ml', 'Trata ferimentos e cortes em geral.', '80.90', '200');

INSERT INTO Fornecedor(NomeFornecedor, Endereco, Telefone, Email)
VALUES ('Farmácia São Paulo', 'Rua do Uruguai 126, Salvador', '(71) 3215-0578', 'farmacia@saopaulo'),
('Farmácia Pague Menos', 'Av. Caminho de Areia 906, Salvador', '(71) 4002-8282', 'paguemenos@farmacia'),
('Drogaria da Gente', 'Av. Caminho Areia 153, Salvador', '(71) 3312-6111', 'drogaria@dagente'),
('Farmácia Shalon', 'Rua Aterro do Joanes 210, Salvador', '(71) 98805-0536', 'farmaciashalon@gmail.com'),
('Farmácia Bonfim', 'Rua da Imperatriz 121 (Bonfim), Salvador', '(71) 3023-2015', 'drogaria@bonfim');


SELECT Produtos.NomeProduto, Fornecedor.NomeFornecedor
FROM Produtos
INNER JOIN Fornecedor
ON Produtos.ProdutoID = Fornecedor.FornecedorID; 


SELECT * FROM Fornecedor, Produtos;'