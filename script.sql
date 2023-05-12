USE [master]
GO
/****** Object:  Database [AlmuerzOrt]    Script Date: 12/5/2023 12:01:00 ******/
CREATE DATABASE [AlmuerzOrt]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AlmuerzOrt', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\AlmuerzOrt.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AlmuerzOrt_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\AlmuerzOrt_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [AlmuerzOrt] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AlmuerzOrt].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AlmuerzOrt] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AlmuerzOrt] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AlmuerzOrt] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AlmuerzOrt] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AlmuerzOrt] SET ARITHABORT OFF 
GO
ALTER DATABASE [AlmuerzOrt] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AlmuerzOrt] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AlmuerzOrt] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AlmuerzOrt] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AlmuerzOrt] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AlmuerzOrt] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AlmuerzOrt] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AlmuerzOrt] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AlmuerzOrt] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AlmuerzOrt] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AlmuerzOrt] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AlmuerzOrt] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AlmuerzOrt] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AlmuerzOrt] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AlmuerzOrt] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AlmuerzOrt] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AlmuerzOrt] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AlmuerzOrt] SET RECOVERY FULL 
GO
ALTER DATABASE [AlmuerzOrt] SET  MULTI_USER 
GO
ALTER DATABASE [AlmuerzOrt] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AlmuerzOrt] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AlmuerzOrt] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AlmuerzOrt] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AlmuerzOrt] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'AlmuerzOrt', N'ON'
GO
ALTER DATABASE [AlmuerzOrt] SET QUERY_STORE = OFF
GO
USE [AlmuerzOrt]
GO
/****** Object:  User [alumno]    Script Date: 12/5/2023 12:01:00 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[ComidaxLocal]    Script Date: 12/5/2023 12:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComidaxLocal](
	[ComidaID] [int] NOT NULL,
	[LocalID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Imagenes]    Script Date: 12/5/2023 12:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Imagenes](
	[LocalID] [int] NOT NULL,
	[Imagen] [varchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Locales]    Script Date: 12/5/2023 12:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locales](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Calificacion] [int] NOT NULL,
	[Direccion] [varchar](50) NOT NULL,
	[Contacto] [varchar](50) NULL,
	[Precio] [int] NOT NULL,
	[Poblacion] [varchar](50) NOT NULL,
	[Tardanza] [varchar](50) NOT NULL,
	[PedirPorAdelantado] [bit] NOT NULL,
 CONSTRAINT [PK_Locales] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reseñas]    Script Date: 12/5/2023 12:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reseñas](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UsuarioID] [int] NOT NULL,
	[LocalID] [int] NOT NULL,
	[Imagen] [varchar](50) NOT NULL,
	[Calificacion] [int] NOT NULL,
	[ComidaID] [int] NOT NULL,
	[Precio] [int] NOT NULL,
	[Tardanza] [int] NOT NULL,
	[Poblacion] [varchar](50) NOT NULL,
	[Descripcion] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Reseñas] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoDeComida]    Script Date: 12/5/2023 12:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoDeComida](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Comida] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TipoDeComida] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 12/5/2023 12:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Usuario] [varchar](50) NOT NULL,
	[Contraseña] [varchar](50) NOT NULL,
	[Foto] [varchar](max) NOT NULL,
	[isBanned] [bit] NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[ComidaxLocal] ([ComidaID], [LocalID]) VALUES (3, 1)
INSERT [dbo].[ComidaxLocal] ([ComidaID], [LocalID]) VALUES (5, 2)
INSERT [dbo].[ComidaxLocal] ([ComidaID], [LocalID]) VALUES (7, 2)
INSERT [dbo].[ComidaxLocal] ([ComidaID], [LocalID]) VALUES (3, 3)
INSERT [dbo].[ComidaxLocal] ([ComidaID], [LocalID]) VALUES (8, 3)
INSERT [dbo].[ComidaxLocal] ([ComidaID], [LocalID]) VALUES (6, 5)
INSERT [dbo].[ComidaxLocal] ([ComidaID], [LocalID]) VALUES (5, 6)
GO
INSERT [dbo].[Imagenes] ([LocalID], [Imagen]) VALUES (1, N'chinojorge1.jpg')
INSERT [dbo].[Imagenes] ([LocalID], [Imagen]) VALUES (1, N'chinojorge2.jpg')
INSERT [dbo].[Imagenes] ([LocalID], [Imagen]) VALUES (1, N'chinojorge3.jpg')
GO
SET IDENTITY_INSERT [dbo].[Locales] ON 

INSERT [dbo].[Locales] ([ID], [Nombre], [Calificacion], [Direccion], [Contacto], [Precio], [Poblacion], [Tardanza], [PedirPorAdelantado]) VALUES (1, N'Kwom Yuen Rotisería China
', 9, N'Yatay 213', N'01149587733', 700, N'Media', N'Media', 0)
INSERT [dbo].[Locales] ([ID], [Nombre], [Calificacion], [Direccion], [Contacto], [Precio], [Poblacion], [Tardanza], [PedirPorAdelantado]) VALUES (2, N'Cri Cri', 6, N'Av. Díaz Vélez 4401', NULL, 800, N'Baja', N'Baja', 0)
INSERT [dbo].[Locales] ([ID], [Nombre], [Calificacion], [Direccion], [Contacto], [Precio], [Poblacion], [Tardanza], [PedirPorAdelantado]) VALUES (3, N'Green Deli', 8, N'Av. Díaz Vélez 4501', NULL, 1000, N'Muy alta', N'Alta', 0)
INSERT [dbo].[Locales] ([ID], [Nombre], [Calificacion], [Direccion], [Contacto], [Precio], [Poblacion], [Tardanza], [PedirPorAdelantado]) VALUES (5, N'Via Veneto', 7, N'Av. Díaz Vélez 4459', N'01149825572', 700, N'Alta', N'Media', 0)
INSERT [dbo].[Locales] ([ID], [Nombre], [Calificacion], [Direccion], [Contacto], [Precio], [Poblacion], [Tardanza], [PedirPorAdelantado]) VALUES (6, N'Impanato', 8, N'Tte. Gral. Juan Domingo Perón 4402', N'01126112100', 1000, N'Media', N'Media', 1)
INSERT [dbo].[Locales] ([ID], [Nombre], [Calificacion], [Direccion], [Contacto], [Precio], [Poblacion], [Tardanza], [PedirPorAdelantado]) VALUES (11, N'Pollin', 9, N'Rio de janeiro 320', N'01149813487', 700, N'Alta', N'Baja', 1)
INSERT [dbo].[Locales] ([ID], [Nombre], [Calificacion], [Direccion], [Contacto], [Precio], [Poblacion], [Tardanza], [PedirPorAdelantado]) VALUES (12, N'El Vasquito', 9, N'Río de Janeiro 310', N'01149822220', 900, N'Muy alta', N'Media', 0)
SET IDENTITY_INSERT [dbo].[Locales] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoDeComida] ON 

INSERT [dbo].[TipoDeComida] ([ID], [Comida]) VALUES (3, N'Comida china')
INSERT [dbo].[TipoDeComida] ([ID], [Comida]) VALUES (4, N'Pizza')
INSERT [dbo].[TipoDeComida] ([ID], [Comida]) VALUES (5, N'Empanada')
INSERT [dbo].[TipoDeComida] ([ID], [Comida]) VALUES (6, N'Pastas')
INSERT [dbo].[TipoDeComida] ([ID], [Comida]) VALUES (7, N'Sanguches')
INSERT [dbo].[TipoDeComida] ([ID], [Comida]) VALUES (8, N'Vegetariano')
SET IDENTITY_INSERT [dbo].[TipoDeComida] OFF
GO
ALTER TABLE [dbo].[ComidaxLocal]  WITH CHECK ADD  CONSTRAINT [FK_ComidaxLocal_Locales] FOREIGN KEY([LocalID])
REFERENCES [dbo].[Locales] ([ID])
GO
ALTER TABLE [dbo].[ComidaxLocal] CHECK CONSTRAINT [FK_ComidaxLocal_Locales]
GO
ALTER TABLE [dbo].[ComidaxLocal]  WITH CHECK ADD  CONSTRAINT [FK_ComidaxLocal_TipoDeComida] FOREIGN KEY([ComidaID])
REFERENCES [dbo].[TipoDeComida] ([ID])
GO
ALTER TABLE [dbo].[ComidaxLocal] CHECK CONSTRAINT [FK_ComidaxLocal_TipoDeComida]
GO
ALTER TABLE [dbo].[Imagenes]  WITH CHECK ADD  CONSTRAINT [FK_Imagenes_Locales] FOREIGN KEY([LocalID])
REFERENCES [dbo].[Locales] ([ID])
GO
ALTER TABLE [dbo].[Imagenes] CHECK CONSTRAINT [FK_Imagenes_Locales]
GO
ALTER TABLE [dbo].[Reseñas]  WITH CHECK ADD  CONSTRAINT [FK_Reseñas_Locales] FOREIGN KEY([LocalID])
REFERENCES [dbo].[Locales] ([ID])
GO
ALTER TABLE [dbo].[Reseñas] CHECK CONSTRAINT [FK_Reseñas_Locales]
GO
ALTER TABLE [dbo].[Reseñas]  WITH CHECK ADD  CONSTRAINT [FK_Reseñas_TipoDeComida] FOREIGN KEY([ComidaID])
REFERENCES [dbo].[TipoDeComida] ([ID])
GO
ALTER TABLE [dbo].[Reseñas] CHECK CONSTRAINT [FK_Reseñas_TipoDeComida]
GO
ALTER TABLE [dbo].[Reseñas]  WITH CHECK ADD  CONSTRAINT [FK_Reseñas_Usuario] FOREIGN KEY([UsuarioID])
REFERENCES [dbo].[Usuario] ([ID])
GO
ALTER TABLE [dbo].[Reseñas] CHECK CONSTRAINT [FK_Reseñas_Usuario]
GO
USE [master]
GO
ALTER DATABASE [AlmuerzOrt] SET  READ_WRITE 
GO
