CREATE DATABASE RESILIA;

CREATE TABLE alunos(
id_aluno INT PRIMARY KEY,
nome_aluno VARCHAR(255));

CREATE TABLE emails(
id_emails INT PRIMARY KEY,
id_aluno INT
);

ALTER TABLE emails ADD foreign key (id_aluno) REFERENCES alunos (id_aluno);
ALTER TABLE emails ADD column email VARCHAR(255);

CREATE TABLE matricula(
id_matricula INT PRIMARY KEY,
id_aluno INT,
data_matricula DATE);

ALTER TABLE matricula ADD foreign key (id_aluno) REFERENCES alunos (id_aluno);

CREATE TABLE cursos(
id_curso INT PRIMARY KEY,
nome_curso VARCHAR (255));

CREATE TABLE turmas(
id_turma INT PRIMARY KEY,
nome_turma VARCHAR(255));

CREATE TABLE entregas(
id_entregas INT PRIMARY KEY,
id_aluno INT,
link_github TEXT,
modulo INT,
conceito VARCHAR(255));

ALTER TABLE entregas ADD foreign key (id_aluno) REFERENCES alunos (id_aluno);

CREATE TABLE aluno_turma(
id_aluno_turma INT PRIMARY KEY,
id_aluno INT,
id_turma INT);

ALTER TABLE aluno_turma ADD FOREIGN KEY (id_aluno) REFERENCES alunos (id_aluno);
ALTER TABLE aluno_turma ADD FOREIGN KEY (id_turma) REFERENCES turmas (id_turma);

CREATE TABLE curso_matricula(
id_curso_matricula INT PRIMARY KEY,
id_curso INT,
id_matricula INT);

ALTER TABLE curso_matricula ADD FOREIGN KEY (id_curso) REFERENCES cursos (id_curso);
ALTER TABLE curso_matricula ADD FOREIGN KEY (id_matricula) REFERENCES matricula (id_matricula);


#Saber quem são os alunos que entregaram o projeto do módulo 1 e estão com o conceito em “Pronto” ou “Mais que pronto”

SELECT * FROM entregas WHERE conceito =  "Mais que Pronto" OR conceito = "Pronto";

#Consultar quantos alunos temos em cada turma

SELECT id_turma, COUNT(id_aluno) as quantidade_alunos
FROM aluno_turma
GROUP BY id_turma;

#Quantos projetos no total (entre todas as turmas) foram entregues com conceito “Ainda não está pronto” e “Chegando lá”

SELECT conceito, COUNT(conceito) as quantidade_conceito
FROM entregas
WHERE conceito =  "Ainda não está pronto" OR conceito = "chegando lá"
GROUP BY conceito;

#Qual a turma com a maior quantidade de projetos no “Mais que pronto”

SELECT COUNT(e.conceito) as quantidade_conceito, at.id_turma, t.nome_turma
FROM aluno_turma as at
JOIN entregas as e ON e.id_aluno = at.id_aluno
JOIN turmas as t ON t.id_turma = at.id_turma
WHERE e.conceito =  "Mais que pronto"
GROUP BY at.id_turma
ORDER BY COUNT(e.conceito) DESC
LIMIT 1;


#populando as tabelas

