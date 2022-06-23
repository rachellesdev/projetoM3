#Quais os 3 jogos melhores avaliados? colocar as notas no grafico
SELECT * FROM steam ORDER BY (positive_ratings) DESC
LIMIT 3;