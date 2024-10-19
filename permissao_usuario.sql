CREATE USER 'consulta_user'@'localhost' IDENTIFIED BY 'consulta123';
GRANT SELECT ON aeroporto.* TO 'consulta_user'@'localhost';

CREATE USER 'alteracao_user'@'localhost' IDENTIFIED BY 'alteracao123';
GRANT SELECT, INSERT, UPDATE, DELETE ON aeroporto.* TO 'alteracao_user'@'localhost';

FLUSH PRIVILEGES;