INSERT INTO alunos (nome_aluno) VALUES
("Clara Sales"),
("Enrico Mendes"),
("Otávio Peixoto"),
("Laís Almeida"),
("Olivia Caldeira"),
("João Guilherme Fernandes"),
("Enzo Gabriel Fogaça"),
("Alexia Carvalho"),
("Carolina Campos"),
("Marina Dias"),
("Bernardo Castro"),
("Igor Ribeiro"),
("Gabriela Rezende"),
("Mirella Costa"),
("Ana Vitória Barros"),
("Theo Fogaça"),
("Olivia Aragão"),
("Melissa Araújo"),
("Evelyn Araújo"),
("Esther Azevedo"),
("Fernanda Viana"),
("Lucca Silveira"),
("Ryan Ramos"),
("Levi da Rocha"),
("Maria Sophia Araújo"),
("Ana Clara Ribeiro"),
("Luana Rocha"),
("Clarice Fernandes"),
("João Miguel Fernandes"),
("Luana Araújo"),
("Ana Vitória Silva"),
("João Lucas Castro"),
("Benjamin Gomes"),
("Felipe Ribeiro"),
("Maria Vitória Ferreira"),
("Caio Nunes"),
("Igor da Cruz"),
("Renan Silveira"),
("Luigi Monteiro"),
("Davi Rodrigues"),
("Enrico da Mata"),
("Melissa Ramos"),
("Caroline Silveira"),
("Miguel Souza"),
("Heitor da Mota"),
("Daniela Rodrigues"),
("Luiza Novaes"),
("Davi da Cruz"),
("Francisco Carvalho");


INSERT INTO emails (id_aluno, email) VALUES 
(1, "Nina@email.com"),
(2, "Clara@email.com"),
(3,"Enrico@email.com"),
(4,"Otávio@email.com"),
(5,"Laís@email.com"),
(6,"Olivia@email.com"),
(7,"João@email.com"),
(8,"Enzo@email.com"),
(9,"Alexia@email.com"),
(10,"Carolina@email.com"),
(11,"Marina@email.com"),
(12,"Bernardo@email.com"),
(13,"Igor@email.com"),
(14,"Gabriela@email.com"),
(15,"Mirella@email.com"),
(16,"Ana@email.com"),
(17,"Theo@email.com"),
(18,"Olivia@email.com"),
(19,"Melissa@email.com"),
(20,"Evelyn@email.com"),
(21,"Esther@email.com"),
(22,"Fernanda@email.com"),
(23,"Lucca@email.com"),
(24,"Ryan@email.com"),
(25,"Levi@email.com"),
(26,"Maria@email.com"),
(27,"Ana@email.com"),
(28,"Luana@email.com"),
(29,"Clarice@email.com"),
(30,"João@email.com"),
(31,"Luana@email.com"),
(32,"Ana@email.com"),
(33,"João@email.com"),
(34,"Benjamin@email.com"),
(35,"Felipe@email.com"),
(36,"Maria@email.com"),
(37,"Caio@email.com"),
(38,"Igor@email.com"),
(39,"Renan@email.com"),
(40,"Luigi@email.com"),
(41,"Davi@email.com"),
(42,"Enrico@email.com"),
(43,"Melissa@email.com"),
(44,"Caroline@email.com"),
(45,"Miguel@email.com"),
(46,"Heitor@email.com"),
(47,"Daniela@email.com"),
(48,"Luiza@email.com"),
(49,"Davi@email.com"),
(50,"Francisco@email.com");


INSERT INTO turmas (nome_turma) VALUES 
("T17"), ("T18");


INSERT INTO matricula (id_aluno, data_matricula) VALUES
(1, "2020-11-12"),
(2, "2020-12-13"),
(3,"2020-02-12"),
(4,"2020-12-22"),
(5,"2020-04-12"),
(6,"2020-11-02"),
(7,"2020-09-07"),
(8,"2020-10-30"),
(9,"2021-12-12"),
(10,"2021-12-12"),
(11,"2021-11-12"),
(12,"2020-11-12"),
(13,"2020-12-13"),
(14,"2020-02-12"),
(15,"2020-12-22"),
(16,"2020-04-12"),
(17,"2020-11-02"),
(18,"2020-09-07"),
(19,"2020-10-30"),
(20,"2021-12-12"),
(21,"2021-12-12"),
(22,"2021-11-12"),
(23,"2020-11-12"),
(24,"2020-12-13"),
(25,"2020-02-12"),
(26,"2020-12-22"),
(27,"2020-04-12"),
(28,"2020-11-02"),
(29,"2020-09-07"),
(30,"2020-10-30"),
(31,"2021-12-12"),
(32,"2021-12-12"),
(33,"2021-11-12"),
(34,"2020-11-12"),
(35,"2020-12-13"),
(36,"2020-02-12"),
(37,"2020-12-22"),
(38,"2020-04-12"),
(39,"2020-11-02"),
(40,"2020-09-07"),
(41,"2020-10-30"),
(42,"2021-12-12"),
(43,"2021-12-12"),
(44,"2021-11-12"),
(45,"2020-11-02"),
(46,"2020-09-07"),
(47,"2020-10-30"),
(48,"2021-12-12"),
(49,"2021-12-12"),
(50,"2021-11-12");


