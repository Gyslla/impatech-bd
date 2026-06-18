-- ============================================================
-- GABARITO — Exercício de Fixação
-- Banco de Dados — IMPA Tech (Aula 5)
-- Banco: vendas.db
-- ============================================================
-- Estado esperado antes do exercício:
--   Cliente: Ana (id=1), João (id=2)
--   Pedido:  id=1 (Ana, 100), id=2 (João, 50)
-- ============================================================


-- ------------------------------------------------------------
-- Questão 1: Insira um novo cliente chamado Carlos.
-- ------------------------------------------------------------

INSERT INTO Cliente (name)
VALUES ('Carlos');

-- ATENÇÃO: Carlos receberá id = 4, não 3.
-- Por quê? A tabela usa AUTOINCREMENT, que nunca reutiliza ids.
-- O id=3 foi usado anteriormente pela Maria (mesmo tendo sido deletada),
-- então o próximo id disponível é 4.

-- Resultado esperado em Cliente:
--   id | name
--   1  | Ana
--   2  | João
--   4  | Carlos


-- ------------------------------------------------------------
-- Questão 2: Insira um pedido de R$ 200 para Carlos.
-- ------------------------------------------------------------

-- Como Carlos recebeu id = 4, usamos cliente_id = 4.
-- (Se o banco do aluno estiver diferente, o id pode variar —
--  peça para ele verificar com SELECT * FROM Cliente primeiro.)

INSERT INTO Pedido (cliente_id, valor)
VALUES (4, 200);


-- ------------------------------------------------------------
-- Questão 3: Liste todos os clientes.
-- ------------------------------------------------------------

SELECT *
FROM Cliente;

-- Resultado esperado:
--   id | name
--   1  | Ana
--   2  | João
--   4  | Carlos


-- ------------------------------------------------------------
-- Questão 4: Liste todos os pedidos do maior para o menor valor.
-- ------------------------------------------------------------

SELECT *
FROM Pedido
ORDER BY valor DESC;

-- Resultado esperado:
--   id | cliente_id | valor
--   3  | 4          | 200.0   ← pedido do Carlos
--   1  | 1          | 100.0   ← pedido da Ana
--   2  | 2          | 50.0    ← pedido do João


-- ------------------------------------------------------------
-- Questão 5: Qual é o valor total vendido?
-- ------------------------------------------------------------

SELECT SUM(valor) AS total_vendido
FROM Pedido;

-- Resultado esperado:
--   total_vendido
--   350.0
--   (100 + 50 + 200 = 350)
