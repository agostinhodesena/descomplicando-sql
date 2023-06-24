-- Databricks notebook source
-- Verificando média na mão, média aritmética, mínimo e mediana dos preços da tabela item_pedido

SELECT sum(vlPreco) / count(vlPreco) AS media_na_mao,
       mean(vlPreco),
       min(vlPreco),
       percentile(vlPreco, 0.5)
FROM silver.olist.item_pedido

-- COMMAND ----------

-- Verificando máximo, desvio padrão, mediana e média aritmética dos valores de frete da tabela item_pedido.

SELECT max(vlFrete),
       std(vlFrete),
       percentile(vlFrete, 0.5),
       mean(vlFrete)
FROM silver.olist.item_pedido