INSERT INTO cursos (id_matricula, nome_curso) VALUE 
(1, " Web Dev Full Stack"),
(2, " Web Dev Full Stack"),
(3," Web Dev Full Stack"),
(4," Web Dev Full Stack"),
(5," Web Dev Full Stack"),
(6," Web Dev Full Stack"),
(7," Web Dev Full Stack"),
(8," Web Dev Full Stack"),
(9," Web Dev Full Stack"),
(10," Web Dev Full Stack"),
(11," Web Dev Full Stack"),
(12," Web Dev Full Stack"),
(13," Web Dev Full Stack"),
(14," Web Dev Full Stack"),
(15," Web Dev Full Stack"),
(16," Web Dev Full Stack"),
(17," Web Dev Full Stack"),
(18," Web Dev Full Stack"),
(19," Web Dev Full Stack"),
(20," Web Dev Full Stack"),
(21," Web Dev Full Stack"),
(22," Web Dev Full Stack"),
(23," Web Dev Full Stack"),
(24," Web Dev Full Stack"),
(25," Web Dev Full Stack"),
(26," Web Dev Full Stack"),
(27," Web Dev Full Stack"),
(28," Web Dev Full Stack"),
(29," Web Dev Full Stack"),
(30," Web Dev Full Stack"),
(31," Web Dev Full Stack"),
(32," Web Dev Full Stack"),
(33," Web Dev Full Stack"),
(34," Web Dev Full Stack"),
(35," Web Dev Full Stack"),
(36," Web Dev Full Stack"),
(37," Web Dev Full Stack"),
(38," Web Dev Full Stack"),
(39," Web Dev Full Stack"),
(40," Web Dev Full Stack"),
(41," Web Dev Full Stack"),
(42," Web Dev Full Stack"),
(43," Web Dev Full Stack"),
(44," Web Dev Full Stack"),
(45," Web Dev Full Stack"),
(46," Web Dev Full Stack"),
(47," Web Dev Full Stack"),
(48," Web Dev Full Stack"),
(49," Web Dev Full Stack"),
(50," Web Dev Full Stack");


