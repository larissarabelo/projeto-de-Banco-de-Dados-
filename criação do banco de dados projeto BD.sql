CREATE DATABASE advocacia;
USE advocacia;

CREATE TABLE TbCliente(
	RG VARCHAR (11), 
	nome_cliente  VARCHAR(200), 
	CPF VARCHAR (11) UNIQUE NOT NULL, 
	telefone NUMERIC(13), 
	rua   VARCHAR(200),
	bairro   VARCHAR(100),
	complemento   VARCHAR(200),
	UF   VARCHAR(2),
	municipio   VARCHAR(200),
	email   VARCHAR(50), 
	data_nascimento DATE, 
	 sexo CHAR(1),
	PRIMARY KEY (RG));
    
CREATE TABLE tbEspecialidade(
	id_especialidade INT,
	nome_especialidade VARCHAR(220),
    PRIMARY KEY(id_especialidade));
CREATE TABLE TbAdvogado(
	num_oab VARCHAR (15), 
	nome_advogado   VARCHAR(220), 
	salario_advogado   FLOAT (10), 
	id_especialidade INT,
	 cargo   VARCHAR(120),
	 PRIMARY KEY (num_oab),
	FOREIGN KEY (id_especialidade) REFERENCES TbEspecialidade (id_especialidade));
 
CREATE TABLE TbProcesso(
	num_processo NUMERIC (50),
	num_procuracao NUMERIC (50) UNIQUE NOT NULL,
	tipo_processo VARCHAR (220) NOT NULL, 
	data_audiencia DATE, 
	custo_processo  FLOAT(10),
	descricao_problema VARCHAR(1000) NOT NULL,
	PRIMARY KEY (num_processo));

CREATE TABLE tbPrefeitura(
	CNPJ_municipio VARCHAR (15), 
	nome_prefeito  VARCHAR(200) NOT NULL, 
	telefone_prefeitura NUMERIC(13), 
	telefone_prefeito NUMERIC(13), 
	UF VARCHAR(2),
	nome_municipio  VARCHAR(250) NOT NULL, 
	num_oab VARCHAR (15), 
	honorarios_advocaticios  FLOAT(12), 
    valor_aluguel  FLOAT(12), 
    descricao_servico VARCHAR(900),
    PRIMARY KEY (CNPJ_municipio),
	FOREIGN KEY (num_oab) REFERENCES TbAdvogado(num_oab)
);


CREATE TABLE TbClienteAdvogado (
	RG VARCHAR (11), 
	num_oab VARCHAR (15), 
	PRIMARY KEY (RG,num_oab),
	FOREIGN KEY (RG) REFERENCES tbCliente(RG),
	FOREIGN KEY (num_oab) REFERENCES tbAdvogado (num_oab));

CREATE TABLE TbClienteProcesso  (
	RG VARCHAR (11), 
	num_processo  NUMERIC (50),
	PRIMARY KEY (RG,num_processo),
	FOREIGN KEY (RG) REFERENCES tbCliente(RG),
	FOREIGN KEY (num_processo) REFERENCES TbProcesso (num_processo));
    
    
CREATE TABLE TbAdvogadoProcesso   (
		num_oab VARCHAR (15),  
		num_processo  NUMERIC (50),
		honorarios_advocaticios FLOAT(12),
		PRIMARY KEY (num_oab,num_processo),
		FOREIGN KEY (num_oab) REFERENCES tbAdvogado (num_oab),
		FOREIGN KEY (num_processo) REFERENCES TbProcesso (num_processo));
        
CREATE TABLE TbCategoria  (
		id_categoria INT, 
		nome VARCHAR(200) NOT NULL,
		PRIMARY KEY (id_categoria));
        
CREATE TABLE TbDespesa  (
		id_despesa INT, 
		nome_despesa VARCHAR(200) NOT NULL,
		motivo_despesa VARCHAR(200) NOT NULL,
		id_categoria INT,
		num_processo NUMERIC (50),
		valor FLOAT NOT NULL,
        data_despesa DATE NOT NULL,
		PRIMARY KEY (id_despesa),
		FOREIGN KEY (id_categoria) REFERENCES TbCategoria  (id_categoria),
		FOREIGN KEY (num_processo) REFERENCES TbProcesso (num_processo));
        
