CREATE DATABASE advocacia;
USE advocacia;

CREATE TABLE tbMunicipio (
    id_municipio INT,
    UF VARCHAR(2),
    municipio VARCHAR(200),
    PRIMARY KEY (id_municipio)
);
CREATE TABLE tbSexo (
    id_sexo INT,
    sexo_pessoa VARCHAR(100),
    PRIMARY KEY (id_sexo)
);
CREATE TABLE TbCliente (
    RG VARCHAR(11),
    nome_cliente VARCHAR(200) NOT NULL,
    CPF VARCHAR(11) UNIQUE NOT NULL,
    telefone NUMERIC(13) NOT NULL,
    rua VARCHAR(200),
    bairro VARCHAR(100),
    complemento VARCHAR(200),
    id_municipio INT,
    email VARCHAR(50),
    data_nascimento DATE NOT NULL,
    id_sexo INT,
    PRIMARY KEY (RG),
    FOREIGN KEY (id_municipio)
        REFERENCES TbMunicipio (id_municipio),
    FOREIGN KEY (id_sexo)
        REFERENCES TbSexo (id_sexo)
);

CREATE TABLE tbEspecialidade (
    id_especialidade INT,
    nome_especialidade VARCHAR(220) NOT NULL,
    PRIMARY KEY (id_especialidade)
);
    
CREATE TABLE tbCargo (
    id_cargo INT,
    nome_cargo VARCHAR(120) NOT NULL,
    PRIMARY KEY (id_cargo)
);
    
CREATE TABLE TbAdvogado (
    num_oab VARCHAR(15),
    nome_advogado VARCHAR(220) NOT NULL,
    salario_advogado FLOAT(10) NOT NULL,
    id_especialidade INT,
    id_cargo INT,
    PRIMARY KEY (num_oab),
    FOREIGN KEY (id_especialidade)
        REFERENCES TbEspecialidade (id_especialidade),
    FOREIGN KEY (id_cargo)
        REFERENCES tbCargo (id_cargo)
);
 
CREATE TABLE TbProcesso (
    num_processo NUMERIC(50),
    num_procuracao NUMERIC(50) UNIQUE NOT NULL,
    tipo_processo VARCHAR(220) NOT NULL,
    data_audiencia DATE,
    custo_processo FLOAT(10),
    descricao_problema VARCHAR(1000) NOT NULL,
    PRIMARY KEY (num_processo)
);

CREATE TABLE tbPrefeitura (
    CNPJ_municipio VARCHAR(15),
    nome_prefeito VARCHAR(200) NOT NULL,
    telefone_prefeitura NUMERIC(13) NOT NULL,
    telefone_prefeito NUMERIC(13),
    id_municipio INT,
    valor_aluguel FLOAT(12) NOT NULL,
    PRIMARY KEY (CNPJ_municipio),
    FOREIGN KEY (id_municipio)
        REFERENCES TbMunicipio (id_municipio)
);

CREATE TABLE tbAdvogadoPrefeitura (
    num_oab VARCHAR(15),
    CNPJ_municipio VARCHAR(15),
    descricao_servico VARCHAR(900),
    honorarios_advocaticios FLOAT(12),
    PRIMARY KEY (CNPJ_municipio , num_oab),
    FOREIGN KEY (num_oab)
        REFERENCES tbAdvogado (num_oab),
    FOREIGN KEY (CNPJ_municipio)
        REFERENCES tbPrefeitura (CNPJ_municipio)
);

CREATE TABLE TbClienteProcesso (
    RG VARCHAR(11),
    num_processo NUMERIC(50),
    PRIMARY KEY (RG , num_processo),
    FOREIGN KEY (RG)
        REFERENCES tbCliente (RG),
    FOREIGN KEY (num_processo)
        REFERENCES TbProcesso (num_processo)
);
    
    
CREATE TABLE TbAdvogadoProcesso (
    num_oab VARCHAR(15),
    num_processo NUMERIC(50),
    honorarios_advocaticios FLOAT(12),
    PRIMARY KEY (num_oab , num_processo),
    FOREIGN KEY (num_oab)
        REFERENCES tbAdvogado (num_oab),
    FOREIGN KEY (num_processo)
        REFERENCES TbProcesso (num_processo)
);
        
CREATE TABLE TbCategoria (
    id_categoria INT,
    nome VARCHAR(200) UNIQUE NOT NULL,
    PRIMARY KEY (id_categoria)
);
        
CREATE TABLE TbDespesa (
    id_despesa INT,
    nome_despesa VARCHAR(200) NOT NULL,
    motivo_despesa VARCHAR(200) NOT NULL,
    id_categoria INT,
    num_processo NUMERIC(50),
    valor FLOAT NOT NULL,
    data_despesa DATE NOT NULL,
    PRIMARY KEY (id_despesa),
    FOREIGN KEY (id_categoria)
        REFERENCES TbCategoria (id_categoria),
    FOREIGN KEY (num_processo)
        REFERENCES TbProcesso (num_processo)
);
        
CREATE TABLE TbReceita (
    id_receita INT,
    nome_receita VARCHAR(200) NOT NULL,
    motivo_receita VARCHAR(200) NOT NULL,
    id_categoria INT,
    num_oab VARCHAR(15),
    valor FLOAT NOT NULL,
    data_receita DATE NOT NULL,
    PRIMARY KEY (id_receita),
    FOREIGN KEY (id_categoria)
        REFERENCES TbCategoria (id_categoria),
    FOREIGN KEY (num_oab)
        REFERENCES TbAdvogado (num_oab)
);
