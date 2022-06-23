#Quais jogos são cyberpunk e são RPG? Fazer quantos jogos e colocar todos, pois sao só 13
SELECT
COUNT(1),
(SELECT COUNT(1) FROM steam WHERE steamspy_tags LIKE "%RPG%" AND steamspy_tags LIKE "%cyberpunk%") as rpg_e_cyberpunk
FROM steam;

SELECT name, steamspy_tags
FROM steam
WHERE  steamspy_tags LIKE "%RPG%" AND steamspy_tags LIKE "%cyberpunk%"
ORDER BY NAME;