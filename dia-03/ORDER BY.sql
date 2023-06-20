-- Databricks notebook source
-- Ordenar tabela item_pedido pelo preço pago de forma crescente

SELECT *
FROM silver.olist.item_pedido
ORDER BY vlPreco ASC
LIMIT 10

-- COMMAND ----------

-- Ordenar tabela item_pedido pelo preço pago de forma decrescente

SELECT *
FROM silver.olist.item_pedido
ORDER BY vlPreco DESC
LIMIT 10

-- COMMAND ----------

-- Ordenar tabela item_pedido pelo preço pago e pelo valor do frete de forma decrescente e apresentar o TOP 3.

SELECT *
FROM silver.olist.item_pedido
ORDER BY vlPreco, vlFrete DESC
LIMIT 3

-- COMMAND ----------

-- Filtrar dados pela categoria "perfumaria" e ordenar pelo tamanho do nome do produto, apresentando o TOP 5.

SELECT *
FROM silver.olist.produto
WHERE descCategoria = 'perfumaria'
ORDER BY nrTamanhoNome DESC
LIMIT 5

-- COMMAND ----------

-- Filtrar dados pela categoria "perfumaria" e ordenar pelo volume do item (comprimento x altura x largura), apresentando o TOP 5.

SELECT *,
       (vlComprimentoCm * vlAlturaCm * vlLarguraCm) AS vlVolume
FROM silver.olist.produto
WHERE descCategoria = 'perfumaria'
ORDER BY vlVolume DESC
LIMIT 5
