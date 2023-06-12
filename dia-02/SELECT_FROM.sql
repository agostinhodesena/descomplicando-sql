-- Databricks notebook source
-- DBTITLE 1,Consultando tabelas:
-- * = selecionar tudo de uma tabela
-- _._._ = catalogo.database.tabela 
-- o catálogo demonstra o nível de trabalho que as databases estão: gold, trabalhadas e quase prontas para uso; silver, dados puros;

SELECT *
FROM silver.olist.pedido

-- COMMAND ----------

-- Limitando 10 linhas da tabela no DATABRICKS:

SELECT *
FROM silver.olist.pedido
LIMIT 10

-- COMMAND ----------

SELECT *
FROM silver.olist.item_pedido
LIMIT 10

-- COMMAND ----------

-- criando uma coluna nova:

SELECT *, 
       vlPreco + vlFrete AS valorTotal
FROM silver.olist.item_pedido
LIMIT 10

-- COMMAND ----------

-- consultando apenas algumas colunas da tabela:

SELECT idPedido,
       idProduto,
       vlPreco,
       vlFrete,
       vlPreco + vlFrete AS valorTotal
FROM silver.olist.item_pedido
LIMIT 10

-- COMMAND ----------


