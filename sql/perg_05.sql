#Quais os 3 jogos piores avaliados? colocar a avaliacao no grafico
SELECT * FROM steam ORDER BY (positive_ratings) ASC
LIMIT 3;