CREATE TABLE TbReceita  (
		id_receita INT, 
		nome_receita VARCHAR(200) NOT NULL,
		motivo_receita VARCHAR(200) NOT NULL,
		id_categoria INT,
		num_oab VARCHAR (15),
		valor FLOAT NOT NULL,
		data_receita DATE NOT NULL,
		PRIMARY KEY (id_receita),
		FOREIGN KEY (id_categoria) REFERENCES TbCategoria  (id_categoria),
		FOREIGN KEY (num_oab) REFERENCES TbAdvogado (num_oab));


INSERT INTO TbEspecialidade VALUES (1, 'Processo Civil ');
INSERT INTO TbEspecialidade VALUES (2, 'Processo Penal ');
INSERT INTO TbEspecialidade VALUES (3, 'Direito Administrativo ');
INSERT INTO TbEspecialidade VALUES (4, 'Tributario ');
INSERT INTO TbEspecialidade VALUES (5, 'Trabalista ');
INSERT INTO TbEspecialidade VALUES (6, 'Socioambiental ');
INSERT INTO TbEspecialidade VALUES (7, 'Direito Internacional ');
  
INSERT INTO TbAdvogado VALUES ('142958336107551', 'Nathalie  Santos',2500.00,4,'Advogada efetivada');
INSERT INTO TbAdvogado VALUES ('122135746107581', 'Maisa Ferreira',1200.00,1,'Advogada em periodo de experincia');
INSERT INTO TbAdvogado VALUES ('232145746103592', 'Fabio Angelotti',2500.00,5,'Advogado efetivada');
INSERT INTO TbAdvogado VALUES ('163945746103729', 'Carolina Buzanello',7500.00,3,'Proprietaria');
INSERT INTO TbAdvogado VALUES ('173949748429327', 'Patricia Ribas',2750.00,2,'Advogada efetivada');
INSERT INTO TbAdvogado VALUES ('258459728449369', 'Vitor Strapasson',2550.00,6,'Advogado em periodo de experincia');
INSERT INTO TbAdvogado VALUES ('131258748107566', 'Eliane Hiraki',3100.00,7,'Advogada efetivada');

INSERT INTO tbCliente VALUES ('1353222006', 'Jessica Beatriz Alves','11163578961',51987761144,'Rua Bacacheri', 'Bacacheri', 'numero 88', 'PR', 'Curitiba', 'jessica@email.com','1997-08-02','F');
INSERT INTO tbCliente VALUES ('2553222376', 'Arthur Geovani Schmit','12763533961',41983761149,'Rua Getulio Vargas', 'Batel', 'numero 11400', 'PR', 'Curitiba', 'arthur4136@email.com','1985-05-14','M');
INSERT INTO tbCliente VALUES ('2549122333', 'Pedro Henrique Silva','02363533944',41999722149,'Rua Republica Argentina', 'Agua verde', 'numero 2192', 'PR', 'Curitiba', 'pedro1s52@email.com','1999-04-29','M');
INSERT INTO tbCliente VALUES ('1549121438', 'Mayara Beatriz Ribeiro','03563123984',41989145146,'Rua Sao Francisco', 'Centro', 'numero 504', 'PR', 'Curitiba', 'mx19ribeirobia@email.com','1972-01-08','F');
INSERT INTO tbCliente VALUES ('1647124677', 'Carla Pinheiro Ribas','01463999940',41988442230,'Av. Cel. Francisco H. dos Santos', 'Jardim das Américas', 'numero 100', 'PR', 'Curitiba', 'carla.pinheiro.r@email.com','1969-09-21','F');
INSERT INTO tbCliente VALUES ('11111111111', 'Keila Neroni','03598923940',41987432532,'Av. Cel. Dulcídio', 'Rebouças', 'numero 1727', 'PR', 'Curitiba', 'neroni9k.r@email.com','1995-11-19','F');
INSERT INTO tbCliente VALUES ('11111111112', 'Flavio Almeida','03478911950',41987862555,'Av. Sete de Setembro', 'Batel', 'numero 146', 'PR', 'Curitiba', 'flaviok.r@email.com','1998-03-21','M');
INSERT INTO tbCliente VALUES ('11111111113', 'Bruno Gonçalves','03278431333',41987832927,'Av. Brigadeiro Franco', 'Centro', 'numero 8727', 'PR', 'Curitiba', 'gbruno.r@email.com','1995-11-19','M');


