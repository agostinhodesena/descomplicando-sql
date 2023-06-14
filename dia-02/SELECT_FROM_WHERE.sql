-- Databricks notebook source
-- Filtrando tabela com pedidos com preço maior que 500:

SELECT *
FROM silver.olist.item_pedido
WHERE vlPreco >= 500
LIMIT 10

-- COMMAND ----------

-- Filtrando tabela com pedidos com frete maior que preço:

SELECT *
FROM silver.olist.item_pedido
WHERE vlFrete > vlPreco
LIMIT 10

-- COMMAND ----------

-- Filtrando tabela com pedidos com preço maior que 100 e frete maior que preço:

SELECT *
FROM silver.olist.item_pedido
WHERE vlPreco > 100 
AND vlFrete > vlPreco
LIMIT 10

-- COMMAND ----------

-- Filtrando produtos de petshop, telefonia e bebes:

  SELECT *
  FROM silver.olist.produto
  WHERE descCategoria = 'pet_shop'
  OR descCategoria = 'telefonia'
  OR descCategoria = 'bebes'
  LIMIT 20

-- COMMAND ----------

-- Filtrando produtos de petshop, telefonia e bebes:

  SELECT *
  FROM silver.olist.produto
  WHERE descCategoria IN ('pet_shop', 'telefonia', 'bebes')
  LIMIT 20

-- COMMAND ----------

-- Filtrando pedidos de janeiro de 2007 usando data:

SELECT *
FROM silver.olist.pedido
WHERE date(dtPedido) >= '2017-01-01'
AND date(dtPedido) <= '2017-01-31'
LIMIT 10

-- COMMAND ----------

-- Filtrando pedidos de janeiro de 2007 usando mês e ano:

SELECT *
FROM silver.olist.pedido
WHERE year(dtPedido) = 2017
AND month(dtPedido) = 01
LIMIT 10

-- COMMAND ----------

-- Filtrando pedidos de janeiro de 2007 e junho de 2017 usando data:

SELECT *
FROM silver.olist.pedido
WHERE (date(dtPedido) >= '2017-01-01' AND date(dtPedido) <= '2017-01-31') OR
      (date(dtPedido) >= '2017-06-01' AND date(dtPedido) <= '2017-06-30')
LIMIT 10

-- COMMAND ----------

-- Filtrando pedidos de janeiro de 2007 e junho de 2017 usando mês e ano:

SELECT *
FROM silver.olist.pedido
WHERE year(dtPedido) = 2017
AND (month(dtPedido) = 01 OR month(dtPedido) = 06)
LIMIT 10

-- COMMAND ----------

-- Filtrando pedidos de janeiro de 2007 e junho de 2017 usando IN:

SELECT *
FROM silver.olist.pedido
WHERE year(dtPedido) = 2017
AND month(dtPedido) IN (1,6)
LIMIT 10

-- COMMAND ----------


