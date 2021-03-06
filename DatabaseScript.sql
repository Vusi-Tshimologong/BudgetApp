USE [master]
GO
/****** Object:  Database [BudgetData]    Script Date: 2022/06/03 14:13:56 ******/
CREATE DATABASE [BudgetData]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BudgetData', FILENAME = N'C:\Users\Vusi Mosime\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\mssqllocaldb\BudgetData.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BudgetData_log', FILENAME = N'C:\Users\Vusi Mosime\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\mssqllocaldb\BudgetData.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BudgetData] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BudgetData].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BudgetData] SET ANSI_NULL_DEFAULT ON 
GO
ALTER DATABASE [BudgetData] SET ANSI_NULLS ON 
GO
ALTER DATABASE [BudgetData] SET ANSI_PADDING ON 
GO
ALTER DATABASE [BudgetData] SET ANSI_WARNINGS ON 
GO
ALTER DATABASE [BudgetData] SET ARITHABORT ON 
GO
ALTER DATABASE [BudgetData] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BudgetData] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BudgetData] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BudgetData] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BudgetData] SET CURSOR_DEFAULT  LOCAL 
GO
ALTER DATABASE [BudgetData] SET CONCAT_NULL_YIELDS_NULL ON 
GO
ALTER DATABASE [BudgetData] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BudgetData] SET QUOTED_IDENTIFIER ON 
GO
ALTER DATABASE [BudgetData] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BudgetData] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BudgetData] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BudgetData] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BudgetData] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BudgetData] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BudgetData] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BudgetData] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BudgetData] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BudgetData] SET RECOVERY FULL 
GO
ALTER DATABASE [BudgetData] SET  MULTI_USER 
GO
ALTER DATABASE [BudgetData] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BudgetData] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BudgetData] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BudgetData] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BudgetData] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BudgetData] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BudgetData] SET QUERY_STORE = OFF
GO
USE [BudgetData]
GO
/****** Object:  Table [dbo].[Budget]    Script Date: 2022/06/03 14:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Budget](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Amount] [decimal](18, 0) NOT NULL,
	[isIncome] [bit] NULL,
	[CurrentDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Consolidator]    Script Date: 2022/06/03 14:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consolidator](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ActualAmount] [decimal](18, 0) NOT NULL,
	[BudgetAmount] [decimal](18, 0) NOT NULL,
	[isOverBudget] [bit] NOT NULL,
	[CurrentDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Expenditure]    Script Date: 2022/06/03 14:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Expenditure](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Amount] [decimal](18, 0) NOT NULL,
	[CurrentDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Income]    Script Date: 2022/06/03 14:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Income](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Amount] [decimal](18, 0) NOT NULL,
	[CurrentDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Budget] ADD  DEFAULT (getdate()) FOR [CurrentDate]
GO
/****** Object:  StoredProcedure [dbo].[spCreateMonth]    Script Date: 2022/06/03 14:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vusi
-- Create date: 2022/06/01
-- Description:	Creates a table for the Budget Month
-- =============================================
CREATE PROCEDURE [dbo].[spCreateMonth] 
	-- Add the parameters for the stored procedure here
	@MonthName nvarchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here


ALTER TABLE [select @MonthName] DROP CONSTRAINT [DF__Budget__Month__38996AB5]

/****** Object:  Table [dbo].[@MonthName]    Script Date: 2022/06/01 10:33:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[select @MonthName]') AND type in (N'U'))
DROP TABLE [dbo].[select @MonthName]

/****** Object:  Table [dbo].[@MonthName]    Script Date: 2022/06/01 10:33:32 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[select @MonthName](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Amount] [decimal](18, 0) NOT NULL,
	[isIncome] [bit] NOT NULL,
	[Month] [datetime] NOT NULL
) ON [PRIMARY]

ALTER TABLE [dbo].[seelct @MonthName] ADD  DEFAULT (getdate()) FOR [select @MonthName]

END
GO
/****** Object:  StoredProcedure [dbo].[spGetBudgetReport]    Script Date: 2022/06/03 14:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vusi
-- Create date: 2022/05/26
-- Description:	Get the total expenditures and income from Budget Table
-- =============================================
CREATE PROCEDURE [dbo].[spGetBudgetReport]
	-- Add the parameters for the stored procedure here
	@TotalExpenditure decimal OUTPUT,
	@TotalIncome decimal OUTPUT,
	@Difference decimal OUTPUT,
	@Month DATETIME
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT @TotalExpenditure=SUM(Budget.Amount)
FROM Budget
WHERE isIncome=0 AND MONTH(CurrentDate)=MONTH(@Month);

	SELECT @TotalIncome=SUM(Budget.Amount)
FROM Budget
WHERE isIncome=1 AND MONTH(CurrentDate)=MONTH(@Month);

SET @Difference=@TotalIncome-@TotalExpenditure;
END
GO
/****** Object:  StoredProcedure [dbo].[spInsertData]    Script Date: 2022/06/03 14:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vusi M
-- Create date: 02/06/2022
-- Description:	Intert values into the expense,income and budget tables
-- =============================================
CREATE PROCEDURE [dbo].[spInsertData] 
	-- Add the parameters for the stored procedure here
	@Name nvarChar(50),
	@Amount decimal=0.0,
	@month DateTime,
	@tableName nvarchar
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    -- Insert statements for procedure here
	if @tableName='Expen'
	begin
	INSERT INTO dbo.Expenditure
	VALUES (@Name,@Amount,@month);
	end

	else if @tableName='Income'
	begin
	INSERT INTO dbo.Income
	VALUES (@Name,@Amount,@month);
	end

	ELSE if @tableName='Budget'
	begin
	INSERT INTO dbo.Budget
	VALUES (@Name,@Amount,@month);
	end
END
GO
/****** Object:  StoredProcedure [dbo].[spInsertIntoBudget]    Script Date: 2022/06/03 14:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vusi M
-- Create date: 26/05/2022
-- Description:	Intert values into a Budget Table
-- =============================================
CREATE PROCEDURE [dbo].[spInsertIntoBudget] 
	-- Add the parameters for the stored procedure here
	@Name nvarChar(50),
	@Amount decimal=0.0,
	@type bit=0,
	@month DateTime 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    -- Insert statements for procedure here
	INSERT INTO Budget
	VALUES (@Name,@Amount,@type,@month);
END
GO
/****** Object:  StoredProcedure [dbo].[spInsertIntoExpenses]    Script Date: 2022/06/03 14:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vusi M
-- Create date: 02/06/2022
-- Description:	Intert values into the Expense Table
-- =============================================
CREATE PROCEDURE [dbo].[spInsertIntoExpenses] 
	-- Add the parameters for the stored procedure here
	@Name nvarChar(50),
	@Amount decimal=0.0,
	@month DateTime 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    -- Insert statements for procedure here
	INSERT INTO Expenses
	VALUES (@Name,@Amount,@month);
END
GO
/****** Object:  StoredProcedure [dbo].[spInsertIntoIncome]    Script Date: 2022/06/03 14:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vusi M
-- Create date: 02/06/2022
-- Description:	Intert values into the Expense Table
-- =============================================
CREATE PROCEDURE [dbo].[spInsertIntoIncome] 
	-- Add the parameters for the stored procedure here
	@Name nvarChar(50),
	@Amount decimal=0.0,
	@month DateTime 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    -- Insert statements for procedure here
	INSERT INTO Income
	VALUES (@Name,@Amount,@month);
END
GO
/****** Object:  StoredProcedure [dbo].[spRead]    Script Date: 2022/06/03 14:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vusi
-- Create date: 2022/06/02
-- Description:	Get the total Amounts from a Table column
-- =============================================
CREATE PROCEDURE [dbo].[spRead]
	-- Add the parameters for the stored procedure here
	@TotalAmount decimal OUTPUT,
	@tableName nvarchar
	--@Month DATETIME
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	if @tableName='Expense'
	begin
		SELECT @TotalAmount=SUM(Expenditure.Amount)
		FROM Expenditure
		--WHERE  MONTH(CurrentDate)=MONTH(@Month);
	end

	if @tableName='Income'
	begin
		SELECT @TotalAmount=SUM(Income.Amount)
		FROM Income
		--WHERE  MONTH(CurrentDate)=MONTH(@Month);
	end

	 if @tableName='Budget'
	begin
		SELECT @TotalAmount=SUM(Budget.Amount)
        FROM Budget
		--WHERE  MONTH(CurrentDate)=MONTH(@Month);
	end
END
GO
USE [master]
GO
ALTER DATABASE [BudgetData] SET  READ_WRITE 
GO
