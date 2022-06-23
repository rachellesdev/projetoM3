#Quantos jogos possuem movies?
SELECT 	count(1) as total,
	(SELECT COUNT(1) from steam_media_data where movies != '') as trailler
FROM steam_media_data;