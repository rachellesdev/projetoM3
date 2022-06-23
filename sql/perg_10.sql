#Quantos jogos de estratégia possuem villain protagonist?
SELECT
COUNT(1) as total,
(SELECT COUNT(1) FROM steam WHERE steamspy_tags LIKE  "%villain protagonist%" AND genres LIKE "%strategy%") AS quantidade_viloes
FROM steam;

#Quais jogos
SELECT *
FROM steam
WHERE  steamspy_tags LIKE  "%villain protagonist%" AND genres LIKE "%strategy%";