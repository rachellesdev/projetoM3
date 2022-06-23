#Quantos jogos não são em inglês?

SELECT
COUNT(1) as total,
(SELECT COUNT(1) FROM steam WHERE english =  0) as total_outro_idioma
FROM steam;