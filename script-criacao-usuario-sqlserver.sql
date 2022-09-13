-- o script abaixo deverá ser executado no Banco de Dados de Produção - SQL Server
-- estes comandos criam um usuário que tem permissão de ESCRITA/WRITER.
-- como os dados capturados pelo Arduino serão INSERIDOS/ESCRITOS/WRITTEN no banco de dados,
-- é importante que sejam inseridos com as credenciais de acordo.

CREATE USER [usuarioParaAPIArduino_datawriter]
WITH PASSWORD = '#Gf_senhaParaAPI',
DEFAULT_SCHEMA = dbo;

EXEC sys.sp_addrolemember @rolename = N'db_datawriter', @membername = N'usuarioParaAPIArduino_datawriter'
