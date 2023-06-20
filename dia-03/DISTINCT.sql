-- Databricks notebook source
-- Obter valores distintos da UF da tabela de vendedor ordenados de forma crescente.

SELECT DISTINCT descUF
FROM silver.olist.vendedor
ORDER BY descUF ASC

-- COMMAND ----------

-- Obter valores distintos da cidade e do UF da tabela de vendedor ordenados de forma crescente.

SELECT DISTINCT descUF, descCidade
FROM silver.olist.vendedor
ORDER BY descUF ASC, descCidade ASC

-- COMMAND ----------

-- Obter valores distintos da categoria filtrando para mostrar dados não nulos e ordenados de forma crescente.

SELECT DISTINCT descCategoria
FROM silver.olist.produto
WHERE descCategoria IS NOT NULL
ORDER BY descCategoria ASC
