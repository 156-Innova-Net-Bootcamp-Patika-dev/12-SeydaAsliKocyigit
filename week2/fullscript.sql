USE [master]
GO
/****** Object:  Database [documentdb]    Script Date: 08/02/2022 15:25:44 ******/
CREATE DATABASE [documentdb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'documentdb', FILENAME = N'C:\database\documentdb.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'documentdb_log', FILENAME = N'C:\database\documentdb_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [documentdb] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [documentdb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [documentdb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [documentdb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [documentdb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [documentdb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [documentdb] SET ARITHABORT OFF 
GO
ALTER DATABASE [documentdb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [documentdb] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [documentdb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [documentdb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [documentdb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [documentdb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [documentdb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [documentdb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [documentdb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [documentdb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [documentdb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [documentdb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [documentdb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [documentdb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [documentdb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [documentdb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [documentdb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [documentdb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [documentdb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [documentdb] SET  MULTI_USER 
GO
ALTER DATABASE [documentdb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [documentdb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [documentdb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [documentdb] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [documentdb]
GO
/****** Object:  Table [dbo].[TbDocuments]    Script Date: 08/02/2022 15:25:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbDocuments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[folderid] [int] NOT NULL,
	[documentname] [nvarchar](50) NULL,
	[documentdate] [datetime] NULL,
 CONSTRAINT [PK_TbDocuments] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TbFolder]    Script Date: 08/02/2022 15:25:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbFolder](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[foldername] [nvarchar](50) NULL,
	[cabinetno] [int] NULL,
 CONSTRAINT [PK_TbFolder] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[TbDocuments]  WITH CHECK ADD  CONSTRAINT [FK_TbDocuments_TbFolder] FOREIGN KEY([folderid])
REFERENCES [dbo].[TbFolder] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TbDocuments] CHECK CONSTRAINT [FK_TbDocuments_TbFolder]
GO
USE [master]
GO
ALTER DATABASE [documentdb] SET  READ_WRITE 
GO
