-- Criação da tabela data
CREATE TABLE data (
    id INT PRIMARY KEY AUTO_INCREMENT,
    dataCompleta DATETIME,
    ano VARCHAR(45),
    mes VARCHAR(45),
    dia VARCHAR(45),
    hora VARCHAR(45)
);

-- Criação da tabela estado
CREATE TABLE estado (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    sigla VARCHAR(45)
);

-- Criação da tabela cidade
CREATE TABLE cidade (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    estado_id INT,
    FOREIGN KEY (estado_id) REFERENCES estado(id)
);

-- Criação da tabela aeroporto
CREATE TABLE aeroporto (
    id INT PRIMARY KEY AUTO_INCREMENT,
    icao VARCHAR(45),
    nome VARCHAR(45),
    cidade_id INT,
    FOREIGN KEY (cidade_id) REFERENCES cidade(id)
);

-- Criação da tabela empresa_aerea
CREATE TABLE empresa_aerea (
    id INT PRIMARY KEY AUTO_INCREMENT,
    icao VARCHAR(45),
    nome VARCHAR(45)
);

-- Criação da tabela fato_voo
CREATE TABLE fato_voo (
    id INT PRIMARY KEY AUTO_INCREMENT,
    aeroporto_origem_id INT,
    empresa_aerea_id INT,
    aeroporto_destino_id INT,
    data_partida_prevista_id INT,
    data_partida_real_id INT,
    data_chegada_prevista_id INT,
    data_chegada_real_id INT,
    situacao_voo VARCHAR(45),
    situacao_partida VARCHAR(45),
    situacao_chegada VARCHAR(45),
    numero_voo INT,
    numero_de_assentos INT,
    assentos_ocupados INT,
    distancia_voo DOUBLE,
    FOREIGN KEY (aeroporto_origem_id) REFERENCES aeroporto(id),
    FOREIGN KEY (aeroporto_destino_id) REFERENCES aeroporto(id),
    FOREIGN KEY (empresa_aerea_id) REFERENCES empresa_aerea(id),
    FOREIGN KEY (data_partida_prevista_id) REFERENCES data(id),
    FOREIGN KEY (data_partida_real_id) REFERENCES data(id),
    FOREIGN KEY (data_chegada_prevista_id) REFERENCES data(id),
    FOREIGN KEY (data_chegada_real_id) REFERENCES data(id)
);

-- Criação da tabela fato_reclamacao
CREATE TABLE fato_reclamacao (
    id INT PRIMARY KEY AUTO_INCREMENT,
    data_abertura VARCHAR(45),
    data_finalizacao VARCHAR(45),
    assunto VARCHAR(45),
    grupo_problema VARCHAR(45),
    situacao VARCHAR(45),
    avaliacao VARCHAR(45),
    cidade_id INT,
    estado_id INT,
    hash_reclamacao VARCHAR(45),
    FOREIGN KEY (cidade_id) REFERENCES cidade(id),
    FOREIGN KEY (estado_id) REFERENCES estado(id)
);
