
#Em quais jogos os personagem personagens aparecem?

SELECT nome_personagem, name as nome_jogo
FROM personagens
JOIN personagem_jogo ON personagens.id_personagem= personagem_jogo.id_personagem
JOIN steam ON personagem_jogo.appid = steam.appid;