INSERT INTO TbProcesso VALUES(15931258745623214574616181077394974842932712032345,
16115931271203234587456266355746899725739497484293,'Pedido de cidadania europeia', '2019-08-09', 5600,'Reconhecimento do parentesco sanguineo com cidadão europeu juntamento com o pedido de cidadania europeia.' );
INSERT INTO TbProcesso VALUES(11111111111111111111111111111111111111111111111111,
11111111111111111111111111111111111111111111111111,'Pedido de divórcio', '2020-05-13', 2600,'Divórcio com sepração parcial de bens.' );
INSERT INTO TbProcesso VALUES(11111111111111111111111111111111111111111111111112,
11111111111111111111111111111111111111111211111115,'Revisao de demissão por justa causa ', '2018-10-01', 2100,'A cliente alega que o motivo demissão não está correto, não justificativa para demissão por justa causa.' );
INSERT INTO TbProcesso VALUES(11111111111111111111111111111111111111111111111113,
11111111111111111111111111111111111111111111114293,'Revisao de sentença penal ', '2018-10-01', 2100,'O cliente alega que é preciso recorrer contra a pena de 5 anos de cadeia, pois houve parcialidade do juiz, que era parente da vítima assassinada. E o acusado também se entregou e não possui antecedentes criminais.' );
INSERT INTO TbProcesso VALUES(11111111111111111111111111111111111111111111111114,
11111111111111111111111111111111115911111111114103,'Representação em processo penal ', '2019-12-27', 4100,'O cliente é acusado de tentativa de latrocínio, mas no momento do incidente estava em uma festa em outro bairro, mas não tem como provar.' );
INSERT INTO TbProcesso VALUES(11111111111111111111111111111111111111111111111115,
11111111111141111111111111111111111111111111115547,'Recurso na multa do imposto de renda', '2021-08-03', 4100,'A cliente é acusado de sonegar 100 mil de imposto de renda.' );
INSERT INTO TbProcesso VALUES(11111111111111111111111111111111111111111111111116,
11111111111141111111111111111111111111111111115501,'Recurso na multa do imposto de renda', NULL, 3200,'O cliente é acusado de sonegar 20 mil de imposto de renda.' );
INSERT INTO TbProcesso VALUES(11111111111111111111111111111111111111111111111117,
11111111111141111111111111111111111111111111115902,'Multa ambiental', NULL, 1500,'O cliente é acusado de desmatar area de refloestamento e quer recorrer da multa de 19.550,90 reais.' );


INSERT INTO tbPrefeitura VALUES(258459728449370,'Roberta Dias',04132716352,41988332211, 'PR', 'Pinhais', 163945746103729,12580,6500,'Representacao principalmente nos problemas tributarios e processos contra o municipio');
INSERT INTO tbPrefeitura VALUES(258459721449350,'Gisele Ribas',04132556359,41988332561, 'PR', ' Sao Jose dos Pinhais', 163945746103729,16590,7500,'Representacao principalmente nos problemas contabeis');
INSERT INTO tbPrefeitura VALUES(258459723449311,'Bianca Teixeira',04133316352,41988002211, 'PR', 'Campo Largo', 163945746103729,14580,7000,'Representacao principalmente nos processos que apontam funcionarios fantasmas');


