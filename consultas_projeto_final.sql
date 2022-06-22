#Quantos jogos rodam em: linux, iOS e windows?

SELECT COUNT(platforms) as quantidade_plataforma
FROM steam
WHERE platforms LIKE "%windows%";

SELECT COUNT(platforms) as quantidade_plataforma
FROM steam
WHERE platforms LIKE "%mac%";

SELECT COUNT(platforms) as quantidade_plataforma
FROM steam
WHERE platforms LIKE "%linux%";

SELECT COUNT(platforms) as quantidade_plataforma
FROM steam
WHERE platforms = "windows;mac;linux";

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

#Quais os 3 jogos melhores avaliados? colocar as notas no grafico
SELECT * FROM steam ORDER BY (positive_ratings) DESC
LIMIT 3;

#Dentre 10 jogos mais bem avaliados quantos quais são free ? colocar a avaliacao tbm no grafico
SELECT * FROM steam WHERE price = 0 ORDER BY (positive_ratings) DESC
LIMIT 10;

#Quais os 3 jogos piores avaliados? colocar a avaliacao no grafico
SELECT * FROM steam ORDER BY (positive_ratings) ASC
LIMIT 3;

#Quantos jogos são gratuitos ?
SELECT price, COUNT(price) as total_de_graca
FROM steam
WHERE price =  0
GROUP BY price;

#Qual a média de preço de cada gênero? O problema aqui é que não conseguimos separar cada action
# das colunas que tem mais de um gênero, ele busca tudo junto, para facilitar e colocar nos gráficos 
# podemos escolher alguns generos para colocar no grafico
SELECT genres, ROUND(AVG(price))
FROM steam
GROUP BY genres;

SELECT genres, ROUND(AVG(price)) as media_preco
FROM steam
WHERE genres = "action"
GROUP BY genres;
#Quais e quantos jogos devem ser jogados por maiores de 16 e 18 anos ?

SELECT * FROM steam WHERE required_age >= 16 ORDER BY (name) DESC;

SELECT required_age, COUNT(required_age) as total_para_maiores_de_16
FROM steam
WHERE required_age >=  16
GROUP BY required_age;

#Quais jogos são cyberpunk e são RPG? Fazer quantos jogos e colocar todos, pois sao só 13

SELECT COUNT(steamspy_tags) as rpg_e_cyberpunk
FROM steam
WHERE  steamspy_tags LIKE "%RPG%" AND steamspy_tags LIKE "%cyberpunk%";

SELECT name, steamspy_tags
FROM steam
WHERE  steamspy_tags LIKE "%RPG%" AND steamspy_tags LIKE "%cyberpunk%"
ORDER BY NAME;


#Quantos jogos de estratégia possuem villain protagonist?
SELECT *
FROM steam
WHERE  steamspy_tags LIKE  "%villain protagonist%" AND genres LIKE "%strategy%";

#Quantos jogos não são em inglês?
SELECT COUNT(english) as total_outro_idioma
FROM steam
WHERE english =  0
GROUP BY english;

#Quantos jogos possuem movies?
SELECT COUNT(movies) as trailler
FROM steam_media_data;

#Quantos jogos possuem mais de uma forma de suporte técnico? nao consegui fazer :/
SELECT website, support_url, support_email, COUNT(*)
FROM steam_support_info
WHERE website IS NOT NULL AND support_url is not null AND  support_email  is not null
GROUP BY website, support_url, support_email;


