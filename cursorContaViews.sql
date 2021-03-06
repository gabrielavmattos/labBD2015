-- Cursor: contaNumeroViews
-- Resumo: Cursor que retorna um pequeno relatorio com o numero e nomes das view criadas no banco, no relatorio foram criadas varias views, esse tipo de relatorio sera util
-- Autor: Rodrigo

DECLARE @schemaName VARCHAR(30)
    , @procName VARCHAR(30)
    , @contador integer

-- Cursor para percorrer os nomes dos objetos
DECLARE cursor_objects CURSOR FOR
    SELECT
          TABLE_SCHEMA, TABLE_NAME
    FROM
        INFORMATION_SCHEMA.VIEWS
   

set @contador = 0
OPEN cursor_objects
FETCH NEXT FROM cursor_objects INTO @schemaName, @procName

-- Percorrendo linhas do cursor (enquanto houverem)
WHILE @@FETCH_STATUS = 0
BEGIN

    PRINT  N'Nome View: '+  @schemaName+'.'+ @procName
	
	set @contador = @contador + 1
    FETCH NEXT FROM cursor_objects INTO @schemaName, @procName
END

CLOSE cursor_objects
DEALLOCATE cursor_objects

PRINT 'O numero total de views encontradas é: '
PRINT  @contador
