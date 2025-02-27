-- Criação da tabela Áreas de Conhecimento
CREATE TABLE areas_conhecimento (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(255) NOT NULL,
  abreviacao VARCHAR(10) NOT NULL
);

-- Criação da tabela Competências
CREATE TABLE competencias (
  id SERIAL PRIMARY KEY,
  competenciadearea INT NOT NULL,
  descricao TEXT NOT NULL,
  area_conhecimento_id INT NOT NULL,
  FOREIGN KEY (area_conhecimento_id) REFERENCES areas_conhecimento(id)
);

-- Criação da tabela Habilidades
CREATE TABLE habilidades (
  id SERIAL PRIMARY KEY,
  habilidade INT NOT NULL,
  descricao TEXT NOT NULL,
  competencia_id INT NOT NULL,
  FOREIGN KEY (competencia_id) REFERENCES competencias(id)
);


-- Inserção de dados na tabela Áreas de Conhecimento
INSERT INTO areas_conhecimento (nome, abreviacao)
VALUES 
('Linguagens, Códigos e suas Tecnologias', 'LC');

-- Inserção de dados na tabela Competências
INSERT INTO competencias (competenciadearea, descricao, area_conhecimento_id)
VALUES 
(1, 'Aplicar as tecnologias da comunicação e da informação na escola, no trabalho e em outros contextos relevantes para sua vida.', 1),
(2, 'Conhecer e usar língua(s) estrangeira(s) moderna(s) como instrumento de acesso a informações e a outras culturas e grupos sociais.', 1),
(3, 'Compreender e usar a linguagem corporal como relevante para a própria vida, integradora social e formadora da identidade.', 1),
(4, 'Compreender a arte como saber cultural e estético gerador de significação e integrador da organização do mundo e da própria identidade.', 1),
(5, 'Analisar, interpretar e aplicar recursos expressivos das linguagens, relacionando textos com seus contextos, mediante a natureza, função, organização, estrutura das manifestações, de acordo com as condições de produção e recepção.', 1),
(6, 'Compreender e usar os sistemas simbólicos das diferentes linguagens como meios de organização cognitiva da realidade pela constituição de significados, expressão, comunicação e informação.', 1),
(7, 'Confrontar opiniões e pontos de vista sobre as diferentes linguagens e suas manifestações específicas.', 1),
(8, 'Compreender e usar a língua portuguesa como língua materna, geradora de significação e integradora da organização do mundo e da própria identidade.', 1),
(9, 'Entender os princípios, a natureza, a função e o impacto das tecnologias da comunicação e da informação na sua vida pessoal e social, no desenvolvimento do conhecimento, associando-o aos conhecimentos científicos, às linguagens que lhes dão suporte, às demais tecnologias, aos processos de produção e aos problemas que se propõem solucionar.', 1);

-- Inserção de dados na tabela Habilidades
INSERT INTO habilidades (habilidade, descricao, competencia_id)
VALUES 
-- Competência 1
(1, 'Identificar as diferentes linguagens e seus recursos expressivos como elementos de caracterização dos sistemas de comunicação.', 1),
(2, 'Recorrer aos conhecimentos sobre as linguagens dos sistemas de comunicação e informação para resolver problemas sociais.', 1),
(3, 'Relacionar informações geradas nos sistemas de comunicação e informação, considerando a função social desses sistemas.', 1),
(4, 'Reconhecer posições críticas aos usos sociais que são feitos das linguagens e dos sistemas de comunicação e informação.', 1),

-- Competência 2
(5, 'Associar vocábulos e expressões de um texto em LEM ao seu tema.', 2),
(6, 'Utilizar os conhecimentos da LEM e de seus mecanismos como meio de ampliar as possibilidades de acesso a informações, tecnologias e culturas.', 2),
(7, 'Relacionar um texto em LEM, as estruturas linguísticas, sua função e seu uso social.', 2),
(8, 'Reconhecer a importância da produção cultural em LEM como representação da diversidade cultural e linguística.', 2),

