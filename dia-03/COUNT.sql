-- Databricks notebook source
-- Contagem de linhas da tabela pedido:

SELECT COUNT(*),
       COUNT(1)
FROM silver.olist.pedido

-- COMMAND ----------

-- Contagem da coluna descSituacao considerando valores distintos (sem repetições).

SELECT COUNT(descSituacao),
       COUNT(DISTINCT descSituacao)
FROM silver.olist.pedido

-- COMMAND ----------

-- Contagem de uma tabela com chave primária:

SELECT COUNT(*),
       COUNT(idPedido),
       COUNT(DISTINCT idPedido)
FROM silver.olist.pedido
