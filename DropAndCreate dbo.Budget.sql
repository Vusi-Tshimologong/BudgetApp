USE [BudgetData]
GO

/****** Object: Table [dbo].[Budget] Script Date: 2022/05/31 14:21:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP TABLE [dbo].[Budget];


GO
CREATE TABLE [dbo].[Budget] (
    [Id]       INT           IDENTITY (1, 1) NOT NULL,
    [Name]     NVARCHAR (50) NOT NULL,
    [Amount]   DECIMAL       NOT NULL,
    [CurrentDate]    DATETIME      DEFAULT (getdate()) NOT NULL
);


