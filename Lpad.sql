SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER FUNCTION [dbo].[Lpad](
		@String VARCHAR(255)
		, @Tamanho TINYINT
		, @Char CHAR(1) = '0'
)
RETURNS VARCHAR(255)
AS
BEGIN
      DECLARE @Result VARCHAR(255)
      SET @Result = REPLICATE(@Char, @Tamanho - LEN(@String)) + @String
      RETURN @Result
END