-- Competência 3
(9, 'Reconhecer as manifestações corporais de movimento como originárias de necessidades cotidianas de um grupo social.', 3),
(10, 'Reconhecer a necessidade de transformação de hábitos corporais em função das necessidades cinestésicas.', 3),
(11, 'Reconhecer a linguagem corporal como meio de interação social, considerando os limites de desempenho e as alternativas de adaptação para diferentes indivíduos.', 3),

-- Competência 4
(12, 'Reconhecer diferentes funções da arte, do trabalho da produção dos artistas em seus meios culturais.', 4),
(13, 'Analisar as diversas produções artísticas como meio de explicar diferentes culturas, padrões de beleza e preconceitos.', 4),
(14, 'Reconhecer o valor da diversidade artística e das inter-relações de elementos que se apresentam nas manifestações de vários grupos sociais e étnicos.', 4),

-- Competência 5
(15, 'Estabelecer relações entre o texto literário e o momento de sua produção, situando aspectos do contexto histórico, social e político.', 5),
(16, 'Relacionar informações sobre concepções artísticas e procedimentos de construção do texto literário.', 5),
(17, 'Reconhecer a presença de valores sociais e humanos atualizáveis e permanentes no patrimônio literário nacional.', 5),

-- Competência 6
(18, 'Identificar os elementos que concorrem para a progressão temática e para a organização e estruturação de textos de diferentes gêneros e tipos.', 6),
(19, 'Analisar a função da linguagem predominante nos textos em situações específicas de interlocução.', 6),
(20, 'Reconhecer a importância do patrimônio linguístico para a preservação da memória e da identidade nacional.', 6),

-- Competência 7
(21, 'Reconhecer em textos de diferentes gêneros, recursos verbais e não-verbais utilizados com a finalidade de criar e mudar comportamentos e hábitos.', 7),
(22, 'Relacionar, em diferentes textos, opiniões, temas, assuntos e recursos linguísticos.', 7),
(23, 'Inferir em um texto quais são os objetivos de seu produtor e quem é seu público alvo, pela análise dos procedimentos argumentativos utilizados.', 7),
(24, 'Reconhecer no texto estratégias argumentativas empregadas para o convencimento do público, tais como a intimidação, sedução, comoção, chantagem, entre outras.', 7),

-- Competência 8
(25, 'Identificar, em textos de diferentes gêneros, as marcas linguísticas que singularizam as variedades linguísticas sociais, regionais e de registro.', 8),
(26, 'Relacionar as variedades linguísticas a situações específicas de uso social.', 8),
(27, 'Reconhecer os usos da norma padrão da língua portuguesa nas diferentes situações de comunicação.', 8),

-- Competência 9
(28, 'Reconhecer a função e o impacto social das diferentes tecnologias da comunicação e informação.', 9),
(29, 'Identificar pela análise de suas linguagens, as tecnologias da comunicação e informação.', 9),
(30, 'Relacionar as tecnologias de comunicação e informação ao desenvolvimento das sociedades e ao conhecimento que elas produzem.', 9);


-- Inserção na tabela Áreas de Conhecimento
INSERT INTO areas_conhecimento (nome, abreviacao)
VALUES 
('Matemática e suas Tecnologias', 'MT');

-- Inserção na tabela Competências
INSERT INTO competencias (competenciadearea, descricao, area_conhecimento_id)
VALUES 
(1, 'Construir significados para os números naturais, inteiros, racionais e reais.', 2),
(2, 'Utilizar o conhecimento geométrico para realizar a leitura e a representação da realidade e agir sobre ela.', 2),
(3, 'Construir noções de grandezas e medidas para a compreensão da realidade e a solução de problemas do cotidiano.', 2),
(4, 'Construir noções de variação de grandezas para a compreensão da realidade e a solução de problemas do cotidiano.', 2),
(5, 'Modelar e resolver problemas que envolvem variáveis socioeconômicas ou técnico-científicas, usando representações algébricas.', 2),
(6, 'Interpretar informações de natureza científica e social obtidas da leitura de gráficos e tabelas, realizando previsão de tendência, extrapolação, interpolação e interpretação.', 2),
(7, 'Compreender o caráter aleatório e não-determinístico dos fenômenos naturais e sociais e utilizar instrumentos adequados para medidas, determinação de amostras e cálculos de probabilidade para interpretar informações de variáveis apresentadas em uma distribuição estatística.', 2);

