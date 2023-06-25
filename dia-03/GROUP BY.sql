-- Databricks notebook source
-- Contar número de vendedores distintos agrupados por estado e ordenados por esse número na tabela vendedor.

SELECT descUF AS Estado,
       count(DISTINCT idVendedor) AS Quantidade
FROM silver.olist.vendedor
GROUP BY Estado
ORDER BY Quantidade DESC

-- COMMAND ----------

-- Contar (a) número de produtos, (b) média de peso, (c) mediana de peso, (d) média de volume, (e) mediana de volume na tabela produto agrupados por categoria e ordenados decrescentemente por mediana do peso.

SELECT descCategoria,
       count(DISTINCT idProduto) AS quantidadeProdutos,
       mean(vlPesoGramas) AS mediaPeso,
       percentile(vlPesoGramas, 0.5) AS medianaPeso,
       mean(vlComprimentoCm*vlAlturaCm*vlLarguraCm) AS mediaVolume,
       percentile(vlComprimentoCm*vlAlturaCm*vlLarguraCm, 0.5) AS medianaVolume
FROM silver.olist.produto
GROUP BY descCategoria
ORDER BY medianaPeso

-- COMMAND ----------

-- Contar quantos pedidos foram feitos agrupando e ordenando por ano.

SELECT year(dtPedido) AS Ano,
       count(DISTINCT idPedido) AS Quantidade
FROM silver.olist.pedido
GROUP BY year(dtPedido)
ORDER BY year(dtPedido)

-- COMMAND ----------

-- Contar quantos pedidos foram feitos agrupando e ordenando por mês e ano.

SELECT year(dtPedido) AS Ano,
       month(dtPedido) AS Mes,
       count(DISTINCT idPedido) AS Quantidade
FROM silver.olist.pedido
GROUP BY year(dtPedido), month(dtPedido)
ORDER BY year(dtPedido) DESC, month(dtPedido)
