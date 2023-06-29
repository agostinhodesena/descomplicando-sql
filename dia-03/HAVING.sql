-- Databricks notebook source
-- Verificar média do peso dos produtos das categorias 'bebes', 'perfumaria' e moveis e agrupar por categoria considerando apenas as categorias com mais de 100 produtos e média de peso maior que 1000, ordenado pela média de peso de ordem descrescente.

SELECT descCategoria AS categoria,
       count(DISTINCT idProduto) AS quantidade,
       mean(vlPesoGramas) AS mediaPeso
FROM silver.olist.produto
WHERE descCategoria IN ('bebes', 'perfumaria') OR descCategoria = '%moveis%'
GROUP BY descCategoria 
HAVING quantidade > 100 AND mediaPeso > 1000
ORDER BY mediaPeso DESC


-- COMMAND ----------


