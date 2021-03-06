USE [master]
GO
/****** Object:  Database [LocusnineAssignmentDB]    Script Date: 19-09-2020 03:17:39 PM ******/
CREATE DATABASE [LocusnineAssignmentDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LocusnineAssignmentDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\LocusnineAssignmentDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'LocusnineAssignmentDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\LocusnineAssignmentDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [LocusnineAssignmentDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LocusnineAssignmentDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LocusnineAssignmentDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LocusnineAssignmentDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LocusnineAssignmentDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LocusnineAssignmentDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LocusnineAssignmentDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [LocusnineAssignmentDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LocusnineAssignmentDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LocusnineAssignmentDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LocusnineAssignmentDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LocusnineAssignmentDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LocusnineAssignmentDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LocusnineAssignmentDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LocusnineAssignmentDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LocusnineAssignmentDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LocusnineAssignmentDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LocusnineAssignmentDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LocusnineAssignmentDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LocusnineAssignmentDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LocusnineAssignmentDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LocusnineAssignmentDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LocusnineAssignmentDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LocusnineAssignmentDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LocusnineAssignmentDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LocusnineAssignmentDB] SET  MULTI_USER 
GO
ALTER DATABASE [LocusnineAssignmentDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LocusnineAssignmentDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LocusnineAssignmentDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LocusnineAssignmentDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [LocusnineAssignmentDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [LocusnineAssignmentDB]
GO
/****** Object:  Table [dbo].[User]    Script Date: 19-09-2020 03:17:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[Email] [varchar](100) NULL,
	[Role] [varchar](20) NULL,
	[MobileNumber] [varchar](20) NULL,
	[Status] [varchar](20) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [Name], [Email], [Role], [MobileNumber], [Status]) VALUES (1, N'Vivek Jain', N'vivekjain@locusnine.com', N'ADMIN', N'9688543021', N'Active')
INSERT [dbo].[User] ([ID], [Name], [Email], [Role], [MobileNumber], [Status]) VALUES (2, N'Avinash Jaiswal', N'avinashjaiswal@locusnine.com', N'CUSTOMEREXECUTIVE', N'7600812541', N'Active')
INSERT [dbo].[User] ([ID], [Name], [Email], [Role], [MobileNumber], [Status]) VALUES (3, N'Vivek Jain', N'vivekjain1@locusnine.com', N'Customer Executive', N'9819897965', N'Inactive')
INSERT [dbo].[User] ([ID], [Name], [Email], [Role], [MobileNumber], [Status]) VALUES (4, N'Avinash jaiswal', N'avinashjaiswal1@locusnine.com', N'Admin', N'9857458695', N'Inactive')
INSERT [dbo].[User] ([ID], [Name], [Email], [Role], [MobileNumber], [Status]) VALUES (5, N'harsh hardhna', N'harshhardhna@locusnine.com', N'Admin', N'9854756985', N'Inactive')
INSERT [dbo].[User] ([ID], [Name], [Email], [Role], [MobileNumber], [Status]) VALUES (6, N'Vivek', N'vivek@locusnine.com', N'Admin', N'2901966186', N'Active')
INSERT [dbo].[User] ([ID], [Name], [Email], [Role], [MobileNumber], [Status]) VALUES (7, N'Ranjeet', N'ranjeet@locusnine.com', N'Admin', N'2753840388', N'Inactive')
INSERT [dbo].[User] ([ID], [Name], [Email], [Role], [MobileNumber], [Status]) VALUES (8, N'Sunil', N'sunil@locusnine.com', N'Customer Executive', N'6742468347', N'Pending')
INSERT [dbo].[User] ([ID], [Name], [Email], [Role], [MobileNumber], [Status]) VALUES (9, N'Ganesh', N'ganesh@locusnine.com', N'Admin', N'1547141730', N'Active')
INSERT [dbo].[User] ([ID], [Name], [Email], [Role], [MobileNumber], [Status]) VALUES (10, N'Subhadip', N'Subhadip@locusnine.com', N'Admin', N'1395421778', N'Active')
INSERT [dbo].[User] ([ID], [Name], [Email], [Role], [MobileNumber], [Status]) VALUES (11, N'Vijay', N'vijay@locusnine.com', N'Customer Executive', N'6281736356', N'Active')
INSERT [dbo].[User] ([ID], [Name], [Email], [Role], [MobileNumber], [Status]) VALUES (12, N'Gajana', N'gajanan@locusnine.com', N'Admin', N'4539475643', N'Inactive')
INSERT [dbo].[User] ([ID], [Name], [Email], [Role], [MobileNumber], [Status]) VALUES (13, N'Santosh', N'santosh@locusnine.com', N'Admin', N'6416506054', N'Active')
INSERT [dbo].[User] ([ID], [Name], [Email], [Role], [MobileNumber], [Status]) VALUES (14, N'Pravee', N'praveen@locusnine.com', N'Admin', N'6079810840', N'Inactive')
INSERT [dbo].[User] ([ID], [Name], [Email], [Role], [MobileNumber], [Status]) VALUES (15, N'Suresh', N'suresh@locusnine.com', N'Admin', N'1774051908', N'Active')
INSERT [dbo].[User] ([ID], [Name], [Email], [Role], [MobileNumber], [Status]) VALUES (16, N'Priya', N'priya@locusnine.com', N'Customer Executive', N'1726314307', N'Active')
INSERT [dbo].[User] ([ID], [Name], [Email], [Role], [MobileNumber], [Status]) VALUES (17, N'Sharath', N'Sharath@locusnine.com', N'Customer Executive', N'6688630672', N'Inactive')
INSERT [dbo].[User] ([ID], [Name], [Email], [Role], [MobileNumber], [Status]) VALUES (18, N'Nishu', N'nishu@locusnine.com', N'Admin', N'7158823692', N'Active')
INSERT [dbo].[User] ([ID], [Name], [Email], [Role], [MobileNumber], [Status]) VALUES (19, N'Mukesh', N'mukesh@locusnine.com', N'Customer Executive', N'6334771105', N'Inactive')
INSERT [dbo].[User] ([ID], [Name], [Email], [Role], [MobileNumber], [Status]) VALUES (20, N'Raghavendra', N'raghavendra@locusnine.com', N'Customer Executive', N'2516497198', N'Active')
INSERT [dbo].[User] ([ID], [Name], [Email], [Role], [MobileNumber], [Status]) VALUES (21, N'Ashish', N'ashish@locusnine.com', N'Customer Executive', N'9149334604', N'Inactive')
INSERT [dbo].[User] ([ID], [Name], [Email], [Role], [MobileNumber], [Status]) VALUES (22, N'Saroj', N'saroj@locusnine.com', N'Admin', N'4572485125', N'Active')
INSERT [dbo].[User] ([ID], [Name], [Email], [Role], [MobileNumber], [Status]) VALUES (23, N'Sarthak', N'Sarthak@locusnine.com', N'Customer Executive', N'0243694313', N'Inactive')
INSERT [dbo].[User] ([ID], [Name], [Email], [Role], [MobileNumber], [Status]) VALUES (24, N'Rajeev', N'rajeev@locusnine.com', N'Customer Executive', N'0512862205', N'Active')
INSERT [dbo].[User] ([ID], [Name], [Email], [Role], [MobileNumber], [Status]) VALUES (25, N'Kaveri', N'kaveri@locusnine.com', N'Customer Executive', N'0776049651', N'Active')
INSERT [dbo].[User] ([ID], [Name], [Email], [Role], [MobileNumber], [Status]) VALUES (26, N'Sunil', N'sunil@locusnine.com', N'Customer Executive', N'8774978987', N'Active')
INSERT [dbo].[User] ([ID], [Name], [Email], [Role], [MobileNumber], [Status]) VALUES (27, N'Nagalaxmi', N'nagalaxmi@locusnine.com', N'Customer Executive', N'5536110557', N'Inactive')
INSERT [dbo].[User] ([ID], [Name], [Email], [Role], [MobileNumber], [Status]) VALUES (28, N'Anusha', N'anusha@locusnine.com', N'Customer Executive', N'7781728293', N'Inactive')
INSERT [dbo].[User] ([ID], [Name], [Email], [Role], [MobileNumber], [Status]) VALUES (29, N'Vicky', N'vicky@locusnine.com', N'Customer Executive', N'6706849916', N'Active')
INSERT [dbo].[User] ([ID], [Name], [Email], [Role], [MobileNumber], [Status]) VALUES (30, N'Anu', N'anu@locusnine.com', N'Admin', N'6929267332', N'Active')
INSERT [dbo].[User] ([ID], [Name], [Email], [Role], [MobileNumber], [Status]) VALUES (31, N'Divyank', N'divyank@locusnine.com', N'Customer Executive', N'2094236378', N'Active')
SET IDENTITY_INSERT [dbo].[User] OFF
/****** Object:  StoredProcedure [dbo].[GetUserCount]    Script Date: 19-09-2020 03:17:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[GetUserCount]
(  
 @search varchar(100)=null  
)   
As  
 Begin  
  if(@search IS NULL)
	SET @search =''

 SELECT count(*) as totalCount FROM [dbo].[User] WHERE Name LIKE '%'+@search+'%' ;  
 End  

GO
/****** Object:  StoredProcedure [dbo].[GetUsers]    Script Date: 19-09-2020 03:17:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[GetUsers]
(  
 @PageIndex INT,  
 @pageSize INT,
 @search varchar(100)=null  
)   
As  
 Begin
 if(@search IS NULL)
	SET @search =''

 SELECT * FROM [dbo].[User] WHERE Name LIKE '%'+@search+'%' 
 ORDER BY ID OFFSET @PageSize*(@PageIndex-1) ROWS FETCH NEXT @PageSize ROWS ONLY;
 End
GO
USE [master]
GO
ALTER DATABASE [LocusnineAssignmentDB] SET  READ_WRITE 
GO
