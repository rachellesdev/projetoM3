CREATE TABLE personagens(
id_personagem INT PRIMARY KEY,
nome_personagem VARCHAR(255));

CREATE TABLE personagem_jogo(
id_personagem_jogo INT PRIMARY KEY,
id_personagem INT,
appid INT);

ALTER TABLE personagem_jogo ADD FOREIGN KEY (appid) REFERENCES steam (appid);