-- Inserção na tabela Habilidades
INSERT INTO habilidades (habilidade, descricao, competencia_id)
VALUES 
-- Competência 1
(1, 'Reconhecer, no contexto social, diferentes significados e representações dos números e operações - naturais, inteiros, racionais ou reais.', 10),
(2, 'Identificar padrões numéricos ou princípios de contagem.', 10),
(3, 'Resolver situação-problema envolvendo conhecimentos numéricos.', 10),
(4, 'Avaliar a razoabilidade de um resultado numérico na construção de argumentos sobre afirmações quantitativas.', 10),
(5, 'Avaliar propostas de intervenção na realidade utilizando conhecimentos numéricos.', 10),

-- Competência 2
(6, 'Interpretar a localização e a movimentação de pessoas/objetos no espaço tridimensional e sua representação no espaço bidimensional.', 11),
(7, 'Identificar características de figuras planas ou espaciais.', 11),
(8, 'Resolver situação-problema que envolva conhecimentos geométricos de espaço e forma.', 11),
(9, 'Utilizar conhecimentos geométricos de espaço e forma na seleção de argumentos propostos como solução de problemas do cotidiano.', 11),

-- Competência 3
(10, 'Identificar relações entre grandezas e unidades de medida.', 12),
(11, 'Utilizar a noção de escalas na leitura de representação de situação do cotidiano.', 12),
(12, 'Resolver situação-problema que envolva medidas de grandezas.', 12),
(13, 'Avaliar o resultado de uma medição na construção de um argumento consistente.', 12),
(14, 'Avaliar proposta de intervenção na realidade utilizando conhecimentos geométricos relacionados a grandezas e medidas.', 12),

-- Competência 4
(15, 'Identificar a relação de dependência entre grandezas.', 13),
(16, 'Resolver situação-problema envolvendo a variação de grandezas, direta ou inversamente proporcionais.', 13),
(17, 'Analisar informações envolvendo a variação de grandezas como recurso para a construção de argumentação.', 13),
(18, 'Avaliar propostas de intervenção na realidade envolvendo variação de grandezas.', 13),

-- Competência 5
(19, 'Identificar representações algébricas que expressem a relação entre grandezas.', 14),
(20, 'Interpretar gráfico cartesiano que represente relações entre grandezas.', 14),
(21, 'Resolver situação-problema cuja modelagem envolva conhecimentos algébricos.', 14),
(22, 'Utilizar conhecimentos algébricos/geométricos como recurso para a construção de argumentação.', 14),
(23, 'Avaliar propostas de intervenção na realidade utilizando conhecimentos algébricos.', 14),

-- Competência 6
(24, 'Utilizar informações expressas em gráficos ou tabelas para fazer inferências.', 15),
(25, 'Resolver problema com dados apresentados em tabelas ou gráficos.', 15),
(26, 'Analisar informações expressas em gráficos ou tabelas como recurso para a construção de argumentos.', 15),

-- Competência 7
(27, 'Calcular medidas de tendência central ou de dispersão de um conjunto de dados expressos em uma tabela de frequências de dados agrupados (não em classes) ou em gráficos.', 16),
(28, 'Resolver situação-problema que envolva conhecimentos de estatística e probabilidade.', 16),
(29, 'Utilizar conhecimentos de estatística e probabilidade como recurso para a construção de argumentação.', 16),
(30, 'Avaliar propostas de intervenção na realidade utilizando conhecimentos de estatística e probabilidade.', 16);


-- Inserção na tabela Áreas de Conhecimento
INSERT INTO areas_conhecimento (nome, abreviacao)
VALUES 
('Ciências da Natureza e suas Tecnologias', 'CN');

