#Quantos jogos rodam em: linux, iOS e windows?
SELECT 
COUNT(1) as total,
	(SELECT COUNT(1) FROM steam WHERE platforms LIKE "%windows%") as quantidade_windows,
    (SELECT COUNT(1) FROM steam WHERE platforms LIKE "%mac%") as quantidade_mac,
    (SELECT COUNT(1) FROM steam WHERE platforms LIKE "%linux%") as quantidade_linux,
    (SELECT COUNT(1) FROM steam WHERE platforms = "windows;mac;linux") as quantidade_todos
FROM steam;