INSERT INTO TbClienteAdvogado VALUES (1353222006,131258748107566);
INSERT INTO TbClienteAdvogado VALUES (1647124677,122135746107581);
INSERT INTO TbClienteAdvogado VALUES (1353222006,232145746103592);
INSERT INTO TbClienteAdvogado VALUES (11111111111,173949748429327);
INSERT INTO TbClienteAdvogado VALUES (2553222376,173949748429327);
INSERT INTO TbClienteAdvogado VALUES (2549122333,142958336107551);
INSERT INTO TbClienteAdvogado VALUES (1549121438,142958336107551);
INSERT INTO TbClienteAdvogado VALUES (11111111113,258459728449369);


INSERT INTO TbClienteProcesso VALUES (1353222006,15931258745623214574616181077394974842932712032345);
INSERT INTO TbClienteProcesso VALUES (1647124677,11111111111111111111111111111111111111111111111111);
INSERT INTO TbClienteProcesso VALUES (1353222006,11111111111111111111111111111111111111111111111112);
INSERT INTO TbClienteProcesso VALUES (11111111111,11111111111111111111111111111111111111111111111113);
INSERT INTO TbClienteProcesso VALUES (2553222376,11111111111111111111111111111111111111111111111114);
INSERT INTO TbClienteProcesso VALUES (2549122333,11111111111111111111111111111111111111111111111115);
INSERT INTO TbClienteProcesso VALUES (1549121438,11111111111111111111111111111111111111111111111116);
INSERT INTO TbClienteProcesso VALUES (11111111113,11111111111111111111111111111111111111111111111117);

INSERT INTO TbAdvogadoProcesso VALUES (131258748107566,15931258745623214574616181077394974842932712032345,2600);
INSERT INTO TbAdvogadoProcesso VALUES (122135746107581,11111111111111111111111111111111111111111111111111,2400);
INSERT INTO TbAdvogadoProcesso VALUES (232145746103592,11111111111111111111111111111111111111111111111112,2270);
INSERT INTO TbAdvogadoProcesso VALUES (173949748429327,11111111111111111111111111111111111111111111111113,2105);
INSERT INTO TbAdvogadoProcesso VALUES (173949748429327,11111111111111111111111111111111111111111111111114,1994);
INSERT INTO TbAdvogadoProcesso VALUES (142958336107551,11111111111111111111111111111111111111111111111115,1850);
INSERT INTO TbAdvogadoProcesso VALUES (142958336107551,11111111111111111111111111111111111111111111111116,1795);
INSERT INTO TbAdvogadoProcesso VALUES (258459728449369,11111111111111111111111111111111111111111111111117,1500);  

INSERT INTO TbCategoria VALUES (1,'Despesa com cartorio');          
INSERT INTO TbCategoria VALUES (2,'Despesa na emissao de documentos');  
INSERT INTO TbCategoria VALUES (3,'Despesa com materiais da propria advocacia com documentos');  
INSERT INTO TbCategoria VALUES (4,'Despesa com viagens a trabalho');  
INSERT INTO TbCategoria VALUES (5,'Receita vinda do Aluguel');  
INSERT INTO TbCategoria VALUES (6,'Receita vinda do Aluguel com correcao de juros (o pagamento atrasou)');  
INSERT INTO TbCategoria VALUES (7,'Receita vinda de honorarios');  
INSERT INTO TbCategoria VALUES (8,'Receita vinda de honorarios com correcao de juros (o pagamento atrasou)');  



