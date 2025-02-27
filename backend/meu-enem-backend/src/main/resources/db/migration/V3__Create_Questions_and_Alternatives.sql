CREATE TABLE questoes (
id SERIAL PRIMARY KEY,
co_item BIGINT NOT NULL UNIQUE,
title VARCHAR(255),
index INT,
year INT,
context TEXT,
correct_alternative CHAR(1),
alternatives_intro TEXT,
nu_param_a FLOAT,
nu_param_b FLOAT,
nu_param_c FLOAT,
co_prova INT,
tp_lingua SMALLINT CHECK (tp_lingua IN (0, 1)) DEFAULT NULL,
habilidade_id INT,
area_conhecimento_id INT,
file TEXT,
FOREIGN KEY (habilidade_id) REFERENCES habilidades(id),
FOREIGN KEY (area_conhecimento_id) REFERENCES areas_conhecimento(id)
);

CREATE TABLE alternativas (
id SERIAL PRIMARY KEY,
questao_id INT NOT NULL,
letra CHAR(1) NOT NULL,
texto TEXT,
file TEXT,
is_correct BOOLEAN NOT NULL,
FOREIGN KEY (questao_id) REFERENCES questoes(id) ON DELETE CASCADE
);