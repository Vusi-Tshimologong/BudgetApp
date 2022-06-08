USE [BudgetData]
GO

/****** Object: Table [dbo].[Budget] Script Date: 2022/06/02 08:55:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Consolidator] (
    [Id]          INT           IDENTITY (1, 1) NOT NULL,
    [Name]        NVARCHAR (50) NOT NULL,
    [ActualAmount]      DECIMAL (18)  NOT NULL,
	[BudgetAmount]       DECIMAL (18)  NOT NULL,
	[isOverBudget]       bit  NOT NULL,
    [CurrentDate] DATETIME      NOT NULL
);


