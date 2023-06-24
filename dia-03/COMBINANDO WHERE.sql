-- Databricks notebook source
-- Verificando a quantidade de vendedores e vendedores únicos do RJ

SELECT count(DISTINCT idVendedor),
       count(idVendedor)
FROM silver.olist.vendedor
WHERE descUF = 'RJ'

-- COMMAND ----------

-- Verificando a quantidade de clientes, clientes únicos e cidades distintas do SP
SELECT count(idCliente),
       count(DISTINCT idClienteUnico),
       count(DISTINCT descCidade)
FROM silver.olist.cliente
WHERE descUF = 'SP'

-- COMMAND ----------

-- Verificando a média, mediana e desvio-padrão de peso da categoria bebês

SELECT mean(vlPesoGramas),
       percentile(vlPesoGramas, 0.5),
       std(vlPesoGramas)
FROM silver.olist.produto
WHERE descCategoria = 'bebes'

-- COMMAND ----------

-- Verificando a média, mediana, desvio-padrão, mínimo, máximo e amplitude de peso da categoria perfumaria 

SELECT mean(vlPesoGramas),
       percentile(vlPesoGramas, 0.5),
       std(vlPesoGramas),
       min(vlPesoGramas),
       max(vlPesoGramas),
       max(vlPesoGramas) - min(vlPesoGramas) AS amplitude
FROM silver.olist.produto
WHERE descCategoria = 'perfumaria'

-- COMMAND ----------


