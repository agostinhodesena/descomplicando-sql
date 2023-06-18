-- Databricks notebook source
SELECT *
FROM silver.olist.item_pedido

-- COMMAND ----------

-- Criando faixa de preços usando CASE WHEN THEN:

SELECT *,
      CASE
          WHEN vlPreco <= 100 THEN '000 -| 100'
          WHEN vlPreco <= 200 THEN '100 -| 200'
          WHEN vlPreco <= 300 THEN '200 -| 300'
          WHEN vlPreco <= 400 THEN '300 -| 400'
          WHEN vlPreco <= 500 THEN '400 -| 500'
          WHEN vlPreco <= 600 THEN '500 -| 600'
          WHEN vlPreco <= 700 THEN '600 -| 700'
          WHEN vlPreco <= 800 THEN '700 -| 800'
          WHEN vlPreco <= 900 THEN '800 -| 900'
          WHEN vlPreco <= 1000 THEN '900 -| 1000'
          ELSE '+ 1000'
      END AS faixaPrecos
FROM silver.olist.item_pedido
LIMIT 20

-- COMMAND ----------

-- Criando níveis de frete:

SELECT *,
      CASE
          WHEN vlFrete / (vlFrete + vlPreco) = 0 THEN 'Frete Gratuito'
          WHEN vlFrete / (vlFrete + vlPreco) <= 0.2 THEN 'Frete Baixo'
          WHEN vlFrete / (vlFrete + vlPreco) <= 0.4 THEN 'Frete Médio'
          ELSE 'Frete Alto'
      END AS nivelFrete
FROM silver.olist.item_pedido

-- COMMAND ----------

SELECT *
FROM silver.olist.cliente
LIMIT 10

-- COMMAND ----------

-- Separando os clientes por regiões do Brasil:

SELECT *,
      CASE
          WHEN descUF IN ('ES', 'MG', 'SP', 'RJ') THEN 'Sudeste'
          WHEN descUF IN ('PR', 'SC', 'RS') THEN 'Sul'
          WHEN descUF IN ('DF', 'GO', 'MT', 'MS') THEN 'Centro-Oeste'
          WHEN descUF IN ('AC', 'AM', 'AP', 'PA', 'RO', 'RR', 'TO') THEN 'Sudeste'
          ELSE 'Nordeste'
      END AS descRegiao
FROM silver.olist.cliente
LIMIT 20

-- COMMAND ----------

-- Separando os clientes por nacionalidade:

SELECT *,
      CASE
          WHEN descUF = 'SP' THEN 'Paulista'
          WHEN descUF = 'RJ' THEN 'Fluminense'
          WHEN descUF = 'MG' THEN 'Mineiro'
          WHEN descUF = 'ES' THEN 'Capixaba'
          ELSE 'Não Mapeado'
      END AS descNacionalidade
FROM silver.olist.cliente
LIMIT 20

-- COMMAND ----------


