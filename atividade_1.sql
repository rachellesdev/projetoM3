create database spotify;
use spotify;

create table usuario(
id_usuario int PRIMARY KEY,
usuario VARCHAR(20),
username VARCHAR(20)
);

create table musica(
id_musica int PRIMARY KEY,
artista VARCHAR(100),
nome VARCHAR(100)
);

create table playlist(
id_playlist int PRIMARY KEY,
nome VARCHAR(100)
)