-- Inserção na tabela Competências
INSERT INTO competencias (competenciadearea, descricao, area_conhecimento_id)
VALUES 
(1, 'Compreender as ciências naturais e as tecnologias a elas associadas como construções humanas, percebendo seus papéis nos processos de produção e no desenvolvimento econômico e social da humanidade.', 3),
(2, 'Identificar a presença e aplicar as tecnologias associadas às ciências naturais em diferentes contextos.', 3),
(3, 'Associar intervenções que resultam em degradação ou conservação ambiental a processos produtivos e sociais e a instrumentos ou ações científico-tecnológicos.', 3),
(4, 'Compreender interações entre organismos e ambiente, em particular aquelas relacionadas à saúde humana, relacionando conhecimentos científicos, aspectos culturais e características individuais.', 3),
(5, 'Entender métodos e procedimentos próprios das ciências naturais e aplicá-los em diferentes contextos.', 3),
(6, 'Apropriar-se de conhecimentos da física para, em situações problema, interpretar, avaliar ou planejar intervenções científico-tecnológicas.', 3),
(7, 'Apropriar-se de conhecimentos da química para, em situações problema, interpretar, avaliar ou planejar intervenções científico-tecnológicas.', 3),
(8, 'Apropriar-se de conhecimentos da biologia para, em situações problema, interpretar, avaliar ou planejar intervenções científico-tecnológicas.', 3);

-- Inserção na tabela Habilidades
INSERT INTO habilidades (habilidade, descricao, competencia_id)
VALUES 
-- Competência 1
(1, 'Reconhecer características ou propriedades de fenômenos ondulatórios ou oscilatórios, relacionando-os a seus usos em diferentes contextos.', 17),
(2, 'Associar a solução de problemas de comunicação, transporte, saúde ou outro, com o correspondente desenvolvimento científico e tecnológico.', 17),
(3, 'Confrontar interpretações científicas com interpretações baseadas no senso comum, ao longo do tempo ou em diferentes culturas.', 17),
(4, 'Avaliar propostas de intervenção no ambiente, considerando a qualidade da vida humana ou medidas de conservação, recuperação ou utilização sustentável da biodiversidade.', 17),

-- Competência 2
(5, 'Dimensionar circuitos ou dispositivos elétricos de uso cotidiano.', 18),
(6, 'Relacionar informações para compreender manuais de instalação ou utilização de aparelhos, ou sistemas tecnológicos de uso comum.', 18),
(7, 'Selecionar testes de controle, parâmetros ou critérios para a comparação de materiais e produtos, tendo em vista a defesa do consumidor, a saúde do trabalhador ou a qualidade de vida.', 18),

-- Competência 3
(8, 'Identificar etapas em processos de obtenção, transformação, utilização ou reciclagem de recursos naturais, energéticos ou matérias-primas, considerando processos biológicos, químicos ou físicos neles envolvidos.', 19),
(9, 'Compreender a importância dos ciclos biogeoquímicos ou do fluxo energia para a vida, ou da ação de agentes ou fenômenos que podem causar alterações nesses processos.', 19),
(10, 'Analisar perturbações ambientais, identificando fontes, transporte e(ou) destino dos poluentes ou prevendo efeitos em sistemas naturais, produtivos ou sociais.', 19),
(11, 'Reconhecer benefícios, limitações e aspectos éticos da biotecnologia, considerando estruturas e processos biológicos envolvidos em produtos biotecnológicos.', 19),
(12, 'Avaliar impactos em ambientes naturais decorrentes de atividades sociais ou econômicas, considerando interesses contraditórios.', 19),

-- Competência 4
(13, 'Reconhecer mecanismos de transmissão da vida, prevendo ou explicando a manifestação de características dos seres vivos.', 20),
(14, 'Identificar padrões em fenômenos e processos vitais dos organismos, como manutenção do equilíbrio interno, defesa, relações com o ambiente, sexualidade, entre outros.', 20),
(15, 'Interpretar modelos e experimentos para explicar fenômenos ou processos biológicos em qualquer nível de organização dos sistemas biológicos.', 20),
(16, 'Compreender o papel da evolução na produção de padrões, processos biológicos ou na organização taxonômica dos seres vivos.', 20),

