-- Databricks notebook source
-- Qual pedido com maior valor de frete? E o menor?

SELECT idPedido,
       sum(vlFrete) AS totalFrete
FROM silver.olist.item_pedido
GROUP BY idPedido
ORDER BY totalFrete DESC
LIMIT 1

-- COMMAND ----------

SELECT idPedido,
       sum(vlFrete) AS totalFrete
FROM silver.olist.item_pedido
GROUP BY idPedido
ORDER BY totalFrete ASC

-- COMMAND ----------

-- Qual vendedor tem mais pedidos?

SELECT DISTINCT idVendedor,
       count(distinct idPedido) AS quantidade
FROM silver.olist.item_pedido
GROUP BY idVendedor
ORDER BY quantidade DESC
LIMIT 1

-- COMMAND ----------

-- Qual vendedor tem mais itens vendidos? E o com menos?

SELECT idVendedor,
       count(idProduto) AS quantidade
FROM silver.olist.item_pedido
GROUP BY idVendedor
ORDER BY quantidade DESC
LIMIT 1

-- COMMAND ----------

SELECT idVendedor,
       count(idProduto) AS quantidade
FROM silver.olist.item_pedido
GROUP BY idVendedor
ORDER BY quantidade ASC

-- COMMAND ----------

-- Qual dia tivemos mais pedidos?

SELECT date(dtPedido),
       count(DISTINCT idPedido) AS quantidade
FROM silver.olist.pedido
GROUP BY date(dtPedido)
ORDER BY count(DISTINCT idPedido) DESC

-- COMMAND ----------

-- Quantos vendedores são do estado de São Paulo?

SELECT DISTINCT descUF,
       count(DISTINCT idVendedor)
FROM silver.olist.vendedor
WHERE descUF = 'SP'
GROUP BY descUF

-- COMMAND ----------

-- Quantos vendedores são de Presidente Prudente?

SELECT DISTINCT descCidade,
       count(DISTINCT idVendedor)
FROM silver.olist.vendedor
WHERE descCidade = 'presidente prudente'
GROUP BY descCidade

-- COMMAND ----------

-- Quantos clientes são do estado do Rio de Janeiro?

SELECT DISTINCT descUF,
       count(DISTINCT idCliente)
FROM silver.olist.cliente
WHERE descUF = 'RJ'
GROUP BY descUF

-- COMMAND ----------

-- Quantos produtos são de construção?

SELECT DISTINCT descCategoria,
       count(DISTINCT idProduto)
FROM silver.olist.produto
WHERE descCategoria LIKE '%construcao%'
GROUP BY descCategoria

-- COMMAND ----------

-- Qual o valor médio de um pedido? E do frete?

SELECT sum(vlPreco) / count(DISTINCT idPedido) AS valorMedioPedido,
       sum(vlFrete) / count(DISTINCT idPedido) AS valorMedioFretePedido
FROM silver.olist.item_pedido

-- COMMAND ----------

-- Em média os pedidos são de quantas parcelas de cartão? E o valor médio por parcela?

SELECT mean(nrParcelas) AS valorQuantidadeParcela, 
       mean(vlPagamento/nrParcelas) AS valorMedioParcela
FROM silver.olist.pagamento_pedido
WHERE descTipoPagamento = 'credit_card'

-- COMMAND ----------

-- Quanto tempo em média demora para um pedido chegar depois de aprovado?

SELECT mean(datediff(day, dtAprovado, dtEntregue))
FROM silver.olist.pedido

-- COMMAND ----------

-- Qual estado tem mais vendedores?

SELECT DISTINCT descUF,
       count(DISTINCT idVendedor) AS Quantidade
FROM silver.olist.vendedor
GROUP BY descUF
SORT BY Quantidade DESC
LIMIT 1

-- COMMAND ----------

-- Qual cidade tem mais clientes?

SELECT DISTINCT descCidade,
       count(DISTINCT idCliente) AS Quantidade
FROM silver.olist.cliente
GROUP BY descCidade
SORT BY Quantidade DESC
LIMIT 1

-- COMMAND ----------

-- Qual categoria tem mais itens?

SELECT DISTINCT descCategoria,
       count(DISTINCT idProduto) AS Quantidade
FROM silver.olist.produto
GROUP BY descCategoria
ORDER BY Quantidade DESC
LIMIT 1

-- COMMAND ----------

-- Qual categoria tem maior peso médio de produto?

SELECT DISTINCT descCategoria,
       mean(vlPesoGramas) AS media
FROM silver.olist.produto
GROUP BY descCategoria
SORT BY media DESC
LIMIT 1

-- COMMAND ----------

-- Qual a série histórica de pedidos por dia? E receita?

SELECT DISTINCT date(dtPedido),
       count(DISTINCT idPedido)
FROM silver.olist.pedido
GROUP BY date(dtPedido)
ORDER BY date(dtPedido) ASC


-- COMMAND ----------

-- Qual produto é o campeão de vendas? Em receita? Em quantidade?

SELECT idProduto,
       count(*) AS quantidade,
       sum(vlPreco) AS receita
FROM silver.olist.item_pedido
GROUP BY idProduto
ORDER BY receita DESC

-- COMMAND ----------


