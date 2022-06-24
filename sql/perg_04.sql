#Dentre 10 jogos mais bem avaliados quantos quais são free ? colocar a avaliacao tbm no grafico
SELECT * FROM steam ORDER BY (positive_ratings) DESC
LIMIT 10; #aqui tem os 10. agr tem que pegar os grátis entre eles.)

SELECT *
FROM steam
WHERE appid in (730, 570, 570, 440, 4000, 218620, 105600, 550, 252950, 230410) and price =  0;

SELECT COUNT(1)
FROM steam
WHERE price !=  0;

SELECT COUNT(1)
FROM steam
WHERE price =  0;