-- Competência 5
(17, 'Relacionar informações apresentadas em diferentes formas de linguagem e representação usadas nas ciências físicas, químicas ou biológicas, como texto discursivo, gráficos, tabelas, relações matemáticas ou linguagem simbólica.', 21),
(18, 'Relacionar propriedades físicas, químicas ou biológicas de produtos, sistemas ou procedimentos tecnológicos às finalidades a que se destinam.', 21),
(19, 'Avaliar métodos, processos ou procedimentos das ciências naturais que contribuam para diagnosticar ou solucionar problemas de ordem social, econômica ou ambiental.', 21),

-- Competência 6
(20, 'Caracterizar causas ou efeitos dos movimentos de partículas, substâncias, objetos ou corpos celestes.', 22),
(21, 'Utilizar leis físicas e (ou) químicas para interpretar processos naturais ou tecnológicos inseridos no contexto da termodinâmica e(ou) do eletromagnetismo.', 22),
(22, 'Compreender fenômenos decorrentes da interação entre a radiação e a matéria em suas manifestações em processos naturais ou tecnológicos, ou em suas implicações biológicas, sociais, econômicas ou ambientais.', 22),
(23, 'Avaliar possibilidades de geração, uso ou transformação de energia em ambientes específicos, considerando implicações éticas, ambientais, sociais e/ou econômicas.', 22),

-- Competência 7
(24, 'Utilizar códigos e nomenclatura da química para caracterizar materiais, substâncias ou transformações químicas.', 23),
(25, 'Caracterizar materiais ou substâncias, identificando etapas, rendimentos ou implicações biológicas, sociais, econômicas ou ambientais de sua obtenção ou produção.', 23),
(26, 'Avaliar implicações sociais, ambientais e/ou econômicas na produção ou no consumo de recursos energéticos ou minerais, identificando transformações químicas ou de energia envolvidas nesses processos.', 23),
(27, 'Avaliar propostas de intervenção no meio ambiente aplicando conhecimentos químicos, observando riscos ou benefícios.', 23),

-- Competência 8
(28, 'Associar características adaptativas dos organismos com seu modo de vida ou com seus limites de distribuição em diferentes ambientes, em especial em ambientes brasileiros.', 24),
(29, 'Interpretar experimentos ou técnicas que utilizam seres vivos, analisando implicações para o ambiente, a saúde, a produção de alimentos, matérias primas ou produtos industriais.', 24),
(30, 'Avaliar propostas de alcance individual ou coletivo, identificando aquelas que visam à preservação e a implementação da saúde individual, coletiva ou do ambiente.', 24);

-- Inserção na tabela Áreas de Conhecimento
INSERT INTO areas_conhecimento (nome, abreviacao)
VALUES 
('Ciências Humanas e suas Tecnologias', 'CH');

-- Inserção na tabela Competências
INSERT INTO competencias (competenciadearea, descricao, area_conhecimento_id)
VALUES 
(1, 'Compreender os elementos culturais que constituem as identidades.', 4),
(2, 'Compreender as transformações dos espaços geográficos como produto das relações socioeconômicas e culturais de poder.', 4),
(3, 'Compreender a produção e o papel histórico das instituições sociais, políticas e econômicas, associando-as aos diferentes grupos, conflitos e movimentos sociais.', 4),
(4, 'Entender as transformações técnicas e tecnológicas e seu impacto nos processos de produção, no desenvolvimento do conhecimento e na vida social.', 4),
(5, 'Utilizar os conhecimentos históricos para compreender e valorizar os fundamentos da cidadania e da democracia, favorecendo uma atuação consciente do indivíduo na sociedade.', 4),
(6, 'Compreender a sociedade e a natureza, reconhecendo suas interações no espaço em diferentes contextos históricos e geográficos.', 4);