INSERT INTO TbDespesa VALUES (1,'Emissao da procuracao', 'Procuracao obrigatoria para desenvolver o processo',2,15931258745623214574616181077394974842932712032345, 50, '2019-03-15');          
INSERT INTO TbDespesa VALUES (2,'Despesa com cartorio para provar parentesco', 'Autenticacao obrigatoria no cartorio para o processo',1,15931258745623214574616181077394974842932712032345, 270, '2019-07-15');          
INSERT INTO TbDespesa VALUES (3,'Emissao da procuracao', 'Procuracao obrigatoria para desenvolver o processo',2,11111111111111111111111111111111111111111111111111, 50, '2020-04-03');          
INSERT INTO TbDespesa VALUES (4,'Despesa com cartorio para protocolar o divorcio', 'Protocolar pedido de divorcio para iniciar o processo',1,11111111111111111111111111111111111111111111111111, 250, '2020-04-27');          
INSERT INTO TbDespesa VALUES (5,'Despesa com papeis', 'Papeis utilzados para o pedido de divorcio',3,11111111111111111111111111111111111111111111111111, 25, '2020-04-22');          
INSERT INTO TbDespesa VALUES (6,'Emissao da procuracao', 'Procuracao obrigatoria para desenvolver o processo',2,11111111111111111111111111111111111111111111111112, 50, '2018-08-21');          
INSERT INTO TbDespesa VALUES (7,'Despesa com documento da acao trabalhista', 'Documentos obrigatorios para desenvolver as provas do processo',2,11111111111111111111111111111111111111111111111112, 150, '2018-09-05');          
INSERT INTO TbDespesa VALUES (8,'Emissao da procuracao', 'Procuracao obrigatoria para desenvolver o processo',2,11111111111111111111111111111111111111111111111113, 50, '2018-09-21');          
INSERT INTO TbDespesa VALUES (9,'Obter documentos do processo', 'Procedimentos para obter o processo que estava em andamento',2,11111111111111111111111111111111111111111111111113, 20, '2018-09-22');          
INSERT INTO TbDespesa VALUES (10,'Protolocar nova defesa', 'Protocolar nova defesa no tribunal para recorre a pena',2,11111111111111111111111111111111111111111111111113, 720, '2018-09-22');          
INSERT INTO TbDespesa VALUES (11,'Emissao da procuracao', 'Procuracao obrigatoria para desenvolver o processo',2,11111111111111111111111111111111111111111111111114, 50, '2019-07-19');          
INSERT INTO TbDespesa VALUES (12,'Elaborar defesa', 'Elaborar defesa e assumir o processo',2,11111111111111111111111111111111111111111111111114, 1520, '2019-07-23');          
INSERT INTO TbDespesa VALUES (13,'Emissao da procuracao', 'Procuracao obrigatoria para desenvolver o processo',2,11111111111111111111111111111111111111111111111115, 50, '2021-07-29');          
INSERT INTO TbDespesa VALUES (14,'Reunir documentos para defesa', 'Obter documentos e estruturar defesa',2,11111111111111111111111111111111111111111111111115, 650, '2021-08-01');          
INSERT INTO TbDespesa VALUES (15,'Emissao da procuracao', 'Procuracao obrigatoria para desenvolver o processo',2,11111111111111111111111111111111111111111111111116, 50, '2021-09-09');          
INSERT INTO TbDespesa VALUES (16,'Emissao da procuracao', 'Procuracao obrigatoria para desenvolver o processo',2,11111111111111111111111111111111111111111111111117, 50, '2021-09-15');          
INSERT INTO TbDespesa VALUES (17,'Emissao da procuracao da representacao do municipio', 'Procuracao obrigatoria para representar o municipio de Pinhais',2,NULL, 150, '2021-01-02');          
INSERT INTO TbDespesa VALUES (18,'Emissao da procuracao da representacao do municipio', 'Procuracao obrigatoria para representar o municipio de Sao Jose dos Pinhais',2,NULL, 150, '2021-01-02');
INSERT INTO TbDespesa VALUES (19,'Emissao da procuracao da representacao do municipio', 'Procuracao obrigatoria para representar o municipio de Campo Largo ',2,NULL, 150, '2021-01-02');          
INSERT INTO TbDespesa VALUES (20,'Viagem para fiscalizar o trabalho dos servidores', 'Viagem para fiscalizar o trabalho dos servidores do municipio de Campo Largo ',4,NULL, 798, '2021-01-02');          
INSERT INTO TbDespesa VALUES (21,'Viagem para fiscalizar o trabalho dos servidores', 'Segunda viagem para fiscalizar o trabalho dos servidores do municipio de Campo Largo ',4,NULL, 858, '2021-06-12');          
INSERT INTO TbDespesa VALUES (22,'Viagem para fiscalizar o trabalho dos servidores', 'Viagem para fiscalizar o trabalho dos servidores do municipio de Pinhais ',4,NULL, 798, '2021-01-03');          
INSERT INTO TbDespesa VALUES (23,'Viagem para fiscalizar o trabalho dos servidores', 'Segunda viagem para fiscalizar o trabalho dos servidores do municipio de Pinhais ',4,NULL, 858, '2021-06-18');          
INSERT INTO TbDespesa VALUES (24,'Viagem para fiscalizar o trabalho dos servidores', 'Viagem para fiscalizar o trabalho dos servidores do municipio de Sao Jose dos Pinhais ',4,NULL, 550, '2021-01-04');          
INSERT INTO TbDespesa VALUES (25,'Viagem para fiscalizar o trabalho dos servidores', 'Segunda viagem para fiscalizar o trabalho dos servidores do municipio de Sao Jose dos Pinhais ',4,NULL, 674, '2021-06-04');          



