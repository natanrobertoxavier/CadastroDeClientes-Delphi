USE [sinqia]
GO

/****** Object:  View [dbo].[VW_CIDADES]    Script Date: 14/03/2024 16:51:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VW_CIDADES] AS
SELECT [Codigo_Cidade]
      ,[Nome]
      ,[Estado]
      ,[Cep_Inicial]
      ,[Cep_Final]
  FROM [sinqia].[dbo].[CIDADES]
GO


