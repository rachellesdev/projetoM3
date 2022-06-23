#Qual a média de preço de cada gênero? O problema aqui é que não conseguimos separar cada action
# das colunas que tem mais de um gênero, ele busca tudo junto, para facilitar e colocar nos gráficos 
# podemos escolher alguns generos para colocar no grafico
SELECT genres, ROUND(AVG(price))
FROM steam
GROUP BY genres;

SELECT genres, ROUND(AVG(price)) as media_preco
FROM steam
WHERE genres LIKE "%action%"
GROUP BY genres;

SELECT genres, ROUND(AVG(price)) as media_preco
FROM steam
WHERE genres LIKE "%RPG%"
GROUP BY genres;