-- AULA 2 - PRIMEIRAS CONSULTAS
-- Exemplo 1. Selecionando todas as linhas e colunas da:
-- a) Tabela pedidos
SELECT * FROM pedidos;

-- b) Tabela clientes
SELECT * FROM clientes;

-- Exemplo 2. Selecionando colunas especificas da Tabela clientes
SELECT 
	ID_Cliente,
    Nome,
	Data_Nascimento,
    Email
FROM clientes;

-- Exemplo 3. Mudando nomes de algumas colunas da Tabela clientes
SELECT 
	ID_Cliente AS 'Cliente_ID',
    Nome AS 'Cliente_Nome',
	Data_Nascimento AS 'Cliente_Data',
    Email AS 'Cliente_Email'
FROM clientes;

-- Exemplo 4.Selecionar as 5 primeiras linhas da Tabela produtos
SELECT * 
FROM produtos 
LIMIT 5;

-- Selecionar todas as linhas da Tabela produtos
-- ordenando pela coluna Preco_Unit
SELECT * FROM produtos
ORDER BY Preco_Unit;


-- AULA 3 - CRIANDO FILTROS
SELECT * 
FROM produtos;
-- Exemplo 1. Mostre apenas os produtos com preços iguais ou maiores a R$ 1.800
SELECT * 
FROM produtos WHERE Preco_Unit >= 1800;

-- Exemplo 2. Mostre apenas os produtos com preços a R$ 3.100
SELECT * 
FROM produtos 
WHERE Preco_Unit = 3100;

-- Exemplo 3. Mostre apenas os produtos da marca DELL
SELECT *
FROM produtos
WHERE Marca_Produto = 'DELL';

-- Exemplo 4. Mostre apenas  os pedidos feitos no dia 03/01/2019
SELECT *
FROM pedidos
WHERE Data_Venda = '2019-01-03';

-- Exemplo 5. Mostre apenas os clientes solteiros e masculinos
SELECT *
FROM clientes
WHERE Estado_Civil = 'S' AND Sexo = 'M';

-- Exemplo 6. Mostrar apenas os produtos da marca DELL ou Samsung
SELECT *
FROM produtos
WHERE Marca_Produto = 'DELL' OR Marca_Produto = 'Samsung';


-- Aula 4. FUNÇÕES DE AGREGAÇÃO
-- Exemplo 1. Contar a qtd de clientes na tabela clientes
SELECT 
	COUNT(Nome)
FROM clientes;

-- Exemplo 2. Contar a qtd de escolaridades distintas na tabela clientes
SELECT
	COUNT(distinct Escolaridade)
FROM clientes;

-- Exemplo 3. Somar a receita da tabela pedidos
--            e alterar o nome da coluna
SELECT 
	SUM(Receita_Venda) AS 'Total_Receita'
FROM pedidos;

-- Exemplo 4. Fazer a média da receita da tabela pedidos
--            e alterar o nome da coluna
SELECT
	AVG(Receita_Venda) AS 'Media_Receita'
FROM pedidos;

-- Exemplo 5. Mostrar a menor e a maior receita da tabela pedidos
--            e alterar o nome da coluna
SELECT
	MIN(Receita_Venda) AS 'Menor_Receita',
    MAX(Receita_Venda) AS 'Maior_Receita'
FROM pedidos;


-- Aula 5. CRIANDO AGRUPAMENTOS COM GROUP BY
-- Exemplo 1. Descobrir o total de clientes por sexo
SELECT Sexo,
	COUNT(*) AS 'Qtd. Clientes'
FROM clientes
GROUP BY Sexo;

-- Exemplo 2. Retornar o total de produtos por marca da tabela produtos
SELECT Marca_Produto,
	COUNT(*) AS 'Qtd_Produtos'
FROM produtos
GROUP BY Marca_Produto;

-- Exemplo 3. Descobrir a receita total e o custo total 
--            da tabela pedidos por ID de loja
SELECT ID_Loja,
	SUM(Receita_Venda) AS 'Receita_Total',
    SUM(Custo_Venda) AS 'Custo_Total'
FROM pedidos
GROUP BY ID_Loja;


-- Aula 6. RELACIONAMENTO DE TABELAS COM INNER JOIN
-- Exemplo 1. Faça uma consulta que tenha como resultado
--            todas as colunas da tabela pedidos e as colunas
--            Loja, Gerente e Telefone

-- Tabela A > Tabela Fato: pedidos
-- Tabela B > Tabela Dimensão: lojas
-- Chave Primária (pedidos): ID_Lojas
-- Chave Estrangeira (lojas): ID_Lojas

SELECT 
	pedidos.*,
    lojas.Loja,
    lojas.Gerente,
    lojas.Telefone
FROM pedidos
INNER JOIN lojas
	ON pedidos.ID_Loja = lojas.ID_Loja;