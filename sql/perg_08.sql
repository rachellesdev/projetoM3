#Quais e quantos jogos devem ser jogados por maiores de 16 e 18 anos ?

SELECT * FROM steam WHERE required_age >= 16 ORDER BY (name) DESC;

SELECT required_age, COUNT(required_age) as total_para_maiores_de_16
FROM steam
WHERE required_age >=  16
GROUP BY required_age;