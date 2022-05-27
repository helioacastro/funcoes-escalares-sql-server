SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE OR ALTER FUNCTION [dbo].[ProperCase] ( @texto VARCHAR(100))  
RETURNS VARCHAR(100) AS  

BEGIN 
	DECLARE @palavra VARCHAR(50)
	DECLARE @inicio	INT
	DECLARE @posicao 	INT		
	DECLARE @tamanho	INT
	DECLARE @retorno	VARCHAR(100)

	SET @texto = RTRIM(@texto) + ' '
	SET @tamanho = LEN(@texto)
	SET @retorno = ''
	SET @inicio = 1


	SET @posicao = CHARINDEX(' ', @texto, @inicio)
	IF @posicao > CHARINDEX('-', @texto, @inicio) AND CHARINDEX('-', @texto, @inicio) <> 0
		SET @posicao = CHARINDEX('-', @texto, @inicio)
	IF @posicao > CHARINDEX('.', @texto, @inicio) AND CHARINDEX('.', @texto, @inicio) <> 0
		SET @posicao = CHARINDEX('.', @texto, @inicio)
	IF @posicao > CHARINDEX(',', @texto, @inicio) AND CHARINDEX(',', @texto, @inicio) <> 0
		SET @posicao = CHARINDEX(',', @texto, @inicio)

	WHILE @posicao <> 0
	BEGIN
		SET @palavra = SUBSTRING(@texto, @inicio, @posicao	- @inicio + 1) 
		
		IF @palavra = 'DE' OR @palavra = 'DO' OR @palavra = 'DA' OR @palavra = 'DOS' OR @palavra = 'E' or @palavra = 'DAS'
			SET @palavra = LOWER(@palavra)		

		SET @retorno = @retorno + @palavra
		SET @inicio = @posicao + 1

		SET @posicao = CHARINDEX(' ', @texto, @inicio)
		IF @posicao > CHARINDEX('-', @texto, @inicio) AND CHARINDEX('-', @texto, @inicio) <> 0
			SET @posicao = CHARINDEX('-', @texto, @inicio)
		IF @posicao > CHARINDEX('.', @texto, @inicio) AND CHARINDEX('.', @texto, @inicio) <> 0
			SET @posicao = CHARINDEX('.', @texto, @inicio)		
		IF @posicao > CHARINDEX(',', @texto, @inicio) AND CHARINDEX(',', @texto, @inicio) <> 0
			SET @posicao = CHARINDEX(',', @texto, @inicio)
	END 
	RETURN  @retorno


END






