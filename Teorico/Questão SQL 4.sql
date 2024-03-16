--PRIMEIRO FAÇO UM SELECT NA TABELA TODA PARA IDENTIFICAR O CONTEÚDO
SELECT * 
	FROM CLIENTES

--INICIO UMA TRANSAÇÃO PARA PODER CONFIRMAR AS ALTERAÇÕES QUE SERÃO REALIZADAS
BEGIN TRANSACTION;

DELETE
FROM CLIENTES
WHERE CODIGO_CLIENTE BETWEEN 100 AND 200;

--APÓS O COMANDO DE DELETE, CONFIRMO PARA SABER SE A DELEÇÃO OCORREU CONFORME ESPERADO
SELECT * 
	FROM CLIENTES

--AQUI JÁ DEIXO OS COMANDOS DE COMMIT (CASO TENHA OCORRIDO COMO O PLANEJADO A DELEÇÃO)
--OU ROLLBACK, CASO TENHA OCORRIDO ALGO INESPERADO 

--COMMIT;
--ROLLBACK;