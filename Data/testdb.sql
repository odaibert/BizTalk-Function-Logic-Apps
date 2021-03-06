USE [testdb]
GO
/****** Object:  Table [dbo].[ContactType]    Script Date: 9/13/2018 4:54:37 PM ******/
DROP TABLE IF EXISTS [dbo].[ContactType]
GO
/****** Object:  User [testlogin]    Script Date: 9/13/2018 4:54:37 PM ******/
DROP USER IF EXISTS [testlogin]
GO
USE [master]
GO
/****** Object:  Login [##MS_PolicyEventProcessingLogin##]    Script Date: 9/13/2018 4:54:37 PM ******/
IF  EXISTS (SELECT * FROM sys.server_principals WHERE name = N'##MS_PolicyEventProcessingLogin##')
DROP LOGIN [##MS_PolicyEventProcessingLogin##]
GO
/****** Object:  Login [##MS_PolicyTsqlExecutionLogin##]    Script Date: 9/13/2018 4:54:37 PM ******/
IF  EXISTS (SELECT * FROM sys.server_principals WHERE name = N'##MS_PolicyTsqlExecutionLogin##')
DROP LOGIN [##MS_PolicyTsqlExecutionLogin##]
GO
/****** Object:  Login [BUILTIN\Administrators]    Script Date: 9/13/2018 4:54:37 PM ******/
IF  EXISTS (SELECT * FROM sys.server_principals WHERE name = N'BUILTIN\Administrators')
DROP LOGIN [BUILTIN\Administrators]
GO
/****** Object:  Login [NT AUTHORITY\SYSTEM]    Script Date: 9/13/2018 4:54:37 PM ******/
IF  EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT AUTHORITY\SYSTEM')
DROP LOGIN [NT AUTHORITY\SYSTEM]
GO
/****** Object:  Login [NT SERVICE\MSSQLSERVER]    Script Date: 9/13/2018 4:54:37 PM ******/
IF  EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT SERVICE\MSSQLSERVER')
DROP LOGIN [NT SERVICE\MSSQLSERVER]
GO
/****** Object:  Login [NT SERVICE\SQLSERVERAGENT]    Script Date: 9/13/2018 4:54:37 PM ******/
IF  EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT SERVICE\SQLSERVERAGENT')
DROP LOGIN [NT SERVICE\SQLSERVERAGENT]
GO
/****** Object:  Login [NT SERVICE\SQLTELEMETRY]    Script Date: 9/13/2018 4:54:37 PM ******/
IF  EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT SERVICE\SQLTELEMETRY')
DROP LOGIN [NT SERVICE\SQLTELEMETRY]
GO
/****** Object:  Login [NT SERVICE\SQLWriter]    Script Date: 9/13/2018 4:54:37 PM ******/
IF  EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT SERVICE\SQLWriter')
DROP LOGIN [NT SERVICE\SQLWriter]
GO
/****** Object:  Login [NT SERVICE\Winmgmt]    Script Date: 9/13/2018 4:54:37 PM ******/
IF  EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT SERVICE\Winmgmt')
DROP LOGIN [NT SERVICE\Winmgmt]
GO
/****** Object:  Login [testlogin]    Script Date: 9/13/2018 4:54:37 PM ******/
IF  EXISTS (SELECT * FROM sys.server_principals WHERE name = N'testlogin')
DROP LOGIN [testlogin]
GO
/****** Object:  Database [testdb]    Script Date: 9/13/2018 4:54:37 PM ******/
DROP DATABASE IF EXISTS [testdb]
GO
/****** Object:  Database [testdb]    Script Date: 9/13/2018 4:54:37 PM ******/
CREATE DATABASE [testdb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'testdb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\testdb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'testdb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\testdb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [testdb] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [testdb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [testdb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [testdb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [testdb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [testdb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [testdb] SET ARITHABORT OFF 
GO
ALTER DATABASE [testdb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [testdb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [testdb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [testdb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [testdb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [testdb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [testdb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [testdb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [testdb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [testdb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [testdb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [testdb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [testdb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [testdb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [testdb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [testdb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [testdb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [testdb] SET RECOVERY FULL 
GO
ALTER DATABASE [testdb] SET  MULTI_USER 
GO
ALTER DATABASE [testdb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [testdb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [testdb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [testdb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [testdb] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'testdb', N'ON'
GO
ALTER DATABASE [testdb] SET QUERY_STORE = OFF
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [testlogin]    Script Date: 9/13/2018 4:54:38 PM ******/
CREATE LOGIN [testlogin] WITH PASSWORD=N'oHcDJkEoQCJYpNt1FaDVDKPM2yt3tHe2faiGzX1BSvs=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [testlogin] DISABLE
GO
/****** Object:  Login [NT SERVICE\Winmgmt]    Script Date: 9/13/2018 4:54:38 PM ******/
CREATE LOGIN [NT SERVICE\Winmgmt] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT SERVICE\SQLWriter]    Script Date: 9/13/2018 4:54:38 PM ******/
CREATE LOGIN [NT SERVICE\SQLWriter] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT SERVICE\SQLTELEMETRY]    Script Date: 9/13/2018 4:54:38 PM ******/
CREATE LOGIN [NT SERVICE\SQLTELEMETRY] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT SERVICE\SQLSERVERAGENT]    Script Date: 9/13/2018 4:54:38 PM ******/
CREATE LOGIN [NT SERVICE\SQLSERVERAGENT] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT SERVICE\MSSQLSERVER]    Script Date: 9/13/2018 4:54:38 PM ******/
CREATE LOGIN [NT SERVICE\MSSQLSERVER] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT AUTHORITY\SYSTEM]    Script Date: 9/13/2018 4:54:38 PM ******/
CREATE LOGIN [NT AUTHORITY\SYSTEM] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [BUILTIN\Administrators]    Script Date: 9/13/2018 4:54:38 PM ******/
CREATE LOGIN [BUILTIN\Administrators] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyTsqlExecutionLogin##]    Script Date: 9/13/2018 4:54:38 PM ******/
CREATE LOGIN [##MS_PolicyTsqlExecutionLogin##] WITH PASSWORD=N'qz/eqSmZlV3iunTo9qvMetCnci1OtBmnmmynCpvdwcs=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyTsqlExecutionLogin##] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyEventProcessingLogin##]    Script Date: 9/13/2018 4:54:38 PM ******/
CREATE LOGIN [##MS_PolicyEventProcessingLogin##] WITH PASSWORD=N'qqi5iZ9fA8sOYWqjS49hUCQBeXTZy9IeoM5puYnDvYM=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyEventProcessingLogin##] DISABLE
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\Winmgmt]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\SQLWriter]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\SQLSERVERAGENT]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\MSSQLSERVER]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [BUILTIN\Administrators]
GO
USE [testdb]
GO
/****** Object:  User [testlogin]    Script Date: 9/13/2018 4:54:38 PM ******/
CREATE USER [testlogin] FOR LOGIN [testlogin] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [testlogin]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [testlogin]
GO
/****** Object:  Table [dbo].[ContactType]    Script Date: 9/13/2018 4:54:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactType](
	[ID] [int] NOT NULL,
	[ContactType] [nvarchar](50) NULL,
 CONSTRAINT [PK_ContactType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ContactType] ([ID], [ContactType]) VALUES (1, N'Accounting Manager')
INSERT [dbo].[ContactType] ([ID], [ContactType]) VALUES (2, N'Assistant Sales Agent')
INSERT [dbo].[ContactType] ([ID], [ContactType]) VALUES (3, N'Assistant Sales Representative')
INSERT [dbo].[ContactType] ([ID], [ContactType]) VALUES (4, N'Coordinator Foreign Markets')
INSERT [dbo].[ContactType] ([ID], [ContactType]) VALUES (5, N'Export Administrator')
INSERT [dbo].[ContactType] ([ID], [ContactType]) VALUES (6, N'International Marketing Manager')
INSERT [dbo].[ContactType] ([ID], [ContactType]) VALUES (7, N'Marketing Assistant')
INSERT [dbo].[ContactType] ([ID], [ContactType]) VALUES (8, N'Marketing Manager')
INSERT [dbo].[ContactType] ([ID], [ContactType]) VALUES (9, N'Marketing Representative')
INSERT [dbo].[ContactType] ([ID], [ContactType]) VALUES (10, N'Order Administrator')
INSERT [dbo].[ContactType] ([ID], [ContactType]) VALUES (11, N'Owner')
INSERT [dbo].[ContactType] ([ID], [ContactType]) VALUES (12, N'Owner / Marketing Assistant')
INSERT [dbo].[ContactType] ([ID], [ContactType]) VALUES (13, N'Product Manager')
INSERT [dbo].[ContactType] ([ID], [ContactType]) VALUES (14, N'Purchasing Agent')
INSERT [dbo].[ContactType] ([ID], [ContactType]) VALUES (15, N'Purchasing Manager')
INSERT [dbo].[ContactType] ([ID], [ContactType]) VALUES (16, N'Regional Account Representative')
INSERT [dbo].[ContactType] ([ID], [ContactType]) VALUES (17, N'Sales Agent')
INSERT [dbo].[ContactType] ([ID], [ContactType]) VALUES (18, N'Sales Associate')
INSERT [dbo].[ContactType] ([ID], [ContactType]) VALUES (19, N'Sales Manager')
INSERT [dbo].[ContactType] ([ID], [ContactType]) VALUES (20, N'Sales Representative')
USE [master]
GO
ALTER DATABASE [testdb] SET  READ_WRITE 
GO
