-- Databricks notebook source
SELECT '2023-01-01' -- ano, mes, dia

-- COMMAND ----------

-- adicionando 30 dias na data

SELECT date_add('2023-01-01', 30)

-- COMMAND ----------

-- retirando 30 dias na data

SELECT date_add('2023-01-01', -30)

-- COMMAND ----------

-- retirando 30 dias na data

SELECT date_sub(now(), 30)

-- COMMAND ----------

-- adicionando 12 meses na data

SELECT add_months('2023-01-01', 12)

-- COMMAND ----------

-- retirando 12 meses na data

SELECT add_months('2023-01-01', -12)

-- COMMAND ----------

-- extrair ano:

SELECT year('2023-01-01')

-- COMMAND ----------

-- extrair mes:

SELECT month('2023-01-01')

-- COMMAND ----------

-- extrair dia:

SELECT day('2023-01-01')

-- COMMAND ----------

-- extrair dia da semana:

SELECT dayofweek('2023-01-01')

-- (1 = Domingo, 2 = Segunda, ..., 7 = Sábado)

-- COMMAND ----------

-- diferença em dias entre datas:

SELECT datediff('2023-06-01', '2023-01-01')

-- COMMAND ----------

-- diferença em meses entre datas:

SELECT months_between('2023-06-01', '2023-01-01')

-- COMMAND ----------

SELECT *
FROM silver.olist.pedido

-- COMMAND ----------

SELECT *,
       datediff(dtEntregue, dtPedido) as diasParaEntrega
FROM silver.olist.pedido
LIMIT 10

-- COMMAND ----------

SELECT idPedido,
       idCliente,
       dtPedido,
       dtEntregue,
       datediff(dtEntregue, dtPedido) as diasParaEntrega
FROM silver.olist.pedido
LIMIT 10

-- COMMAND ----------


