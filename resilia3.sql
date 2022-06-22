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