INSERT INTO TbReceita VALUES (1,'Aluguel de Pinhais', 'Aluguel do mes de janeiro da prefeitura de Pinhais ',5,NULL, 6500, '2021-01-15');          
INSERT INTO TbReceita VALUES (2,'Aluguel de Pinhais', 'Aluguel do mes de fevereiro da prefeitura de Pinhais ',5,NULL, 6500, '2021-02-15');          
INSERT INTO TbReceita VALUES (3,'Aluguel de Pinhais', 'Aluguel do mes de março da prefeitura de Pinhais ',6,NULL, 6950, '2021-03-22');          
INSERT INTO TbReceita VALUES (4,'Aluguel de Pinhais', 'Aluguel do mes de abril da prefeitura de Pinhais ',5,NULL, 6500, '2021-04-15');          
INSERT INTO TbReceita VALUES (5,'Aluguel de Pinhais', 'Aluguel do mes de maio da prefeitura de Pinhais ',5,NULL, 6500, '2021-05-15');          
INSERT INTO TbReceita VALUES (6,'Aluguel de Pinhais', 'Aluguel do mes de junho da prefeitura de Pinhais ',5,NULL, 6500, '2021-06-15');          
INSERT INTO TbReceita VALUES (7,'Aluguel de Pinhais', 'Aluguel do mes de julho da prefeitura de Pinhais ',6,NULL, 7000, '2021-07-29');          
INSERT INTO TbReceita VALUES (8,'Aluguel de Pinhais', 'Aluguel do mes de agosto da prefeitura de Pinhais ',5,NULL, 6500, '2021-08-15');          
INSERT INTO TbReceita VALUES (9,'Aluguel de Pinhais', 'Aluguel do mes de setembro da prefeitura de Pinhais ',6,NULL, 6580, '2021-09-17');          
INSERT INTO TbReceita VALUES (10,'Aluguel de Sao Jose dos Pinhais', 'Aluguel do mes de janeiro da prefeitura de Sao Jose dos Pinhais ',5,NULL, 7500, '2021-01-05');          
INSERT INTO TbReceita VALUES (11,'Aluguel de Sao Jose dos Pinhais', 'Aluguel do mes de fevereiro da prefeitura de Sao Jose dos Pinhais ',5,NULL, 7500, '2021-02-05');          
INSERT INTO TbReceita VALUES (12,'Aluguel de Sao Jose dos Pinhais', 'Aluguel do mes de março da prefeitura de Sao Jose dos Pinhais ',5,NULL, 7500, '2021-03-05');          
INSERT INTO TbReceita VALUES (13,'Aluguel de Sao Jose dos Pinhais', 'Aluguel do mes de abril da prefeitura de Sao Jose dos Pinhais ',5,NULL, 7500, '2021-04-05');          
INSERT INTO TbReceita VALUES (14,'Aluguel de Sao Jose dos Pinhais', 'Aluguel do mes de maio da prefeitura de Sao Jose dos Pinhais ',5,NULL, 7500, '2021-05-05');          
INSERT INTO TbReceita VALUES (15,'Aluguel de Sao Jose dos Pinhais', 'Aluguel do mes de junho da prefeitura de Sao Jose dos Pinhais ',5,NULL, 7500, '2021-06-05');          
INSERT INTO TbReceita VALUES (16,'Aluguel de Sao Jose dos Pinhais', 'Aluguel do mes de julho da prefeitura de Sao Jose dos Pinhais ',5,NULL, 7500, '2021-07-05');          
INSERT INTO TbReceita VALUES (17,'Aluguel de Sao Jose dos Pinhais', 'Aluguel do mes de agosto da prefeitura de Sao Jose dos Pinhais ',5,NULL, 7500, '2021-08-05');          
INSERT INTO TbReceita VALUES (18,'Aluguel de Sao Jose dos Pinhais', 'Aluguel do mes de setembro da prefeitura de Sao Jose dos Pinhais ',5,NULL, 7500, '2021-09-05'); 
INSERT INTO TbReceita VALUES (19,'Aluguel de Campo Largo', 'Aluguel do mes de janeiro da prefeitura de Campo Largo ',5,NULL, 7000, '2021-01-15');          
INSERT INTO TbReceita VALUES (20,'Aluguel de Campo Largo', 'Aluguel do mes de fevereiro da prefeitura de Campo Largo ',5,NULL, 7000, '2021-02-15');          
INSERT INTO TbReceita VALUES (21,'Aluguel de Campo Largo', 'Aluguel do mes de março da prefeitura de Campo Largo ',6,NULL, 7250, '2021-03-26');          
INSERT INTO TbReceita VALUES (22,'Aluguel de Campo Largo', 'Aluguel do mes de abril da prefeitura de Campo Largo ',5,NULL, 7000, '2021-04-15');          
INSERT INTO TbReceita VALUES (23,'Aluguel de Campo Largo', 'Aluguel do mes de maio da prefeitura de Campo Largo ',5,NULL, 7000, '2021-05-15');          
INSERT INTO TbReceita VALUES (24,'Aluguel de Campo Largo', 'Aluguel do mes de junho da prefeitura de Campo Largo ',5,NULL, 7000, '2021-06-15');          
INSERT INTO TbReceita VALUES (25,'Aluguel de Campo Largo', 'Aluguel do mes de julho da prefeitura de Campo Largo ',6,NULL, 7350, '2021-08-19');          
INSERT INTO TbReceita VALUES (26,'Aluguel de Campo Largo', 'Aluguel do mes de agosto da prefeitura de Campo Largo ',6,NULL, 7250, '2021-08-26');          
INSERT INTO TbReceita VALUES (27,'Aluguel de Campo Largo', 'Aluguel do mes de setembro da prefeitura de Campo Largo ',6,NULL, 7060, '2021-09-16'); 
INSERT INTO TbReceita VALUES (28,'Honorarios do processo', 'Honorarios recebecidos depois da audiencia ',7,131258748107566, 8520, '2019-10-01'); 
INSERT INTO TbReceita VALUES (29,'Honorarios do processo', 'Honorarios recebecidos com atraso',8,122135746107581, 5400, '2020-06-19'); 
INSERT INTO TbReceita VALUES (30,'Honorarios do processo', 'Honorarios recebecidos com atraso ',8,232145746103592, 4680, '2018-11-01'); 
INSERT INTO TbReceita VALUES (31,'Honorarios do processo', 'Honorarios recebecidos apos a finzalizao do processo',7,173949748429327, 4995, '2018-12-08'); 
INSERT INTO TbReceita VALUES (32,'Honorarios do processo', 'Honorarios recebecidos apos a finzalizao do processo',7,173949748429327, 7664, '2020-01-13'); 
INSERT INTO TbReceita VALUES (33,'Honorarios do processo', 'Honorarios recebecidos apos a finzalizao do processo',8,142958336107551, 6800, '2021-08-31'); 
INSERT INTO TbReceita VALUES (34,'Honorarios do processo', 'Honorarios antecipados',7,142958336107551, 5225, '2021-09-01'); 
INSERT INTO TbReceita VALUES (35,'Honorarios do processo', 'Honorarios antecipados',7,258459728449369, 3050, '2021-09-02'); 