INSERT INTO entregas (id_aluno, link_github, modulo, conceito) VALUES 
(1, "https://github.com/nina",1, "Ainda não está pronto"),
(2, "https://github.com/clara",1, "Chegando lá"),
(3,"https://github.com/enrico",1, "Pronto"),
(4,"https://github.com/otavio",1, "Mais que Pronto"),
(5,"https://github.com/lais",1, "Ainda não está pronto"),
(6,"https://github.com/olivia",1, "Chegando lá"),
(7,"https://github.com/joao",1, "Pronto"),
(8,"https://github.com/enzo",1, "Mais que Pronto"),
(9,"https://github.com/alexia",1, "Ainda não está pronto"),
(10,"https://github.com/carolina",1, "Chegando lá"),
(11,"https://github.com/marina",1, "Pronto"),
(12,"https://github.com/bernardo",1, "Mais que Pronto"),
(13,"https://github.com/igor",1, "Ainda não está pronto"),
(14,"https://github.com/gabriela",1, "Chegando lá"),
(15,"https://github.com/mirella",1, "Pronto"),
(16,"https://github.com/ana",1, "Mais que Pronto"),
(17,"https://github.com/theo",1, "Ainda não está pronto"),
(18,"https://github.com/oliviaa",1, "Chegando lá"),
(19,"https://github.com/melissa",1, "Pronto"),
(20,"https://github.com/revelyn",1, "Mais que Pronto"),
(21,"https://github.com/esther",1, "Ainda não está pronto"),
(22,"https://github.com/fernanda",1, "Chegando lá"),
(23,"https://github.com/lucca",1, "Pronto"),
(24,"https://github.com/ryan",1, "Mais que Pronto"),
(25,"https://github.com/levi",1, "Ainda não está pronto"),
(26,"https://github.com/maria",1, "Chegando lá"),
(27,"https://github.com/anac",1, "Pronto"),
(28,"https://github.com/luana",1, "Mais que Pronto"),
(29,"https://github.com/rc;arice",1, "Ainda não está pronto"),
(30,"https://github.com/joaol",1, "Chegando lá"),
(31,"https://github.com/luana2",1, "Pronto"),
(32,"https://github.com/anahehe",1, "Mais que Pronto"),
(33,"https://github.com/joao-ctrl",1, "Ainda não está pronto"),
(34,"https://github.com/benjamin-ctrl",1, "Chegando lá"),
(35,"https://github.com/felipe-ctrl",1, "Pronto"),
(36,"https://github.com/rmaria-ctrl",1, "Mais que Pronto"),
(37,"https://github.com/rcaio-ctrl",1, "Ainda não está pronto"),
(38,"https://github.com/roigor-ctrl",1, "Chegando lá"),
(39,"https://github.com/renan-ctrl",1, "Pronto"),
(40,"https://github.com/luigia-ctrl",1, "Mais que Pronto"),
(41,"https://github.com/rdavia-ctrl",1, "Ainda não está pronto"),
(42,"https://github.com/enricoa-ctrl",1, "Chegando lá"),
(43,"https://github.com/melissana-ctrl",1, "Pronto"),
(44,"https://github.com/caroleine-ctrl",1, "Mais que Pronto"),
(45,"https://github.com/miguelna-ctrl",1, "Ainda não está pronto"),
(46,"https://github.com/heitora-ctrl",1, "Chegando lá"),
(47,"https://github.com/luizana-ctrl",1, "Pronto"),
(48,"https://github.com/rodabvia-ctrl",1, "Mais que Pronto"),
(49,"https://github.com/rdavihha-ctrl",1, "Ainda não está pronto"),
(50,"https://github.com/francicoa-ctrl",1, "Chegando lá");


INSERT INTO aluno_turma (id_aluno, id_turma) VALUES
(1,1),
(2,2),
(3,1),
(4,2),
(5,1),
(6,2),
(7,1),
(8,2),
(9,1),
(10,2),
(11,1),
(12,2),
(13,2),
(14,1),
(15,2),
(16,1),
(17,2),
(18,2),
(19,2),
(20,2),
(21,1),
(22,2),
(23,1),
(24,1),
(25,2),
(26,1),
(27,1),
(28,1),
(29,1),
(30,2),
(31,2),
(32,1),
(33,2),
(34,2),
(35,1),
(37,2),
(36,1),
(38,1),
(39,2),
(30,1),
(41,2),
(42,1),
(43,2),
(44,1),
(45,2),
(46,1),
(47,2),
(48,1),
(49,2),
(50,1);


INSERT INTO curso_matricula (id_curso, id_matricula) VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10),
(11,11),
(12,12),
(13,13),
(14,14),
(15,15),
(16,16),
(17,17),
(18,18),
(19,19),
(20,20),
(21,21),
(22,22),
(23,23),
(24,24),
(25,25),
(26,26),
(27,27),
(28,28),
(29,29),
(30,30),
(31,31),
(32,32),
(33,33),
(34,34),
(35,35),
(37,37),
(36,36),
(38,38),
(39,39),
(30,30),
(41,41),
(42,42),
(43,43),
(44,44),
(45,45),
(46,46),
(47,47),
(48,48),
(49,49),
(50,50);