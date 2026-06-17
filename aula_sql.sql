-- ============================================================
-- AULA PRÁTICA: SQL COM SQLite
-- Disciplina: Banco de Dados — IMPA Tech
-- Banco de dados: vendas.db
-- ============================================================
--
-- ESTRUTURA DAS TABELAS:
--
--   Cliente
--     id    INTEGER  PRIMARY KEY AUTOINCREMENT
--     name  TEXT
--
--   Pedido
--     id          INTEGER  PRIMARY KEY AUTOINCREMENT
--     cliente_id  INTEGER  (referência ao id da tabela Cliente)
--     valor       REAL
--
-- ============================================================


-- ============================================================
-- 1. INSERT — Inserindo registros
-- ============================================================

-- Inserindo clientes especificando o nome da coluna (boa prática)
INSERT INTO Cliente (name) VALUES ('Ana');
INSERT INTO Cliente (name) VALUES ('João');

-- Inserindo pedidos associados aos clientes pelo id
INSERT INTO Pedido (cliente_id, valor) VALUES (1, 100);
INSERT INTO Pedido (cliente_id, valor) VALUES (2, 50);

-- INSERT sem especificar colunas: a ordem dos valores deve
-- seguir exatamente a ordem das colunas na tabela (id, name)
INSERT INTO Cliente VALUES (3, 'Maria');


-- ============================================================
-- 2. UPDATE — Alterando registros existentes
-- ============================================================

-- Atualiza o campo name do cliente cujo id = 3
-- Sem o WHERE, TODOS os registros seriam alterados!
UPDATE Cliente
SET name = 'Maria Silva'
WHERE id = 3;


-- ============================================================
-- 3. DELETE — Removendo registros
-- ============================================================

-- Remove o cliente com id = 3
-- Sem o WHERE, TODOS os registros seriam removidos!
DELETE FROM Cliente
WHERE id = 3;


-- ============================================================
-- 4. SELECT com JOIN — Combinando duas tabelas
-- ============================================================

-- Versão com alias: "c" representa Cliente, "p" representa Pedido
-- Alias tornam a query mais compacta
SELECT
    c.name,
    p.valor
FROM Cliente c
JOIN Pedido p ON c.id = p.cliente_id;

-- Versão sem alias: usa o nome completo das tabelas
-- Mais verbosa, mas mais fácil de ler para iniciantes
SELECT
    Cliente.name,
    Pedido.valor
FROM Cliente
JOIN Pedido ON Cliente.id = Pedido.cliente_id;


-- ============================================================
-- 5. Adicionando mais pedidos para os próximos exemplos
-- ============================================================

INSERT INTO Pedido (cliente_id, valor) VALUES (1, 200);
INSERT INTO Pedido (cliente_id, valor) VALUES (2, 300);


-- ============================================================
-- 6. GROUP BY — Agrupando e somando por cliente
-- ============================================================

-- SUM() soma os valores; GROUP BY agrupa uma linha por cliente
-- ORDER BY ... ASC ordena do menor para o maior total
SELECT
    Cliente.name,
    SUM(Pedido.valor) AS total_gasto
FROM Cliente
JOIN Pedido ON Cliente.id = Pedido.cliente_id
GROUP BY Cliente.name
ORDER BY total_gasto ASC;


-- ============================================================
-- 7. Funções de agregação simples
-- ============================================================

-- COUNT(*): conta o número total de linhas na tabela Pedido
SELECT COUNT(*) FROM Pedido;

-- SUM(valor): soma todos os valores de pedido
SELECT SUM(valor) FROM Pedido;

-- AVG(valor): calcula a média dos valores de pedido
SELECT AVG(valor) FROM Pedido;
