-- Databricks notebook source
-- Selecione todos os clientes paulistanos (moram na cidade de São Paulo):

SELECT *
FROM silver.olist.cliente
WHERE descCidade = 'sao paulo'

-- COMMAND ----------

-- Selecione todos os clientes paulistas (moram no estado de São Paulo):

SELECT *
FROM silver.olist.cliente
WHERE descUF = 'SP'

-- COMMAND ----------

-- Selecione todos os vendedores cariocas (moram na cidade do Rio de Janeiro) e paulistas (moram no estado de São Paulo):

SELECT *
FROM silver.olist.vendedor
WHERE descCidade = 'rio de janeiro' OR descUF = 'SP'

-- COMMAND ----------

-- Selecione produtos de perfumaria e bebes com altura maior que 5cm:

SELECT *
FROM silver.olist.produto
WHERE descCategoria IN('perfumaria', 'bebes') AND vlAlturaCm > 5

-- COMMAND ----------

-- Selecione os pedidos com mais de um item:

SELECT *
FROM silver.olist.item_pedido
WHERE idPedidoItem >=2
LIMIT 10

-- COMMAND ----------

-- Selecione os pedidos que o frete é mais caro que o item:

SELECT *
FROM silver.olist.item_pedido
WHERE vlFrete > vlPreco
LIMIT 10

-- COMMAND ----------

-- Lista de pedidos que ainda não foram enviados:

SELECT *
FROM silver.olist.pedido
WHERE dtEnvio IS NULL
LIMIT 10

-- COMMAND ----------

-- Lista de pedidos que foram entregues com atraso:

SELECT *
FROM silver.olist.pedido
WHERE date(dtEntregue) > date(dtEstimativaEntrega)
LIMIT  10

-- COMMAND ----------

-- Lista de pedidos que foram entregues com 2 dias de antecedência:

SELECT *
FROM silver.olist.pedido
WHERE day(dtEstimativaEntrega) - day(dtEntregue) = 2
LIMIT 10

-- COMMAND ----------

-- Selecione os pedidos feitos em dezembro de 2017 e entregues com atraso:

SELECT *
FROM silver.olist.pedido
WHERE (month(dtPedido) = 12 AND year(dtPedido) = 2017) AND (date(dtEntregue) > date(dtEstimativaEntrega))
LIMIT 20

-- COMMAND ----------

-- Selecione os pedidos com avaliação maior ou igual que 4:

SELECT *
FROM silver.olist.avaliacao_pedido
WHERE vlNota >= 4
LIMIT 10

-- COMMAND ----------

-- Selecione pedidos pagos com cartão de crédito com duas ou mais parcelas menores que R$40,00:

SELECT *
FROM silver.olist.pagamento_pedido
WHERE descTipoPagamento = 'credit_card' AND nrParcelas >= 2 AND vlPagamento < 40
LIMIT 10