-- Inserção na tabela Habilidades
INSERT INTO habilidades (habilidade, descricao, competencia_id)
VALUES 
-- Competência 1
(1, 'Interpretar historicamente e/ou geograficamente fontes documentais acerca de aspectos da cultura.', 25),
(2, 'Analisar a produção da memória pelas sociedades humanas.', 25),
(3, 'Associar as manifestações culturais do presente aos seus processos históricos.', 25),
(4, 'Comparar pontos de vista expressos em diferentes fontes sobre determinado aspecto da cultura.', 25),
(5, 'Identificar as manifestações ou representações da diversidade do patrimônio cultural e artístico em diferentes sociedades.', 25),

-- Competência 2
(6, 'Interpretar diferentes representações gráficas e cartográficas dos espaços geográficos.', 26),
(7, 'Identificar os significados histórico-geográficos das relações de poder entre as nações.', 26),
(8, 'Analisar a ação dos estados nacionais no que se refere à dinâmica dos fluxos populacionais e no enfrentamento de problemas de ordem econômico-social.', 26),
(9, 'Comparar o significado histórico-geográfico das organizações políticas e socioeconômicas em escala local, regional ou mundial.', 26),
(10, 'Reconhecer a dinâmica da organização dos movimentos sociais e a importância da participação da coletividade na transformação da realidade histórico-geográfica.', 26),

-- Competência 3
(11, 'Identificar registros de práticas de grupos sociais no tempo e no espaço.', 27),
(12, 'Analisar o papel da justiça como instituição na organização das sociedades.', 27),
(13, 'Analisar a atuação dos movimentos sociais que contribuíram para mudanças ou rupturas em processos de disputa pelo poder.', 27),
(14, 'Comparar diferentes pontos de vista, presentes em textos analíticos e interpretativos, sobre situação ou fatos de natureza histórico-geográfica acerca das instituições sociais, políticas e econômicas.', 27),
(15, 'Avaliar criticamente conflitos culturais, sociais, políticos, econômicos ou ambientais ao longo da história.', 27),

-- Competência 4
(16, 'Identificar registros sobre o papel das técnicas e tecnologias na organização do trabalho e/ou da vida social.', 28),
(17, 'Analisar fatores que explicam o impacto das novas tecnologias no processo de territorialização da produção.', 28),
(18, 'Analisar diferentes processos de produção ou circulação de riquezas e suas implicações sócio-espaciais.', 28),
(19, 'Reconhecer as transformações técnicas e tecnológicas que determinam as várias formas de uso e apropriação dos espaços rural e urbano.', 28),
(20, 'Selecionar argumentos favoráveis ou contrários às modificações impostas pelas novas tecnologias à vida social e ao mundo do trabalho.', 28),

-- Competência 5
(21, 'Identificar o papel dos meios de comunicação na construção da vida social.', 29),
(22, 'Analisar as lutas sociais e conquistas obtidas no que se refere às mudanças nas legislações ou nas políticas públicas.', 29),
(23, 'Analisar a importância dos valores éticos na estruturação política das sociedades.', 29),
(24, 'Relacionar cidadania e democracia na organização das sociedades.', 29),
(25, 'Identificar estratégias que promovam formas de inclusão social.', 29),

-- Competência 6
(26, 'Identificar em fontes diversas o processo de ocupação dos meios físicos e as relações da vida humana com a paisagem.', 30),
(27, 'Analisar de maneira crítica as interações da sociedade com o meio físico, levando em consideração aspectos históricos e(ou) geográficos.', 30),
(28, 'Relacionar o uso das tecnologias com os impactos sócio-ambientais em diferentes contextos histórico-geográficos.', 30),
(29, 'Reconhecer a função dos recursos naturais na produção do espaço geográfico, relacionando-os com as mudanças provocadas pelas ações humanas.', 30),
(30, 'Avaliar as relações entre preservação e degradação da vida no planeta nas diferentes escalas.', 30);
