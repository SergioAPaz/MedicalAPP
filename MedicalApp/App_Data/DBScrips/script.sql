USE [master]
GO
/****** Object:  Database [MedicalApp]    Script Date: 3/11/2019 11:24:33 PM ******/
CREATE DATABASE [MedicalApp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MedicalApp', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\MedicalApp.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MedicalApp_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\MedicalApp_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MedicalApp] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MedicalApp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MedicalApp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MedicalApp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MedicalApp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MedicalApp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MedicalApp] SET ARITHABORT OFF 
GO
ALTER DATABASE [MedicalApp] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MedicalApp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MedicalApp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MedicalApp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MedicalApp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MedicalApp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MedicalApp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MedicalApp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MedicalApp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MedicalApp] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MedicalApp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MedicalApp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MedicalApp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MedicalApp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MedicalApp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MedicalApp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MedicalApp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MedicalApp] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MedicalApp] SET  MULTI_USER 
GO
ALTER DATABASE [MedicalApp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MedicalApp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MedicalApp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MedicalApp] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [MedicalApp] SET DELAYED_DURABILITY = DISABLED 
GO
USE [MedicalApp]
GO
/****** Object:  User [IIS APPPOOL\DefaultAppPool]    Script Date: 3/11/2019 11:24:33 PM ******/
CREATE USER [IIS APPPOOL\DefaultAppPool] FOR LOGIN [IIS APPPOOL\DefaultAppPool] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [IIS APPPOOL\DefaultAppPool]
GO
/****** Object:  Table [dbo].[CT_Doctores]    Script Date: 3/11/2019 11:24:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CT_Doctores](
	[int] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_CT_Doctores] PRIMARY KEY CLUSTERED 
(
	[int] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CT_Roles]    Script Date: 3/11/2019 11:24:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CT_Roles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Role] [varchar](50) NULL,
 CONSTRAINT [PK_CT_Roles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CT_Users]    Script Date: 3/11/2019 11:24:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CT_Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[Rol] [int] NOT NULL,
	[Name] [varchar](50) NULL,
	[BornDate] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[LastLogin] [datetime] NULL,
 CONSTRAINT [PK_CT_Users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tareas]    Script Date: 3/11/2019 11:24:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tareas](
	[id] [int] IDENTITY(1000,1) NOT NULL,
	[Fecha] [datetime] NULL,
	[Asignador] [int] NULL,
	[TituloTarea] [varchar](150) NULL,
	[Descripcion] [varchar](max) NULL,
	[Asignado] [int] NULL,
	[FechaLimite] [date] NULL,
	[Vencida] [int] NULL,
	[Terminada] [int] NULL,
	[FechaDeTermino] [datetime] NULL,
	[Adjunto] [varchar](50) NULL,
	[ComentarioDeCierre] [varchar](max) NULL,
	[EvidenciaDeCierreAdjunto] [varchar](50) NULL,
 CONSTRAINT [PK_Tareas] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[CT_Roles] ON 

INSERT [dbo].[CT_Roles] ([id], [Role]) VALUES (1, N'Doctor')
INSERT [dbo].[CT_Roles] ([id], [Role]) VALUES (2, N'Usuario')
SET IDENTITY_INSERT [dbo].[CT_Roles] OFF
SET IDENTITY_INSERT [dbo].[CT_Users] ON 

INSERT [dbo].[CT_Users] ([id], [UserName], [Rol], [Name], [BornDate], [Password], [LastLogin]) VALUES (9, N'serch3', 1, N'sergio alejandro paz holguin', N'3/11/2019 10:28:24 PM', N'2UWmIGZmPY5hEb3jaQC4vA==', CAST(N'2019-03-11 23:20:21.240' AS DateTime))
INSERT [dbo].[CT_Users] ([id], [UserName], [Rol], [Name], [BornDate], [Password], [LastLogin]) VALUES (10, N'alex', 1, N'sergio alejandro paz holg22uin', N'3/11/2019 10:35:37 PM', N'2UWmIGZmPY5hEb3jaQC4vA==', NULL)
SET IDENTITY_INSERT [dbo].[CT_Users] OFF
SET IDENTITY_INSERT [dbo].[Tareas] ON 

INSERT [dbo].[Tareas] ([id], [Fecha], [Asignador], [TituloTarea], [Descripcion], [Asignado], [FechaLimite], [Vencida], [Terminada], [FechaDeTermino], [Adjunto], [ComentarioDeCierre], [EvidenciaDeCierreAdjunto]) VALUES (2067, CAST(N'2019-03-11 22:34:02.247' AS DateTime), 9, N'sdfdsf', N'sdfsd', 9, CAST(N'2019-03-12' AS Date), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Tareas] ([id], [Fecha], [Asignador], [TituloTarea], [Descripcion], [Asignado], [FechaLimite], [Vencida], [Terminada], [FechaDeTermino], [Adjunto], [ComentarioDeCierre], [EvidenciaDeCierreAdjunto]) VALUES (2068, CAST(N'2019-03-11 22:36:22.073' AS DateTime), 9, N'zxc', N'zxc', 10, CAST(N'2019-03-14' AS Date), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Tareas] ([id], [Fecha], [Asignador], [TituloTarea], [Descripcion], [Asignado], [FechaLimite], [Vencida], [Terminada], [FechaDeTermino], [Adjunto], [ComentarioDeCierre], [EvidenciaDeCierreAdjunto]) VALUES (2069, CAST(N'2019-03-11 22:36:31.113' AS DateTime), 9, N'asd', N'asd', 10, CAST(N'2019-03-01' AS Date), NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Tareas] OFF
ALTER TABLE [dbo].[CT_Users]  WITH CHECK ADD  CONSTRAINT [FK_CT_Users_CT_Roles] FOREIGN KEY([Rol])
REFERENCES [dbo].[CT_Roles] ([id])
GO
ALTER TABLE [dbo].[CT_Users] CHECK CONSTRAINT [FK_CT_Users_CT_Roles]
GO
ALTER TABLE [dbo].[Tareas]  WITH CHECK ADD  CONSTRAINT [FK_Tareas_CT_Users] FOREIGN KEY([Asignado])
REFERENCES [dbo].[CT_Users] ([id])
GO
ALTER TABLE [dbo].[Tareas] CHECK CONSTRAINT [FK_Tareas_CT_Users]
GO
ALTER TABLE [dbo].[Tareas]  WITH CHECK ADD  CONSTRAINT [FK_Tareas_CT_Users1] FOREIGN KEY([Asignador])
REFERENCES [dbo].[CT_Users] ([id])
GO
ALTER TABLE [dbo].[Tareas] CHECK CONSTRAINT [FK_Tareas_CT_Users1]
GO
USE [master]
GO
ALTER DATABASE [MedicalApp] SET  READ_WRITE 
GO
