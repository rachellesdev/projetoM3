#Quais jogos rodam em: linux, iOS e windows? Podemo limitar nos 10 primeiros para colocar no gráfico
SELECT name 
FROM steam
WHERE platforms = "windows;mac;linux";

SELECT name 
FROM steam
WHERE platforms LIKE "%windows%";

SELECT name 
FROM steam
WHERE platforms LIKE "%mac%";

SELECT name 
FROM steam
WHERE platforms LIKE "%linux%";