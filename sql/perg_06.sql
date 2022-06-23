#Quantos jogos são gratuitos ?
SELECT
COUNT(1) as total,
(SELECT COUNT(1) FROM STEAM WHERE price =  0) as total_de_graca
FROM steam;