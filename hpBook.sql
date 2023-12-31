USE [master]
GO
/****** Object:  Database [BBStore1]    Script Date: 11/26/2023 10:08:26 PM ******/
CREATE DATABASE [BBStore1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BBStore1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\BBStore1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BBStore1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\BBStore1_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BBStore1] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BBStore1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BBStore1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BBStore1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BBStore1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BBStore1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BBStore1] SET ARITHABORT OFF 
GO
ALTER DATABASE [BBStore1] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BBStore1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BBStore1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BBStore1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BBStore1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BBStore1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BBStore1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BBStore1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BBStore1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BBStore1] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BBStore1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BBStore1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BBStore1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BBStore1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BBStore1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BBStore1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BBStore1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BBStore1] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BBStore1] SET  MULTI_USER 
GO
ALTER DATABASE [BBStore1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BBStore1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BBStore1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BBStore1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BBStore1] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BBStore1] SET QUERY_STORE = OFF
GO
USE [BBStore1]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 11/26/2023 10:08:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Fullname] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Photo] [nvarchar](50) NOT NULL,
	[resetToken] [varchar](max) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Authorities]    Script Date: 11/26/2023 10:08:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authorities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[RoleId] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 11/26/2023 10:08:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [char](4) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Photo] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 11/26/2023 10:08:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderId] [bigint] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 11/26/2023 10:08:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 11/26/2023 10:08:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Image] [nvarchar](50) NOT NULL,
	[NXB] [nvarchar](50) NOT NULL,
	[TG] [nvarchar](50) NOT NULL,
	[Price] [float] NOT NULL,
	[CreateDate] [date] NOT NULL,
	[Available] [bit] NOT NULL,
	[CategoryId] [char](4) NOT NULL,
	[HeadImage] [nvarchar](50) NULL,
	[GioiThieu] [nvarchar](max) NULL,
	[SoLuong] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 11/26/2023 10:08:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [nvarchar](10) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'', N'', N'', N'', N'', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'ALFKI', N'alfki', N'Maria Anders', N'alfki@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'ANATR', N'anatr', N'Ana Trujillo', N'anatr@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'ANTON', N'anton', N'Antonio Moreno', N'anton@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'AROUT', N'arout', N'Thomas Hardy', N'arout@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'BERGS', N'bergs', N'Christina Berglund', N'bergs@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'BLAUS', N'blaus', N'Hanna Moos', N'blaus@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'BLONP', N'blonp', N'Frédérique Citeaux', N'blonp@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'BOLID', N'bolid', N'Martín Sommer', N'bolid@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'BONAP', N'bonap', N'Laurence Lebihan', N'bonap@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'BOTTM', N'bottm', N'Elizabeth Lincoln', N'bottm@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'BSBEV', N'bsbev', N'Victoria Ashworth', N'bsbev@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'CACTU', N'cactu', N'Patricio Simpson', N'cactu@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'CENTC', N'centc', N'Francisco Chang', N'centc@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'CHOPS', N'chops', N'Yang Wang', N'chops@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'COMMI', N'commi', N'Pedro Afonso', N'commi@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'CONSH', N'consh', N'Elizabeth Brown', N'consh@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'customer', N'123', N'Nguyễn Văn Tèo', N'teonv@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'dat', N'123', N'Tran Tuan Dat', N'dat9a13@gmail.com', N'6c638291a66ddc93b86bf4f43c337701.jpg', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'dat1', N'1', N'Tran Tuan Datsad', N'datt8843@gmail.com', N'', N'f508b678-0ba2-4271-9bcb-5253c2250b3f')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'dat12', N'1', N'Tran Tuan Dat', N'dat@phptravels.com', N'', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'director', N'123', N'Nguyễn Chí Phèo', N'pheonc@fpt.edu.vn', N'-1407968806.jpg', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'DRACD', N'dracd', N'Sven Ottlieb', N'dracd@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'DUMON', N'dumon', N'Janine Labrune', N'dumon@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'EASTC', N'eastc', N'Ann Devon', N'eastc@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'ERNSH', N'ernsh', N'Roland Mendel', N'ernsh@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'FAMIA', N'famia', N'Aria Cruz', N'famia@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'FISSA', N'fissa', N'Diego Roel', N'fissa@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'FOLIG', N'folig', N'Martine Rancé', N'folig@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'FOLKO', N'folko', N'Maria Larsson', N'folko@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'FRANK', N'frank', N'Peter Franken', N'frank@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'FRANR', N'franr', N'Carine Schmitt', N'franr@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'FRANS', N'frans', N'Paolo Accorti', N'frans@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'FURIB', N'furib', N'Lino Rodriguez', N'furib@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'GALED', N'galed', N'Eduardo Saavedra', N'galed@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'GODOS', N'godos', N'José Pedro Freyre', N'godos@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'GOURL', N'gourl', N'André Fonseca', N'gourl@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'GREAL', N'greal', N'Howard Snyder', N'greal@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'GROSR', N'grosr', N'Manuel Pereira', N'grosr@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'HANAR', N'hanar', N'Mario Pontes', N'hanar@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'HILAA', N'hilaa', N'Carlos Hernández', N'hilaa@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'HUNGC', N'hungc', N'Yoshi Latimer', N'hungc@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'HUNGO', N'hungo', N'Patricia McKenna', N'hungo@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'ISLAT', N'islat', N'Helen Bennett', N'islat@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'KOENE', N'koene', N'Philip Cramer', N'koene@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'LACOR', N'lacor', N'Daniel Tonini', N'lacor@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'LAMAI', N'lamai', N'Annette Roulet', N'lamai@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'LAUGB', N'laugb', N'Yoshi Tannamuri', N'laugb@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'LAZYK', N'lazyk', N'John Steel', N'lazyk@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'LEHMS', N'lehms', N'Renate Messner', N'lehms@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'LETSS', N'letss', N'Jaime Yorres', N'letss@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'LILAS', N'lilas', N'Carlos González', N'lilas@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'LINOD', N'linod', N'Felipe Izquierdo', N'linod@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'LONEP', N'lonep', N'Fran Wilson', N'lonep@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'MAGAA', N'magaa', N'Giovanni Rovelli', N'magaa@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'MAISD', N'maisd', N'Catherine Dewey', N'maisd@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'MEREP', N'merep', N'Jean Fresnière', N'merep@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'MORGK', N'morgk', N'Alexander Feuer', N'morgk@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'NORTS', N'norts', N'Simon Crowther', N'norts@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'OCEAN', N'ocean', N'Yvonne Moncada', N'ocean@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'OLDWO', N'oldwo', N'Rene Phillips', N'oldwo@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'OTTIK', N'ottik', N'Henriette Pfalzheim', N'ottik@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'PARIS', N'paris', N'Marie Bertrand', N'paris@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'PERIC', N'peric', N'Guillermo Fernández', N'peric@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'PICCO', N'picco', N'Georg Pipps', N'picco@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'PRINI', N'prini', N'Isabel de Castro', N'prini@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'QUEDE', N'quede', N'Bernardo Batista', N'quede@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'QUEEN', N'queen', N'Lúcia Carvalho', N'queen@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'QUICK', N'quick', N'Horst Kloss', N'quick@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'RANCH', N'ranch', N'Sergio Gutiérrez', N'ranch@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'RATTC', N'rattc', N'Paula Wilson', N'rattc@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'REGGC', N'reggc', N'Maurizio Moroni', N'reggc@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'RICAR', N'ricar', N'Janete Limeira', N'ricar@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'RICSU', N'ricsu', N'Michael Holz', N'ricsu@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'ROMEY', N'romey', N'Alejandra Camino', N'romey@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'SANTG', N'santg', N'Jonas Bergulfsen', N'santg@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'SAVEA', N'savea', N'Jose Pavarotti', N'savea@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'SEVES', N'seves', N'Hari Kumar', N'seves@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'SIMOB', N'simob', N'Jytte Petersen', N'simob@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'SPECD', N'specd', N'Dominique Perrier', N'specd@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'SPLIR', N'splir', N'Art Braunschweiger', N'splir@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'staff', N'123', N'Phạm Thị Nở1', N'nopt@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'SUPRD', N'suprd', N'Pascale Cartrain', N'suprd@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'thdch', N'123', N'Tran Tuan Dat', N'dattt8843@gmail.com', N'', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'thdch11', N'2', N'datcute', N'dattt8843@gmail.com', N'', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'thdch11111', N'123', N'Tran Tuan Dat', N'dattt8843@gmail.com', N'fpoly1.jpg', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'THEBI', N'thebi', N'Liz Nixon', N'thebi@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'THECR', N'thecr', N'Liu Wong', N'thecr@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'TOMSP', N'tomsp', N'Karin Josephs', N'tomsp@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'TORTU', N'tortu', N'Miguel Angel Paolino', N'tortu@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'TRADH', N'tradh', N'Anabela Domingues', N'tradh@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'TRAIH', N'traih', N'Helvetius Nagy', N'traih@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'VAFFE', N'vaffe', N'Palle Ibsen', N'vaffe@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'VICTE', N'victe', N'Mary Saveley', N'victe@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'VINET', N'vinet', N'Paul Henriot', N'vinet@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'WANDK', N'wandk', N'Rita Müller', N'wandk@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'WARTH', N'warth', N'Pirkko Koskitalo', N'warth@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'WELLI', N'welli', N'Paula Parente', N'welli@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'WHITC', N'whitc', N'Karl Jablonski', N'whitc@gmail.com', N'user.png', NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'WILMK', N'wilmk', N'Matti Karttunen', N'wilmk@gmail.com', N'user.png', NULL)
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [resetToken]) VALUES (N'WOLZA', N'wolza', N'Zbyszek Piestrzeniewicz', N'wolza@gmail.com', N'user.png', NULL)
SET IDENTITY_INSERT [dbo].[Authorities] ON 

INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (2, N'ALFKI', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (3, N'ANATR', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (4, N'ANTON', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (5, N'AROUT', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (6, N'BERGS', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (7, N'BLAUS', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (8, N'BLONP', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (9, N'BOLID', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (10, N'BONAP', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (11, N'BOTTM', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (12, N'BSBEV', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (13, N'CACTU', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (14, N'CENTC', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (15, N'CHOPS', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (16, N'COMMI', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (17, N'CONSH', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (18, N'DRACD', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (19, N'DUMON', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (20, N'EASTC', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (21, N'ERNSH', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (22, N'FAMIA', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (23, N'FISSA', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (24, N'FOLIG', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (25, N'FOLKO', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (26, N'FRANK', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (27, N'FRANR', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (28, N'FRANS', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (29, N'FURIB', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (30, N'GALED', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (31, N'GODOS', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (32, N'GOURL', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (33, N'GREAL', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (34, N'GROSR', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (35, N'HANAR', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (36, N'HILAA', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (37, N'HUNGC', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (38, N'HUNGO', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (39, N'ISLAT', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (40, N'KOENE', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (41, N'LACOR', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (42, N'LAMAI', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (43, N'LAUGB', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (44, N'LAZYK', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (45, N'LEHMS', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (46, N'LETSS', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (47, N'LILAS', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (48, N'LINOD', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (49, N'LONEP', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (50, N'MAGAA', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (51, N'MAISD', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (52, N'MEREP', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (53, N'MORGK', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (55, N'NORTS', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (56, N'OCEAN', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (57, N'OLDWO', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (58, N'OTTIK', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (59, N'PARIS', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (60, N'PERIC', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (61, N'PICCO', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (62, N'PRINI', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (63, N'QUEDE', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (64, N'QUEEN', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (65, N'QUICK', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (66, N'RANCH', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (67, N'RATTC', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (68, N'REGGC', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (69, N'RICAR', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (70, N'RICSU', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (71, N'ROMEY', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (72, N'SANTG', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (74, N'SAVEA', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (75, N'SEVES', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (76, N'SIMOB', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (77, N'SPECD', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (78, N'SPLIR', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (79, N'SUPRD', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (80, N'customer', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (82, N'THEBI', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (83, N'THECR', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (84, N'TOMSP', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (85, N'TORTU', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (86, N'TRADH', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (87, N'TRAIH', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (89, N'VAFFE', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (90, N'VICTE', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (91, N'VINET', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (92, N'WANDK', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (93, N'WARTH', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (94, N'WELLI', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (95, N'WHITC', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (96, N'WILMK', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (97, N'WOLZA', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (98, N'director', N'DIRE')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (100, N'staff', N'STAF')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (2103, N'director', N'STAF')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (7103, N'staff', N'CUST')
SET IDENTITY_INSERT [dbo].[Authorities] OFF
INSERT [dbo].[Categories] ([Id], [Name], [Photo]) VALUES (N'1000', N'Văn Học', N'1.png')
INSERT [dbo].[Categories] ([Id], [Name], [Photo]) VALUES (N'1001', N'Sách kinh tế', N'2.png')
INSERT [dbo].[Categories] ([Id], [Name], [Photo]) VALUES (N'1002', N'Sách tâm lý – Kỹ năng sống', N'3.png')
INSERT [dbo].[Categories] ([Id], [Name], [Photo]) VALUES (N'1003', N'Sách thiếu nhi', N'4.png')
INSERT [dbo].[Categories] ([Id], [Name], [Photo]) VALUES (N'1004', N'Ngôn tình', N'5.png')
INSERT [dbo].[Categories] ([Id], [Name], [Photo]) VALUES (N'1005', N'Tiểu sử hồi ký', N'6.png')
INSERT [dbo].[Categories] ([Id], [Name], [Photo]) VALUES (N'1006', N'Sách Giáo Khoa', N'7.png')
INSERT [dbo].[Categories] ([Id], [Name], [Photo]) VALUES (N'1007', N'Sách nuôi dạy con', N'8.png')
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100005, 10249, 1051, 42.4, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100006, 10250, 1041, 7.7, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100007, 10250, 1051, 42.4, 35)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100008, 10250, 1065, 16.8, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100009, 10251, 1022, 16.8, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100010, 10251, 1057, 15.6, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100011, 10251, 1065, 16.8, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100012, 10252, 1020, 64.8, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100013, 10252, 1033, 2, 25)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100014, 10252, 1060, 27.2, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100015, 10253, 1031, 10, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100016, 10253, 1039, 14.4, 42)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100017, 10253, 1049, 16, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100018, 10254, 1024, 3.6, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100019, 10254, 1055, 19.2, 21)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100020, 10254, 1074, 8, 21)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100021, 10255, 1002, 15.2, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100022, 10255, 1016, 13.9, 35)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100023, 10255, 1036, 15.2, 25)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100024, 10255, 1059, 44, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100025, 10256, 1053, 26.2, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100026, 10256, 1077, 10.4, 12)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100027, 10257, 1027, 35.1, 25)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100028, 10257, 1039, 14.4, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100029, 10257, 1077, 10.4, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100030, 10258, 1002, 15.2, 50)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100032, 10258, 1032, 25.6, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100033, 10259, 1021, 8, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100034, 10259, 1037, 20.8, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100035, 10260, 1041, 7.7, 16)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100036, 10260, 1057, 15.6, 50)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100037, 10260, 1062, 39.4, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100038, 10260, 1070, 12, 21)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100039, 10261, 1021, 8, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100040, 10261, 1035, 14.4, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100042, 10262, 1007, 24, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100043, 10262, 1056, 30.4, 2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100044, 10263, 1016, 13.9, 60)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100045, 10263, 1024, 3.6, 28)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100046, 10263, 1030, 20.7, 60)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100047, 10263, 1074, 8, 36)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100048, 10264, 1002, 15.2, 35)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100049, 10264, 1041, 7.7, 25)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100050, 10265, 1017, 31.2, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100051, 10265, 1070, 12, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100052, 10266, 1012, 30.4, 12)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100053, 10267, 1040, 14.7, 50)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100054, 10267, 1059, 44, 70)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100055, 10267, 1076, 14.4, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100056, 10268, 1029, 99, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100058, 10269, 1033, 2, 60)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100060, 10270, 1036, 15.2, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100061, 10270, 1043, 36.8, 25)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100062, 10271, 1033, 2, 24)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100063, 10272, 1020, 64.8, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100064, 10272, 1031, 10, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100066, 10273, 1010, 24.8, 24)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100067, 10273, 1031, 10, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100068, 10273, 1033, 2, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100069, 10273, 1040, 14.7, 60)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100070, 10273, 1076, 14.4, 33)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100071, 10274, 1071, 17.2, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100073, 10275, 1024, 3.6, 12)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100074, 10275, 1059, 44, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100075, 10276, 1010, 24.8, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100076, 10276, 1013, 4.8, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100077, 10277, 1028, 36.4, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100078, 10277, 1062, 39.4, 12)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100079, 10278, 1044, 15.5, 16)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100080, 10278, 1059, 44, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100081, 10278, 1063, 35.1, 8)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100082, 10278, 1073, 12, 25)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100083, 10279, 1017, 31.2, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100084, 10280, 1024, 3.6, 12)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100085, 10280, 1055, 19.2, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100086, 10280, 1075, 6.2, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100087, 10281, 1019, 7.3, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100088, 10281, 1024, 3.6, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100089, 10281, 1035, 14.4, 4)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100090, 10282, 1030, 20.7, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100091, 10282, 1057, 15.6, 2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100092, 10283, 1015, 12.4, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100093, 10283, 1019, 7.3, 18)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100094, 10283, 1060, 27.2, 35)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100096, 10284, 1027, 35.1, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100097, 10284, 1044, 15.5, 21)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100098, 10284, 1060, 27.2, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100099, 10284, 1067, 11.2, 5)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100100, 10285, 1001, 14.4, 45)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100101, 10285, 1040, 14.7, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100102, 10285, 1053, 26.2, 36)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100103, 10286, 1035, 14.4, 100)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100104, 10286, 1062, 39.4, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100105, 10287, 1016, 13.9, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100106, 10287, 1034, 11.2, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100107, 10287, 1046, 9.6, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100108, 10288, 1054, 5.9, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100109, 10288, 1068, 10, 3)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100110, 10289, 1003, 8, 30)
GO
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100111, 10289, 1064, 26.6, 9)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100113, 10290, 1029, 99, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100114, 10290, 1049, 16, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100115, 10290, 1077, 10.4, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100116, 10291, 1013, 4.8, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100117, 10291, 1044, 15.5, 24)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100118, 10291, 1051, 42.4, 2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100119, 10292, 1020, 64.8, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100120, 10293, 1018, 50, 12)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100121, 10293, 1024, 3.6, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100122, 10293, 1063, 35.1, 5)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100123, 10293, 1075, 6.2, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100124, 10294, 1001, 14.4, 18)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100125, 10294, 1017, 31.2, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100126, 10294, 1043, 36.8, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100127, 10294, 1060, 27.2, 21)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100128, 10294, 1075, 6.2, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100129, 10295, 1056, 30.4, 4)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100131, 10296, 1016, 13.9, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100132, 10296, 1069, 28.8, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100133, 10297, 1039, 14.4, 60)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100135, 10298, 1002, 15.2, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100136, 10298, 1036, 15.2, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100137, 10298, 1059, 44, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100138, 10298, 1062, 39.4, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100139, 10299, 1019, 7.3, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100140, 10299, 1070, 12, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100141, 10300, 1066, 13.6, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100142, 10300, 1068, 10, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100143, 10301, 1040, 14.7, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100144, 10301, 1056, 30.4, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100145, 10302, 1017, 31.2, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100146, 10302, 1028, 36.4, 28)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100147, 10302, 1043, 36.8, 12)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100148, 10303, 1040, 14.7, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100149, 10303, 1065, 16.8, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100150, 10303, 1068, 10, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100151, 10304, 1049, 16, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100152, 10304, 1059, 44, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100153, 10304, 1071, 17.2, 2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100154, 10305, 1018, 50, 25)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100155, 10305, 1029, 99, 25)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100156, 10305, 1039, 14.4, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100157, 10306, 1030, 20.7, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100158, 10306, 1053, 26.2, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100159, 10306, 1054, 5.9, 5)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100160, 10307, 1062, 39.4, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100161, 10307, 1068, 10, 3)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100162, 10308, 1069, 28.8, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100163, 10308, 1070, 12, 5)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100164, 10309, 1004, 17.6, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100165, 10309, 1006, 20, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100167, 10309, 1043, 36.8, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100168, 10309, 1071, 17.2, 3)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100169, 10310, 1016, 13.9, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100170, 10310, 1062, 39.4, 5)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100172, 10311, 1069, 28.8, 7)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100173, 10312, 1028, 36.4, 4)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100174, 10312, 1043, 36.8, 24)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100175, 10312, 1053, 26.2, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100176, 10312, 1075, 6.2, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100177, 10313, 1036, 15.2, 12)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100178, 10314, 1032, 25.6, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100179, 10314, 1058, 10.6, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100180, 10314, 1062, 39.4, 25)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100181, 10315, 1034, 11.2, 14)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100182, 10315, 1070, 12, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100183, 10316, 1041, 7.7, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100184, 10316, 1062, 39.4, 70)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100185, 10317, 1001, 14.4, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100186, 10318, 1041, 7.7, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100187, 10318, 1076, 14.4, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100188, 10319, 1017, 31.2, 8)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100189, 10319, 1028, 36.4, 14)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100190, 10319, 1076, 14.4, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100191, 10320, 1071, 17.2, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100192, 10321, 1035, 14.4, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100193, 10322, 1052, 5.6, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100194, 10323, 1015, 12.4, 5)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100195, 10323, 1025, 11.2, 4)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100196, 10323, 1039, 14.4, 4)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100197, 10324, 1016, 13.9, 21)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100198, 10324, 1035, 14.4, 70)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100199, 10324, 1046, 9.6, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100200, 10324, 1059, 44, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100201, 10324, 1063, 35.1, 80)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100202, 10325, 1006, 20, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100203, 10325, 1013, 4.8, 12)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100204, 10325, 1014, 18.6, 9)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100205, 10325, 1031, 10, 4)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100207, 10326, 1004, 17.6, 24)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100208, 10326, 1057, 15.6, 16)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100209, 10326, 1075, 6.2, 50)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100210, 10327, 1002, 15.2, 25)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100212, 10327, 1030, 20.7, 35)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100213, 10327, 1058, 10.6, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100214, 10328, 1059, 44, 9)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100215, 10328, 1065, 16.8, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100216, 10328, 1068, 10, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100217, 10329, 1019, 7.3, 10)
GO
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100218, 10329, 1030, 20.7, 8)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100219, 10329, 1038, 210.8, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100220, 10329, 1056, 30.4, 12)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100221, 10330, 1026, 24.9, 50)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100223, 10331, 1054, 5.9, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100224, 10332, 1018, 50, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100226, 10332, 1047, 7.6, 16)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100227, 10333, 1014, 18.6, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100228, 10333, 1021, 8, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100229, 10333, 1071, 17.2, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100230, 10334, 1052, 5.6, 8)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100231, 10334, 1068, 10, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100232, 10335, 1002, 15.2, 7)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100233, 10335, 1031, 10, 25)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100234, 10335, 1032, 25.6, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100235, 10335, 1051, 42.4, 48)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100236, 10336, 1004, 17.6, 18)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100237, 10337, 1023, 7.2, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100238, 10337, 1026, 24.9, 24)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100239, 10337, 1036, 15.2, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100240, 10337, 1037, 20.8, 28)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100242, 10338, 1017, 31.2, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100243, 10338, 1030, 20.7, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100244, 10339, 1004, 17.6, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100245, 10339, 1017, 31.2, 70)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100246, 10339, 1062, 39.4, 28)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100247, 10340, 1018, 50, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100248, 10340, 1041, 7.7, 12)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100249, 10340, 1043, 36.8, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100250, 10341, 1033, 2, 8)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100251, 10341, 1059, 44, 9)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100252, 10342, 1002, 15.2, 24)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100253, 10342, 1031, 10, 56)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100254, 10342, 1036, 15.2, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100255, 10342, 1055, 19.2, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100256, 10343, 1064, 26.6, 50)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100257, 10343, 1068, 10, 4)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100258, 10343, 1076, 14.4, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100259, 10344, 1004, 17.6, 35)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100260, 10344, 1008, 32, 70)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100261, 10345, 1008, 32, 70)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100262, 10345, 1019, 7.3, 80)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100264, 10346, 1017, 31.2, 36)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100265, 10346, 1056, 30.4, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100266, 10347, 1025, 11.2, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100267, 10347, 1039, 14.4, 50)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100268, 10347, 1040, 14.7, 4)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100269, 10347, 1075, 6.2, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100270, 10348, 1001, 14.4, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100271, 10348, 1023, 7.2, 25)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100272, 10349, 1054, 5.9, 24)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100273, 10350, 1050, 13, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100274, 10350, 1069, 28.8, 18)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100275, 10351, 1038, 210.8, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100276, 10351, 1041, 7.7, 13)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100277, 10351, 1044, 15.5, 77)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100278, 10351, 1065, 16.8, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100279, 10352, 1024, 3.6, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100280, 10352, 1054, 5.9, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100282, 10353, 1038, 210.8, 50)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100283, 10354, 1001, 14.4, 12)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100284, 10354, 1029, 99, 4)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100285, 10355, 1024, 3.6, 25)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100286, 10355, 1057, 15.6, 25)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100287, 10356, 1031, 10, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100288, 10356, 1055, 19.2, 12)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100289, 10356, 1069, 28.8, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100290, 10357, 1010, 24.8, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100291, 10357, 1026, 24.9, 16)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100292, 10357, 1060, 27.2, 8)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100293, 10358, 1024, 3.6, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100294, 10358, 1034, 11.2, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100295, 10358, 1036, 15.2, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100296, 10359, 1016, 13.9, 56)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100297, 10359, 1031, 10, 70)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100298, 10359, 1060, 27.2, 80)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100299, 10360, 1028, 36.4, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100300, 10360, 1029, 99, 35)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100301, 10360, 1038, 210.8, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100302, 10360, 1049, 16, 35)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100303, 10360, 1054, 5.9, 28)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100304, 10361, 1039, 14.4, 54)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100305, 10361, 1060, 27.2, 55)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100306, 10362, 1025, 11.2, 50)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100307, 10362, 1051, 42.4, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100308, 10362, 1054, 5.9, 24)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100309, 10363, 1031, 10, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100310, 10363, 1075, 6.2, 12)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100311, 10363, 1076, 14.4, 12)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100312, 10364, 1069, 28.8, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100313, 10364, 1071, 17.2, 5)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100315, 10366, 1065, 16.8, 5)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100316, 10366, 1077, 10.4, 5)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100317, 10367, 1034, 11.2, 36)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100318, 10367, 1054, 5.9, 18)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100319, 10367, 1065, 16.8, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100320, 10367, 1077, 10.4, 7)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100321, 10368, 1021, 8, 5)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100322, 10368, 1028, 36.4, 13)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100323, 10368, 1057, 15.6, 25)
GO
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100324, 10368, 1064, 26.6, 35)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100325, 10369, 1029, 99, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100326, 10369, 1056, 30.4, 18)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100327, 10370, 1001, 14.4, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100328, 10370, 1064, 26.6, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100329, 10370, 1074, 8, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100330, 10371, 1036, 15.2, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100331, 10372, 1020, 64.8, 12)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100332, 10372, 1038, 210.8, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100333, 10372, 1060, 27.2, 70)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100335, 10373, 1058, 10.6, 80)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100336, 10373, 1071, 17.2, 50)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100337, 10374, 1031, 10, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100338, 10374, 1058, 10.6, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100339, 10375, 1014, 18.6, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100340, 10375, 1054, 5.9, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100341, 10376, 1031, 10, 42)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100342, 10377, 1028, 36.4, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100343, 10377, 1039, 14.4, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100344, 10378, 1071, 17.2, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100345, 10379, 1041, 7.7, 8)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100346, 10379, 1063, 35.1, 16)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100347, 10379, 1065, 16.8, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100348, 10380, 1030, 20.7, 18)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100349, 10380, 1053, 26.2, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100350, 10380, 1060, 27.2, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100351, 10380, 1070, 12, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100352, 10381, 1074, 8, 14)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100354, 10382, 1018, 50, 9)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100355, 10382, 1029, 99, 14)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100356, 10382, 1033, 2, 60)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100357, 10382, 1074, 8, 50)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100358, 10383, 1013, 4.8, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100359, 10383, 1050, 13, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100360, 10383, 1056, 30.4, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100361, 10384, 1020, 64.8, 28)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100362, 10384, 1060, 27.2, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100363, 10385, 1007, 24, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100364, 10385, 1060, 27.2, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100365, 10385, 1068, 10, 8)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100366, 10386, 1024, 3.6, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100367, 10386, 1034, 11.2, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100368, 10387, 1024, 3.6, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100369, 10387, 1028, 36.4, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100370, 10387, 1059, 44, 12)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100371, 10387, 1071, 17.2, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100372, 10388, 1045, 7.6, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100373, 10388, 1052, 5.6, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100374, 10388, 1053, 26.2, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100375, 10389, 1010, 24.8, 16)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100376, 10389, 1055, 19.2, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100377, 10389, 1062, 39.4, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100378, 10389, 1070, 12, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100379, 10390, 1031, 10, 60)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100380, 10390, 1035, 14.4, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100381, 10390, 1046, 9.6, 45)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100383, 10391, 1013, 4.8, 18)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100384, 10392, 1069, 28.8, 50)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100385, 10393, 1002, 15.2, 25)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100386, 10393, 1014, 18.6, 42)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100387, 10393, 1025, 11.2, 7)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100388, 10393, 1026, 24.9, 70)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100389, 10393, 1031, 10, 32)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100390, 10394, 1013, 4.8, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100391, 10394, 1062, 39.4, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100392, 10395, 1046, 9.6, 28)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100393, 10395, 1053, 26.2, 70)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100394, 10395, 1069, 28.8, 8)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100395, 10396, 1023, 7.2, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100396, 10396, 1071, 17.2, 60)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100398, 10397, 1021, 8, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100399, 10397, 1051, 42.4, 18)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100400, 10398, 1035, 14.4, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100401, 10398, 1055, 19.2, 120)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100402, 10399, 1068, 10, 60)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100403, 10399, 1071, 17.2, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100404, 10399, 1076, 14.4, 35)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100405, 10399, 1077, 10.4, 14)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100406, 10400, 1029, 99, 21)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100407, 10400, 1035, 14.4, 35)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100408, 10400, 1049, 16, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100409, 10401, 1030, 20.7, 18)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100410, 10401, 1056, 30.4, 70)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100411, 10401, 1065, 16.8, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100412, 10401, 1071, 17.2, 60)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100413, 10402, 1023, 7.2, 60)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100414, 10402, 1063, 35.1, 65)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100415, 10403, 1016, 13.9, 21)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100416, 10403, 1048, 10.2, 70)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100417, 10404, 1026, 24.9, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100419, 10404, 1049, 16, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100420, 10405, 1003, 8, 50)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100421, 10406, 1001, 14.4, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100422, 10406, 1021, 8, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100423, 10406, 1028, 36.4, 42)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100424, 10406, 1036, 15.2, 5)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100425, 10406, 1040, 14.7, 2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100427, 10407, 1069, 28.8, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100428, 10407, 1071, 17.2, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100429, 10408, 1037, 20.8, 10)
GO
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100430, 10408, 1054, 5.9, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100431, 10408, 1062, 39.4, 35)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100432, 10409, 1014, 18.6, 12)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100433, 10409, 1021, 8, 12)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100434, 10410, 1033, 2, 49)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100435, 10410, 1059, 44, 16)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100436, 10411, 1041, 7.7, 25)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100437, 10411, 1044, 15.5, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100438, 10411, 1059, 44, 9)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100439, 10412, 1014, 18.6, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100440, 10413, 1001, 14.4, 24)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100441, 10413, 1062, 39.4, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100442, 10413, 1076, 14.4, 14)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100443, 10414, 1019, 7.3, 18)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100444, 10414, 1033, 2, 50)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100445, 10415, 1017, 31.2, 2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100446, 10415, 1033, 2, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100447, 10416, 1019, 7.3, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100448, 10416, 1053, 26.2, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100449, 10416, 1057, 15.6, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100450, 10417, 1038, 210.8, 50)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100451, 10417, 1046, 9.6, 2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100452, 10417, 1068, 10, 36)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100453, 10417, 1077, 10.4, 35)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100454, 10418, 1002, 15.2, 60)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100455, 10418, 1047, 7.6, 55)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100456, 10418, 1061, 22.8, 16)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100457, 10418, 1074, 8, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100458, 10419, 1060, 27.2, 60)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100459, 10419, 1069, 28.8, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100460, 10420, 1009, 150, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100461, 10420, 1013, 4.8, 2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100462, 10420, 1070, 12, 8)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100463, 10420, 1073, 12, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100464, 10421, 1019, 7.3, 4)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100465, 10421, 1026, 24.9, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100466, 10421, 1053, 26.2, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100467, 10421, 1077, 10.4, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100468, 10422, 1026, 24.9, 2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100469, 10423, 1031, 10, 14)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100470, 10423, 1059, 44, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100471, 10424, 1035, 14.4, 60)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100472, 10424, 1038, 210.8, 49)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100473, 10424, 1068, 10, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100474, 10425, 1055, 19.2, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100475, 10425, 1076, 14.4, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100476, 10426, 1056, 30.4, 5)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100477, 10426, 1064, 26.6, 7)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100478, 10427, 1014, 18.6, 35)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100479, 10428, 1046, 9.6, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100480, 10429, 1050, 13, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100481, 10429, 1063, 35.1, 35)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100482, 10430, 1017, 31.2, 45)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100483, 10430, 1021, 8, 50)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100484, 10430, 1056, 30.4, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100485, 10430, 1059, 44, 70)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100486, 10431, 1017, 31.2, 50)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100487, 10431, 1040, 14.7, 50)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100488, 10431, 1047, 7.6, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100489, 10432, 1026, 24.9, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100490, 10432, 1054, 5.9, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100491, 10433, 1056, 30.4, 28)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100493, 10434, 1076, 14.4, 18)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100494, 10435, 1002, 15.2, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100495, 10435, 1022, 16.8, 12)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100497, 10436, 1046, 9.6, 5)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100498, 10436, 1056, 30.4, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100499, 10436, 1064, 26.6, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100500, 10436, 1075, 6.2, 24)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100501, 10437, 1053, 26.2, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100502, 10438, 1019, 7.3, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100503, 10438, 1034, 11.2, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100504, 10438, 1057, 15.6, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100505, 10439, 1012, 30.4, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100506, 10439, 1016, 13.9, 16)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100507, 10439, 1064, 26.6, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100508, 10439, 1074, 8, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100509, 10440, 1002, 15.2, 45)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100510, 10440, 1016, 13.9, 49)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100511, 10440, 1029, 99, 24)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100512, 10440, 1061, 22.8, 90)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100513, 10441, 1027, 35.1, 50)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100515, 10442, 1054, 5.9, 80)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100516, 10442, 1066, 13.6, 60)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100518, 10443, 1028, 36.4, 12)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100519, 10444, 1017, 31.2, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100520, 10444, 1026, 24.9, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100521, 10444, 1035, 14.4, 8)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100522, 10444, 1041, 7.7, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100523, 10445, 1039, 14.4, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100524, 10445, 1054, 5.9, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100525, 10446, 1019, 7.3, 12)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100526, 10446, 1024, 3.6, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100527, 10446, 1031, 10, 3)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100528, 10446, 1052, 5.6, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100529, 10447, 1019, 7.3, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100530, 10447, 1065, 16.8, 35)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100531, 10447, 1071, 17.2, 2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100532, 10448, 1026, 24.9, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100533, 10448, 1040, 14.7, 20)
GO
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100534, 10449, 1010, 24.8, 14)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100535, 10449, 1052, 5.6, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100536, 10449, 1062, 39.4, 35)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100537, 10450, 1010, 24.8, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100538, 10450, 1054, 5.9, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100539, 10451, 1055, 19.2, 120)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100540, 10451, 1064, 26.6, 35)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100541, 10451, 1065, 16.8, 28)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100542, 10451, 1077, 10.4, 55)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100543, 10452, 1028, 36.4, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100544, 10452, 1044, 15.5, 100)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100545, 10453, 1048, 10.2, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100546, 10453, 1070, 12, 25)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100547, 10454, 1016, 13.9, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100548, 10454, 1033, 2, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100549, 10454, 1046, 9.6, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100550, 10455, 1039, 14.4, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100551, 10455, 1053, 26.2, 50)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100552, 10455, 1061, 22.8, 25)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100553, 10455, 1071, 17.2, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100554, 10456, 1021, 8, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100555, 10456, 1049, 16, 21)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100556, 10457, 1059, 44, 36)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100557, 10458, 1026, 24.9, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100558, 10458, 1028, 36.4, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100559, 10458, 1043, 36.8, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100560, 10458, 1056, 30.4, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100561, 10458, 1071, 17.2, 50)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100562, 10459, 1007, 24, 16)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100563, 10459, 1046, 9.6, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100565, 10460, 1068, 10, 21)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100566, 10460, 1075, 6.2, 4)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100567, 10461, 1021, 8, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100568, 10461, 1030, 20.7, 28)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100569, 10461, 1055, 19.2, 60)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100570, 10462, 1013, 4.8, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100571, 10462, 1023, 7.2, 21)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100572, 10463, 1019, 7.3, 21)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100574, 10464, 1004, 17.6, 16)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100575, 10464, 1043, 36.8, 3)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100576, 10464, 1056, 30.4, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100577, 10464, 1060, 27.2, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100578, 10465, 1024, 3.6, 25)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100579, 10465, 1029, 99, 18)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100580, 10465, 1040, 14.7, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100581, 10465, 1045, 7.6, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100582, 10465, 1050, 13, 25)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100584, 10466, 1046, 9.6, 5)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100585, 10467, 1024, 3.6, 28)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100586, 10467, 1025, 11.2, 12)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100587, 10468, 1030, 20.7, 8)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100588, 10468, 1043, 36.8, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100589, 10469, 1002, 15.2, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100590, 10469, 1016, 13.9, 35)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100591, 10469, 1044, 15.5, 2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100592, 10470, 1018, 50, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100593, 10470, 1023, 7.2, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100594, 10470, 1064, 26.6, 8)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100595, 10471, 1007, 24, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100596, 10471, 1056, 30.4, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100597, 10472, 1024, 3.6, 80)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100598, 10472, 1051, 42.4, 18)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100599, 10473, 1033, 2, 12)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100600, 10473, 1071, 17.2, 12)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100601, 10474, 1014, 18.6, 12)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100602, 10474, 1028, 36.4, 18)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100603, 10474, 1040, 14.7, 21)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100604, 10474, 1075, 6.2, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100605, 10475, 1031, 10, 35)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100606, 10475, 1066, 13.6, 60)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100607, 10475, 1076, 14.4, 42)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100608, 10476, 1055, 19.2, 2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100609, 10476, 1070, 12, 12)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100610, 10477, 1001, 14.4, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100611, 10477, 1021, 8, 21)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100612, 10477, 1039, 14.4, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100613, 10478, 1010, 24.8, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100614, 10479, 1038, 210.8, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100615, 10479, 1053, 26.2, 28)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100616, 10479, 1059, 44, 60)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100617, 10479, 1064, 26.6, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100618, 10480, 1047, 7.6, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100619, 10480, 1059, 44, 12)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100620, 10481, 1049, 16, 24)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100621, 10481, 1060, 27.2, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100622, 10482, 1040, 14.7, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100623, 10483, 1034, 11.2, 35)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100624, 10483, 1077, 10.4, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100625, 10484, 1021, 8, 14)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100626, 10484, 1040, 14.7, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100627, 10484, 1051, 42.4, 3)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100628, 10485, 1002, 15.2, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100629, 10485, 1003, 8, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100630, 10485, 1055, 19.2, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100631, 10485, 1070, 12, 60)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100633, 10486, 1051, 42.4, 25)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100634, 10486, 1074, 8, 16)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100635, 10487, 1019, 7.3, 5)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100636, 10487, 1026, 24.9, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100637, 10487, 1054, 5.9, 24)
GO
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100638, 10488, 1059, 44, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100639, 10488, 1073, 12, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100641, 10489, 1016, 13.9, 18)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100642, 10490, 1059, 44, 60)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100643, 10490, 1068, 10, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100644, 10490, 1075, 6.2, 36)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100645, 10491, 1044, 15.5, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100646, 10491, 1077, 10.4, 7)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100647, 10492, 1025, 11.2, 60)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100649, 10493, 1065, 16.8, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100650, 10493, 1066, 13.6, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100651, 10493, 1069, 28.8, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100652, 10494, 1056, 30.4, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100653, 10495, 1023, 7.2, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100654, 10495, 1041, 7.7, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100655, 10495, 1077, 10.4, 5)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100656, 10496, 1031, 10, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100657, 10497, 1056, 30.4, 14)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100659, 10497, 1077, 10.4, 25)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100660, 10498, 1024, 4.5, 14)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100661, 10498, 1040, 18.4, 5)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100663, 10499, 1028, 45.6, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100664, 10499, 1049, 20, 25)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100665, 10500, 1015, 15.5, 12)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100666, 10500, 1028, 45.6, 8)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100667, 10501, 1054, 7.45, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100668, 10502, 1045, 9.5, 21)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100669, 10502, 1053, 32.8, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100670, 10502, 1067, 14, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100671, 10503, 1014, 23.25, 70)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100672, 10503, 1065, 21.05, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100673, 10504, 1002, 19, 12)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100674, 10504, 1021, 10, 12)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100675, 10504, 1053, 32.8, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100676, 10504, 1061, 28.5, 25)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100677, 10505, 1062, 49.3, 3)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100678, 10506, 1025, 14, 18)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100679, 10506, 1070, 15, 14)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100680, 10507, 1043, 46, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100681, 10507, 1048, 12.75, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100682, 10508, 1013, 6, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100683, 10508, 1039, 18, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100684, 10509, 1028, 45.6, 3)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100685, 10510, 1029, 123.79, 36)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100686, 10510, 1075, 7.75, 36)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100687, 10511, 1004, 22, 50)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100688, 10511, 1007, 30, 50)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100689, 10511, 1008, 40, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100690, 10512, 1024, 4.5, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100691, 10512, 1046, 12, 9)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100692, 10512, 1047, 9.5, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100693, 10512, 1060, 34, 12)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100694, 10513, 1021, 10, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100695, 10513, 1032, 32, 50)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100696, 10513, 1061, 28.5, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100697, 10514, 1020, 81, 39)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100698, 10514, 1028, 45.6, 35)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100699, 10514, 1056, 38, 70)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100700, 10514, 1065, 21.05, 39)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100701, 10514, 1075, 7.75, 50)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100702, 10515, 1009, 150, 16)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100703, 10515, 1016, 17.45, 50)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100704, 10515, 1027, 43.9, 120)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100705, 10515, 1033, 2.5, 16)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100706, 10515, 1060, 34, 84)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100707, 10516, 1018, 62.5, 25)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100708, 10516, 1041, 9.65, 80)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100710, 10517, 1052, 7, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100711, 10517, 1059, 55, 4)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100712, 10517, 1070, 15, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100713, 10518, 1024, 4.5, 5)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100714, 10518, 1038, 263.5, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100715, 10518, 1044, 19.45, 9)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100716, 10519, 1010, 31, 16)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100717, 10519, 1056, 38, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100718, 10519, 1060, 34, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100719, 10520, 1024, 4.5, 8)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100720, 10520, 1053, 32.8, 5)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100721, 10521, 1035, 18, 3)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100722, 10521, 1041, 9.65, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100723, 10521, 1068, 12.5, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100724, 10522, 1001, 18, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100725, 10522, 1008, 40, 24)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100726, 10522, 1030, 25.89, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100727, 10522, 1040, 18.4, 25)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100728, 10523, 1017, 39, 25)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100729, 10523, 1020, 81, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100730, 10523, 1037, 26, 18)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100731, 10523, 1041, 9.65, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100732, 10524, 1010, 31, 2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100733, 10524, 1030, 25.89, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100734, 10524, 1043, 46, 60)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100735, 10524, 1054, 7.45, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100736, 10525, 1036, 19, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100737, 10525, 1040, 18.4, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100738, 10526, 1001, 18, 8)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100739, 10526, 1013, 6, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100740, 10526, 1056, 38, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100741, 10527, 1004, 22, 50)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100742, 10527, 1036, 19, 30)
GO
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100744, 10528, 1033, 2.5, 8)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100746, 10529, 1055, 24, 14)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100747, 10529, 1068, 12.5, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100748, 10529, 1069, 36, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100749, 10530, 1017, 39, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100750, 10530, 1043, 46, 25)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100751, 10530, 1061, 28.5, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100752, 10530, 1076, 18, 50)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100753, 10531, 1059, 55, 2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100754, 10532, 1030, 25.89, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100755, 10532, 1066, 17, 24)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100756, 10533, 1004, 22, 50)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100758, 10533, 1073, 15, 24)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100759, 10534, 1030, 25.89, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100760, 10534, 1040, 18.4, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100761, 10534, 1054, 7.45, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100763, 10535, 1040, 18.4, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100764, 10535, 1057, 19.5, 5)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100765, 10535, 1059, 55, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100766, 10536, 1012, 38, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100767, 10536, 1031, 12.5, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100768, 10536, 1033, 2.5, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100769, 10536, 1060, 34, 35)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100770, 10537, 1031, 12.5, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100771, 10537, 1051, 53, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100772, 10537, 1058, 13.25, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100774, 10537, 1073, 15, 9)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100775, 10538, 1070, 15, 7)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100777, 10539, 1013, 6, 8)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100778, 10539, 1021, 10, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100779, 10539, 1033, 2.5, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100780, 10539, 1049, 20, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100781, 10540, 1003, 10, 60)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100782, 10540, 1026, 31.23, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100783, 10540, 1038, 263.5, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100784, 10540, 1068, 12.5, 35)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100785, 10541, 1024, 4.5, 35)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100786, 10541, 1038, 263.5, 4)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100787, 10541, 1065, 21.05, 36)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100788, 10541, 1071, 21.5, 9)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100790, 10542, 1054, 7.45, 24)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100791, 10543, 1012, 38, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100792, 10543, 1023, 9, 70)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100793, 10544, 1028, 45.6, 7)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100794, 10544, 1067, 14, 7)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100796, 10546, 1007, 30, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100797, 10546, 1035, 18, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100798, 10546, 1062, 49.3, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100799, 10547, 1032, 32, 24)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100800, 10547, 1036, 19, 60)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100801, 10548, 1034, 14, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100802, 10548, 1041, 9.65, 14)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100803, 10549, 1031, 12.5, 55)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100804, 10549, 1045, 9.5, 100)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100805, 10549, 1051, 53, 48)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100806, 10550, 1017, 39, 8)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100807, 10550, 1019, 9.2, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100808, 10550, 1021, 10, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100809, 10550, 1061, 28.5, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100810, 10551, 1016, 17.45, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100811, 10551, 1035, 18, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100812, 10551, 1044, 19.45, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100813, 10552, 1069, 36, 18)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100814, 10552, 1075, 7.75, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100816, 10553, 1016, 17.45, 14)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100817, 10553, 1022, 21, 24)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100818, 10553, 1031, 12.5, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100819, 10553, 1035, 18, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100820, 10554, 1016, 17.45, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100821, 10554, 1023, 9, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100822, 10554, 1062, 49.3, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100823, 10554, 1077, 13, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100824, 10555, 1014, 23.25, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100825, 10555, 1019, 9.2, 35)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100826, 10555, 1024, 4.5, 18)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100827, 10555, 1051, 53, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100828, 10555, 1056, 38, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100830, 10557, 1064, 33.25, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100831, 10557, 1075, 7.75, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100832, 10558, 1047, 9.5, 25)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100833, 10558, 1051, 53, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100834, 10558, 1052, 7, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100835, 10558, 1053, 32.8, 18)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100836, 10558, 1073, 15, 3)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100837, 10559, 1041, 9.65, 12)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100838, 10559, 1055, 24, 18)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100839, 10560, 1030, 25.89, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100840, 10560, 1062, 49.3, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100841, 10561, 1044, 19.45, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100842, 10561, 1051, 53, 50)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100843, 10562, 1033, 2.5, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100844, 10562, 1062, 49.3, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100845, 10563, 1036, 19, 25)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100846, 10563, 1052, 7, 70)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100847, 10564, 1017, 39, 16)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100848, 10564, 1031, 12.5, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100849, 10564, 1055, 24, 25)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100850, 10565, 1024, 4.5, 25)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100851, 10565, 1064, 33.25, 18)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100853, 10566, 1018, 62.5, 18)
GO
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100854, 10566, 1076, 18, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100855, 10567, 1031, 12.5, 60)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100856, 10567, 1051, 53, 3)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100857, 10567, 1059, 55, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100858, 10568, 1010, 31, 5)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100859, 10569, 1031, 12.5, 35)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100860, 10569, 1076, 18, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100862, 10570, 1056, 38, 60)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100863, 10571, 1014, 23.25, 11)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100865, 10572, 1016, 17.45, 12)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100866, 10572, 1032, 32, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100867, 10572, 1040, 18.4, 50)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100868, 10572, 1075, 7.75, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100869, 10573, 1017, 39, 18)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100870, 10573, 1034, 14, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100871, 10573, 1053, 32.8, 25)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100872, 10574, 1033, 2.5, 14)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100873, 10574, 1040, 18.4, 2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100874, 10574, 1062, 49.3, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100875, 10574, 1064, 33.25, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100876, 10575, 1059, 55, 12)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100877, 10575, 1063, 43.9, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100879, 10575, 1076, 18, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100880, 10576, 1001, 18, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100881, 10576, 1031, 12.5, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100882, 10576, 1044, 19.45, 21)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100883, 10577, 1039, 18, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100884, 10577, 1075, 7.75, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100885, 10577, 1077, 13, 18)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100886, 10578, 1035, 18, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100887, 10578, 1057, 19.5, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100888, 10579, 1015, 15.5, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100889, 10579, 1075, 7.75, 21)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100890, 10580, 1014, 23.25, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100891, 10580, 1041, 9.65, 9)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100892, 10580, 1065, 21.05, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100893, 10581, 1075, 7.75, 50)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100894, 10582, 1057, 19.5, 4)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100895, 10582, 1076, 18, 14)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100896, 10583, 1029, 123.79, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100897, 10583, 1060, 34, 24)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100898, 10583, 1069, 36, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100899, 10584, 1031, 12.5, 50)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100900, 10585, 1047, 9.5, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100901, 10586, 1052, 7, 4)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100902, 10587, 1026, 31.23, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100903, 10587, 1035, 18, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100904, 10587, 1077, 13, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100905, 10588, 1018, 62.5, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100907, 10589, 1035, 18, 4)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100908, 10590, 1001, 18, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100909, 10590, 1077, 13, 60)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100910, 10591, 1003, 10, 14)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100911, 10591, 1007, 30, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100912, 10591, 1054, 7.45, 50)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100913, 10592, 1015, 15.5, 25)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100914, 10592, 1026, 31.23, 5)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100915, 10593, 1020, 81, 21)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100916, 10593, 1069, 36, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100917, 10593, 1076, 18, 4)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100918, 10594, 1052, 7, 24)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100919, 10594, 1058, 13.25, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100920, 10595, 1035, 18, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100921, 10595, 1061, 28.5, 120)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100922, 10595, 1069, 36, 65)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100923, 10596, 1056, 38, 5)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100924, 10596, 1063, 43.9, 24)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100925, 10596, 1075, 7.75, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100926, 10597, 1024, 4.5, 35)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100927, 10597, 1057, 19.5, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100928, 10597, 1065, 21.05, 12)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100929, 10598, 1027, 43.9, 50)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100930, 10598, 1071, 21.5, 9)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100931, 10599, 1062, 49.3, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100932, 10600, 1054, 7.45, 4)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100933, 10600, 1073, 15, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100934, 10601, 1013, 6, 60)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100935, 10601, 1059, 55, 35)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100936, 10602, 1077, 13, 5)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100937, 10603, 1022, 21, 48)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100938, 10603, 1049, 20, 25)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100939, 10604, 1048, 12.75, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100940, 10604, 1076, 18, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100941, 10605, 1016, 17.45, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100942, 10605, 1059, 55, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100943, 10605, 1060, 34, 70)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100944, 10605, 1071, 21.5, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100945, 10606, 1004, 22, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100946, 10606, 1055, 24, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100947, 10606, 1062, 49.3, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100948, 10607, 1007, 30, 45)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100949, 10607, 1017, 39, 100)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100950, 10607, 1033, 2.5, 14)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100951, 10607, 1040, 18.4, 42)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100953, 10608, 1056, 38, 28)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100954, 10609, 1001, 18, 3)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100955, 10609, 1010, 31, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100956, 10609, 1021, 10, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100957, 10610, 1036, 19, 21)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100958, 10611, 1001, 18, 6)
GO
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100959, 10611, 1002, 19, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100960, 10611, 1060, 34, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100961, 10612, 1010, 31, 70)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100962, 10612, 1036, 19, 55)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100963, 10612, 1049, 20, 18)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100964, 10612, 1060, 34, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100965, 10612, 1076, 18, 80)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100966, 10613, 1013, 6, 8)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100967, 10613, 1075, 7.75, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100969, 10614, 1021, 10, 8)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100970, 10614, 1039, 18, 5)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100971, 10615, 1055, 24, 5)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100972, 10616, 1038, 263.5, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100973, 10616, 1056, 38, 14)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100974, 10616, 1070, 15, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100975, 10616, 1071, 21.5, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100976, 10617, 1059, 55, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100977, 10618, 1006, 25, 70)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100978, 10618, 1056, 38, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100979, 10618, 1068, 12.5, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100980, 10619, 1021, 10, 42)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100981, 10619, 1022, 21, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100982, 10620, 1024, 4.5, 5)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100983, 10620, 1052, 7, 5)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100984, 10621, 1019, 9.2, 5)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100985, 10621, 1023, 9, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100986, 10621, 1070, 15, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100987, 10621, 1071, 21.5, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100988, 10622, 1002, 19, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100989, 10622, 1068, 12.5, 18)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100990, 10623, 1014, 23.25, 21)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100991, 10623, 1019, 9.2, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100992, 10623, 1021, 10, 25)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100993, 10623, 1024, 4.5, 3)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100994, 10623, 1035, 18, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100995, 10624, 1028, 45.6, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100996, 10624, 1029, 123.79, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100997, 10624, 1044, 19.45, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100998, 10625, 1014, 23.25, 3)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101000, 10625, 1060, 34, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101001, 10626, 1053, 32.8, 12)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101002, 121215, 1003, 79000, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101003, 121216, 1103, 163000, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101004, 121218, 1005, 89000, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101005, 121221, 1002, 89000, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101006, 121222, 1103, 163000, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101007, 121223, 1088, 142400, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101008, 121223, 1103, 163000, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101009, 121224, 1003, 79000, 2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101010, 121225, 1001, 78000, 2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101011, 121226, 1001, 78000, 3)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101012, 121227, 1001, 78000, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101013, 121228, 1001, 78000, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101014, 121229, 1001, 78000, 5)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101015, 121230, 1016, 70210, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101016, 121230, 1001, 78000, 3)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101017, 121230, 1002, 89000, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101018, 121231, 1004, 99000, 1)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10249, N'TOMSP', CAST(N'1996-07-05T00:00:00.000' AS DateTime), N'Luisenstr. 48')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10250, N'HANAR', CAST(N'1996-07-08T00:00:00.000' AS DateTime), N'Rua do Paço, 67')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10251, N'VICTE', CAST(N'1996-07-08T00:00:00.000' AS DateTime), N'2, rue du Commerce')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10252, N'SUPRD', CAST(N'1996-07-09T00:00:00.000' AS DateTime), N'Boulevard Tirou, 255')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10253, N'HANAR', CAST(N'1996-07-10T00:00:00.000' AS DateTime), N'Rua do Paço, 67')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10254, N'CHOPS', CAST(N'1996-07-11T00:00:00.000' AS DateTime), N'Hauptstr. 31')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10255, N'RICSU', CAST(N'1996-07-12T00:00:00.000' AS DateTime), N'Starenweg 5')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10256, N'WELLI', CAST(N'1996-07-15T00:00:00.000' AS DateTime), N'Rua do Mercado, 12')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10257, N'HILAA', CAST(N'1996-07-16T00:00:00.000' AS DateTime), N'Carrera 22 con Ave. Carlos Soublette #8-35')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10258, N'ERNSH', CAST(N'1996-07-17T00:00:00.000' AS DateTime), N'Kirchgasse 6')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10259, N'CENTC', CAST(N'1996-07-18T00:00:00.000' AS DateTime), N'Sierras de Granada 9993')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10260, N'OTTIK', CAST(N'1996-07-19T00:00:00.000' AS DateTime), N'Mehrheimerstr. 369')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10261, N'QUEDE', CAST(N'1996-07-19T00:00:00.000' AS DateTime), N'Rua da Panificadora, 12')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10262, N'RATTC', CAST(N'1996-07-22T00:00:00.000' AS DateTime), N'2817 Milton Dr.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10263, N'ERNSH', CAST(N'1996-07-23T00:00:00.000' AS DateTime), N'Kirchgasse 6')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10264, N'FOLKO', CAST(N'1996-07-24T00:00:00.000' AS DateTime), N'Åkergatan 24')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10265, N'BLONP', CAST(N'1996-07-25T00:00:00.000' AS DateTime), N'24, place Kléber')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10266, N'WARTH', CAST(N'1996-07-26T00:00:00.000' AS DateTime), N'Torikatu 38')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10267, N'FRANK', CAST(N'1996-07-29T00:00:00.000' AS DateTime), N'Berliner Platz 43')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10268, N'GROSR', CAST(N'1996-07-30T00:00:00.000' AS DateTime), N'5ª Ave. Los Palos Grandes')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10269, N'WHITC', CAST(N'1996-07-31T00:00:00.000' AS DateTime), N'1029 - 12th Ave. S.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10270, N'WARTH', CAST(N'1996-08-01T00:00:00.000' AS DateTime), N'Torikatu 38')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10271, N'SPLIR', CAST(N'1996-08-01T00:00:00.000' AS DateTime), N'P.O. Box 555')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10272, N'RATTC', CAST(N'1996-08-02T00:00:00.000' AS DateTime), N'2817 Milton Dr.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10273, N'QUICK', CAST(N'1996-08-05T00:00:00.000' AS DateTime), N'Taucherstraße 10')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10274, N'VINET', CAST(N'1996-08-06T00:00:00.000' AS DateTime), N'59 rue de l''Abbaye')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10275, N'MAGAA', CAST(N'1996-08-07T00:00:00.000' AS DateTime), N'Via Ludovico il Moro 22')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10276, N'TORTU', CAST(N'1996-08-08T00:00:00.000' AS DateTime), N'Avda. Azteca 123')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10277, N'MORGK', CAST(N'1996-08-09T00:00:00.000' AS DateTime), N'Heerstr. 22')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10278, N'BERGS', CAST(N'1996-08-12T00:00:00.000' AS DateTime), N'Berguvsvägen  8')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10279, N'LEHMS', CAST(N'1996-08-13T00:00:00.000' AS DateTime), N'Magazinweg 7')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10280, N'BERGS', CAST(N'1996-08-14T00:00:00.000' AS DateTime), N'Berguvsvägen  8')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10281, N'ROMEY', CAST(N'1996-08-14T00:00:00.000' AS DateTime), N'Gran Vía, 1')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10282, N'ROMEY', CAST(N'1996-08-15T00:00:00.000' AS DateTime), N'Gran Vía, 1')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10283, N'LILAS', CAST(N'1996-08-16T00:00:00.000' AS DateTime), N'Carrera 52 con Ave. Bolívar #65-98 Llano Largo')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10284, N'LEHMS', CAST(N'1996-08-19T00:00:00.000' AS DateTime), N'Magazinweg 7')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10285, N'QUICK', CAST(N'1996-08-20T00:00:00.000' AS DateTime), N'Taucherstraße 10')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10286, N'QUICK', CAST(N'1996-08-21T00:00:00.000' AS DateTime), N'Taucherstraße 10')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10287, N'RICAR', CAST(N'1996-08-22T00:00:00.000' AS DateTime), N'Av. Copacabana, 267')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10288, N'REGGC', CAST(N'1996-08-23T00:00:00.000' AS DateTime), N'Strada Provinciale 124')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10289, N'BSBEV', CAST(N'1996-08-26T00:00:00.000' AS DateTime), N'Fauntleroy Circus')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10290, N'COMMI', CAST(N'1996-08-27T00:00:00.000' AS DateTime), N'Av. dos Lusíadas, 23')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10291, N'QUEDE', CAST(N'1996-08-27T00:00:00.000' AS DateTime), N'Rua da Panificadora, 12')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10292, N'TRADH', CAST(N'1996-08-28T00:00:00.000' AS DateTime), N'Av. Inês de Castro, 414')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10293, N'TORTU', CAST(N'1996-08-29T00:00:00.000' AS DateTime), N'Avda. Azteca 123')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10294, N'RATTC', CAST(N'1996-08-30T00:00:00.000' AS DateTime), N'2817 Milton Dr.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10295, N'VINET', CAST(N'1996-09-02T00:00:00.000' AS DateTime), N'59 rue de l''Abbaye')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10296, N'LILAS', CAST(N'1996-09-03T00:00:00.000' AS DateTime), N'Carrera 52 con Ave. Bolívar #65-98 Llano Largo')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10297, N'BLONP', CAST(N'1996-09-04T00:00:00.000' AS DateTime), N'24, place Kléber')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10298, N'HUNGO', CAST(N'1996-09-05T00:00:00.000' AS DateTime), N'8 Johnstown Road')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10299, N'RICAR', CAST(N'1996-09-06T00:00:00.000' AS DateTime), N'Av. Copacabana, 267')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10300, N'MAGAA', CAST(N'1996-09-09T00:00:00.000' AS DateTime), N'Via Ludovico il Moro 22')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10301, N'WANDK', CAST(N'1996-09-09T00:00:00.000' AS DateTime), N'Adenauerallee 900')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10302, N'SUPRD', CAST(N'1996-09-10T00:00:00.000' AS DateTime), N'Boulevard Tirou, 255')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10303, N'GODOS', CAST(N'1996-09-11T00:00:00.000' AS DateTime), N'C/ Romero, 33')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10304, N'TORTU', CAST(N'1996-09-12T00:00:00.000' AS DateTime), N'Avda. Azteca 123')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10305, N'OLDWO', CAST(N'1996-09-13T00:00:00.000' AS DateTime), N'2743 Bering St.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10306, N'ROMEY', CAST(N'1996-09-16T00:00:00.000' AS DateTime), N'Gran Vía, 1')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10307, N'LONEP', CAST(N'1996-09-17T00:00:00.000' AS DateTime), N'89 Chiaroscuro Rd.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10308, N'ANATR', CAST(N'1996-09-18T00:00:00.000' AS DateTime), N'Avda. de la Constitución 2222')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10309, N'HUNGO', CAST(N'1996-09-19T00:00:00.000' AS DateTime), N'8 Johnstown Road')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10310, N'THEBI', CAST(N'1996-09-20T00:00:00.000' AS DateTime), N'89 Jefferson Way Suite 2')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10311, N'DUMON', CAST(N'1996-09-20T00:00:00.000' AS DateTime), N'67, rue des Cinquante Otages')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10312, N'WANDK', CAST(N'1996-09-23T00:00:00.000' AS DateTime), N'Adenauerallee 900')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10313, N'QUICK', CAST(N'1996-09-24T00:00:00.000' AS DateTime), N'Taucherstraße 10')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10314, N'RATTC', CAST(N'1996-09-25T00:00:00.000' AS DateTime), N'2817 Milton Dr.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10315, N'ISLAT', CAST(N'1996-09-26T00:00:00.000' AS DateTime), N'Garden House Crowther Way')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10316, N'RATTC', CAST(N'1996-09-27T00:00:00.000' AS DateTime), N'2817 Milton Dr.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10317, N'LONEP', CAST(N'1996-09-30T00:00:00.000' AS DateTime), N'89 Chiaroscuro Rd.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10318, N'ISLAT', CAST(N'1996-10-01T00:00:00.000' AS DateTime), N'Garden House Crowther Way')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10319, N'TORTU', CAST(N'1996-10-02T00:00:00.000' AS DateTime), N'Avda. Azteca 123')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10320, N'WARTH', CAST(N'1996-10-03T00:00:00.000' AS DateTime), N'Torikatu 38')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10321, N'ISLAT', CAST(N'1996-10-03T00:00:00.000' AS DateTime), N'Garden House Crowther Way')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10322, N'PERIC', CAST(N'1996-10-04T00:00:00.000' AS DateTime), N'Calle Dr. Jorge Cash 321')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10323, N'KOENE', CAST(N'1996-10-07T00:00:00.000' AS DateTime), N'Maubelstr. 90')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10324, N'SAVEA', CAST(N'1996-10-08T00:00:00.000' AS DateTime), N'187 Suffolk Ln.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10325, N'KOENE', CAST(N'1996-10-09T00:00:00.000' AS DateTime), N'Maubelstr. 90')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10326, N'BOLID', CAST(N'1996-10-10T00:00:00.000' AS DateTime), N'C/ Araquil, 67')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10327, N'FOLKO', CAST(N'1996-10-11T00:00:00.000' AS DateTime), N'Åkergatan 24')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10328, N'FURIB', CAST(N'1996-10-14T00:00:00.000' AS DateTime), N'Jardim das rosas n. 32')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10329, N'SPLIR', CAST(N'1996-10-15T00:00:00.000' AS DateTime), N'P.O. Box 555')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10330, N'LILAS', CAST(N'1996-10-16T00:00:00.000' AS DateTime), N'Carrera 52 con Ave. Bolívar #65-98 Llano Largo')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10331, N'BONAP', CAST(N'1996-10-16T00:00:00.000' AS DateTime), N'12, rue des Bouchers')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10332, N'MEREP', CAST(N'1996-10-17T00:00:00.000' AS DateTime), N'43 rue St. Laurent')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10333, N'WARTH', CAST(N'1996-10-18T00:00:00.000' AS DateTime), N'Torikatu 38')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10334, N'VICTE', CAST(N'1996-10-21T00:00:00.000' AS DateTime), N'2, rue du Commerce')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10335, N'HUNGO', CAST(N'1996-10-22T00:00:00.000' AS DateTime), N'8 Johnstown Road')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10336, N'PRINI', CAST(N'1996-10-23T00:00:00.000' AS DateTime), N'Estrada da saúde n. 58')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10337, N'FRANK', CAST(N'1996-10-24T00:00:00.000' AS DateTime), N'Berliner Platz 43')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10338, N'OLDWO', CAST(N'1996-10-25T00:00:00.000' AS DateTime), N'2743 Bering St.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10339, N'MEREP', CAST(N'1996-10-28T00:00:00.000' AS DateTime), N'43 rue St. Laurent')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10340, N'BONAP', CAST(N'1996-10-29T00:00:00.000' AS DateTime), N'12, rue des Bouchers')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10341, N'SIMOB', CAST(N'1996-10-29T00:00:00.000' AS DateTime), N'Vinbæltet 34')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10342, N'FRANK', CAST(N'1996-10-30T00:00:00.000' AS DateTime), N'Berliner Platz 43')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10343, N'LEHMS', CAST(N'1996-10-31T00:00:00.000' AS DateTime), N'Magazinweg 7')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10344, N'WHITC', CAST(N'1996-11-01T00:00:00.000' AS DateTime), N'1029 - 12th Ave. S.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10345, N'QUICK', CAST(N'1996-11-04T00:00:00.000' AS DateTime), N'Taucherstraße 10')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10346, N'RATTC', CAST(N'1996-11-05T00:00:00.000' AS DateTime), N'2817 Milton Dr.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10347, N'FAMIA', CAST(N'1996-11-06T00:00:00.000' AS DateTime), N'Rua Orós, 92')
GO
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10348, N'WANDK', CAST(N'1996-11-07T00:00:00.000' AS DateTime), N'Adenauerallee 900')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10349, N'SPLIR', CAST(N'1996-11-08T00:00:00.000' AS DateTime), N'P.O. Box 555')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10350, N'LAMAI', CAST(N'1996-11-11T00:00:00.000' AS DateTime), N'1 rue Alsace-Lorraine')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10351, N'ERNSH', CAST(N'1996-11-11T00:00:00.000' AS DateTime), N'Kirchgasse 6')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10352, N'FURIB', CAST(N'1996-11-12T00:00:00.000' AS DateTime), N'Jardim das rosas n. 32')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10353, N'PICCO', CAST(N'1996-11-13T00:00:00.000' AS DateTime), N'Geislweg 14')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10354, N'PERIC', CAST(N'1996-11-14T00:00:00.000' AS DateTime), N'Calle Dr. Jorge Cash 321')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10355, N'AROUT', CAST(N'1996-11-15T00:00:00.000' AS DateTime), N'Brook Farm Stratford St. Mary')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10356, N'WANDK', CAST(N'1996-11-18T00:00:00.000' AS DateTime), N'Adenauerallee 900')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10357, N'LILAS', CAST(N'1996-11-19T00:00:00.000' AS DateTime), N'Carrera 52 con Ave. Bolívar #65-98 Llano Largo')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10358, N'LAMAI', CAST(N'1996-11-20T00:00:00.000' AS DateTime), N'1 rue Alsace-Lorraine')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10359, N'SEVES', CAST(N'1996-11-21T00:00:00.000' AS DateTime), N'90 Wadhurst Rd.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10360, N'BLONP', CAST(N'1996-11-22T00:00:00.000' AS DateTime), N'24, place Kléber')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10361, N'QUICK', CAST(N'1996-11-22T00:00:00.000' AS DateTime), N'Taucherstraße 10')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10362, N'BONAP', CAST(N'1996-11-25T00:00:00.000' AS DateTime), N'12, rue des Bouchers')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10363, N'DRACD', CAST(N'1996-11-26T00:00:00.000' AS DateTime), N'Walserweg 21')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10364, N'EASTC', CAST(N'1996-11-26T00:00:00.000' AS DateTime), N'35 King George')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10365, N'ANTON', CAST(N'1996-11-27T00:00:00.000' AS DateTime), N'Mataderos  2312')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10366, N'GALED', CAST(N'1996-11-28T00:00:00.000' AS DateTime), N'Rambla de Cataluña, 23')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10367, N'VAFFE', CAST(N'1996-11-28T00:00:00.000' AS DateTime), N'Smagsloget 45')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10368, N'ERNSH', CAST(N'1996-11-29T00:00:00.000' AS DateTime), N'Kirchgasse 6')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10369, N'SPLIR', CAST(N'1996-12-02T00:00:00.000' AS DateTime), N'P.O. Box 555')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10370, N'CHOPS', CAST(N'1996-12-03T00:00:00.000' AS DateTime), N'Hauptstr. 31')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10371, N'LAMAI', CAST(N'1996-12-03T00:00:00.000' AS DateTime), N'1 rue Alsace-Lorraine')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10372, N'QUEEN', CAST(N'1996-12-04T00:00:00.000' AS DateTime), N'Alameda dos Canàrios, 891')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10373, N'HUNGO', CAST(N'1996-12-05T00:00:00.000' AS DateTime), N'8 Johnstown Road')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10374, N'WOLZA', CAST(N'1996-12-05T00:00:00.000' AS DateTime), N'ul. Filtrowa 68')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10375, N'HUNGC', CAST(N'1996-12-06T00:00:00.000' AS DateTime), N'City Center Plaza 516 Main St.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10376, N'MEREP', CAST(N'1996-12-09T00:00:00.000' AS DateTime), N'43 rue St. Laurent')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10377, N'SEVES', CAST(N'1996-12-09T00:00:00.000' AS DateTime), N'90 Wadhurst Rd.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10378, N'FOLKO', CAST(N'1996-12-10T00:00:00.000' AS DateTime), N'Åkergatan 24')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10379, N'QUEDE', CAST(N'1996-12-11T00:00:00.000' AS DateTime), N'Rua da Panificadora, 12')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10380, N'HUNGO', CAST(N'1996-12-12T00:00:00.000' AS DateTime), N'8 Johnstown Road')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10381, N'LILAS', CAST(N'1996-12-12T00:00:00.000' AS DateTime), N'Carrera 52 con Ave. Bolívar #65-98 Llano Largo')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10382, N'ERNSH', CAST(N'1996-12-13T00:00:00.000' AS DateTime), N'Kirchgasse 6')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10383, N'AROUT', CAST(N'1996-12-16T00:00:00.000' AS DateTime), N'Brook Farm Stratford St. Mary')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10384, N'BERGS', CAST(N'1996-12-16T00:00:00.000' AS DateTime), N'Berguvsvägen  8')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10385, N'SPLIR', CAST(N'1996-12-17T00:00:00.000' AS DateTime), N'P.O. Box 555')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10386, N'FAMIA', CAST(N'1996-12-18T00:00:00.000' AS DateTime), N'Rua Orós, 92')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10387, N'SANTG', CAST(N'1996-12-18T00:00:00.000' AS DateTime), N'Erling Skakkes gate 78')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10388, N'SEVES', CAST(N'1996-12-19T00:00:00.000' AS DateTime), N'90 Wadhurst Rd.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10389, N'BOTTM', CAST(N'1996-12-20T00:00:00.000' AS DateTime), N'23 Tsawassen Blvd.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10390, N'ERNSH', CAST(N'1996-12-23T00:00:00.000' AS DateTime), N'Kirchgasse 6')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10391, N'DRACD', CAST(N'1996-12-23T00:00:00.000' AS DateTime), N'Walserweg 21')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10392, N'PICCO', CAST(N'1996-12-24T00:00:00.000' AS DateTime), N'Geislweg 14')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10393, N'SAVEA', CAST(N'1996-12-25T00:00:00.000' AS DateTime), N'187 Suffolk Ln.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10394, N'HUNGC', CAST(N'1996-12-25T00:00:00.000' AS DateTime), N'City Center Plaza 516 Main St.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10395, N'HILAA', CAST(N'1996-12-26T00:00:00.000' AS DateTime), N'Carrera 22 con Ave. Carlos Soublette #8-35')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10396, N'FRANK', CAST(N'1996-12-27T00:00:00.000' AS DateTime), N'Berliner Platz 43')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10397, N'PRINI', CAST(N'1996-12-27T00:00:00.000' AS DateTime), N'Estrada da saúde n. 58')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10398, N'SAVEA', CAST(N'1996-12-30T00:00:00.000' AS DateTime), N'187 Suffolk Ln.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10399, N'VAFFE', CAST(N'1996-12-31T00:00:00.000' AS DateTime), N'Smagsloget 45')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10400, N'EASTC', CAST(N'1997-01-01T00:00:00.000' AS DateTime), N'35 King George')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10401, N'RATTC', CAST(N'1997-01-01T00:00:00.000' AS DateTime), N'2817 Milton Dr.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10402, N'ERNSH', CAST(N'1997-01-02T00:00:00.000' AS DateTime), N'Kirchgasse 6')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10403, N'ERNSH', CAST(N'1997-01-03T00:00:00.000' AS DateTime), N'Kirchgasse 6')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10404, N'MAGAA', CAST(N'1997-01-03T00:00:00.000' AS DateTime), N'Via Ludovico il Moro 22')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10405, N'LINOD', CAST(N'1997-01-06T00:00:00.000' AS DateTime), N'Ave. 5 de Mayo Porlamar')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10406, N'QUEEN', CAST(N'1997-01-07T00:00:00.000' AS DateTime), N'Alameda dos Canàrios, 891')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10407, N'OTTIK', CAST(N'1997-01-07T00:00:00.000' AS DateTime), N'Mehrheimerstr. 369')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10408, N'FOLIG', CAST(N'1997-01-08T00:00:00.000' AS DateTime), N'184, chaussée de Tournai')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10409, N'OCEAN', CAST(N'1997-01-09T00:00:00.000' AS DateTime), N'Ing. Gustavo Moncada 8585 Piso 20-A')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10410, N'BOTTM', CAST(N'1997-01-10T00:00:00.000' AS DateTime), N'23 Tsawassen Blvd.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10411, N'BOTTM', CAST(N'1997-01-10T00:00:00.000' AS DateTime), N'23 Tsawassen Blvd.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10412, N'WARTH', CAST(N'1997-01-13T00:00:00.000' AS DateTime), N'Torikatu 38')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10413, N'LAMAI', CAST(N'1997-01-14T00:00:00.000' AS DateTime), N'1 rue Alsace-Lorraine')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10414, N'FAMIA', CAST(N'1997-01-14T00:00:00.000' AS DateTime), N'Rua Orós, 92')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10415, N'HUNGC', CAST(N'1997-01-15T00:00:00.000' AS DateTime), N'City Center Plaza 516 Main St.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10416, N'WARTH', CAST(N'1997-01-16T00:00:00.000' AS DateTime), N'Torikatu 38')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10417, N'SIMOB', CAST(N'1997-01-16T00:00:00.000' AS DateTime), N'Vinbæltet 34')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10418, N'QUICK', CAST(N'1997-01-17T00:00:00.000' AS DateTime), N'Taucherstraße 10')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10419, N'RICSU', CAST(N'1997-01-20T00:00:00.000' AS DateTime), N'Starenweg 5')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10420, N'WELLI', CAST(N'1997-01-21T00:00:00.000' AS DateTime), N'Rua do Mercado, 12')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10421, N'QUEDE', CAST(N'1997-01-21T00:00:00.000' AS DateTime), N'Rua da Panificadora, 12')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10422, N'FRANS', CAST(N'1997-01-22T00:00:00.000' AS DateTime), N'Via Monte Bianco 34')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10423, N'GOURL', CAST(N'1997-01-23T00:00:00.000' AS DateTime), N'Av. Brasil, 442')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10424, N'MEREP', CAST(N'1997-01-23T00:00:00.000' AS DateTime), N'43 rue St. Laurent')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10425, N'LAMAI', CAST(N'1997-01-24T00:00:00.000' AS DateTime), N'1 rue Alsace-Lorraine')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10426, N'GALED', CAST(N'1997-01-27T00:00:00.000' AS DateTime), N'Rambla de Cataluña, 23')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10427, N'PICCO', CAST(N'1997-01-27T00:00:00.000' AS DateTime), N'Geislweg 14')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10428, N'REGGC', CAST(N'1997-01-28T00:00:00.000' AS DateTime), N'Strada Provinciale 124')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10429, N'HUNGO', CAST(N'1997-01-29T00:00:00.000' AS DateTime), N'8 Johnstown Road')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10430, N'ERNSH', CAST(N'1997-01-30T00:00:00.000' AS DateTime), N'Kirchgasse 6')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10431, N'BOTTM', CAST(N'1997-01-30T00:00:00.000' AS DateTime), N'23 Tsawassen Blvd.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10432, N'SPLIR', CAST(N'1997-01-31T00:00:00.000' AS DateTime), N'P.O. Box 555')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10433, N'PRINI', CAST(N'1997-02-03T00:00:00.000' AS DateTime), N'Estrada da saúde n. 58')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10434, N'FOLKO', CAST(N'1997-02-03T00:00:00.000' AS DateTime), N'Åkergatan 24')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10435, N'CONSH', CAST(N'1997-02-04T00:00:00.000' AS DateTime), N'Berkeley Gardens 12  Brewery')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10436, N'BLONP', CAST(N'1997-02-05T00:00:00.000' AS DateTime), N'24, place Kléber')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10437, N'WARTH', CAST(N'1997-02-05T00:00:00.000' AS DateTime), N'Torikatu 38')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10438, N'TOMSP', CAST(N'1997-02-06T00:00:00.000' AS DateTime), N'Luisenstr. 48')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10439, N'MEREP', CAST(N'1997-02-07T00:00:00.000' AS DateTime), N'43 rue St. Laurent')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10440, N'SAVEA', CAST(N'1997-02-10T00:00:00.000' AS DateTime), N'187 Suffolk Ln.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10441, N'OLDWO', CAST(N'1997-02-10T00:00:00.000' AS DateTime), N'2743 Bering St.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10442, N'ERNSH', CAST(N'1997-02-11T00:00:00.000' AS DateTime), N'Kirchgasse 6')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10443, N'REGGC', CAST(N'1997-02-12T00:00:00.000' AS DateTime), N'Strada Provinciale 124')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10444, N'BERGS', CAST(N'1997-02-12T00:00:00.000' AS DateTime), N'Berguvsvägen  8')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10445, N'BERGS', CAST(N'1997-02-13T00:00:00.000' AS DateTime), N'Berguvsvägen  8')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10446, N'TOMSP', CAST(N'1997-02-14T00:00:00.000' AS DateTime), N'Luisenstr. 48')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10447, N'RICAR', CAST(N'1997-02-14T00:00:00.000' AS DateTime), N'Av. Copacabana, 267')
GO
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10448, N'RANCH', CAST(N'1997-02-17T00:00:00.000' AS DateTime), N'Av. del Libertador 900')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10449, N'BLONP', CAST(N'1997-02-18T00:00:00.000' AS DateTime), N'24, place Kléber')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10450, N'VICTE', CAST(N'1997-02-19T00:00:00.000' AS DateTime), N'2, rue du Commerce')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10451, N'QUICK', CAST(N'1997-02-19T00:00:00.000' AS DateTime), N'Taucherstraße 10')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10452, N'SAVEA', CAST(N'1997-02-20T00:00:00.000' AS DateTime), N'187 Suffolk Ln.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10453, N'AROUT', CAST(N'1997-02-21T00:00:00.000' AS DateTime), N'Brook Farm Stratford St. Mary')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10454, N'LAMAI', CAST(N'1997-02-21T00:00:00.000' AS DateTime), N'1 rue Alsace-Lorraine')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10455, N'WARTH', CAST(N'1997-02-24T00:00:00.000' AS DateTime), N'Torikatu 38')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10456, N'KOENE', CAST(N'1997-02-25T00:00:00.000' AS DateTime), N'Maubelstr. 90')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10457, N'KOENE', CAST(N'1997-02-25T00:00:00.000' AS DateTime), N'Maubelstr. 90')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10458, N'SUPRD', CAST(N'1997-02-26T00:00:00.000' AS DateTime), N'Boulevard Tirou, 255')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10459, N'VICTE', CAST(N'1997-02-27T00:00:00.000' AS DateTime), N'2, rue du Commerce')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10460, N'FOLKO', CAST(N'1997-02-28T00:00:00.000' AS DateTime), N'Åkergatan 24')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10461, N'LILAS', CAST(N'1997-02-28T00:00:00.000' AS DateTime), N'Carrera 52 con Ave. Bolívar #65-98 Llano Largo')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10462, N'CONSH', CAST(N'1997-03-03T00:00:00.000' AS DateTime), N'Berkeley Gardens 12  Brewery')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10463, N'SUPRD', CAST(N'1997-03-04T00:00:00.000' AS DateTime), N'Boulevard Tirou, 255')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10464, N'FURIB', CAST(N'1997-03-04T00:00:00.000' AS DateTime), N'Jardim das rosas n. 32')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10465, N'VAFFE', CAST(N'1997-03-05T00:00:00.000' AS DateTime), N'Smagsloget 45')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10466, N'COMMI', CAST(N'1997-03-06T00:00:00.000' AS DateTime), N'Av. dos Lusíadas, 23')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10467, N'MAGAA', CAST(N'1997-03-06T00:00:00.000' AS DateTime), N'Via Ludovico il Moro 22')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10468, N'KOENE', CAST(N'1997-03-07T00:00:00.000' AS DateTime), N'Maubelstr. 90')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10469, N'WHITC', CAST(N'1997-03-10T00:00:00.000' AS DateTime), N'1029 - 12th Ave. S.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10470, N'BONAP', CAST(N'1997-03-11T00:00:00.000' AS DateTime), N'12, rue des Bouchers')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10471, N'BSBEV', CAST(N'1997-03-11T00:00:00.000' AS DateTime), N'Fauntleroy Circus')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10472, N'SEVES', CAST(N'1997-03-12T00:00:00.000' AS DateTime), N'90 Wadhurst Rd.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10473, N'ISLAT', CAST(N'1997-03-13T00:00:00.000' AS DateTime), N'Garden House Crowther Way')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10474, N'PERIC', CAST(N'1997-03-13T00:00:00.000' AS DateTime), N'Calle Dr. Jorge Cash 321')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10475, N'SUPRD', CAST(N'1997-03-14T00:00:00.000' AS DateTime), N'Boulevard Tirou, 255')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10476, N'HILAA', CAST(N'1997-03-17T00:00:00.000' AS DateTime), N'Carrera 22 con Ave. Carlos Soublette #8-35')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10477, N'PRINI', CAST(N'1997-03-17T00:00:00.000' AS DateTime), N'Estrada da saúde n. 58')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10478, N'VICTE', CAST(N'1997-03-18T00:00:00.000' AS DateTime), N'2, rue du Commerce')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10479, N'RATTC', CAST(N'1997-03-19T00:00:00.000' AS DateTime), N'2817 Milton Dr.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10480, N'FOLIG', CAST(N'1997-03-20T00:00:00.000' AS DateTime), N'184, chaussée de Tournai')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10481, N'RICAR', CAST(N'1997-03-20T00:00:00.000' AS DateTime), N'Av. Copacabana, 267')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10482, N'LAZYK', CAST(N'1997-03-21T00:00:00.000' AS DateTime), N'12 Orchestra Terrace')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10483, N'WHITC', CAST(N'1997-03-24T00:00:00.000' AS DateTime), N'1029 - 12th Ave. S.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10484, N'BSBEV', CAST(N'1997-03-24T00:00:00.000' AS DateTime), N'Fauntleroy Circus')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10485, N'LINOD', CAST(N'1997-03-25T00:00:00.000' AS DateTime), N'Ave. 5 de Mayo Porlamar')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10486, N'HILAA', CAST(N'1997-03-26T00:00:00.000' AS DateTime), N'Carrera 22 con Ave. Carlos Soublette #8-35')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10487, N'QUEEN', CAST(N'1997-03-26T00:00:00.000' AS DateTime), N'Alameda dos Canàrios, 891')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10488, N'FRANK', CAST(N'1997-03-27T00:00:00.000' AS DateTime), N'Berliner Platz 43')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10489, N'PICCO', CAST(N'1997-03-28T00:00:00.000' AS DateTime), N'Geislweg 14')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10490, N'HILAA', CAST(N'1997-03-31T00:00:00.000' AS DateTime), N'Carrera 22 con Ave. Carlos Soublette #8-35')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10491, N'FURIB', CAST(N'1997-03-31T00:00:00.000' AS DateTime), N'Jardim das rosas n. 32')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10492, N'BOTTM', CAST(N'1997-04-01T00:00:00.000' AS DateTime), N'23 Tsawassen Blvd.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10493, N'LAMAI', CAST(N'1997-04-02T00:00:00.000' AS DateTime), N'1 rue Alsace-Lorraine')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10494, N'COMMI', CAST(N'1997-04-02T00:00:00.000' AS DateTime), N'Av. dos Lusíadas, 23')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10495, N'LAUGB', CAST(N'1997-04-03T00:00:00.000' AS DateTime), N'2319 Elm St.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10496, N'TRADH', CAST(N'1997-04-04T00:00:00.000' AS DateTime), N'Av. Inês de Castro, 414')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10497, N'LEHMS', CAST(N'1997-04-04T00:00:00.000' AS DateTime), N'Magazinweg 7')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10498, N'HILAA', CAST(N'1997-04-07T00:00:00.000' AS DateTime), N'Carrera 22 con Ave. Carlos Soublette #8-35')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10499, N'LILAS', CAST(N'1997-04-08T00:00:00.000' AS DateTime), N'Carrera 52 con Ave. Bolívar #65-98 Llano Largo')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10500, N'LAMAI', CAST(N'1997-04-09T00:00:00.000' AS DateTime), N'1 rue Alsace-Lorraine')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10501, N'BLAUS', CAST(N'1997-04-09T00:00:00.000' AS DateTime), N'Forsterstr. 57')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10502, N'PERIC', CAST(N'1997-04-10T00:00:00.000' AS DateTime), N'Calle Dr. Jorge Cash 321')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10503, N'HUNGO', CAST(N'1997-04-11T00:00:00.000' AS DateTime), N'8 Johnstown Road')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10504, N'WHITC', CAST(N'1997-04-11T00:00:00.000' AS DateTime), N'1029 - 12th Ave. S.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10505, N'MEREP', CAST(N'1997-04-14T00:00:00.000' AS DateTime), N'43 rue St. Laurent')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10506, N'KOENE', CAST(N'1997-04-15T00:00:00.000' AS DateTime), N'Maubelstr. 90')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10507, N'ANTON', CAST(N'1997-04-15T00:00:00.000' AS DateTime), N'Mataderos  2312')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10508, N'OTTIK', CAST(N'1997-04-16T00:00:00.000' AS DateTime), N'Mehrheimerstr. 369')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10509, N'BLAUS', CAST(N'1997-04-17T00:00:00.000' AS DateTime), N'Forsterstr. 57')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10510, N'SAVEA', CAST(N'1997-04-18T00:00:00.000' AS DateTime), N'187 Suffolk Ln.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10511, N'BONAP', CAST(N'1997-04-18T00:00:00.000' AS DateTime), N'12, rue des Bouchers')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10512, N'FAMIA', CAST(N'1997-04-21T00:00:00.000' AS DateTime), N'Rua Orós, 92')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10513, N'WANDK', CAST(N'1997-04-22T00:00:00.000' AS DateTime), N'Adenauerallee 900')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10514, N'ERNSH', CAST(N'1997-04-22T00:00:00.000' AS DateTime), N'Kirchgasse 6')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10515, N'QUICK', CAST(N'1997-04-23T00:00:00.000' AS DateTime), N'Taucherstraße 10')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10516, N'HUNGO', CAST(N'1997-04-24T00:00:00.000' AS DateTime), N'8 Johnstown Road')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10517, N'NORTS', CAST(N'1997-04-24T00:00:00.000' AS DateTime), N'South House 300 Queensbridge')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10518, N'TORTU', CAST(N'1997-04-25T00:00:00.000' AS DateTime), N'Avda. Azteca 123')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10519, N'CHOPS', CAST(N'1997-04-28T00:00:00.000' AS DateTime), N'Hauptstr. 31')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10520, N'SANTG', CAST(N'1997-04-29T00:00:00.000' AS DateTime), N'Erling Skakkes gate 78')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10521, N'CACTU', CAST(N'1997-04-29T00:00:00.000' AS DateTime), N'Cerrito 333')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10522, N'LEHMS', CAST(N'1997-04-30T00:00:00.000' AS DateTime), N'Magazinweg 7')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10523, N'SEVES', CAST(N'1997-05-01T00:00:00.000' AS DateTime), N'90 Wadhurst Rd.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10524, N'BERGS', CAST(N'1997-05-01T00:00:00.000' AS DateTime), N'Berguvsvägen  8')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10525, N'BONAP', CAST(N'1997-05-02T00:00:00.000' AS DateTime), N'12, rue des Bouchers')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10526, N'WARTH', CAST(N'1997-05-05T00:00:00.000' AS DateTime), N'Torikatu 38')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10527, N'QUICK', CAST(N'1997-05-05T00:00:00.000' AS DateTime), N'Taucherstraße 10')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10528, N'GREAL', CAST(N'1997-05-06T00:00:00.000' AS DateTime), N'2732 Baker Blvd.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10529, N'MAISD', CAST(N'1997-05-07T00:00:00.000' AS DateTime), N'Rue Joseph-Bens 532')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10530, N'PICCO', CAST(N'1997-05-08T00:00:00.000' AS DateTime), N'Geislweg 14')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10531, N'OCEAN', CAST(N'1997-05-08T00:00:00.000' AS DateTime), N'Ing. Gustavo Moncada 8585 Piso 20-A')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10532, N'EASTC', CAST(N'1997-05-09T00:00:00.000' AS DateTime), N'35 King George')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10533, N'FOLKO', CAST(N'1997-05-12T00:00:00.000' AS DateTime), N'Åkergatan 24')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10534, N'LEHMS', CAST(N'1997-05-12T00:00:00.000' AS DateTime), N'Magazinweg 7')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10535, N'ANTON', CAST(N'1997-05-13T00:00:00.000' AS DateTime), N'Mataderos  2312')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10536, N'LEHMS', CAST(N'1997-05-14T00:00:00.000' AS DateTime), N'Magazinweg 7')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10537, N'RICSU', CAST(N'1997-05-14T00:00:00.000' AS DateTime), N'Starenweg 5')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10538, N'BSBEV', CAST(N'1997-05-15T00:00:00.000' AS DateTime), N'Fauntleroy Circus')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10539, N'BSBEV', CAST(N'1997-05-16T00:00:00.000' AS DateTime), N'Fauntleroy Circus')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10540, N'QUICK', CAST(N'1997-05-19T00:00:00.000' AS DateTime), N'Taucherstraße 10')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10541, N'HANAR', CAST(N'1997-05-19T00:00:00.000' AS DateTime), N'Rua do Paço, 67')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10542, N'KOENE', CAST(N'1997-05-20T00:00:00.000' AS DateTime), N'Maubelstr. 90')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10543, N'LILAS', CAST(N'1997-05-21T00:00:00.000' AS DateTime), N'Carrera 52 con Ave. Bolívar #65-98 Llano Largo')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10544, N'LONEP', CAST(N'1997-05-21T00:00:00.000' AS DateTime), N'89 Chiaroscuro Rd.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10545, N'LAZYK', CAST(N'1997-05-22T00:00:00.000' AS DateTime), N'12 Orchestra Terrace')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10546, N'VICTE', CAST(N'1997-05-23T00:00:00.000' AS DateTime), N'2, rue du Commerce')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10547, N'SEVES', CAST(N'1997-05-23T00:00:00.000' AS DateTime), N'90 Wadhurst Rd.')
GO
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10548, N'TOMSP', CAST(N'1997-05-26T00:00:00.000' AS DateTime), N'Luisenstr. 48')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10549, N'QUICK', CAST(N'1997-05-27T00:00:00.000' AS DateTime), N'Taucherstraße 10')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10550, N'GODOS', CAST(N'1997-05-28T00:00:00.000' AS DateTime), N'C/ Romero, 33')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10551, N'FURIB', CAST(N'1997-05-28T00:00:00.000' AS DateTime), N'Jardim das rosas n. 32')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10552, N'HILAA', CAST(N'1997-05-29T00:00:00.000' AS DateTime), N'Carrera 22 con Ave. Carlos Soublette #8-35')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10553, N'WARTH', CAST(N'1997-05-30T00:00:00.000' AS DateTime), N'Torikatu 38')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10554, N'OTTIK', CAST(N'1997-05-30T00:00:00.000' AS DateTime), N'Mehrheimerstr. 369')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10555, N'SAVEA', CAST(N'1997-06-02T00:00:00.000' AS DateTime), N'187 Suffolk Ln.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10556, N'SIMOB', CAST(N'1997-06-03T00:00:00.000' AS DateTime), N'Vinbæltet 34')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10557, N'LEHMS', CAST(N'1997-06-03T00:00:00.000' AS DateTime), N'Magazinweg 7')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10558, N'AROUT', CAST(N'1997-06-04T00:00:00.000' AS DateTime), N'Brook Farm Stratford St. Mary')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10559, N'BLONP', CAST(N'1997-06-05T00:00:00.000' AS DateTime), N'24, place Kléber')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10560, N'FRANK', CAST(N'1997-06-06T00:00:00.000' AS DateTime), N'Berliner Platz 43')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10561, N'FOLKO', CAST(N'1997-06-06T00:00:00.000' AS DateTime), N'Åkergatan 24')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10562, N'REGGC', CAST(N'1997-06-09T00:00:00.000' AS DateTime), N'Strada Provinciale 124')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10563, N'RICAR', CAST(N'1997-06-10T00:00:00.000' AS DateTime), N'Av. Copacabana, 267')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10564, N'RATTC', CAST(N'1997-06-10T00:00:00.000' AS DateTime), N'2817 Milton Dr.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10565, N'MEREP', CAST(N'1997-06-11T00:00:00.000' AS DateTime), N'43 rue St. Laurent')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10566, N'BLONP', CAST(N'1997-06-12T00:00:00.000' AS DateTime), N'24, place Kléber')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10567, N'HUNGO', CAST(N'1997-06-12T00:00:00.000' AS DateTime), N'8 Johnstown Road')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10568, N'GALED', CAST(N'1997-06-13T00:00:00.000' AS DateTime), N'Rambla de Cataluña, 23')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10569, N'RATTC', CAST(N'1997-06-16T00:00:00.000' AS DateTime), N'2817 Milton Dr.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10570, N'MEREP', CAST(N'1997-06-17T00:00:00.000' AS DateTime), N'43 rue St. Laurent')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10571, N'ERNSH', CAST(N'1997-06-17T00:00:00.000' AS DateTime), N'Kirchgasse 6')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10572, N'BERGS', CAST(N'1997-06-18T00:00:00.000' AS DateTime), N'Berguvsvägen  8')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10573, N'ANTON', CAST(N'1997-06-19T00:00:00.000' AS DateTime), N'Mataderos  2312')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10574, N'TRAIH', CAST(N'1997-06-19T00:00:00.000' AS DateTime), N'722 DaVinci Blvd.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10575, N'MORGK', CAST(N'1997-06-20T00:00:00.000' AS DateTime), N'Heerstr. 22')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10576, N'TORTU', CAST(N'1997-06-23T00:00:00.000' AS DateTime), N'Avda. Azteca 123')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10577, N'TRAIH', CAST(N'1997-06-23T00:00:00.000' AS DateTime), N'722 DaVinci Blvd.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10578, N'BSBEV', CAST(N'1997-06-24T00:00:00.000' AS DateTime), N'Fauntleroy Circus')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10579, N'LETSS', CAST(N'1997-06-25T00:00:00.000' AS DateTime), N'87 Polk St. Suite 5')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10580, N'OTTIK', CAST(N'1997-06-26T00:00:00.000' AS DateTime), N'Mehrheimerstr. 369')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10581, N'FAMIA', CAST(N'1997-06-26T00:00:00.000' AS DateTime), N'Rua Orós, 92')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10582, N'BLAUS', CAST(N'1997-06-27T00:00:00.000' AS DateTime), N'Forsterstr. 57')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10583, N'WARTH', CAST(N'1997-06-30T00:00:00.000' AS DateTime), N'Torikatu 38')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10584, N'BLONP', CAST(N'1997-06-30T00:00:00.000' AS DateTime), N'24, place Kléber')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10585, N'WELLI', CAST(N'1997-07-01T00:00:00.000' AS DateTime), N'Rua do Mercado, 12')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10586, N'REGGC', CAST(N'1997-07-02T00:00:00.000' AS DateTime), N'Strada Provinciale 124')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10587, N'QUEDE', CAST(N'1997-07-02T00:00:00.000' AS DateTime), N'Rua da Panificadora, 12')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10588, N'QUICK', CAST(N'1997-07-03T00:00:00.000' AS DateTime), N'Taucherstraße 10')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10589, N'GREAL', CAST(N'1997-07-04T00:00:00.000' AS DateTime), N'2732 Baker Blvd.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10590, N'MEREP', CAST(N'1997-07-07T00:00:00.000' AS DateTime), N'43 rue St. Laurent')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10591, N'VAFFE', CAST(N'1997-07-07T00:00:00.000' AS DateTime), N'Smagsloget 45')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10592, N'LEHMS', CAST(N'1997-07-08T00:00:00.000' AS DateTime), N'Magazinweg 7')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10593, N'LEHMS', CAST(N'1997-07-09T00:00:00.000' AS DateTime), N'Magazinweg 7')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10594, N'OLDWO', CAST(N'1997-07-09T00:00:00.000' AS DateTime), N'2743 Bering St.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10595, N'ERNSH', CAST(N'1997-07-10T00:00:00.000' AS DateTime), N'Kirchgasse 6')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10596, N'WHITC', CAST(N'1997-07-11T00:00:00.000' AS DateTime), N'1029 - 12th Ave. S.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10597, N'PICCO', CAST(N'1997-07-11T00:00:00.000' AS DateTime), N'Geislweg 14')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10598, N'RATTC', CAST(N'1997-07-14T00:00:00.000' AS DateTime), N'2817 Milton Dr.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10599, N'BSBEV', CAST(N'1997-07-15T00:00:00.000' AS DateTime), N'Fauntleroy Circus')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10600, N'HUNGC', CAST(N'1997-07-16T00:00:00.000' AS DateTime), N'City Center Plaza 516 Main St.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10601, N'HILAA', CAST(N'1997-07-16T00:00:00.000' AS DateTime), N'Carrera 22 con Ave. Carlos Soublette #8-35')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10602, N'VAFFE', CAST(N'1997-07-17T00:00:00.000' AS DateTime), N'Smagsloget 45')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10603, N'SAVEA', CAST(N'1997-07-18T00:00:00.000' AS DateTime), N'187 Suffolk Ln.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10604, N'FURIB', CAST(N'1997-07-18T00:00:00.000' AS DateTime), N'Jardim das rosas n. 32')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10605, N'MEREP', CAST(N'1997-07-21T00:00:00.000' AS DateTime), N'43 rue St. Laurent')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10606, N'TRADH', CAST(N'1997-07-22T00:00:00.000' AS DateTime), N'Av. Inês de Castro, 414')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10607, N'SAVEA', CAST(N'1997-07-22T00:00:00.000' AS DateTime), N'187 Suffolk Ln.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10608, N'TOMSP', CAST(N'1997-07-23T00:00:00.000' AS DateTime), N'Luisenstr. 48')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10609, N'DUMON', CAST(N'1997-07-24T00:00:00.000' AS DateTime), N'67, rue des Cinquante Otages')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10610, N'LAMAI', CAST(N'1997-07-25T00:00:00.000' AS DateTime), N'1 rue Alsace-Lorraine')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10611, N'WOLZA', CAST(N'1997-07-25T00:00:00.000' AS DateTime), N'ul. Filtrowa 68')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10612, N'SAVEA', CAST(N'1997-07-28T00:00:00.000' AS DateTime), N'187 Suffolk Ln.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10613, N'HILAA', CAST(N'1997-07-29T00:00:00.000' AS DateTime), N'Carrera 22 con Ave. Carlos Soublette #8-35')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10614, N'BLAUS', CAST(N'1997-07-29T00:00:00.000' AS DateTime), N'Forsterstr. 57')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10615, N'WILMK', CAST(N'1997-07-30T00:00:00.000' AS DateTime), N'Keskuskatu 45')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10616, N'GREAL', CAST(N'1997-07-31T00:00:00.000' AS DateTime), N'2732 Baker Blvd.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10617, N'GREAL', CAST(N'1997-07-31T00:00:00.000' AS DateTime), N'2732 Baker Blvd.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10618, N'MEREP', CAST(N'1997-08-01T00:00:00.000' AS DateTime), N'43 rue St. Laurent')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10619, N'MEREP', CAST(N'1997-08-04T00:00:00.000' AS DateTime), N'43 rue St. Laurent')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10620, N'LAUGB', CAST(N'1997-08-05T00:00:00.000' AS DateTime), N'2319 Elm St.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10621, N'ISLAT', CAST(N'1997-08-05T00:00:00.000' AS DateTime), N'Garden House Crowther Way')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10622, N'RICAR', CAST(N'1997-08-06T00:00:00.000' AS DateTime), N'Av. Copacabana, 267')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10623, N'FRANK', CAST(N'1997-08-07T00:00:00.000' AS DateTime), N'Berliner Platz 43')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10624, N'THECR', CAST(N'1997-08-07T00:00:00.000' AS DateTime), N'55 Grizzly Peak Rd.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10625, N'ANATR', CAST(N'1997-08-08T00:00:00.000' AS DateTime), N'Avda. de la Constitución 2222')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10626, N'BERGS', CAST(N'1997-08-11T00:00:00.000' AS DateTime), N'Berguvsvägen  8')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10627, N'SAVEA', CAST(N'1997-08-11T00:00:00.000' AS DateTime), N'187 Suffolk Ln.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10628, N'BLONP', CAST(N'1997-08-12T00:00:00.000' AS DateTime), N'24, place Kléber')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10629, N'GODOS', CAST(N'1997-08-12T00:00:00.000' AS DateTime), N'C/ Romero, 33')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10630, N'KOENE', CAST(N'1997-08-13T00:00:00.000' AS DateTime), N'Maubelstr. 90')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10631, N'LAMAI', CAST(N'1997-08-14T00:00:00.000' AS DateTime), N'1 rue Alsace-Lorraine')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10632, N'WANDK', CAST(N'1997-08-14T00:00:00.000' AS DateTime), N'Adenauerallee 900')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10633, N'ERNSH', CAST(N'1997-08-15T00:00:00.000' AS DateTime), N'Kirchgasse 6')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10634, N'FOLIG', CAST(N'1997-08-15T00:00:00.000' AS DateTime), N'184, chaussée de Tournai')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10635, N'MAGAA', CAST(N'1997-08-18T00:00:00.000' AS DateTime), N'Via Ludovico il Moro 22')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10636, N'WARTH', CAST(N'1997-08-19T00:00:00.000' AS DateTime), N'Torikatu 38')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10637, N'QUEEN', CAST(N'1997-08-19T00:00:00.000' AS DateTime), N'Alameda dos Canàrios, 891')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10638, N'LINOD', CAST(N'1997-08-20T00:00:00.000' AS DateTime), N'Ave. 5 de Mayo Porlamar')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10639, N'SANTG', CAST(N'1997-08-20T00:00:00.000' AS DateTime), N'Erling Skakkes gate 78')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10640, N'WANDK', CAST(N'1997-08-21T00:00:00.000' AS DateTime), N'Adenauerallee 900')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10641, N'HILAA', CAST(N'1997-08-22T00:00:00.000' AS DateTime), N'Carrera 22 con Ave. Carlos Soublette #8-35')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10642, N'SIMOB', CAST(N'1997-08-22T00:00:00.000' AS DateTime), N'Vinbæltet 34')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10643, N'ALFKI', CAST(N'1997-08-25T00:00:00.000' AS DateTime), N'Obere Str. 57')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10644, N'WELLI', CAST(N'1997-08-25T00:00:00.000' AS DateTime), N'Rua do Mercado, 12')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10645, N'HANAR', CAST(N'1997-08-26T00:00:00.000' AS DateTime), N'Rua do Paço, 67')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10646, N'HUNGO', CAST(N'1997-08-27T00:00:00.000' AS DateTime), N'8 Johnstown Road')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10647, N'QUEDE', CAST(N'1997-08-27T00:00:00.000' AS DateTime), N'Rua da Panificadora, 12')
GO
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10648, N'RICAR', CAST(N'1997-08-28T00:00:00.000' AS DateTime), N'Av. Copacabana, 267')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10649, N'MAISD', CAST(N'1997-08-28T00:00:00.000' AS DateTime), N'Rue Joseph-Bens 532')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10650, N'FAMIA', CAST(N'1997-08-29T00:00:00.000' AS DateTime), N'Rua Orós, 92')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10651, N'WANDK', CAST(N'1997-09-01T00:00:00.000' AS DateTime), N'Adenauerallee 900')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10652, N'GOURL', CAST(N'1997-09-01T00:00:00.000' AS DateTime), N'Av. Brasil, 442')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10653, N'FRANK', CAST(N'1997-09-02T00:00:00.000' AS DateTime), N'Berliner Platz 43')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10654, N'BERGS', CAST(N'1997-09-02T00:00:00.000' AS DateTime), N'Berguvsvägen  8')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10655, N'REGGC', CAST(N'1997-09-03T00:00:00.000' AS DateTime), N'Strada Provinciale 124')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10656, N'GREAL', CAST(N'1997-09-04T00:00:00.000' AS DateTime), N'2732 Baker Blvd.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10657, N'SAVEA', CAST(N'1997-09-04T00:00:00.000' AS DateTime), N'187 Suffolk Ln.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10658, N'QUICK', CAST(N'1997-09-05T00:00:00.000' AS DateTime), N'Taucherstraße 10')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10659, N'QUEEN', CAST(N'1997-09-05T00:00:00.000' AS DateTime), N'Alameda dos Canàrios, 891')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10660, N'HUNGC', CAST(N'1997-09-08T00:00:00.000' AS DateTime), N'City Center Plaza 516 Main St.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10661, N'HUNGO', CAST(N'1997-09-09T00:00:00.000' AS DateTime), N'8 Johnstown Road')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10662, N'LONEP', CAST(N'1997-09-09T00:00:00.000' AS DateTime), N'89 Chiaroscuro Rd.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10663, N'BONAP', CAST(N'1997-09-10T00:00:00.000' AS DateTime), N'12, rue des Bouchers')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10664, N'FURIB', CAST(N'1997-09-10T00:00:00.000' AS DateTime), N'Jardim das rosas n. 32')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10665, N'LONEP', CAST(N'1997-09-11T00:00:00.000' AS DateTime), N'89 Chiaroscuro Rd.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10666, N'RICSU', CAST(N'1997-09-12T00:00:00.000' AS DateTime), N'Starenweg 5')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10667, N'ERNSH', CAST(N'1997-09-12T00:00:00.000' AS DateTime), N'Kirchgasse 6')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10668, N'WANDK', CAST(N'1997-09-15T00:00:00.000' AS DateTime), N'Adenauerallee 900')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10669, N'SIMOB', CAST(N'1997-09-15T00:00:00.000' AS DateTime), N'Vinbæltet 34')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10670, N'FRANK', CAST(N'1997-09-16T00:00:00.000' AS DateTime), N'Berliner Platz 43')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10671, N'FRANR', CAST(N'1997-09-17T00:00:00.000' AS DateTime), N'54, rue Royale')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10672, N'BERGS', CAST(N'1997-09-17T00:00:00.000' AS DateTime), N'Berguvsvägen  8')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10673, N'WILMK', CAST(N'1997-09-18T00:00:00.000' AS DateTime), N'Keskuskatu 45')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10674, N'ISLAT', CAST(N'1997-09-18T00:00:00.000' AS DateTime), N'Garden House Crowther Way')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10675, N'FRANK', CAST(N'1997-09-19T00:00:00.000' AS DateTime), N'Berliner Platz 43')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10676, N'TORTU', CAST(N'1997-09-22T00:00:00.000' AS DateTime), N'Avda. Azteca 123')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10677, N'ANTON', CAST(N'1997-09-22T00:00:00.000' AS DateTime), N'Mataderos  2312')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10678, N'SAVEA', CAST(N'1997-09-23T00:00:00.000' AS DateTime), N'187 Suffolk Ln.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10679, N'BLONP', CAST(N'1997-09-23T00:00:00.000' AS DateTime), N'24, place Kléber')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10680, N'OLDWO', CAST(N'1997-09-24T00:00:00.000' AS DateTime), N'2743 Bering St.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10681, N'GREAL', CAST(N'1997-09-25T00:00:00.000' AS DateTime), N'2732 Baker Blvd.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10682, N'ANTON', CAST(N'1997-09-25T00:00:00.000' AS DateTime), N'Mataderos  2312')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10683, N'DUMON', CAST(N'1997-09-26T00:00:00.000' AS DateTime), N'67, rue des Cinquante Otages')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10684, N'OTTIK', CAST(N'1997-09-26T00:00:00.000' AS DateTime), N'Mehrheimerstr. 369')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10685, N'GOURL', CAST(N'1997-09-29T00:00:00.000' AS DateTime), N'Av. Brasil, 442')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10686, N'PICCO', CAST(N'1997-09-30T00:00:00.000' AS DateTime), N'Geislweg 14')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10687, N'HUNGO', CAST(N'1997-09-30T00:00:00.000' AS DateTime), N'8 Johnstown Road')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10688, N'VAFFE', CAST(N'1997-10-01T00:00:00.000' AS DateTime), N'Smagsloget 45')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10689, N'BERGS', CAST(N'1997-10-01T00:00:00.000' AS DateTime), N'Berguvsvägen  8')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10690, N'HANAR', CAST(N'1997-10-02T00:00:00.000' AS DateTime), N'Rua do Paço, 67')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10691, N'QUICK', CAST(N'1997-10-03T00:00:00.000' AS DateTime), N'Taucherstraße 10')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10692, N'ALFKI', CAST(N'1997-10-03T00:00:00.000' AS DateTime), N'Obere Str. 57')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10693, N'WHITC', CAST(N'1997-10-06T00:00:00.000' AS DateTime), N'1029 - 12th Ave. S.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10694, N'QUICK', CAST(N'1997-10-06T00:00:00.000' AS DateTime), N'Taucherstraße 10')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10695, N'WILMK', CAST(N'1997-10-07T00:00:00.000' AS DateTime), N'Keskuskatu 45')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10696, N'WHITC', CAST(N'1997-10-08T00:00:00.000' AS DateTime), N'1029 - 12th Ave. S.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10697, N'LINOD', CAST(N'1997-10-08T00:00:00.000' AS DateTime), N'Ave. 5 de Mayo Porlamar')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10698, N'ERNSH', CAST(N'1997-10-09T00:00:00.000' AS DateTime), N'Kirchgasse 6')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10699, N'MORGK', CAST(N'1997-10-09T00:00:00.000' AS DateTime), N'Heerstr. 22')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10700, N'SAVEA', CAST(N'1997-10-10T00:00:00.000' AS DateTime), N'187 Suffolk Ln.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10701, N'HUNGO', CAST(N'1997-10-13T00:00:00.000' AS DateTime), N'8 Johnstown Road')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10702, N'ALFKI', CAST(N'1997-10-13T00:00:00.000' AS DateTime), N'Obere Str. 57')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10703, N'FOLKO', CAST(N'1997-10-14T00:00:00.000' AS DateTime), N'Åkergatan 24')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10704, N'QUEEN', CAST(N'1997-10-14T00:00:00.000' AS DateTime), N'Alameda dos Canàrios, 891')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10705, N'HILAA', CAST(N'1997-10-15T00:00:00.000' AS DateTime), N'Carrera 22 con Ave. Carlos Soublette #8-35')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10706, N'OLDWO', CAST(N'1997-10-16T00:00:00.000' AS DateTime), N'2743 Bering St.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10707, N'AROUT', CAST(N'1997-10-16T00:00:00.000' AS DateTime), N'Brook Farm Stratford St. Mary')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10708, N'THEBI', CAST(N'1997-10-17T00:00:00.000' AS DateTime), N'89 Jefferson Way Suite 2')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10709, N'GOURL', CAST(N'1997-10-17T00:00:00.000' AS DateTime), N'Av. Brasil, 442')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10710, N'FRANS', CAST(N'1997-10-20T00:00:00.000' AS DateTime), N'Via Monte Bianco 34')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10711, N'SAVEA', CAST(N'1997-10-21T00:00:00.000' AS DateTime), N'187 Suffolk Ln.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10712, N'HUNGO', CAST(N'1997-10-21T00:00:00.000' AS DateTime), N'8 Johnstown Road')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10713, N'SAVEA', CAST(N'1997-10-22T00:00:00.000' AS DateTime), N'187 Suffolk Ln.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10714, N'SAVEA', CAST(N'1997-10-22T00:00:00.000' AS DateTime), N'187 Suffolk Ln.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10715, N'BONAP', CAST(N'1997-10-23T00:00:00.000' AS DateTime), N'12, rue des Bouchers')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10716, N'RANCH', CAST(N'1997-10-24T00:00:00.000' AS DateTime), N'Av. del Libertador 900')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10717, N'FRANK', CAST(N'1997-10-24T00:00:00.000' AS DateTime), N'Berliner Platz 43')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10718, N'KOENE', CAST(N'1997-10-27T00:00:00.000' AS DateTime), N'Maubelstr. 90')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10719, N'LETSS', CAST(N'1997-10-27T00:00:00.000' AS DateTime), N'87 Polk St. Suite 5')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10720, N'QUEDE', CAST(N'1997-10-28T00:00:00.000' AS DateTime), N'Rua da Panificadora, 12')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10721, N'QUICK', CAST(N'1997-10-29T00:00:00.000' AS DateTime), N'Taucherstraße 10')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10722, N'SAVEA', CAST(N'1997-10-29T00:00:00.000' AS DateTime), N'187 Suffolk Ln.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10723, N'WHITC', CAST(N'1997-10-30T00:00:00.000' AS DateTime), N'1029 - 12th Ave. S.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10724, N'MEREP', CAST(N'1997-10-30T00:00:00.000' AS DateTime), N'43 rue St. Laurent')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10725, N'FAMIA', CAST(N'1997-10-31T00:00:00.000' AS DateTime), N'Rua Orós, 92')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10726, N'EASTC', CAST(N'1997-11-03T00:00:00.000' AS DateTime), N'35 King George')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10727, N'REGGC', CAST(N'1997-11-03T00:00:00.000' AS DateTime), N'Strada Provinciale 124')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10728, N'QUEEN', CAST(N'1997-11-04T00:00:00.000' AS DateTime), N'Alameda dos Canàrios, 891')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10729, N'LINOD', CAST(N'1997-11-04T00:00:00.000' AS DateTime), N'Ave. 5 de Mayo Porlamar')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10730, N'BONAP', CAST(N'1997-11-05T00:00:00.000' AS DateTime), N'12, rue des Bouchers')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10731, N'CHOPS', CAST(N'1997-11-06T00:00:00.000' AS DateTime), N'Hauptstr. 31')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10732, N'BONAP', CAST(N'1997-11-06T00:00:00.000' AS DateTime), N'12, rue des Bouchers')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10733, N'BERGS', CAST(N'1997-11-07T00:00:00.000' AS DateTime), N'Berguvsvägen  8')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10734, N'GOURL', CAST(N'1997-11-07T00:00:00.000' AS DateTime), N'Av. Brasil, 442')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10735, N'LETSS', CAST(N'1997-11-10T00:00:00.000' AS DateTime), N'87 Polk St. Suite 5')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10736, N'HUNGO', CAST(N'1997-11-11T00:00:00.000' AS DateTime), N'8 Johnstown Road')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10737, N'VINET', CAST(N'1997-11-11T00:00:00.000' AS DateTime), N'59 rue de l''Abbaye')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10738, N'SPECD', CAST(N'1997-11-12T00:00:00.000' AS DateTime), N'25, rue Lauriston')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10739, N'VINET', CAST(N'1997-11-12T00:00:00.000' AS DateTime), N'59 rue de l''Abbaye')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10740, N'WHITC', CAST(N'1997-11-13T00:00:00.000' AS DateTime), N'1029 - 12th Ave. S.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10741, N'AROUT', CAST(N'1997-11-14T00:00:00.000' AS DateTime), N'Brook Farm Stratford St. Mary')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10742, N'BOTTM', CAST(N'1997-11-14T00:00:00.000' AS DateTime), N'23 Tsawassen Blvd.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10743, N'AROUT', CAST(N'1997-11-17T00:00:00.000' AS DateTime), N'Brook Farm Stratford St. Mary')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10744, N'VAFFE', CAST(N'1997-11-17T00:00:00.000' AS DateTime), N'Smagsloget 45')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10745, N'QUICK', CAST(N'1997-11-18T00:00:00.000' AS DateTime), N'Taucherstraße 10')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10746, N'CHOPS', CAST(N'1997-11-19T00:00:00.000' AS DateTime), N'Hauptstr. 31')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10747, N'PICCO', CAST(N'1997-11-19T00:00:00.000' AS DateTime), N'Geislweg 14')
GO
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10748, N'SAVEA', CAST(N'1997-11-20T00:00:00.000' AS DateTime), N'187 Suffolk Ln.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10749, N'ISLAT', CAST(N'1997-11-20T00:00:00.000' AS DateTime), N'Garden House Crowther Way')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10750, N'WARTH', CAST(N'1997-11-21T00:00:00.000' AS DateTime), N'Torikatu 38')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10751, N'RICSU', CAST(N'1997-11-24T00:00:00.000' AS DateTime), N'Starenweg 5')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10752, N'NORTS', CAST(N'1997-11-24T00:00:00.000' AS DateTime), N'South House 300 Queensbridge')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10753, N'FRANS', CAST(N'1997-11-25T00:00:00.000' AS DateTime), N'Via Monte Bianco 34')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10754, N'MAGAA', CAST(N'1997-11-25T00:00:00.000' AS DateTime), N'Via Ludovico il Moro 22')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10755, N'BONAP', CAST(N'1997-11-26T00:00:00.000' AS DateTime), N'12, rue des Bouchers')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10756, N'SPLIR', CAST(N'1997-11-27T00:00:00.000' AS DateTime), N'P.O. Box 555')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10757, N'SAVEA', CAST(N'1997-11-27T00:00:00.000' AS DateTime), N'187 Suffolk Ln.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10758, N'RICSU', CAST(N'1997-11-28T00:00:00.000' AS DateTime), N'Starenweg 5')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10759, N'ANATR', CAST(N'1997-11-28T00:00:00.000' AS DateTime), N'Avda. de la Constitución 2222')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10760, N'MAISD', CAST(N'1997-12-01T00:00:00.000' AS DateTime), N'Rue Joseph-Bens 532')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10761, N'RATTC', CAST(N'1997-12-02T00:00:00.000' AS DateTime), N'2817 Milton Dr.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10762, N'FOLKO', CAST(N'1997-12-02T00:00:00.000' AS DateTime), N'Åkergatan 24')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10763, N'FOLIG', CAST(N'1997-12-03T00:00:00.000' AS DateTime), N'184, chaussée de Tournai')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10764, N'ERNSH', CAST(N'1997-12-03T00:00:00.000' AS DateTime), N'Kirchgasse 6')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10765, N'QUICK', CAST(N'1997-12-04T00:00:00.000' AS DateTime), N'Taucherstraße 10')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10766, N'OTTIK', CAST(N'1997-12-05T00:00:00.000' AS DateTime), N'Mehrheimerstr. 369')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10767, N'SUPRD', CAST(N'1997-12-05T00:00:00.000' AS DateTime), N'Boulevard Tirou, 255')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10768, N'AROUT', CAST(N'1997-12-08T00:00:00.000' AS DateTime), N'Brook Farm Stratford St. Mary')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10769, N'VAFFE', CAST(N'1997-12-08T00:00:00.000' AS DateTime), N'Smagsloget 45')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10770, N'HANAR', CAST(N'1997-12-09T00:00:00.000' AS DateTime), N'Rua do Paço, 67')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10771, N'ERNSH', CAST(N'1997-12-10T00:00:00.000' AS DateTime), N'Kirchgasse 6')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10772, N'LEHMS', CAST(N'1997-12-10T00:00:00.000' AS DateTime), N'Magazinweg 7')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10773, N'ERNSH', CAST(N'1997-12-11T00:00:00.000' AS DateTime), N'Kirchgasse 6')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10774, N'FOLKO', CAST(N'1997-12-11T00:00:00.000' AS DateTime), N'Åkergatan 24')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10775, N'THECR', CAST(N'1997-12-12T00:00:00.000' AS DateTime), N'55 Grizzly Peak Rd.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10776, N'ERNSH', CAST(N'1997-12-15T00:00:00.000' AS DateTime), N'Kirchgasse 6')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10777, N'GOURL', CAST(N'1997-12-15T00:00:00.000' AS DateTime), N'Av. Brasil, 442')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10778, N'BERGS', CAST(N'1997-12-16T00:00:00.000' AS DateTime), N'Berguvsvägen  8')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10779, N'MORGK', CAST(N'1997-12-16T00:00:00.000' AS DateTime), N'Heerstr. 22')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10780, N'LILAS', CAST(N'1997-12-16T00:00:00.000' AS DateTime), N'Carrera 52 con Ave. Bolívar #65-98 Llano Largo')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10781, N'WARTH', CAST(N'1997-12-17T00:00:00.000' AS DateTime), N'Torikatu 38')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10782, N'CACTU', CAST(N'1997-12-17T00:00:00.000' AS DateTime), N'Cerrito 333')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10783, N'HANAR', CAST(N'1997-12-18T00:00:00.000' AS DateTime), N'Rua do Paço, 67')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10784, N'MAGAA', CAST(N'1997-12-18T00:00:00.000' AS DateTime), N'Via Ludovico il Moro 22')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10785, N'GROSR', CAST(N'1997-12-18T00:00:00.000' AS DateTime), N'5ª Ave. Los Palos Grandes')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10786, N'QUEEN', CAST(N'1997-12-19T00:00:00.000' AS DateTime), N'Alameda dos Canàrios, 891')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10787, N'LAMAI', CAST(N'1997-12-19T00:00:00.000' AS DateTime), N'1 rue Alsace-Lorraine')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10788, N'QUICK', CAST(N'1997-12-22T00:00:00.000' AS DateTime), N'Taucherstraße 10')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10789, N'FOLIG', CAST(N'1997-12-22T00:00:00.000' AS DateTime), N'184, chaussée de Tournai')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10790, N'GOURL', CAST(N'1997-12-22T00:00:00.000' AS DateTime), N'Av. Brasil, 442')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10791, N'FRANK', CAST(N'1997-12-23T00:00:00.000' AS DateTime), N'Berliner Platz 43')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10792, N'WOLZA', CAST(N'1997-12-23T00:00:00.000' AS DateTime), N'ul. Filtrowa 68')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10793, N'AROUT', CAST(N'1997-12-24T00:00:00.000' AS DateTime), N'Brook Farm Stratford St. Mary')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10794, N'QUEDE', CAST(N'1997-12-24T00:00:00.000' AS DateTime), N'Rua da Panificadora, 12')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10795, N'ERNSH', CAST(N'1997-12-24T00:00:00.000' AS DateTime), N'Kirchgasse 6')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10796, N'HILAA', CAST(N'1997-12-25T00:00:00.000' AS DateTime), N'Carrera 22 con Ave. Carlos Soublette #8-35')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10797, N'DRACD', CAST(N'1997-12-25T00:00:00.000' AS DateTime), N'Walserweg 21')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10798, N'ISLAT', CAST(N'1997-12-26T00:00:00.000' AS DateTime), N'Garden House Crowther Way')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10799, N'KOENE', CAST(N'1997-12-26T00:00:00.000' AS DateTime), N'Maubelstr. 90')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10800, N'SEVES', CAST(N'1997-12-26T00:00:00.000' AS DateTime), N'90 Wadhurst Rd.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10801, N'BOLID', CAST(N'1997-12-29T00:00:00.000' AS DateTime), N'C/ Araquil, 67')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10802, N'SIMOB', CAST(N'1997-12-29T00:00:00.000' AS DateTime), N'Vinbæltet 34')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10803, N'WELLI', CAST(N'1997-12-30T00:00:00.000' AS DateTime), N'Rua do Mercado, 12')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10804, N'SEVES', CAST(N'1997-12-30T00:00:00.000' AS DateTime), N'90 Wadhurst Rd.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10805, N'THEBI', CAST(N'1997-12-30T00:00:00.000' AS DateTime), N'89 Jefferson Way Suite 2')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10806, N'VICTE', CAST(N'1997-12-31T00:00:00.000' AS DateTime), N'2, rue du Commerce')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10807, N'FRANS', CAST(N'1997-12-31T00:00:00.000' AS DateTime), N'Via Monte Bianco 34')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10808, N'OLDWO', CAST(N'1998-01-01T00:00:00.000' AS DateTime), N'2743 Bering St.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10809, N'WELLI', CAST(N'1998-01-01T00:00:00.000' AS DateTime), N'Rua do Mercado, 12')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10810, N'LAUGB', CAST(N'1998-01-01T00:00:00.000' AS DateTime), N'2319 Elm St.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10811, N'LINOD', CAST(N'1998-01-02T00:00:00.000' AS DateTime), N'Ave. 5 de Mayo Porlamar')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10812, N'REGGC', CAST(N'1998-01-02T00:00:00.000' AS DateTime), N'Strada Provinciale 124')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10813, N'RICAR', CAST(N'1998-01-05T00:00:00.000' AS DateTime), N'Av. Copacabana, 267')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10814, N'VICTE', CAST(N'1998-01-05T00:00:00.000' AS DateTime), N'2, rue du Commerce')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10815, N'SAVEA', CAST(N'1998-01-05T00:00:00.000' AS DateTime), N'187 Suffolk Ln.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10816, N'GREAL', CAST(N'1998-01-06T00:00:00.000' AS DateTime), N'2732 Baker Blvd.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10817, N'KOENE', CAST(N'1998-01-06T00:00:00.000' AS DateTime), N'Maubelstr. 90')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10818, N'MAGAA', CAST(N'1998-01-07T00:00:00.000' AS DateTime), N'Via Ludovico il Moro 22')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10819, N'CACTU', CAST(N'1998-01-07T00:00:00.000' AS DateTime), N'Cerrito 333')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10820, N'RATTC', CAST(N'1998-01-07T00:00:00.000' AS DateTime), N'2817 Milton Dr.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10821, N'SPLIR', CAST(N'1998-01-08T00:00:00.000' AS DateTime), N'P.O. Box 555')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10822, N'TRAIH', CAST(N'1998-01-08T00:00:00.000' AS DateTime), N'722 DaVinci Blvd.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10823, N'LILAS', CAST(N'1998-01-09T00:00:00.000' AS DateTime), N'Carrera 52 con Ave. Bolívar #65-98 Llano Largo')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10824, N'FOLKO', CAST(N'1998-01-09T00:00:00.000' AS DateTime), N'Åkergatan 24')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10825, N'DRACD', CAST(N'1998-01-09T00:00:00.000' AS DateTime), N'Walserweg 21')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10826, N'BLONP', CAST(N'1998-01-12T00:00:00.000' AS DateTime), N'24, place Kléber')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10827, N'BONAP', CAST(N'1998-01-12T00:00:00.000' AS DateTime), N'12, rue des Bouchers')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10828, N'RANCH', CAST(N'1998-01-13T00:00:00.000' AS DateTime), N'Av. del Libertador 900')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10829, N'ISLAT', CAST(N'1998-01-13T00:00:00.000' AS DateTime), N'Garden House Crowther Way')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10830, N'TRADH', CAST(N'1998-01-13T00:00:00.000' AS DateTime), N'Av. Inês de Castro, 414')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10831, N'SANTG', CAST(N'1998-01-14T00:00:00.000' AS DateTime), N'Erling Skakkes gate 78')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10832, N'LAMAI', CAST(N'1998-01-14T00:00:00.000' AS DateTime), N'1 rue Alsace-Lorraine')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10833, N'OTTIK', CAST(N'1998-01-15T00:00:00.000' AS DateTime), N'Mehrheimerstr. 369')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10834, N'TRADH', CAST(N'1998-01-15T00:00:00.000' AS DateTime), N'Av. Inês de Castro, 414')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10835, N'ALFKI', CAST(N'1998-01-15T00:00:00.000' AS DateTime), N'Obere Str. 57')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10836, N'ERNSH', CAST(N'1998-01-16T00:00:00.000' AS DateTime), N'Kirchgasse 6')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10837, N'BERGS', CAST(N'1998-01-16T00:00:00.000' AS DateTime), N'Berguvsvägen  8')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10838, N'LINOD', CAST(N'1998-01-19T00:00:00.000' AS DateTime), N'Ave. 5 de Mayo Porlamar')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10839, N'TRADH', CAST(N'1998-01-19T00:00:00.000' AS DateTime), N'Av. Inês de Castro, 414')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10840, N'LINOD', CAST(N'1998-01-19T00:00:00.000' AS DateTime), N'Ave. 5 de Mayo Porlamar')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10841, N'SUPRD', CAST(N'1998-01-20T00:00:00.000' AS DateTime), N'Boulevard Tirou, 255')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10842, N'TORTU', CAST(N'1998-01-20T00:00:00.000' AS DateTime), N'Avda. Azteca 123')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10843, N'VICTE', CAST(N'1998-01-21T00:00:00.000' AS DateTime), N'2, rue du Commerce')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10844, N'PICCO', CAST(N'1998-01-21T00:00:00.000' AS DateTime), N'Geislweg 14')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10845, N'QUICK', CAST(N'1998-01-21T00:00:00.000' AS DateTime), N'Taucherstraße 10')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10846, N'SUPRD', CAST(N'1998-01-22T00:00:00.000' AS DateTime), N'Boulevard Tirou, 255')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10847, N'SAVEA', CAST(N'1998-01-22T00:00:00.000' AS DateTime), N'187 Suffolk Ln.')
GO
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10848, N'CONSH', CAST(N'1998-01-23T00:00:00.000' AS DateTime), N'Berkeley Gardens 12  Brewery')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10849, N'KOENE', CAST(N'1998-01-23T00:00:00.000' AS DateTime), N'Maubelstr. 90')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10850, N'VICTE', CAST(N'1998-01-23T00:00:00.000' AS DateTime), N'2, rue du Commerce')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10851, N'RICAR', CAST(N'1998-01-26T00:00:00.000' AS DateTime), N'Av. Copacabana, 267')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10852, N'RATTC', CAST(N'1998-01-26T00:00:00.000' AS DateTime), N'2817 Milton Dr.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10853, N'BLAUS', CAST(N'1998-01-27T00:00:00.000' AS DateTime), N'Forsterstr. 57')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10854, N'ERNSH', CAST(N'1998-01-27T00:00:00.000' AS DateTime), N'Kirchgasse 6')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10855, N'OLDWO', CAST(N'1998-01-27T00:00:00.000' AS DateTime), N'2743 Bering St.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10856, N'ANTON', CAST(N'1998-01-28T00:00:00.000' AS DateTime), N'Mataderos  2312')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10857, N'BERGS', CAST(N'1998-01-28T00:00:00.000' AS DateTime), N'Berguvsvägen  8')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10858, N'LACOR', CAST(N'1998-01-29T00:00:00.000' AS DateTime), N'67, avenue de l''Europe')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10859, N'FRANK', CAST(N'1998-01-29T00:00:00.000' AS DateTime), N'Berliner Platz 43')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10860, N'FRANR', CAST(N'1998-01-29T00:00:00.000' AS DateTime), N'54, rue Royale')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10861, N'WHITC', CAST(N'1998-01-30T00:00:00.000' AS DateTime), N'1029 - 12th Ave. S.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10862, N'LEHMS', CAST(N'1998-01-30T00:00:00.000' AS DateTime), N'Magazinweg 7')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10863, N'HILAA', CAST(N'1998-02-02T00:00:00.000' AS DateTime), N'Carrera 22 con Ave. Carlos Soublette #8-35')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10864, N'AROUT', CAST(N'1998-02-02T00:00:00.000' AS DateTime), N'Brook Farm Stratford St. Mary')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10865, N'QUICK', CAST(N'1998-02-02T00:00:00.000' AS DateTime), N'Taucherstraße 10')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10866, N'BERGS', CAST(N'1998-02-03T00:00:00.000' AS DateTime), N'Berguvsvägen  8')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10867, N'LONEP', CAST(N'1998-02-03T00:00:00.000' AS DateTime), N'89 Chiaroscuro Rd.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10868, N'QUEEN', CAST(N'1998-02-04T00:00:00.000' AS DateTime), N'Alameda dos Canàrios, 891')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10869, N'SEVES', CAST(N'1998-02-04T00:00:00.000' AS DateTime), N'90 Wadhurst Rd.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10870, N'WOLZA', CAST(N'1998-02-04T00:00:00.000' AS DateTime), N'ul. Filtrowa 68')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10871, N'BONAP', CAST(N'1998-02-05T00:00:00.000' AS DateTime), N'12, rue des Bouchers')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10872, N'GODOS', CAST(N'1998-02-05T00:00:00.000' AS DateTime), N'C/ Romero, 33')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10873, N'WILMK', CAST(N'1998-02-06T00:00:00.000' AS DateTime), N'Keskuskatu 45')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10874, N'GODOS', CAST(N'1998-02-06T00:00:00.000' AS DateTime), N'C/ Romero, 33')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10875, N'BERGS', CAST(N'1998-02-06T00:00:00.000' AS DateTime), N'Berguvsvägen  8')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10876, N'BONAP', CAST(N'1998-02-09T00:00:00.000' AS DateTime), N'12, rue des Bouchers')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10877, N'RICAR', CAST(N'1998-02-09T00:00:00.000' AS DateTime), N'Av. Copacabana, 267')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10878, N'QUICK', CAST(N'1998-02-10T00:00:00.000' AS DateTime), N'Taucherstraße 10')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10879, N'WILMK', CAST(N'1998-02-10T00:00:00.000' AS DateTime), N'Keskuskatu 45')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10880, N'FOLKO', CAST(N'1998-02-10T00:00:00.000' AS DateTime), N'Åkergatan 24')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10881, N'CACTU', CAST(N'1998-02-11T00:00:00.000' AS DateTime), N'Cerrito 333')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10882, N'SAVEA', CAST(N'1998-02-11T00:00:00.000' AS DateTime), N'187 Suffolk Ln.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10883, N'LONEP', CAST(N'1998-02-12T00:00:00.000' AS DateTime), N'89 Chiaroscuro Rd.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10884, N'LETSS', CAST(N'1998-02-12T00:00:00.000' AS DateTime), N'87 Polk St. Suite 5')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10885, N'SUPRD', CAST(N'1998-02-12T00:00:00.000' AS DateTime), N'Boulevard Tirou, 255')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10886, N'HANAR', CAST(N'1998-02-13T00:00:00.000' AS DateTime), N'Rua do Paço, 67')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10887, N'GALED', CAST(N'1998-02-13T00:00:00.000' AS DateTime), N'Rambla de Cataluña, 23')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10888, N'GODOS', CAST(N'1998-02-16T00:00:00.000' AS DateTime), N'C/ Romero, 33')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10889, N'RATTC', CAST(N'1998-02-16T00:00:00.000' AS DateTime), N'2817 Milton Dr.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10890, N'DUMON', CAST(N'1998-02-16T00:00:00.000' AS DateTime), N'67, rue des Cinquante Otages')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10891, N'LEHMS', CAST(N'1998-02-17T00:00:00.000' AS DateTime), N'Magazinweg 7')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10892, N'MAISD', CAST(N'1998-02-17T00:00:00.000' AS DateTime), N'Rue Joseph-Bens 532')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10893, N'KOENE', CAST(N'1998-02-18T00:00:00.000' AS DateTime), N'Maubelstr. 90')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10894, N'SAVEA', CAST(N'1998-02-18T00:00:00.000' AS DateTime), N'187 Suffolk Ln.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10895, N'ERNSH', CAST(N'1998-02-18T00:00:00.000' AS DateTime), N'Kirchgasse 6')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10896, N'MAISD', CAST(N'1998-02-19T00:00:00.000' AS DateTime), N'Rue Joseph-Bens 532')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10897, N'HUNGO', CAST(N'1998-02-19T00:00:00.000' AS DateTime), N'8 Johnstown Road')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10898, N'OCEAN', CAST(N'1998-02-20T00:00:00.000' AS DateTime), N'Ing. Gustavo Moncada 8585 Piso 20-A')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10899, N'LILAS', CAST(N'1998-02-20T00:00:00.000' AS DateTime), N'Carrera 52 con Ave. Bolívar #65-98 Llano Largo')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10900, N'WELLI', CAST(N'1998-02-20T00:00:00.000' AS DateTime), N'Rua do Mercado, 12')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10901, N'HILAA', CAST(N'1998-02-23T00:00:00.000' AS DateTime), N'Carrera 22 con Ave. Carlos Soublette #8-35')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10902, N'FOLKO', CAST(N'1998-02-23T00:00:00.000' AS DateTime), N'Åkergatan 24')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10903, N'HANAR', CAST(N'1998-02-24T00:00:00.000' AS DateTime), N'Rua do Paço, 67')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10904, N'WHITC', CAST(N'1998-02-24T00:00:00.000' AS DateTime), N'1029 - 12th Ave. S.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10905, N'WELLI', CAST(N'1998-02-24T00:00:00.000' AS DateTime), N'Rua do Mercado, 12')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10906, N'WOLZA', CAST(N'1998-02-25T00:00:00.000' AS DateTime), N'ul. Filtrowa 68')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10907, N'SPECD', CAST(N'1998-02-25T00:00:00.000' AS DateTime), N'25, rue Lauriston')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10908, N'REGGC', CAST(N'1998-02-26T00:00:00.000' AS DateTime), N'Strada Provinciale 124')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10909, N'SANTG', CAST(N'1998-02-26T00:00:00.000' AS DateTime), N'Erling Skakkes gate 78')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10910, N'WILMK', CAST(N'1998-02-26T00:00:00.000' AS DateTime), N'Keskuskatu 45')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10911, N'GODOS', CAST(N'1998-02-26T00:00:00.000' AS DateTime), N'C/ Romero, 33')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10912, N'HUNGO', CAST(N'1998-02-26T00:00:00.000' AS DateTime), N'8 Johnstown Road')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10913, N'QUEEN', CAST(N'1998-02-26T00:00:00.000' AS DateTime), N'Alameda dos Canàrios, 891')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10914, N'QUEEN', CAST(N'1998-02-27T00:00:00.000' AS DateTime), N'Alameda dos Canàrios, 891')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10915, N'TORTU', CAST(N'1998-02-27T00:00:00.000' AS DateTime), N'Avda. Azteca 123')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10916, N'RANCH', CAST(N'1998-02-27T00:00:00.000' AS DateTime), N'Av. del Libertador 900')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10917, N'ROMEY', CAST(N'1998-03-02T00:00:00.000' AS DateTime), N'Gran Vía, 1')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10918, N'BOTTM', CAST(N'1998-03-02T00:00:00.000' AS DateTime), N'23 Tsawassen Blvd.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10919, N'LINOD', CAST(N'1998-03-02T00:00:00.000' AS DateTime), N'Ave. 5 de Mayo Porlamar')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10920, N'AROUT', CAST(N'1998-03-03T00:00:00.000' AS DateTime), N'Brook Farm Stratford St. Mary')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10921, N'VAFFE', CAST(N'1998-03-03T00:00:00.000' AS DateTime), N'Smagsloget 45')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10922, N'HANAR', CAST(N'1998-03-03T00:00:00.000' AS DateTime), N'Rua do Paço, 67')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10923, N'LAMAI', CAST(N'1998-03-03T00:00:00.000' AS DateTime), N'1 rue Alsace-Lorraine')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10924, N'BERGS', CAST(N'1998-03-04T00:00:00.000' AS DateTime), N'Berguvsvägen  8')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10925, N'HANAR', CAST(N'1998-03-04T00:00:00.000' AS DateTime), N'Rua do Paço, 67')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10926, N'ANATR', CAST(N'1998-03-04T00:00:00.000' AS DateTime), N'Avda. de la Constitución 2222')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10927, N'LACOR', CAST(N'1998-03-05T00:00:00.000' AS DateTime), N'67, avenue de l''Europe')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10928, N'GALED', CAST(N'1998-03-05T00:00:00.000' AS DateTime), N'Rambla de Cataluña, 23')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10929, N'FRANK', CAST(N'1998-03-05T00:00:00.000' AS DateTime), N'Berliner Platz 43')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10930, N'SUPRD', CAST(N'1998-03-06T00:00:00.000' AS DateTime), N'Boulevard Tirou, 255')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10931, N'RICSU', CAST(N'1998-03-06T00:00:00.000' AS DateTime), N'Starenweg 5')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10932, N'BONAP', CAST(N'1998-03-06T00:00:00.000' AS DateTime), N'12, rue des Bouchers')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10933, N'ISLAT', CAST(N'1998-03-06T00:00:00.000' AS DateTime), N'Garden House Crowther Way')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10934, N'LEHMS', CAST(N'1998-03-09T00:00:00.000' AS DateTime), N'Magazinweg 7')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10935, N'WELLI', CAST(N'1998-03-09T00:00:00.000' AS DateTime), N'Rua do Mercado, 12')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10936, N'GREAL', CAST(N'1998-03-09T00:00:00.000' AS DateTime), N'2732 Baker Blvd.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10937, N'CACTU', CAST(N'1998-03-10T00:00:00.000' AS DateTime), N'Cerrito 333')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10938, N'QUICK', CAST(N'1998-03-10T00:00:00.000' AS DateTime), N'Taucherstraße 10')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10939, N'MAGAA', CAST(N'1998-03-10T00:00:00.000' AS DateTime), N'Via Ludovico il Moro 22')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10940, N'BONAP', CAST(N'1998-03-11T00:00:00.000' AS DateTime), N'12, rue des Bouchers')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10941, N'SAVEA', CAST(N'1998-03-11T00:00:00.000' AS DateTime), N'187 Suffolk Ln.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10942, N'REGGC', CAST(N'1998-03-11T00:00:00.000' AS DateTime), N'Strada Provinciale 124')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10943, N'BSBEV', CAST(N'1998-03-11T00:00:00.000' AS DateTime), N'Fauntleroy Circus')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10944, N'BOTTM', CAST(N'1998-03-12T00:00:00.000' AS DateTime), N'23 Tsawassen Blvd.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10945, N'MORGK', CAST(N'1998-03-12T00:00:00.000' AS DateTime), N'Heerstr. 22')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10946, N'VAFFE', CAST(N'1998-03-12T00:00:00.000' AS DateTime), N'Smagsloget 45')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10947, N'BSBEV', CAST(N'1998-03-13T00:00:00.000' AS DateTime), N'Fauntleroy Circus')
GO
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10948, N'GODOS', CAST(N'1998-03-13T00:00:00.000' AS DateTime), N'C/ Romero, 33')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10949, N'BOTTM', CAST(N'1998-03-13T00:00:00.000' AS DateTime), N'23 Tsawassen Blvd.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10950, N'MAGAA', CAST(N'1998-03-16T00:00:00.000' AS DateTime), N'Via Ludovico il Moro 22')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10951, N'RICSU', CAST(N'1998-03-16T00:00:00.000' AS DateTime), N'Starenweg 5')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10952, N'ALFKI', CAST(N'1998-03-16T00:00:00.000' AS DateTime), N'Obere Str. 57')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10953, N'AROUT', CAST(N'1998-03-16T00:00:00.000' AS DateTime), N'Brook Farm Stratford St. Mary')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10954, N'LINOD', CAST(N'1998-03-17T00:00:00.000' AS DateTime), N'Ave. 5 de Mayo Porlamar')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10955, N'FOLKO', CAST(N'1998-03-17T00:00:00.000' AS DateTime), N'Åkergatan 24')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10956, N'BLAUS', CAST(N'1998-03-17T00:00:00.000' AS DateTime), N'Forsterstr. 57')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10957, N'HILAA', CAST(N'1998-03-18T00:00:00.000' AS DateTime), N'Carrera 22 con Ave. Carlos Soublette #8-35')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10958, N'OCEAN', CAST(N'1998-03-18T00:00:00.000' AS DateTime), N'Ing. Gustavo Moncada 8585 Piso 20-A')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10959, N'GOURL', CAST(N'1998-03-18T00:00:00.000' AS DateTime), N'Av. Brasil, 442')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10960, N'HILAA', CAST(N'1998-03-19T00:00:00.000' AS DateTime), N'Carrera 22 con Ave. Carlos Soublette #8-35')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10961, N'QUEEN', CAST(N'1998-03-19T00:00:00.000' AS DateTime), N'Alameda dos Canàrios, 891')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10962, N'QUICK', CAST(N'1998-03-19T00:00:00.000' AS DateTime), N'Taucherstraße 10')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10963, N'FURIB', CAST(N'1998-03-19T00:00:00.000' AS DateTime), N'Jardim das rosas n. 32')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10964, N'SPECD', CAST(N'1998-03-20T00:00:00.000' AS DateTime), N'25, rue Lauriston')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10965, N'OLDWO', CAST(N'1998-03-20T00:00:00.000' AS DateTime), N'2743 Bering St.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10966, N'CHOPS', CAST(N'1998-03-20T00:00:00.000' AS DateTime), N'Hauptstr. 31')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10967, N'TOMSP', CAST(N'1998-03-23T00:00:00.000' AS DateTime), N'Luisenstr. 48')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10968, N'ERNSH', CAST(N'1998-03-23T00:00:00.000' AS DateTime), N'Kirchgasse 6')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10969, N'COMMI', CAST(N'1998-03-23T00:00:00.000' AS DateTime), N'Av. dos Lusíadas, 23')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10970, N'BOLID', CAST(N'1998-03-24T00:00:00.000' AS DateTime), N'C/ Araquil, 67')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10971, N'FRANR', CAST(N'1998-03-24T00:00:00.000' AS DateTime), N'54, rue Royale')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10972, N'LACOR', CAST(N'1998-03-24T00:00:00.000' AS DateTime), N'67, avenue de l''Europe')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10973, N'LACOR', CAST(N'1998-03-24T00:00:00.000' AS DateTime), N'67, avenue de l''Europe')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10974, N'SPLIR', CAST(N'1998-03-25T00:00:00.000' AS DateTime), N'P.O. Box 555')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10975, N'BOTTM', CAST(N'1998-03-25T00:00:00.000' AS DateTime), N'23 Tsawassen Blvd.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10976, N'HILAA', CAST(N'1998-03-25T00:00:00.000' AS DateTime), N'Carrera 22 con Ave. Carlos Soublette #8-35')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10977, N'FOLKO', CAST(N'1998-03-26T00:00:00.000' AS DateTime), N'Åkergatan 24')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10978, N'MAISD', CAST(N'1998-03-26T00:00:00.000' AS DateTime), N'Rue Joseph-Bens 532')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10979, N'ERNSH', CAST(N'1998-03-26T00:00:00.000' AS DateTime), N'Kirchgasse 6')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10980, N'FOLKO', CAST(N'1998-03-27T00:00:00.000' AS DateTime), N'Åkergatan 24')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10981, N'HANAR', CAST(N'1998-03-27T00:00:00.000' AS DateTime), N'Rua do Paço, 67')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10982, N'BOTTM', CAST(N'1998-03-27T00:00:00.000' AS DateTime), N'23 Tsawassen Blvd.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10983, N'SAVEA', CAST(N'1998-03-27T00:00:00.000' AS DateTime), N'187 Suffolk Ln.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10984, N'SAVEA', CAST(N'1998-03-30T00:00:00.000' AS DateTime), N'187 Suffolk Ln.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10985, N'HUNGO', CAST(N'1998-03-30T00:00:00.000' AS DateTime), N'8 Johnstown Road')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10986, N'OCEAN', CAST(N'1998-03-30T00:00:00.000' AS DateTime), N'Ing. Gustavo Moncada 8585 Piso 20-A')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10987, N'EASTC', CAST(N'1998-03-31T00:00:00.000' AS DateTime), N'35 King George')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10988, N'RATTC', CAST(N'1998-03-31T00:00:00.000' AS DateTime), N'2817 Milton Dr.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10989, N'QUEDE', CAST(N'1998-03-31T00:00:00.000' AS DateTime), N'Rua da Panificadora, 12')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10990, N'ERNSH', CAST(N'1998-04-01T00:00:00.000' AS DateTime), N'Kirchgasse 6')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10991, N'QUICK', CAST(N'1998-04-01T00:00:00.000' AS DateTime), N'Taucherstraße 10')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10992, N'THEBI', CAST(N'1998-04-01T00:00:00.000' AS DateTime), N'89 Jefferson Way Suite 2')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10993, N'FOLKO', CAST(N'1998-04-01T00:00:00.000' AS DateTime), N'Åkergatan 24')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10994, N'VAFFE', CAST(N'1998-04-02T00:00:00.000' AS DateTime), N'Smagsloget 45')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10995, N'PERIC', CAST(N'1998-04-02T00:00:00.000' AS DateTime), N'Calle Dr. Jorge Cash 321')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10996, N'QUICK', CAST(N'1998-04-02T00:00:00.000' AS DateTime), N'Taucherstraße 10')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10997, N'LILAS', CAST(N'1998-04-03T00:00:00.000' AS DateTime), N'Carrera 52 con Ave. Bolívar #65-98 Llano Largo')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10998, N'WOLZA', CAST(N'1998-04-03T00:00:00.000' AS DateTime), N'ul. Filtrowa 68')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10999, N'OTTIK', CAST(N'1998-04-03T00:00:00.000' AS DateTime), N'Mehrheimerstr. 369')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11000, N'RATTC', CAST(N'1998-04-06T00:00:00.000' AS DateTime), N'2817 Milton Dr.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11001, N'FOLKO', CAST(N'1998-04-06T00:00:00.000' AS DateTime), N'Åkergatan 24')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11002, N'SAVEA', CAST(N'1998-04-06T00:00:00.000' AS DateTime), N'187 Suffolk Ln.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11003, N'THECR', CAST(N'1998-04-06T00:00:00.000' AS DateTime), N'55 Grizzly Peak Rd.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11004, N'MAISD', CAST(N'1998-04-07T00:00:00.000' AS DateTime), N'Rue Joseph-Bens 532')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11005, N'WILMK', CAST(N'1998-04-07T00:00:00.000' AS DateTime), N'Keskuskatu 45')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11006, N'GREAL', CAST(N'1998-04-07T00:00:00.000' AS DateTime), N'2732 Baker Blvd.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11007, N'PRINI', CAST(N'1998-04-08T00:00:00.000' AS DateTime), N'Estrada da saúde n. 58')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11008, N'ERNSH', CAST(N'1998-04-08T00:00:00.000' AS DateTime), N'Kirchgasse 6')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11009, N'GODOS', CAST(N'1998-04-08T00:00:00.000' AS DateTime), N'C/ Romero, 33')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11010, N'REGGC', CAST(N'1998-04-09T00:00:00.000' AS DateTime), N'Strada Provinciale 124')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11011, N'ALFKI', CAST(N'1998-04-09T00:00:00.000' AS DateTime), N'Obere Str. 57')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11012, N'FRANK', CAST(N'1998-04-09T00:00:00.000' AS DateTime), N'Berliner Platz 43')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11013, N'ROMEY', CAST(N'1998-04-09T00:00:00.000' AS DateTime), N'Gran Vía, 1')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11014, N'LINOD', CAST(N'1998-04-10T00:00:00.000' AS DateTime), N'Ave. 5 de Mayo Porlamar')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11015, N'SANTG', CAST(N'1998-04-10T00:00:00.000' AS DateTime), N'Erling Skakkes gate 78')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11016, N'AROUT', CAST(N'1998-04-10T00:00:00.000' AS DateTime), N'Brook Farm Stratford St. Mary')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11017, N'ERNSH', CAST(N'1998-04-13T00:00:00.000' AS DateTime), N'Kirchgasse 6')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11018, N'LONEP', CAST(N'1998-04-13T00:00:00.000' AS DateTime), N'89 Chiaroscuro Rd.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11019, N'RANCH', CAST(N'1998-04-13T00:00:00.000' AS DateTime), N'Av. del Libertador 900')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11020, N'OTTIK', CAST(N'1998-04-14T00:00:00.000' AS DateTime), N'Mehrheimerstr. 369')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11021, N'QUICK', CAST(N'1998-04-14T00:00:00.000' AS DateTime), N'Taucherstraße 10')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11022, N'HANAR', CAST(N'1998-04-14T00:00:00.000' AS DateTime), N'Rua do Paço, 67')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11023, N'BSBEV', CAST(N'1998-04-14T00:00:00.000' AS DateTime), N'Fauntleroy Circus')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11024, N'EASTC', CAST(N'1998-04-15T00:00:00.000' AS DateTime), N'35 King George')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11025, N'WARTH', CAST(N'1998-04-15T00:00:00.000' AS DateTime), N'Torikatu 38')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11026, N'FRANS', CAST(N'1998-04-15T00:00:00.000' AS DateTime), N'Via Monte Bianco 34')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11027, N'BOTTM', CAST(N'1998-04-16T00:00:00.000' AS DateTime), N'23 Tsawassen Blvd.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11028, N'KOENE', CAST(N'1998-04-16T00:00:00.000' AS DateTime), N'Maubelstr. 90')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11029, N'CHOPS', CAST(N'1998-04-16T00:00:00.000' AS DateTime), N'Hauptstr. 31')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11030, N'SAVEA', CAST(N'1998-04-17T00:00:00.000' AS DateTime), N'187 Suffolk Ln.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11031, N'SAVEA', CAST(N'1998-04-17T00:00:00.000' AS DateTime), N'187 Suffolk Ln.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11032, N'WHITC', CAST(N'1998-04-17T00:00:00.000' AS DateTime), N'1029 - 12th Ave. S.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11033, N'RICSU', CAST(N'1998-04-17T00:00:00.000' AS DateTime), N'Starenweg 5')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11034, N'OLDWO', CAST(N'1998-04-20T00:00:00.000' AS DateTime), N'2743 Bering St.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11035, N'SUPRD', CAST(N'1998-04-20T00:00:00.000' AS DateTime), N'Boulevard Tirou, 255')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11036, N'DRACD', CAST(N'1998-04-20T00:00:00.000' AS DateTime), N'Walserweg 21')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11037, N'GODOS', CAST(N'1998-04-21T00:00:00.000' AS DateTime), N'C/ Romero, 33')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11038, N'SUPRD', CAST(N'1998-04-21T00:00:00.000' AS DateTime), N'Boulevard Tirou, 255')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11039, N'LINOD', CAST(N'1998-04-21T00:00:00.000' AS DateTime), N'Ave. 5 de Mayo Porlamar')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11040, N'GREAL', CAST(N'1998-04-22T00:00:00.000' AS DateTime), N'2732 Baker Blvd.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11041, N'CHOPS', CAST(N'1998-04-22T00:00:00.000' AS DateTime), N'Hauptstr. 31')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11042, N'COMMI', CAST(N'1998-04-22T00:00:00.000' AS DateTime), N'Av. dos Lusíadas, 23')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11043, N'SPECD', CAST(N'1998-04-22T00:00:00.000' AS DateTime), N'25, rue Lauriston')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11044, N'WOLZA', CAST(N'1998-04-23T00:00:00.000' AS DateTime), N'ul. Filtrowa 68')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11045, N'BOTTM', CAST(N'1998-04-23T00:00:00.000' AS DateTime), N'23 Tsawassen Blvd.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11046, N'WANDK', CAST(N'1998-04-23T00:00:00.000' AS DateTime), N'Adenauerallee 900')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11047, N'EASTC', CAST(N'1998-04-24T00:00:00.000' AS DateTime), N'35 King George')
GO
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11048, N'BOTTM', CAST(N'1998-04-24T00:00:00.000' AS DateTime), N'23 Tsawassen Blvd.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11049, N'GOURL', CAST(N'1998-04-24T00:00:00.000' AS DateTime), N'Av. Brasil, 442')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11050, N'FOLKO', CAST(N'1998-04-27T00:00:00.000' AS DateTime), N'Åkergatan 24')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11051, N'LAMAI', CAST(N'1998-04-27T00:00:00.000' AS DateTime), N'1 rue Alsace-Lorraine')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11052, N'HANAR', CAST(N'1998-04-27T00:00:00.000' AS DateTime), N'Rua do Paço, 67')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11053, N'PICCO', CAST(N'1998-04-27T00:00:00.000' AS DateTime), N'Geislweg 14')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11054, N'CACTU', CAST(N'1998-04-28T00:00:00.000' AS DateTime), N'Cerrito 333')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11055, N'HILAA', CAST(N'1998-04-28T00:00:00.000' AS DateTime), N'Carrera 22 con Ave. Carlos Soublette #8-35')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11056, N'EASTC', CAST(N'1998-04-28T00:00:00.000' AS DateTime), N'35 King George')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11057, N'NORTS', CAST(N'1998-04-29T00:00:00.000' AS DateTime), N'South House 300 Queensbridge')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11058, N'BLAUS', CAST(N'1998-04-29T00:00:00.000' AS DateTime), N'Forsterstr. 57')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11059, N'RICAR', CAST(N'1998-04-29T00:00:00.000' AS DateTime), N'Av. Copacabana, 267')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11060, N'FRANS', CAST(N'1998-04-30T00:00:00.000' AS DateTime), N'Via Monte Bianco 34')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11061, N'GREAL', CAST(N'1998-04-30T00:00:00.000' AS DateTime), N'2732 Baker Blvd.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11062, N'REGGC', CAST(N'1998-04-30T00:00:00.000' AS DateTime), N'Strada Provinciale 124')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11063, N'HUNGO', CAST(N'1998-04-30T00:00:00.000' AS DateTime), N'8 Johnstown Road')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11064, N'SAVEA', CAST(N'1998-05-01T00:00:00.000' AS DateTime), N'187 Suffolk Ln.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11065, N'LILAS', CAST(N'1998-05-01T00:00:00.000' AS DateTime), N'Carrera 52 con Ave. Bolívar #65-98 Llano Largo')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11066, N'WHITC', CAST(N'1998-05-01T00:00:00.000' AS DateTime), N'1029 - 12th Ave. S.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11067, N'DRACD', CAST(N'1998-05-04T00:00:00.000' AS DateTime), N'Walserweg 21')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11068, N'QUEEN', CAST(N'1998-05-04T00:00:00.000' AS DateTime), N'Alameda dos Canàrios, 891')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11069, N'TORTU', CAST(N'1998-05-04T00:00:00.000' AS DateTime), N'Avda. Azteca 123')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11070, N'LEHMS', CAST(N'1998-05-05T00:00:00.000' AS DateTime), N'Magazinweg 7')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11071, N'LILAS', CAST(N'1998-05-05T00:00:00.000' AS DateTime), N'Carrera 52 con Ave. Bolívar #65-98 Llano Largo')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11072, N'ERNSH', CAST(N'1998-05-05T00:00:00.000' AS DateTime), N'Kirchgasse 6')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11073, N'PERIC', CAST(N'1998-05-05T00:00:00.000' AS DateTime), N'Calle Dr. Jorge Cash 321')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11074, N'SIMOB', CAST(N'1998-05-06T00:00:00.000' AS DateTime), N'Vinbæltet 34')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11075, N'RICSU', CAST(N'1998-05-06T00:00:00.000' AS DateTime), N'Starenweg 5')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11076, N'BONAP', CAST(N'1998-05-06T00:00:00.000' AS DateTime), N'12, rue des Bouchers')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11077, N'RATTC', CAST(N'1998-05-06T00:00:00.000' AS DateTime), N'2817 Milton Dr.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11200, N'director', CAST(N'2020-08-25T00:00:00.000' AS DateTime), N'Công cha như núi Thái sơn')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11205, N'staff', CAST(N'2021-03-11T00:00:00.000' AS DateTime), N'Shipping Address:')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11206, N'staff', CAST(N'2021-03-11T00:00:00.000' AS DateTime), N'Shipping Address:')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11207, N'staff', CAST(N'2021-03-11T00:00:00.000' AS DateTime), N'Shipping Address:')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11208, N'staff', CAST(N'2021-03-11T00:00:00.000' AS DateTime), N'Shipping Address:')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11209, N'staff', CAST(N'2021-03-11T00:00:00.000' AS DateTime), N'Shipping Address:')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11210, N'staff', CAST(N'2021-03-11T00:00:00.000' AS DateTime), N'ORDER PURCHASING')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11211, N'staff', CAST(N'2021-03-11T00:00:00.000' AS DateTime), N'ORDER PURCHASING')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11212, N'staff', CAST(N'2021-03-11T00:00:00.000' AS DateTime), N'Shipping Address:')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11213, N'staff', CAST(N'2021-03-11T00:00:00.000' AS DateTime), N'Shipping Address: 123')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (21205, N'staff', CAST(N'2021-03-12T00:00:00.000' AS DateTime), N'Shipping Address:')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (21206, N'director', CAST(N'2021-03-12T00:00:00.000' AS DateTime), N'Shipping Address:')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (21207, N'director', CAST(N'2021-03-12T00:00:00.000' AS DateTime), N'ORDER PURCHASING')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (21208, N'director', CAST(N'2021-03-12T00:00:00.000' AS DateTime), N'Công cha như núi thái sơn
Nghĩa mẹ như nước trong nguồn chảy ra')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (21209, N'director', CAST(N'2021-03-12T00:00:00.000' AS DateTime), N'© 2021 by FPT Polytechnic. All rights reserved.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (31205, N'staff', CAST(N'2021-03-13T00:00:00.000' AS DateTime), N'Shipping Address:')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (31206, N'staff', CAST(N'2021-03-13T00:00:00.000' AS DateTime), N'Mishi Kobe Niku')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (31207, N'director', CAST(N'2021-03-13T00:00:00.000' AS DateTime), N'Shipping Address:')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (41205, N'staff', CAST(N'2021-03-15T00:00:00.000' AS DateTime), N'Shipping Address:')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (41206, N'staff', CAST(N'2021-03-15T00:00:00.000' AS DateTime), N'Shipping Address:')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (41208, N'staff', CAST(N'2021-03-15T00:00:00.000' AS DateTime), N'Shipping Address:')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (51205, N'director', CAST(N'2021-03-16T00:00:00.000' AS DateTime), N'Shipping Address:')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (61205, N'customer', CAST(N'2021-03-16T00:00:00.000' AS DateTime), N'Shipping Address:')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (71205, N'customer', CAST(N'2021-03-16T00:00:00.000' AS DateTime), N'778/B1 Nguyễn Kiệm, F.4 Q.Tân Phú, HCM')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (71206, N'director', CAST(N'2021-03-17T00:00:00.000' AS DateTime), N'© 2021 by FPT Polytechnic. All rights reserved.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (81206, N'customer', CAST(N'2021-03-17T00:00:00.000' AS DateTime), N'© 2021 by FPT Polytechnic. All rights reserved.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (81207, N'customer', CAST(N'2021-03-17T00:00:00.000' AS DateTime), N'© 2021 by FPT Polytechnic. All rights reserved.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (81208, N'director', CAST(N'2021-03-17T00:00:00.000' AS DateTime), N'Shipping Address')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (81209, N'director', CAST(N'2021-03-17T00:00:00.000' AS DateTime), N'Shipping Address:')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (81210, N'staff', CAST(N'2021-03-17T00:00:00.000' AS DateTime), N'Shipping Address:')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (81211, N'staff', CAST(N'2021-03-17T00:00:00.000' AS DateTime), N'© 2021 by FPT Polytechnic. All rights reserved.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (81212, N'staff', CAST(N'2021-03-17T00:00:00.000' AS DateTime), N'© 2021 by FPT Polytechnic. All rights reserved.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (91205, N'customer', CAST(N'2021-03-22T00:00:00.000' AS DateTime), N'Shipping Address:')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (101205, N'customer', CAST(N'2021-03-22T00:00:00.000' AS DateTime), N'2021 by FPT Polytechnic. All rights reserved.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (111205, N'customer', CAST(N'2021-03-23T00:00:00.000' AS DateTime), N'FPT Polytechnic © 2021. All rights reserved.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (111206, N'customer', CAST(N'2021-03-23T00:00:00.000' AS DateTime), N'FPT Polytechnic © 2021. All rights reserved.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (121205, N'staff', CAST(N'2021-04-05T00:00:00.000' AS DateTime), N'© 2021 by FPT Polytechnic. All rights reserved.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (121206, N'staff', CAST(N'2021-04-05T00:00:00.000' AS DateTime), N'© 2021 by FPT Polytechnic. All rights reserved.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (121207, N'dat', CAST(N'2023-08-12T00:00:00.000' AS DateTime), N'')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (121208, N'dat', CAST(N'2023-08-13T00:00:00.000' AS DateTime), N'tay thanh')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (121209, N'dat', CAST(N'2023-08-13T00:00:00.000' AS DateTime), N'tay thanh')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (121210, N'dat', CAST(N'2023-08-13T00:00:00.000' AS DateTime), N'tay thanh')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (121211, N'dat1', CAST(N'2023-08-13T00:00:00.000' AS DateTime), N'tây ninh')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (121212, N'staff', CAST(N'2023-08-15T00:00:00.000' AS DateTime), N'tay thanh')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (121213, N'dat', CAST(N'2023-08-16T00:00:00.000' AS DateTime), N'tay thanh')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (121214, N'staff', CAST(N'2023-08-16T00:00:00.000' AS DateTime), N'tay thanh')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (121215, N'dat', CAST(N'2023-10-29T00:00:00.000' AS DateTime), N'tay thanh')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (121216, N'staff', CAST(N'2023-11-05T00:00:00.000' AS DateTime), N'tay thanh')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (121217, N'dat', CAST(N'2023-11-05T00:00:00.000' AS DateTime), N'')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (121218, N'dat', CAST(N'2023-11-05T00:00:00.000' AS DateTime), N'')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (121219, N'staff', CAST(N'2023-11-05T00:00:00.000' AS DateTime), N'')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (121220, N'dat', CAST(N'2023-11-18T00:00:00.000' AS DateTime), N'tay thanh')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (121221, N'dat', CAST(N'2023-11-18T00:00:00.000' AS DateTime), N'tây ninh')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (121222, N'staff', CAST(N'2023-11-23T00:00:00.000' AS DateTime), N'tay thanh')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (121223, N'staff', CAST(N'2023-11-23T00:00:00.000' AS DateTime), N'')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (121224, N'dat', CAST(N'2023-11-26T00:00:00.000' AS DateTime), N'')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (121225, N'dat', CAST(N'2023-11-26T00:00:00.000' AS DateTime), N'')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (121226, N'dat', CAST(N'2023-11-26T00:00:00.000' AS DateTime), N'')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (121227, N'dat', CAST(N'2023-11-26T00:00:00.000' AS DateTime), N'')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (121228, N'dat', CAST(N'2023-11-26T00:00:00.000' AS DateTime), N'')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (121229, N'dat', CAST(N'2023-11-26T00:00:00.000' AS DateTime), N'')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (121230, N'dat', CAST(N'2023-11-26T00:00:00.000' AS DateTime), N'')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (121231, N'dat', CAST(N'2023-11-26T00:00:00.000' AS DateTime), N'')
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1001, N'Uống Cafe Trên Đường Của Vũ', N'1001.jpg', N'NXB Hội Nhà Văn', N'Trần Tuấn', 78000, CAST(N'1980-03-29' AS Date), 0, N'1000', N'1001_1.jpg', N'Cuốn sách tựa những hành trình dài của tác giả Trần Tuấn trên mọi miền đất nước, và cả nước ngoài.  Ấy là những miền đất mà ông đã đi qua, đã cảm, đã ngấm cái chất của vùng. Con người nơi miền đất ấy, câu chuyện nơi những mảnh đất ấy ngấm vào lời văn của ông một cách tự nhiên, bình dị. Và rồi chúng trở thành những miền tâm tưởng.
Một chuyến hành trình tưởng như bất tận. Để rồi đến cuối cùng Trần Tuấn, hay thậm chí cả người đọc mới vỡ ra.
', 24)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1002, N'Hạt Nắng Bồ Đề', N'1002.jpg', N'NXB Lao Động', N'Văn Công Tuấn', 89000, CAST(N'1980-03-29' AS Date), 0, N'1000', N'1002_1.jpg', N'Tôi luôn tin tưởng sâu sắc vào lý nhân duyên. Mười lăm bài tản văn trong tập sách này có được là nhờ những duyên lành sau một chuyến hành hương huân tu tại Ấn Độ. Cũng có thể gọi là du ký hay ký sự hành hương.
Số là trong một khóa tu Phật thất ở chùa Bảo Quang Hamburg, khi đang niệm Phật và lạy sám hối, tôi chợt nảy ra ý tưởng rằng, kỳ nghỉ năm tới sẽ không đi du lịch mà phải đi đến Bồ Đề Đạo Tràng. Giờ nghỉ trưa, tôi gọi điện cho người bạn đời và cắt nghĩa là chúng tôi cần một không gian như thế để tập trung tâm ý vào việc tu tập. Tuy bất ngờ nhưng ý kiến được hoan nghênh ngay. Tôi cũng mừng là mọi việc trôi chảy nhanh chóng.
', 39)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1003, N'Hoàng Đế', N'1003.jpg', N'NXB Lao Động', N'Ryszard Kapuściński', 79000, CAST(N'1980-03-29' AS Date), 0, N'1000', N'1003_1.jpg', N'Hoàng ĐếHoàng đế là cuốn sách không chỉ mở đầu sự nghiệp quốc tế của phóng sự gia tầm cỡ nhất Ba Lan, mà còn đưa thể loại phóng sự lên ngang tầm văn học cao cấp.Thể loại văn học rất đặc thù, hay gọi cách khác là viết theo văn phong báo chí, hoặc phóng sự, đã trở thành dấu hiệu nhận biết nhà thơ, nhà văn và nhà du hành Ba Lan Ryszard Kapuściński. Chắc hẳn bản thân Ryszard Kapuściński cũng không hề nghĩ rằng chính phóng sự đã cho ông cơ hội đi đến hầu như khắp nơi trên thế giới, đem lại cho ông danh tiếng quốc tế và một vị thế rất uy tín đối với các thế hệ nhà văn, nhà báo kế tiếp ông. Đã mười năm trôi qua kể từ ngày Ryszard Kapuściński ra đi, nhưng ông vẫn là nhà văn có tác phẩm được dịch và xuất bản ra nhiều ngôn ngữ khác nhau trên thế giới. Những phóng sự viết từ những năm 60 hay 70 của thế kỷ XX không hề mất đi tính thời sự của chúng, còn ngôn ngữ dùng để sáng tạo ra chúng thì vẫn rất hấp dẫn, thôi miên và kích thích trí tưởng tượng của đông đảo bạn đọc.', 50)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1004, N'Mang San Hà Đổi Lấy Duy Nhất Một Người Thương', N'1004.jpg', N'NXB Lao Động', N'Nồng Nàn Phố', 99000, CAST(N'1980-03-29' AS Date), 0, N'1000', N'1004_1.jpg', N'Trở lại sau Anh ngủ thêm đi em phải dậy lấy chồng và Yêu lần nào cũng đau; Mang san hà đổi lấy duy nhất một người thương là tập thơ thứ ba của Nồng Nàn Phố ra mắt bạn đọc sau một thời gian dài vắng bóng.
Vẫn là những câu thơ giản dị đi vào lòng người, không câu chữ thừa, không gò ép vần vèo, không theo một quy luật cấu tứ phức tạp nào cả… thơ Phố nhẹ nhàng như một bài viết tâm tình kể chuyện. Mạnh dạn trong cách sử dụng hình ảnh bình dị đời thường, Phố viết những câu chuyện xảy ra xung quanhmình bằng một cái nhìn rất mới, rất táo bạo nhưng cũng rất sống động, gần gũi. Thơ Phố đọc như không đọc, cảm như không cảm nhưng lại chạm đến tim gan của tất cả mọi người.
Phố viết thơ từ những câu chuyện của những người xung quanh cô vì thế tình yêu trong thơ Phố cũng chân phương, ngọt ngào, tha thiết dốc hết gan ruột như bất kỳ người phụ nữ nào trên cõi đời này. Mang san hà đổi lấy lấy duy nhất một người thương, nhìn tiêu đề, có người sẽ bảo sao giống Mỵ Châu, tình yêu mù quáng để trên đầu vậy, nhưng không, phụ nữ là vậy, đôi khi chỉ cần một người quan tâm mình, yêu thương mình là đủ đổi hết cả san hà, và với người phụ nữ trong tình yêu, luôn si mê đến khờ dại như vậy đó?
Với một giọng thơ dạn dĩ nồng nàn nhưng luôn trăn trở, suy tư,  Thơ của Phố là thơ của người đàn bà viết thơ, trong thơ không chỉ có tình mà có cả ngọt, đắng cùng tâm tình phụ nữ.
', 11)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1005, N'Uống Dòng Suối Núi', N'1005.jpg', N'NXB Thế Giới', N'Lama Kunga Rinpoche, Brian Cutillo', 89000, CAST(N'1980-03-29' AS Date), 0, N'1000', N'1005_1.jpg', N'Lời nói đầu của LAMA KUNGA RINPOCHE trước kia là Thartse Shabthung của Tu Viện Ngor, Tây Tạng.
“Milarepa là một trong những đạo sư tâm linh nổi tiếng nhất của mọi thời. Ngài không những là một nhà lãnh đạo kiệt xuất của dòng phái Kagyu, mà cũng là một đạo sư rất quan trọng đối với mọi trường phái của Phật giáo Tây Tạng. Ngài là một ngôi sao của Phật giáo sơ thời Tây Tạng, và là một ngôi sao sáng chói của Thiền, soi sáng con đường Phật pháp ngày nay. Chắc chắn ngài không phải là một người hoang tưởng bỏ xã hội và ẩn tu nơi thâm sơn cùng cốc. Thật ra, ngài là một người phiêu lưu đã đạt đến chót đỉnh của ngọn núi cao với một cái nhìn toàn cuộc về sanh tử. Ngài là một chiến sĩ đích thực đã thành công trong việc chiến thắng kẻ thù thật sự, như thế trở thành một người cứu độ cho chúng sanh.
Ngài là người có ba năng lực. Thân ngài là thân của Vajrapani (Bồ tát Kim Cương Thủ), ngữ của ngài là ngữ của Manjusri (Bồ tát Văn Thù Sư Lợi), và sự lắng nghe của ngài là sự lắng nghe của Avalokitesvara (Bồ tát Quán Thế Âm). Milarepa là một con người khỏe mạnh, đầy sức sống với một sự kiên định bất thối chuyển trong cuộc tìm kiếm giải thoát. Ngữ của ngài đẹp đẽ và có thể diễn đạt bất cứ sự gì thành bài ca ứng khẩu, với ngôn ngữ đó ngài đã thể hiện tinh túy của Phật pháp theo những cách có thể hiểu cho tất cả mọi loại người nghe. Sự lắng nghe của ngài thông thấu như của Quán Thế Âm - vị Bồ tát Đại bi mà người Tây Tạng gọi là Chenrezi, người nghe thấu tiếng nói của tất cả chúng sanh.
', 31)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1006, N'Chuyện Tình Kẻ Sĩ Việt Nam', N'1006.jpg', N'NXB Phụ Nữ', N'Đinh Công Vĩ', 86400, CAST(N'1980-03-29' AS Date), 0, N'1000', N'1006_1.jpg', N'Chuyện tình kẻ sĩ Việt Nam tập trung đi sâu vào kể 134 chuyện tình của 134 nhân vật lịch sử, văn hóa của nước nhà. Cuốn sách được chia làm 4 phần. Phần 1 - Thời Cổ đại kể về chuyện tình của 5 nhân vật lịch sử. Phần 2 - Thời Trung đại có 34 nhân vật được kể.', 42)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1007, N'Vệ Sĩ Vô Hình', N'1007.jpg', N'NXB Phụ Nữ', N'Dolores Redondo', 61250, CAST(N'1980-03-29' AS Date), 0, N'1000', N'1007_1.jpg', N'Thi thể các thiếu nữ được tìm thấy ở thung lũng Baztán trong tình trạng bị siết cổ, quần áo rách toạc, khuôn mặt biến dạng. Trên vùng kín của mỗi nạn nhân còn được đặt một chiếc txatxingorri - một loại bánh ngọt đặc trưng của vùng. Ngoài ra, người ta còn phát hiện lông động vật ở trên người các nạn nhân. Ngay lập tức, mọi mối nghi ngờ đều hướng đến basajaun - còn được biết đến dưới tên gọi “quý ông trong rừng” một sinh vật có thật trong truyền thuyết.', 15)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1008, N'Từ Tân Thế Giới - Quyển Thượng', N'1008.jpg', N'NXB Hà Nội', N'Yusuke Kishi', 65000, CAST(N'1980-03-29' AS Date), 0, N'1000', N'1008_1.jpg', N'Từ tân thế giới – quyển thượng là cuốn đầu tiên trong series truyện dài gồm 3 tập của tác giả Yusuke Kishi, một kiệt tác văn học giả tưởng và khoa học viễn tưởng Nhật Bản đã xuất sắc giành Grand Prize tại Lễ trao giải khoa học viễn tưởng Nhật Bản lần thứ 29 Nihon SF Taisou 29th do Hiệp hội các nhà văn giả tưởng và khoa học viễn tưởng Nhật Bản bình chọn. Từ tân thế giới cũng được chuyển thể TV series anime do A-1 Pictures studio thực hiện năm 2012 cũng một chuyển thể truyện tranh phát hành bởi Kodansha Comics năm 2012. Bản chuyển thể anime nhận được tiếng vang lớn và được đánh giá là một trong những TV series anime xuất sắc nhất thế kỷ 21', 53)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1009, N'Những Chàng Trai Baltimore', N'1009.jpg', N'NXB Phụ Nữ Việt Nam', N'Joel Dicker', 96390, CAST(N'1980-03-29' AS Date), 0, N'1000', N'1009_1.jpg', N'Bốn năm sau vụ án Harry Quebert hay Chuyện nàng Nola, Marcus Goldman đến Floride để tìm cảm hứng cho cuốn tiểu thuyết tiếp theo. Anh tình cờ gặp lại Alexandra Neville, mối tình thời niên thiếu mà anh từng đánh mất và giờ đây nàng đã trở thành ca sĩ nổi tiếng.  Marcus vẫn còn yêu say đắm Alexandra và ngay lập tức anh cố gắng tìm ra nguyên do vì sao anh lại từ bỏ nàng. Đắm chìm trong dòng hồi tưởng về những kỉ niệm tuổi thơ và thời niên thiếu, Marcus đã vẽ nên một bức tranh về những thành viên gia đình Goldman ở Baltimore mà anh một lòng ngưỡng mộ và cũng là cơ duyên dẫn Marcus quen biết Alexandra.
Marcus Goldman, thuộc tầng lớp trung lưu, sinh sống trong một căn nhà nhỏ ở thị trấn Montclair. Cứ tới kì nghỉ hè hằng năm, Marcus đều đến căn biệt thự nghỉ dưỡng xa hoa của bác Saul Goldman ở Baltimore và sống những ngày tháng hạnh phúc nhất với hai người anh họ của mình là Woody và Hillel. Họ tạo thành Những chàng trai Baltimore hay Hội Goldman. Họ là những con người tài năng, nhiệt huyết, là trung tâm chú ý ở bất cứ nơi nào họ xuất hiện. Nhưng tương lai rực rỡ và vinh quang chói lóa lẽ ra thuộc về họ bỗng chốc sụp đổ chỉ  vì một phút đố kị, lý trí đã bị lòng ghen tuông và sự phản bội hạ gục, khiến cả gia đình rơi vào Thảm kịch.
', 23)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1010, N'Đã Biết Sẽ Có Ngày Hôm Qua', N'1010.jpg', N'NXB Phụ Nữ Việt Nam', N'Huy Hải', 69000, CAST(N'1980-03-29' AS Date), 0, N'1000', N'1010_1.jpg', N'Đi qua tháng năm, ai cũng phải trả giá cho sự trưởng thành của mình. Cái giá đó không đong đếm được bằng đắt rẻ, cũng chẳng ai biết đã đong đếm được bằng bao nhiêu vụng dại, thơ ngây.
Đi qua tháng năm, có ai mà không tiếc nuối, có ai mà không mong được trở lại ngày xưa? Chúng ta dù chỉ sống một lần, thế nhưng có những hoài niệm là mãi mãi.
Tuổi trẻ - thanh xuân luôn là những vùng trời tươi đẹp mà con người muốn níu giữ. Bằng lối viết nhẹ nhàng, sâu lắng tác giả Huy Hải dẫn dắt người đọc đi qua các cung bậc khác nhau trong tập 17 truyện ngắn Đã biết sẽ có ngày hôm qua, để rồi thông qua đó gợi nhắc độc giả hãy trân trọng ngày hôm qua, sống hết mình vì ngày hôm nay và cố gắng không ngừng để vẽ nên ngày mai tươi sáng.
Nhà xuất bản Phụ nữ Việt Nam tin rằng khi cầm cuốn sách này trên tay, các bạn cũng sẽ thấy mình của những năm tháng về trước trong đó. Hoặc ít ra những câu chuyện Huy Hải kể, cũng sẽ gợi nhớ hoặc đánh thức một phần kí ức nào đó của riêng bạn, mà bạn ngỡ đã quên...
“Một ngày... Một tháng... Một năm… Hay nhiều hơn thế. Cứ gặp lại là vui rồi. Chuyện cũ đã qua, nên cất nó cẩn thận trong ngăn kéo kí ức. Chúng ta phải sống cho hiện tại, cho những ngày còn chưa xảy đến, phải không. Còn làm gì ai sống được trong quá khứ đâu? Tuổi trẻ cũng chúng ta sẽ xanh mãi, nên đừng vì điều-gì-đó mà làm chúng héo đi, thật chẳng đáng.”
', 57)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1011, N'Ân Sủng Của Đời', N'1011.jpg', N'NXB Phụ Nữ', N'Daniel Glattauer', 105000, CAST(N'1980-03-29' AS Date), 0, N'1000', N'1011_1.jpg', N'Daniel Glattauer tiếp tục gây ấn tượng với lối viết vừa hài hước vừa ý nhị, duyên dáng. Câu chuyện vô cùng dí dỏm xoay quanh Geri, một nhà báo hạng... Z bỗng chốc bị cuốn vào cuộc điều tra những món tiền từ thiện bí ẩn cùng cậu con rơi vô cùng cá tính. Thông qua câu chuyện, tác giả viết về tình cảm cha - con, thể hiện trách nhiệm của Geri với cậu con trai 14 tuổi của mình, cũng như bàn về vai trò của người làm báo trong thế giới đương đại vô vàn áp lực. Mượn góc nhìn của Geri, những vấn đề xã hội như: nhập cư trái phép, tị nạn, thất nghiệp, đói nghèo... được tác giả đề cập tới bằng ngòi bút gây cười, cái cười giúp người ta hiểu có thể tiếp cận những vấn đề nóng trong xã hội theo nhiều cách khác nhau.', 24)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1012, N'Đáp Án Của Thanh Xuân', N'1012.jpg', N'NXB Phụ Nữ Việt Nam', N'Tiểu Châu', 70000, CAST(N'1980-03-29' AS Date), 0, N'1000', N'1012_1.jpg', N'Đáp án của thanh xuân là lời hồi đáp cho những tâm hồn trẻ cảm thấy mệt nhoài giữa xã hội ngày một khắc nghiệt và xô bồ. Những người trẻ khi nhìn thấy đích đến của cuộc đời nhưng quãng chạy ngày một dông dài, lúc bước từng bước vững chắc thì lại tự vấn về ý nghĩa sự tồn tại của bản thân, tình cảm con người với con người, cách sống sao cho được là chính mình. Những người trẻ tuổi hiện lên qua giọng kể của tác giả Tiểu Châu rất đỗi bình dị, một cô gái trầm lặng ở một khu thị trấn nhỏ ven biển, anh bạn trong câu lạc bộ trường đại học, vài cô nàng son phấn chốn công sở, đôi khi còn là một vài người trẻ thành công nhưng không mang cái bóng quá lớn, không tự ôm vào mình quá nhiều trách nhiệm lớn lao. Tất cả chỉ để nói với chúng ta rằng: Trưởng thành chưa bao giờ là điều dễ dàng. Có đi qua những năm tháng thanh xuân ghập ghềnh, con người ta mới có thể thấu hiểu mình nhất. Thanh xuân luôn là một câu hỏi lớn, đáp án của mỗi người mỗi khác, nhưng tất cả giao nhau ở một ý nghĩa cuối cùng: trải qua thanh xuân, ai cũng muốn một cuộc đời bình an, một cuộc sống có thể nhẹ mình suy ngẫm, làm điều mình thích và được là chính mình.', 41)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1013, N'Bánh Mì Cô Đơn', N'1013.jpg', N'NXB Phụ Nữ', N'Judith Ryan Hendricks', 72240, CAST(N'1980-03-29' AS Date), 0, N'1000', N'1013_1.jpg', N'Cuốn tiểu thuyết Bánh Mì Cô Đơn của tác giả Judith Ryan Hendricks viết về những thân phận phụ nữ hết sức đời thương. Là Wyn Morrison, biết rất nhiều nhưng không rõ mình muốn gì? Là Christine Mayle, yêu sàn diễn đến cháy bỏng, nhưng không dễ gì tìm được người đàn ông của đời mình. Là người mẹ hoàn hảo của Wyn, sau nhiều năm trời im lặng đã mở ra những tâm sự chân thành cùng con gái. Là những phụ nữ vừa bình dị vừa độc đáo ở hiệu bánh Quen Srteet. Tất cả ít nhiều đã giúp Wyn nhìn lại chính mình sau khi mải sống cuộc đời nhung lụa của một cô vợ được cưới về chỉ cốt để làm sang cho chồng.
Và rồi Wyn nhận ra rằng thứ công việc cầm cự mưu sinh ở tiệm bánh mì đã an ủi lòng cô một cách kỳ diệu và bất ngờ giúp cô một lần nữa hiểu được rằng chẳng có gì giống như trước nữa... Bánh mì nở ra, những nỗi đau dịu lại, trái tim được hàn gắn, và cánh cửa tương lai hé mở.
', 53)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1014, N'Bạo Lực', N'1014.jpg', N'NXB Phụ Nữ', N'Karine GIÉBEL', 87320, CAST(N'1980-03-29' AS Date), 0, N'1000', N'1014_1.jpg', N'Câu chuyện xoay quanh gia đình vị giáo sư Reynier giàu có sinh sống tại một biệt thự trong một thành phố nhỏ gần Nice. Ông bố là bác sĩ phẫu thuật tài giỏi, điều hành một bệnh viên tư nổi tiếng. Bà mẹ kế là một phu nhân xinh đẹp quyến rũ. Cô con gái là sinh viên văn khoa đẹp rạng rỡ.
Bề ngoài, quả thực đó là một gia đình lí tưởng, nhưng bên trong có thực sự lí tưởng như người ta hằng mơ ước không?
Một câu chuyện dồn dập khiến người đọc không thể dứt ra được. Cốt truyện không rối rắm nhưng những tình tiết khi khép khi mở khiến bạn hồi hộp như sắp bắt được tội phạm mà không biết rằng đó chỉ là báo động giả, để rồi lại khiến bạn chạy theo từng trang truyện để khám phá. Qua mạch truyện, những mảnh đời cay đắng chua chát cứ dần dần hiện ra.
Armand Reynier có đúng là “lương y như từ mẫu”? Tình yêu mê muội mà ông ta dành cho con gái Maud đã đúng cách chưa. Tiền bạc và danh vọng đã khiến ông mờ mắt đến mức độ nào?...
Cô vợ trẻ Charlotte phải chăng là người đàn bà chỉ thích quyến rũ đàn ông? Ẩn sau hành động có vẻ trăng hoa ấy, là một nỗi đau đớn vô hạn vì không nhận được tình yêu của chồng, chấp nhận bị bạo hành tinh thần để đổi lại sự chăm sóc y tế tại một bệnh viện sang trọng cho cho đứa con riêng sống thực vật.
Maud, một tiểu thư lá ngọc cành vàng, nhưng mang hơi hướng của sự nổi loạn. Tâm tư cô gái mới lớn, những ghen tuông hờn giận vô cớ, những suy nghĩ nông nổi khiến cô gái trẻ trườn sâu vào ma túy đến nỗi suýt mất mạng…
Tất cả cuộc sống giả tạo cùng những bi kịch gia đình ấy chỉ dần dần lộ diện khi Luc Garnier bước chân vào trong gia đình họ và là người bọn họ tin cậy tâm sự mọi nỗi niềm thầm kín. Luc là người đã kịp thời cứu giúp Maud khỏi tay một kẻ hành hung toan cưỡng bức cô và từ đó Luc bắt đầu thâm nhập vào gia đình Reynier với tư cách vệ sĩ. Đây có phải là một sự vô tình, hay đã được sắp đặt. Kể từ khi Luc xuất hiện, gia đình Reynier luôn xảy ra chuyện. Armand Reynier cứ uổng công bật đèn báo động, cài kỹ cửa, nhưng tên trộm vẫn lẻn được vào nhà, thậm chí đến tận giường ngủ của vợ chồng ông và để lại những lời nhắn khủng khiếp, bạo hành tinh thần ông. Vậy thực chất Luc Garnier là ai? Động cơ của Luc là gì ?
Tất cả các nhân vật đều chịu một “bạo lực” tinh thần. Mỗi người  tưởng như có cuộc sống phù hoa, nhưng bản chất tâm hồn họ đều bị một thứ bạo hành gặm nhấm đến độ mục ruỗng, họ chán ghét nhau nhưng vẫn sống bên nhau.
Rất nhiều tình tiết đan xen, những nút thắt kịch tính, những cái bẫy giăng mắc như mạng nhện cuối cùng đã được tháo gỡ một cách bất ngờ ở đoạn kết của câu chuyện
', 21)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1015, N'Hối Hận', N'1015.jpg', N'NXB Phụ Nữ', N'Đông Tây', 712500, CAST(N'1980-03-29' AS Date), 0, N'1000', N'1015_1.jpg', N'Những tưởng chỉ có nói dối mới làm tổn hại đến những người xung quanh, nhưng với Tăng Quảng Hiền, lời nói chân chất của cậu lại là nguồn cơn bi kịch cho cả gia đình. Bố bị hãm hại, mẹ tự sát, em gái bỏ đi. Chỉ trong phút chốc, cậu đã trở thành tội đồ trong mắt mọi người.
Trải qua thời thơ ấu tủi nhục, sóng gió cuộc đời một lần nữa lại ập đến khi Tăng Quảng Hiền phải đối mặt với bản án mười năm tù chỉ vì chút nhục cảm bồng bột của tuổi trẻ.
Mười năm gian lao trong tù, bên ngoài song sắt là một tình yêu trung trinh đang chờ đợi cậu. Nhưng đến khi mãn hạn, điều đón chờ Tăng Quảng Hiền lại là hoa trong bóng kính, trăng nơi đáy sông, khiến cậu không ngừng sai lầm càng thêm sai lầm, hối hận lại càng hối hận...
', 22)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1016, N'Người Ruồi', N'1016.jpg', N'NXB Phụ Nữ', N'Hans Olav Lahlum', 70210, CAST(N'1980-03-29' AS Date), 0, N'1000', N'1016_1.jpg', N'Từng người trong bọn họ lần lượt bị giết hại. Tôi tin rằng chúng ta đang tìm một người ruồi… Oslo một ngày tháng Tư năm 1968: Thanh tra cảnh sát trẻ tuổi Kolbjørn Kristiansen (gọi tắt là K2) nhận được thông báo về một vụ án mạng ''rất không bình thường'' tại lầu trên lầu 2 của một chung cư nhỏ gồm 6 căn hộ và 1 tầng hầm. Những người hàng xóm sau khi nghe tiếng súng nổ đã lập tức chạy lên căn hộ...', 21)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1017, N'Người Vệ Tinh', N'1017.jpg', N'NXB Phụ Nữ', N'Hans Olav Lahlum', 81920, CAST(N'1980-03-29' AS Date), 0, N'1000', N'1017_1.jpg', N'Oslo, năm 1969.
Khi thanh tra cảnh sát trẻ tuổi Kolbjørn Kristiansen (còn gọi là K2) nhận được thông báo một tỉ phú đã gục chết trong bữa tiệc tối, anh vô cùng bàng hoàng. Bởi nạn nhân chính là Magdalon Schelderup, doanh nhân giàu có và là cựu chiến binh Kháng chiến, chỉ mới liên lạc với anh trước đó một ngày vì lo sợ mạng sống của mình đang bị đe dọa.
Đây là cuốn tiểu thuyết thứ hai nằm trong xêri về bộ đôi K2 và Patricia của tác giả Hans Olav Lahlum dành tặng cho nữ hoàng trinh thám cổ điển AgathaChristie. 
Sau khi nổi tiếng nhờ phá thành công vụ án Người ruồi (với sự trợ giúp đắc lực từ Patricia Borchmann, cô gái 19 tuổi ngồi xe lăn nhưng có trí óc phán đoán siêu phàm), thanh tra cảnh sát trẻ tuổi Kolbjørn Kristiansen (gọi tắt là K2) nhận được cú điện thoại bất ngờ của tỷ phú Magdalon Schelderup muốn hẹn gặp anh vì ông ta cam đoan một trong những người gần gũi và thân thiết nhất của mình âm mưu sát hại ông vào tuần tới!
Ngày hôm sau, K2 nhận được cuộc gọi thông báo Magdalon đã bị đầu độc chết trong bữa tiệc tại nhà riêng của chính ngài tỷ phú. Mười thực khách trong bữa tối đó gồm những người thân thiết của nạn nhân: người vợ hiện tại và con gái của bà, người vợ cũ, hai người con trai, cô thư ký riêng, em gái nạn nhân, giám đốc điều hành và cặp vợ chồng là đồng đội cũ từng cùng tham gia Kháng chiến với nạn nhân.
K2 ngay lập tức thẩm vấn các nghi phạm và anh vô cùng bối rối trước sự dối trá trong lời khai của tất cả mười nhân chứng. Trong khi vụ án vẫn chưa được điều tra làm rõ thì hai người khác trong bữa tiệc lần lượt bị giết chết khiến vụ án càng đi vào ngõ cụt.
Viên thanh tra buộc phải nhờ đến sự trợ giúp của cô gái 19 tuổi ngồi xe lăn Patricia để làm sáng tỏ nhiều bí ẩn về Magdalon và những người vệ tinh quanh ông ta, luôn chịu sự ảnh hưởng và chi phối của ông ta dù nạn nhân đã chết.
', 2)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1018, N'Verity - Bí Mật Bị Chôn Vùi', N'1018.jpg', N'Thanh Niên', N'Colleen Hoover', 130650, CAST(N'1980-03-29' AS Date), 0, N'1000', N'1018_1.jpg', N'Lowen Ashleigh là một nhà văn đang gặp khó khăn và đang trên bờ vực phá sản thì nhận được một đề nghị công việc có một không hai trên đời. Jeremy Crawford, chồng của tác giả nổi tiếng Verity Crawford, đã thuê Lowen hoàn thành những cuốn sách còn lại trong một loạt truyện thành công mà người vợ gặp tai nạn của anh không thể hoàn thành.
Lowen đến nhà Crawford, sẵn sàng sắp xếp lại các ghi chú và phác thảo trong nhiều năm của Verity, với hy vọng tìm đủ tài liệu để giúp cô ấy có thể bắt đầu công việc của mình. Trong phòng làm việc hỗn loạn, Lowen ngoài ý muốn phát hiện ra một cuốn tự truyện chưa hoàn thành mà Verity có lẽ sẽ không bao giờ cho ai đọc. Từng trang, từng trang của cuốn tự truyện ngập tràn những lời thú tội lạnh thấu tâm can, bao gồm cả hồi ức của Verity về cái đêm mà gia đình cô mãi mãi thay đổi.
Lowen quyết định giấu bản thảo vì cô biết rằng nội dung của nó có thể sẽ đánh gục Jeremy, người chồng, người cha đã phải chịu vô vàn đau đớn trong suốt nhiều tháng qua. Nhưng khi tình cảm của Lowen dành cho Jeremy lớn dần, cô nhận ra từng lời trong cuốn tự truyện này đều có thể khiến cô trở thành người hưởng lợi. Suy cho cùng, dù cho Jeremy có chung thủy với người vợ gặp tai nạn của mình đến thế nào, thì sự thật kinh hoàng này chắc chắn sẽ khiến anh không thể tiếp tục yêu cô ta vô điều kiện nữa.
Nhưng đến cuối cùng, ai mới là kẻ nói dối, còn sự thật thuộc về ai?
', 11)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1019, N'Con Cừu Thứ Ngàn Lẻ Một Đêm Qua', N'1019.jpg', N'Thanh Niên', N'Marina Benjamin', 86430, CAST(N'1980-03-29' AS Date), 0, N'1000', N'1019_1.jpg', N'Rối loạn giấc ngủ - từ KẺ THÙ cướp đi năng lượng và sự tập trung đến ĐỒNG MINH cho sự sáng tạo vô biênTrong thế giới ngày nay, chứng mất ngủ hay rối loạn mất ngủ đang ngày càng trở nên phổ biến. Mất ngủ đã ảnh hưởng đến khoảng một phần ba dân số toàn cầu – tới nay vẫn chưa có cách trị dứt điểm. Nó là kẻ thù cướp đi năng lượng, sự tập trung và cả những giây phút thư giãn ít ỏi của chúng ta, gây phiền nhiễu đến cuộc sống của nhiều người. Mất ngủ có thể gây tình trạng mệt mỏi khó chịu ảnh hưởng nghiêm trọng đến hiệu suất làm việc và chất lượng cuộc sống.
Con người sẽ ra sao khi mất ngủ cứ ngày một tiếp diễn và gây ảnh hưởng đến đời sống sức khỏe tinh thần?
Liệu ta có thể biến mất ngủ thành đồng minh, thành chứng nhân cho hiện tại, cho cái nhìn sắc sảo và biến nó thành sự sáng tạo vô biên không?
', 22)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1020, N'Nhà Tù Shawshank', N'1020.jpg', N'Thanh Niên', N'Stephen King', 240530, CAST(N'1980-03-29' AS Date), 0, N'1000', N'1020_1.jpg', N'Cuốn sách được chia thành 4 phần: Hy vọng tựa nhựa Xuân, Mùa Hè vụn vỡ, Thu tàn thơ ngây, và Câu chuyện mùa Đông, mỗi phần là một câu chuyện. Trong đó:
Nhà tù Shawshank là phần nổi bật nhất, tương ứng với phần Hy vọng tựa nhựa Xuân. Bộ phim cùng tên (Shawshank Redemption) cũng đã được đề cử cho giải Oscar năm 1994 cho hạng mục Phim chuyển thể hay nhất.
Truyện nói về Andy Dufresne một chủ ngân hàng bị kết án oan giết vợ phải ngồi tù chung thân tại nhà tù khét tiếng nhất bang là Shawshank. Khác hẳn với những con người đầu hàng số phận và sống buông xuôi tại những buồng giam, song sắt – Andy vẫn nuôi dưỡng kế hoạch vượt ngục trong mình. Trong suốt quá trình ở Shawshank, Andy chứng kiến sự tàn ác của cai ngục, của sự mất nhân tính và sự tha hóa của giám đốc nhà tù khi nhúng tay vào tham nhũng, bóc lột và giết chóc tù nhân. Tuy nhiên giữa những mặt tối ấy, tình bạn cao đẹp cũng như niềm tin vào số phận của Andy dành cho những con người anh yêu mến như Red, Tommy bật lên như ngọn lửa le lói trong giông bão nhưng vô cùng mạnh mẽ đưa con người vực dậy từ cõi chết. Có thể đây là một tác phẩm ít máu me và cảm động nhất của Stephen King.
', 14)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1021, N'Nghệ Thuật Tư Duy Chiến Lược', N'1021.jpg', N'NXB Lao Động', N'Avinash K Dixit, Barry J Nalebuff', 239000, CAST(N'1980-03-29' AS Date), 0, N'1001', N'1021_1.jpg', N'Thông qua Nghệ thuật tư duy chiến lược, bạn sẽ thấy "những người thành công" trong mọi lĩnh vực từ giải trí đến chính trị, từ giáo dục đến thể thao, v.v... đạt thành công vang dội là nhờ luôn nắm vững lý thuyết trò chơi hay nghệ thuật tư duy chiến lược, với khả năng dự đoán những động thái tiếp theo của người cùng chơi, trong khi biết rõ rằng đối thủ đang cố gắng làm điều tương tự với mình.
Ngoài ra, bạn cũng sẽ nắm được những bí kíp vô cùng giản đơn để có thể áp dụng lý thuyết trò chơi vào cuộc sống lẫn công việc, từ đó sở hữu một cuộc đời đáng sống.
', 41)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1022, N'Nghĩ Giàu & Làm Giàu (Tái Bản 2020)', N'1022.jpg', N'NXB Tổng Hợp TPHCM', N'Napoleon Hill', 88000, CAST(N'1980-03-29' AS Date), 0, N'1001', N'1022_1.jpg', N'Think and Grow Rich - Nghĩ giàu và làm giàu là một trong những cuốn sách bán chạy nhất mọi thời đại. Đã hơn 60 triệu bản được phát hành với gần trăm ngôn ngữ trên toàn thế giới và được công nhận là cuốn sách tạo ra nhiều triệu phú, một cuốn sách truyền cảm hứng thành công nhiều hơn bất cứ cuốn sách kinh doanh nào trong lịch sử.
Tác phẩm này đã giúp tác giả của nó, Napoleon Hill, được tôn vinh bằng danh hiệu “người tạo ra những nhà triệu phú”. Đây cũng là cuốn sách hiếm hoi được đứng trong top của rất nhiều bình chọn theo nhiều tiêu chí khác nhau - bình chọn của độc giả, của giới chuyên môn, của báo chí. Lý do để Think and Grow Rich - Nghĩ giàu và làm giàu có được vinh quang này thật hiển nhiên và dễ hiểu: Bằng việc đọc và áp dụng những phương pháp đơn giản, cô đọng này vào đời sống của mỗi cá nhân mà đã có hàng ngàn người trên thế giới trở thành triệu phú và thành công bền vững.
', 12)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1023, N'Nguyên Lý Marketing', N'1023.jpg', N'NXB Đại Học Kinh Tế Quốc Dân', N'Philip Kotler, Gary Armstrong', 599400, CAST(N'1980-03-29' AS Date), 0, N'1001', N'1023_1.jpg', N'Cuốn sách xoay quanh năm chủ đề lớn về giá trị khách hàng và sự gắn kết khách hàng, tìm hiểu cách thức mà giá trị khách hàng và sự gắn kết khách hàng thúc đẩy mọi chiến lược marketing chất lượng hơn, đặc biệt là trong thị trường mà mạng xã hội và kỹ thuật số bùng nổ, thay đổi mỗi ngày', 47)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1024, N'Tiktok Marketing', N'1024.jpg', N'NXB Thanh Niên', N'Markus Rach', 111200, CAST(N'1980-03-29' AS Date), 0, N'1001', N'1024_1.png', N'TikTok đang bùng nổ ở mọi nơi và đã trở thành một trong những ứng dụng được tải xuống nhiều nhất thế giới. Không có gì ngạc nhiên khi các nhà tiếp thị đã bắt đầu nhìn thấy tiềm năng của nền tảng này. Kinh doanh đi cùng với xu hướng thì mới có thể phát triển và tiếp cận gần hơn với nhiều tập khách hàng. TikTok đã thu hút được sự chú ý lớn từ nhiều nhà kinh doanh khi mạng xã hội này có thể tạo ra những content vô cùng đặc sắc, đồng thời còn là một kênh marketing hiệu quả.
Cuốn sách này là một hướng dẫn TikTok marketing, trả lời những câu hỏi của các nhà marketing khi nghĩ về TikTok, gợi ý những cách thức khả thi mà các thương hiệu có thể tận dụng tối đa TikTok. Nhiều thương hiệu kết hợp việc điều hành các kênh riêng của họ và làm việc với những người có ảnh hưởng để truyền bá nội dung đến đối tượng rộng hơn. Các thương hiệu cũng có thể thực hiện chiến dịch TikTok marketing của mình bằng cách khuyến khích các thử thách kèm hashtag trên TikTok. Khi thử thách #hashtag được đưa ra trên TikTok, mọi người có thể tham gia chỉ bằng vài lần nhấp chuột. 
', 24)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1025, N'Chiến Tranh Tiền Tệ - Phần 1 - Ai Thực Sự Là Người Giàu Nhất Thế Giới? (Tái bản 2022)', N'1025.jpg', N'NXB Lao Động', N'Song Hong Bing', 165000, CAST(N'1980-03-29' AS Date), 0, N'1001', N'1025_1.jpg', N'Là một cuốn sách làm sửng sốt những ai muốn tìm hiểu về bản chất của tiền tệ, để từ đó nhận ra những hiểm họa tài chính tiềm ẩn nhằm chuẩn bị tâm lý cho một cuộc chiến tiền tệ “không đổ máu”, “Chiến tranh tiền tệ - Ai thật sự là người giàu nhất thế giới” còn phơi bày những âm mưu của các nhà tài phiệt thế giới trong việc tạo ra những cơn “hạn hán”, “bão lũ” về tiền tệ để thu lợi nhuận. Cuốn sách cũng đề cập đến sự phát triển của các định chế tài chính – những cơ cấu được xây dựng nhằm đáp ứng nhu cầu phát triển vũ bão của nền kinh tế toàn cầu.', 11)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1026, N'Tiền Đẻ Ra Tiền - Đầu Tư Tài Chính Thông Minh (Tái Bản)', N'1026.jpg', N'Hồng Đức', N'Duncan Bannatyne', 83400, CAST(N'1980-03-29' AS Date), 0, N'1001', N'1026_1.jpg', N'Sau sự thành công của hai cuốn sách “Thức tỉnh và thay đổi cuộc đời bạn: Bí quyết thành công của triệu phú Anh” và “Quản lý thời gian thông minh của người thành đạt: Bí quyết thành công của triệu phú Anh” là những câu chuyện, những lời khuyên dựa trên những kinh nghiệm phong phú của cuộc đời mình và nhằm mục đích truyền cảm hứng động lực làm giàu cho mọi công dân đều có thể trở thành triệu phú, thì triệu phú người Anh và tác giả của nhiều đầu sách nổi tiếng Duncan Bannatyne đã cho ra mắt cuốn sách “ Tiền Đẻ Ra Tiền – Đầu Tư Tài Chính Thông Minh”.', 22)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1027, N'Hướng Dẫn Căn Bản Về Cách Kiếm Tiền Từ Youtube', N'1027.jpg', N'NXB Lao Động', N'Benji Travis, Sean Canell', 179000, CAST(N'1980-03-29' AS Date), 0, N'1001', N'1027_1.jpg', N'YouTube đã thay đổi hoàn toàn thế giới hiện đại – từ cách chúng ta xem video, kết nối, cho đến cách chúng ta mở rộng thị trường với những cơ hội mới dành cho những cá nhân giàu tham vọng. Ngày nay trên thế giới, hàng nghìn người đang kiếm được những thu nhập triệu đô từ video trực tuyến, nhưng họ làm điều đó bằng cách nào?
Với cuốn sách “Youtube Secrets – Hướng dẫn cách căn bản về kiếm tiền từ Youtube” hai chuyên gia về video trực tuyến Sean Cannel và Benji Travis sẽ mang tới cho các bạn những bí quyết đạt được thành công trên Youtube, đúc kết từ hàng trăm cuộc phỏng vấn với những Youtuber nổi tiếng, cũng như từ chính kinh nghiệm hơn 10 năm hoạt động trên Youtube của họ. Cho dù bạn là người mới hay là những Youtuber kỳ cựu, cuốn sách này sẽ giúp bạn xây dựng được một lực lượng người theo dõi lớn mạnh kiếm được những thu nhập triệu đô và tạo nen những tác động to lớn đến cuộc sống của mọi người.
', 33)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1028, N'Trải Nghiệm Khách Hàng Xuất Sắc', N'1028.jpg', N'NXB Thế Giới', N'Nguyễn Dương', 150000, CAST(N'1980-03-29' AS Date), 0, N'1001', N'1028_1.jpg', N'Bạn đang cầm trên tay cuốn sách Trải nghiệm khách hàng xuất sắc được viết từ hơn 22 năm kinh nghiệm, qua nhiều vị trí, môi trường khác nhau của ông Nguyễn Dương, một chuyên gia cấp quốc tế, một trong những người nhiệt huyết và chuyên sâu nhất về trải nghiệm khách hàng.

Ngoài kinh nghiệm thực tế và kiến thức về quản trị nói chung và quản trị trải nghiệm khách hàng nói riêng, trong quá trình hoàn thành cuốn sách này, tác giả Nguyễn Dương đã thực hiện những đợt đi nghiên cứu nhiều công ty, bao gồm những chuyến đi, những cuộc nói chuyện, phỏng vấn, trao đổi, tìm hiểu và cập nhật cách mà nhiều công ty đã thực hiện để có thể cung cấp những trải nghiệm khách hàng tuyệt vời và tăng trưởng vượt bậc.
Bên cạnh đó, tác giả nghiên cứu cả những lý do và rào cản khiến các chiến lược trải nghiệm khách hàng thất bại. Những nguyên lý và phương pháp đã phát huy hiệu quả và trường tồn theo thời gian, được đúc kết từ nhiều trải nghiệm, bối cảnh, quy mô và môi trường khác nhau, trong và ngoài nước.
', 111)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1029, N'Tài Chính Cá Nhân Dành Cho Người Việt Nam', N'1029.jpg', N'NXB Phụ Nữ Việt Nam', N'Lâm Minh Chánh', 12000, CAST(N'1980-03-29' AS Date), 0, N'1001', N'1029_1.jpg', N'Cuốn sách “Tài chính cá nhân dành cho người Việt Nam” và bộ bài giảng trực tuyến tặng kèm, gồm tất cả những nội dung về tài chính cá nhân.
Kiếm tiền: Khi còn thể làm việc, chúng ta cần kiếm tiền, tạo ra thu nhập với "công suất" lớn nhất.
Tiết kiệm tiền, sử dụng tiền: Chúng ta phải quản lý tiền hiệu quá, sử dụng tiền khôn ngoan. Đặc biệt, chúng ta phải tiết kiệm trước khi sử dụng.
Bảo vệ tiền: Chúng ta phải biết bảo vệ tiền sự mất mát của tiền trước những rủi ro.
Đầu tư tiền: Tiền phải sinh ra tiền. Chúng ta phải đầu tư để tiền tăng trưởng và đạt được mục tiêu tài chính cá nhân.
Mục tiêu tài chính cá nhân: An toàn, Đảm bảo, Độc lập, và Tự do tài chính
', 42)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1030, N'Nhà Đầu Tư Thông Minh', N'1030.jpg', N'NXB Thế Giới', N'Benjamin Graham', 159200, CAST(N'1980-03-29' AS Date), 0, N'1001', N'1030_1.jpg', N'Là nhà tư vấn đầu tư vĩ đại nhất của thế kỷ 20, Benjamin Graham đã giảng dạy và truyền cảm hứng cho nhiều người trên khắp thế giới. Triết lý “đầu tư theo giá trị“ của Graham, bảo vệ nhà đầu tư khỏi những sai lầm lớn và dạy anh ta phát triển các chiến lược dài hạn, đã khiến Nhà đầu tư thông minh trở thành cẩm nang của thị trường chứng khoán kể từ lần xuất bản đầu tiên vào năm 1949.
Trải qua năm tháng, diễn biến thị trường đã chứng minh tính sáng suốt trong các chiến lược của Graham. Trong khi vẫn giữ lại toàn vẹn văn bản ban đầu của Graham, ấn phẩm tái bản này bổ sung thêm bình luận cập nhật của ký giả chuyên về tài chính nổi tiếng Jason Zweig. Cái nhìn của Zweig bao quát hiện thực của thị trường ngày nay, vạch ra sự tương tự giữa những ví dụ của Graham và các tít báo về tài chính hiện nay, giúp bạn đọc có sự hiểu biết kỹ lưỡng hơn về cách thức áp dụng các nguyên tắc của Graham.
Sống động và cần thiết, Nhà đầu tư thông minh là cuốn sách quan trọng nhất mà bạn có dịp đọc về cách thức đạt được các mục tiêu tài chính của mình.
', 111)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1031, N'Cơn Lốc Quản Trị - Ba Trụ Cột Của Văn Hóa Doanh Nghiệp Hận', N'1031.jpg', N'NXB trẻ', N'Phan Văn Trường', 126000, CAST(N'1980-03-29' AS Date), 0, N'1001', N'1031_1.jpg', N'Doanh nghiệp nào cũng có lúc gặp phải những vấn đề không nhất thiết mang tính kỹ thuật, như sự thiếu vắng động lực, hoặc tinh thần tương tác và làm việc nhóm thấp, thậm chí là mâu thuẫn giữa các thành viên, trong đó có cả các lãnh đạo cấp trung và cấp cao. Chẳng công cụ quản lý nào cho phép giải quyết được những vấn đề bắt nguồn từ sự ganh tị, đố kị, thiên vị, hoặc tệ hơn nữa là nạn bè đảng hay tham nhũng nội bộ.
Các mô hình quản lý chỉ mang lý luận kỹ thuật cục bộ hạn hẹp và những giải pháp cấu trúc có sẵn cho doanh nghiệp. Chỉ văn hóa mới có khả năng vào sâu một cách uyển chuyển các vấn đề trong mối quan hệ giữa người với người. Và đây chính là những vấn đề mà các doanh nghiệp Việt Nam thường gặp phải.
Trong tác phẩm mới nhất về văn hóa doanh nghiệp, tác giả Phan Văn Trường phát triển và đi sâu hơn nữa về chủ đề khá trừu tượng này. Vẫn giữ nguyên phong cách tiếp cận dựa trên những câu chuyện từ thực tế trải nghiệm của mình, ông dẫn dắt độc giả trên con đường tìm hiểu vai trò của văn hóa doanh nghiệp, đồng thời đi sâu giải thích ba phong cách văn hóa mà chính ông đã tiên phong áp dụng cho những doanh nghiệp mình từng tham gia quản trị.
', 22)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1032, N'Biến Mọi Thứ Thành Tiền - Make Money', N'1032.jpg', N'NXB Thế Giới', N'Nguyễn Anh Dũng', 100800, CAST(N'1980-03-29' AS Date), 0, N'1001', N'1032_1.jpg', N'Bí quyết giúp bạn thoát nghèo để đạt được thành công và giàu có thực sự “Biến mọi thứ thành tiền” là cuốn sách xoay quanh chủ đề tài chính cá nhân. Đây là vấn đề đang được nhiều người, trong đó có các bạn trẻ đặc biệt quan tâm. Cuốn sách định hướng người đọc về cách kiếm tiền, tư duy làm giàu, cách áp dụng những phương pháp làm giàu vào cuộc sống và phát triển bản thân. Bí quyết giúp bạn thoát nghèo để đạt được thành công và giàu có thực sự ở đây không phải là công thức cho tất cả mọi người.
Cuốn sách chỉ ra cho bạn phương thức, công cụ phù hợp đạt được cơ hội chiến thắng là hiểu chính bản thân mình.
', 113)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1033, N'AI Chứ Không Phải Thế Nào?', N'1033.jpg', N'NXB Thế giới', N'Dan Sullivan', 239000, CAST(N'1980-03-29' AS Date), 0, N'1001', N'1033_1.jpg', N'Cuốn sách này sẽ dạy bạn cách thực hiện sự thay đổi mô hình thiết yếu này để bạn có thể:
- Xây dựng 1 doanh nghiệp thành công một cách hiệu quả trong khi không giết chết chính mình
- Không bao giờ bị giới hạn mục tiêu và tham vọng của bạn một lần nữa
- Mở rộng sự giàu có , đổi mới , các mối quan hệ và niềm vui của bạn
', 12)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1034, N'Thấu Hiểu Hành Vi Giá Thị Trường Tài Chính - Understanding Price Action', N'1034.jpg', N'NXB Thanh Niên', N'Bob Volman', 367000, CAST(N'1980-03-29' AS Date), 0, N'1001', N'1034_1.jpg', N'Phương pháp Price Action được mô tả trong Thấu hiểu Hành vi giá Thị trường Tài chính - Understanding Price Action chỉ dựa vào một Đường trung bình động (Moving Average - MA) và cấu trúc thị trường - hành vi giá để giao dịch (trading). Rất đơn giản nhưng cực kỳ hiệu quả.
Understanding Price Action đến từ Bob Volman, một nhà giao dịch chuyên nghiệp, thực hiện việc giao dịch để kiếm sống. Bob Volman viết quyển sách này để chia sẻ lại phương pháp giao dịch Price Action đặc biệt riêng của chính bản thân mình, vốn là điểm cốt yếu đã giúp ông thành công trong việc thấu hiểu hành vi của giá cả trên thị trường.
Understanding Price Action với khoảng 400 biểu đồ ví dụ được ghi chú cẩn thận đã trở thành một nguồn tài liệu về phương pháp Price Action bổ ích cho cộng đồng nhà giao dịch toàn cầu. Hiếm có quyển sách trading nào có được số lượng biểu đồ ví dụ sinh động và trực quan như Understanding Price Action.
Nếu bạn cần một cẩm nang về phương pháp Price Action đặc biệt hơn so với những phương pháp thông thường khác, Understanding Price Action là một lựa chọn không thể bỏ qua
', 59)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1035, N'Trading In The Zone - Thực Hành Kiểm Soát Cảm Xúc Bằng Tâm Lý Học Hành Vi Trong Đầu Tư Và Giao Dịch', N'1035.jpg', N'NXB Thanh Niên', N'Mark Douglas', 295000, CAST(N'1980-03-29' AS Date), 0, N'1001', N'1035_1.png', N'Trading In The Zone là quyển sách Top 1 kinh điển Thế giới trong việc giúp độc giả xây dựng phương thức quản trị cảm xúc đúng đắn, vững vàng tâm lý và củng cố kỷ luật trong quá trình đầu tư dài hạn hoặc đầu cơ lướt sóng trên thị trường tài chính.
Một chuyên gia nổi tiếng đã nhận xét rằng: “Bạn không thể trở thành người có lợi nhuận ổn định trên thị trường tài chính nếu chưa đọc và thực hành theo Trading In The Zone”. Thật vậy, Trading in The Zone vẫn đang là quyển sách TOP 1 KINH ĐIỂN về đầu tư tài chính trong nhiều chục năm qua, được các nhà đầu tư/ nhà giao dịch chuyên nghiệp, kể cả các phù thủy thị trường chứng khoán khuyến nghị PHẢI ĐỌC nếu muốn thành công bền vững. Và thực sự Trading In The Zone đã giúp độc giả xây dựng phương thức quản trị cảm xúc đúng đắn, vững vàng tâm lý và củng cố kỷ luật trong quá trình đầu tư dài hạn hoặc đầu cơ lướt sóng trên thị trường tài chính.
', 22)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1036, N'Nhà Lãnh Đạo Không Chức Danh', N'1036.jpg', N'NXB Trẻ', N'Robin Sharma', 84000, CAST(N'1980-03-29' AS Date), 0, N'1001', N'1036_1.jpg', N'Suốt hơn 15 năm, Robin Sharma đã thầm lặng chia sẻ với những công ty trong danh sách Fortune 500 và nhiều người siêu giàu khác một công thức thành công đã giúp ông trở thành một trong những nhà cố vấn lãnh đạo được theo đuổi nhiều nhất thế giới. Đây là lần đầu tiên Sharma công bố công thức độc quyền này với bạn, để bạn có thể đạt được những gì tốt nhất, đồng thời giúp tổ chức của bạn có thể có những bước đột phá đến một cấp độ thành công mới trong thời đại thiên biến vạn hóa như hiện nay.', 66)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1037, N'Phân Tích Chứng Khoán (Security Analysis)', N'1037.jpg', N'NXB Lao Động', N'Benjamin Graham - David L Dodd', 424150, CAST(N'1980-03-29' AS Date), 0, N'1001', N'1037_1.jpg', N'“Phiên bản thứ 6 của cuốn sách kinh điển Phân tích chứng khoán đã phủ nhận cách ngôn rằng ‘cái gì tốt rồi thì đừng sửa nó’. Một nhóm những nhà bình luận xuất sắc, dẫn đầu là Seth Klarman và James Grant, đã bắc chiếc cầu nối giữa thế giới tài chính đơn giản của thập niên 1930 với đấu trường đầu tư phức tạp của thiên niên kỷ mới. Độc giả sẽ hưởng lợi từ kinh nghiệm và sự thông thái của các chuyên gia thực hành xuất sắc nhất trong thế giới tài chính và các nhà quan sát thị trường thạo tin nhất. Phiên bản mới này là cuốn sách mà tất cả sinh viên tài chính nghiêm túc cần phải đọc.”', 8)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1038, N'Làm Chủ Business Analytics - Phân Tích Dữ Liệu Để Đi Đến Quyết Định Thông Minh', N'1038.jpg', N'Dân Trí', N'Trần Hùng Thiện, Tăng Thúy Nga', 242100, CAST(N'1980-03-29' AS Date), 0, N'1001', N'1038_1.png', N'Business Analytics hiện đang được nhiều doanh nghiệp săn đón bởi vai trò quan trọng mà vị trí này mang lại cho tổ chức. Nhưng trong thời điểm mà mọi người đổ xô đi học BA, không phải ai cũng hiểu:
- BA thực sự là gì? BA khác gì DA, BI?
- Học BA bắt đầu từ đâu?
- Tình hình thực tế của BA tại các doanh nghiệp Việt Nam như thế nào?
Từ những kiến thức trong suốt 20 năm nghiên cứu thị trường, đi cùng kinh nghiệm tư vấn, thực chiến với các doanh nghiệp hàng đầu, tác giả đã chắt lọc ra những kiến thức đắt giá về BA, phù hợp với phần lớn nhu cầu của doanh nghiệp Việt Nam hiện tại và tình trạng của họ.
', 21)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1039, N'The Book Of Leadership - Dẫn Dắt Bản Thân, Đội Nhóm Và Tổ Chức Vươn Xa', N'1039.jpg', N'NXB Hồng Đức', N'Anthony Gell', 135160, CAST(N'1980-03-29' AS Date), 0, N'1001', N'1039_1.jpg', N'Cuốn sách này dành cho những con người giàu khát vọng, mong muốn tạo ra sự khác biệt to lớn trong thế giới tuyệt vời mà chúng ta đang sống - những người muốn truyền cảm hứng và giúp đỡ mọi người xung quanh. Cho những người muốn sống một cuộc sống đam mê và đạt được những kết quả lớn lao trên chặng đường đi. Cho những người muốn tách khỏi đám đông và vươn đến đỉnh cao cuộc chơi. Cho những người đã chán ngấy những vị lãnh đạo yếu kém, chuyên quyền, vị kỉ hay đơn giản những lãnh đạo tầm thường, và thay vào đó những người muốn nâng cao tiêu chuẩn và nâng tầm bản thân.
Cuốn sách này dành cho cả những lãnh đạo dày dạn kinh nghiệm, đủ thông minh để biết rằng học tập không bao giờ ngừng nghỉ - rằng theo đuổi sự xuất chúng trong lãnh đạo là một hoạt động cả đời - và cho những lãnh đạo mới bổ nhiệm, ham học hỏi thói quen lãnh đạo tốt ngay từ đầu. Dành cho những người muốn đội nhóm của họ đạt kết quả phi thường, không phải bình thường, và cho lãnh đạo của những công ty lớn cũng như những công ty nhỏ (nhưng có hoài bão).
Về cơ bản, cuốn sách này dành cho những ai đang thèm khát (tôi không nói về nỗi thèm bánh nhé), đang tìm cách khai thác sức mạnh tuyệt vời mà lãnh đạo giỏi mang lại.
Nếu đó là bạn, thì tôi rất vinh hạnh khi có một người thực sự tuyệt vời trên thế giới đang cầm cuốn sách này, ngay lúc này, và tôi sẽ làm hết sức.
', 5)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1040, N'Tư Duy Ngược Dịch Chuyển Thế Giới - Originals: How Non-Conformists Move The World', N'1040.jpg', N'NXB Tổng Hợp TPHCM', N'Adam Grant', 142200, CAST(N'1980-03-29' AS Date), 0, N'1001', N'1040_1.jpg', N'Tư Duy Ngược Dịch Chuyển Thế Giới - Originals: How Non-Conformists Move The World
Adam Grant là tác giả cuốn Give and take (tựa tiếng Việt là “Cho và nhận), tác phẩm được The New York Times bình chọn là sách bán chạy nhất. Trong Give and take, Adam đã chỉ cho mọi người cách thức để bảo vệ thành công những ý tưởng mới, cũng như phương pháp để các nhà lãnh đạo có thể khuyến khích sự đa dạng và khác biệt trong suy nghĩ và hành động của tổ chức mình.
Với Tư duy ngược dịch chuyển thế giới, một lần nữa, Adam Grant lại giải quyết vấn đề làm sao để cải thiện thế giới, nhưng từ góc nhìn mới “trở nên khác biệt”: Chọn đi “ngược dòng”, đấu tranh với tính tuân thủ cứng nhắc và đập tan các truyền thống lỗi thời.
', 3)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1041, N'Bản Đồ Về Dòng Tiền - Hiểu Và Áp Dụng Sơ Đồ Kế Toán Trong Doanh Nghiệp Và Đời Sống', N'1041.jpg', N'Hồng Đức', N'Tetsuro Kondo, Mokoto Okiyama', 97150, CAST(N'1980-03-29' AS Date), 0, N'1001', N'1041_1.jpg', N'Bản Đồ Về Dòng Tiền - Hiểu Và Áp Dụng Sơ Đồ Kế Toán Trong Doanh Nghiệp Và Đời Sống
Qua từng phần của cuốn sách Bản đồ về dòng tiền: Hiểu và áp dụng sơ đồ kế toán trong doanh nghiệp và đời sống sẽ gửi tới bạn đọc từ những khái niệm cơ bản nhất về kế toán. Với quá khứ của tác giả - một người chưa hề biết tới kế toán là gì lại được dẫn lối chỉ đường từ chính những nội dung đơn giản trong cuốn sách này thì quả thật nó rất tuyệt vời!
', 1)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1042, N'Quy Tắc Làm Việc Của Google', N'1042.jpg', N'NXB Công Thương', N'Laszlo Bock', 186150, CAST(N'1980-03-29' AS Date), 0, N'1001', N'1042_1.jpg', N'Trong cuốn sách Quy Tắc Làm Việc Của Google, Laszlo Bock - Phó chủ tịch cấp cao phụ trách nhân sự của Google đã đưa ra một số lời khuyên hữu ích giúp các nhà quản lý thực hiện hiệu quả việc tuyển dụng nhân sự.
“Tất cả những gì bạn cần là tin tưởng rằng con người về cơ bản đều tốt, và có đủ can đảm để đối xử với nhân viên của bạn như những người chủ, thay vì những cỗ máy. Cỗ máy chỉ làm công việc của nó; còn người chủ có thể làm bất kỳ điều gì để công ty và nhóm của họ thành công.
Con người dành hầu hết thời gian ở công sở, nhưng công việc là một trải nghiệm không hề dễ chịu đối với hầu hết mọi người – một công cụ để đi đến kết thúc. Không nhất thiết phải như vậy.
Chúng ta không có mọi câu trả lời, nhưng chúng ta đã tìm ra vài điều thú vị về cách thức tốt nhất để tìm kiếm, phát triển và giữ chân nhân viên trong một môi trường tự do, sáng tạo và vui vẻ.
', 44)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1043, N'Phát Triển Kỹ Năng Lãnh Đạo', N'1043.jpg', N'NXB Lao Động', N'John C.Maxwell', 152150, CAST(N'1980-03-29' AS Date), 0, N'1001', N'1043_1.jpg', N'Định nghĩa đúng đắn về lãnh đạo – Lãnh đạo là sự ảnh hưởng, không hơn, không kém…
Phẩm chất của nhà lãnh đạo – Lãnh đạo không phải là một câu lạc bộ dành riêng cho những người sinh ra để chỉ huy. Muốn làm một nhà lãnh đạo, bạn phải có những phẩm chất được lĩnh hội và trau dồi qua thời gian. Kết hợp những phẩm chất đó với khát vọng và quyết tâm, thì không điều gì có thể ngăn bạn trở thành một nhà lãnh đạo.

Sự khác nhau giữa quản lý và nhà lãnh đạo – Đảm bảo tất cả mọi người đều hoàn thành công việc là tài năng của nhà quản lý. Khích lệ người khác làm việc tốt hơn là tài năng của nhà lãnh đạo.
Dù bạn đang ở nấc thang lãnh đạo nào, cuốn sách bạn đang cầm trên tay cũng sẽ khích lệ bạn truyền cảm hứng cho người khác bằng sự tận tâm và tầm nhìn xa trông rộng của nhà lãnh đạo.
', 42)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1044, N'Bán Hàng, Quảng Cáo Và Kiếm Tiền Trên Facebook', N'1044.jpg', N'NXB Thông Tin và Truyền Thông', N'MBA, Nguyễn Phan Anh', 143840, CAST(N'1980-03-29' AS Date), 0, N'1001', N'1044_1.jpg', N'Trong các hình thức kinh doanh trực tuyến thì bán hàng trên Facebook đang được xem là phương thức kinh doanh vô cùng hiệu quả trong thời đại số bên cạnh việc bán hàng thông qua một website bán hàng chuyên nghiệp. Sức lan tỏa nhanh chóng cùng với khả năng tiếp cận khách hàng tiềm năng hiệu quả, quản lý và bán hàng thuận tiện chính là điểm mạnh của hoạt động bán hàng online trên Facebook. Tuy nhiên, để có thể tăng trưởng doanh số tốt cùng với thúc đẩy hoạt động bán hàng đòi hỏi bạn cần có một chiến lược kinh doanh và cách bán hàng trên Facebook hợp lý.', 12)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1045, N'Nghệ Thuật Quản Lý Tài Chính Cá Nhân', N'1045.jpg', N'NXB Lao Động', N'Brian Tracy, Dan Strutzel', 95400, CAST(N'1980-03-29' AS Date), 0, N'1001', N'1045_1.jpg', N'TIỀN BẠC là niềm đam mê bất tận và nỗi khổ đau cùng cực của nhân loại, là chủ đề cực độ nhạy cảm nhưng tột cùng cuốn hút trong xã hội loài người. Người ta kiếm tiền, tiêu tiền, lại lo lắng nghĩ cách kiếm tiền, rồi tự hỏi tại sao cuộc đời mình khó khăn đến thế.
Ai cũng muốn đạt được một cuộc đời tự do về tài chính, nhưng bạn thực sự dành ra bao nhiêu tâm huyết và sức lực để giành lấy nó? Bạn có nghiêm túc suy nghĩ cải thiện năng lực kiếm tiền của bản thân, thận trọng tính toán khi chi tiêu, và khôn khéo cân nhắc lúc đầu tư? Hay nói trắng ra, bạn đã chú ý quản lý tài chính cá nhân đến mức nào để trở nên tự do tài chính?
Bất chấp vô số công trình nghiên cứu vi mô và vĩ mô, hiểu biết của cộng đồng về tiền bạc vẫn còn rất mơ hồ, và thái độ của mọi người về quản lý tài chính cá nhân vẫn còn rất mông lung.
', 7)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1046, N'Economix - Các Nền Kinh Tế Vận Hành (Và Không Vận Hành) Thế Nào Và Tại Sao?', N'1046.jpg', N'NXB Dân Trí', N'Michael Goodwin', 129200, CAST(N'1980-03-29' AS Date), 0, N'1001', N'1046_1.jpg', N'Nếu các bạn từng tìm cách hiểu những khái niệm kinh tế qua việc đọc vô số giáo trình kinh tế học, nhưng vẫn thấy thật khó hình dung được bức tranh toàn cảnh về bộ môn này, thì cuốn sách sẽ cung cấp cho các bạn một mảnh ghép hoàn chỉnh cho những mảnh nho nhỏ mà các bạn đã đọc qua.
Chúng ta sẽ hiểu rõ hơn về những khái niệm kinh tế cơ bản cùng những học thuyết kinh tế lớn còn ảnh hưởng tới ngày nay, qua tư tưởng của các nhà kinh tế học lớn như: Adam Smith, John Keynes...
Có thể coi đây là một cuốn sử về lịch sử kinh tế thế giới kể từ khi nền kinh tế hàng hóa ra đời. Chúng ta sẽ lướt qua vài thế kỷ với vô số học thuyết về kinh tế học cùng những vụ khủng hoảng kinh tế lớn như thể đang đọc một cuốn truyện tranh, cả bi lẫn hài, căng thẳng mà không kém phần sảng khoái.
', 43)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1047, N'Nghệ Thuật Kết Nối - Cách Tạo Ấn Tượng Để Kết Giao Khéo Léo', N'1047.jpg', N'NXB Hồng Đức', N'Patrick King', 138000, CAST(N'1980-03-29' AS Date), 0, N'1002', N'1047_1.jpg', N'Mọi người có thể thấy không phải vì công việc chúng ta mới cần quan hệ và mới cần để kết nối, kết giao với nhau mà hãy kết giao để tạo ra nhiều mối quan hệ trong công việc và cuộc sống. Có bao giờ bạn nghĩ đến các nguyên nhân khiến kết nối bị gián đoạn chưa? Kết nối bị gián đoạn làm mất thời gian, gián đoạn mạch thông tin cũng như ảnh hưởng đến chất lượng cuộc trò chuyện. Như vậy, kết nối là mạch nguồn của giao tiếp. Cuốn sách Nghệ thuật kết nối – Cách tạo ấn tượng để kết giao khéo léo sẽ chỉ ra rằng chất lượng các tương tác thực sự quan trọng chứ không chỉ là số lượng hay sự hiện diện của những người xung quanh chúng ta.', 13)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1048, N'Đọc Suy Nghĩ - Thấu Tâm Can', N'1048.jpg', N'Hồng Đức', N'Lư Văn Kiện', 156000, CAST(N'1980-03-29' AS Date), 0, N'1002', N'1048_1.jpg', N'Cuốn sách Đọc suy nghĩ, thấu tâm can tóm tắt chín kỹ năng đọc tâm trí biến bạn trở thành người đọc hiểu được suy nghĩ của người xung quanh mình trong vài giây, học được chiến lược tâm lý để không bị bối rối bởi đối phương.
Trong cuốn sách này, bạn sẽ học được cách nhanh chóng chiếm được lòng tin của người lạ; hiểu nhu cầu của người khác thông qua tâm lý học biểu hiện nhỏ; kỹ năng đàm phán và giao tiếp giành chiến thắng 100%; sử dụng tâm lý ám thị để kích thích tiềm năng bản thân; sử dụng "trái tim" để nhìn thế giới, để cuộc sống không ngừng được cải thiện.
', 7)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1049, N'Lập Trình Não Bộ - Làm Chủ Trí Nhớ, Sự Tập Trung, Cảm Xúc Và Giải Phóng Thiên Tài Bên Trong Bạn', N'1049.jpg', N'NXB Hồng Đức', N'Dave Farrow', 188000, CAST(N'1980-03-29' AS Date), 0, N'1002', N'1049_1.jpg', N'Người ta chỉ thường nghĩ đến tác động của não bộ là nó ảnh hưởng đến tâm trí, tư duy, cách suy nghĩ, cách quyết định hành động. Nhưng tâm trí, tư duy, hành động lại tác động đến cảm xúc, sức khỏe, dạ dày, một cơn thèm ăn, cơ bắp, giấc ngủ, và thậm chí là vận may…? Hay nói cách khác, não bộ điều khiển toàn bộ con người bạn, bất cứ điều gì diễn ra và cuộc đời bạn. Cách bạn làm, là hệ quả của não bộ. Vậy làm thế nào để có một “hệ quả tốt” như :giúp bạn có được sức khỏe cường tráng, học tập tiến bộ, sự nghiệp thăng tiến, cuộc đời thăng hoa... thay vì một “hệ lụy” với những quyết định sai lầm, ảo não, một tư duy yếu đuối và một cuộc đời tầm thường.', 32)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1050, N'Lắng Nghe Tiếng Nói Bên Trong Bạn', N'1050.jpg', N'NXB Hồng Đức', N'Micheal Hyatt, Megan Hyatt Miller', 176000, CAST(N'1980-03-29' AS Date), 0, N'1002', N'1050_1.jpg', N'Lắng Nghe Tiếng Nói Bên Trong Bạn
Nhiều người vẫn thường khuyên rằng “Đừng đi tìm kiếm một câu trả lời ở bất kì đâu cả. Hãy lắng nghe tiếng nói bên trong của bạn!” Vậy tiếng nói bên trong bạn là gì và làm thế nào để lắng nghe nó?
', 33)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1051, N'Nguyên Tắc Bất Biến Khiến Sự Nghiệp Thăng Tiến Cuộc Đời Thăng Hoa', N'1051.jpg', N'NXB Hồng Đức', N'Joseph Murphy', 150000, CAST(N'1980-03-29' AS Date), 0, N'1002', N'1051_1.jpg', N'Rất nhiều người dù đang ở độ tuổi 20, 40 hay 60 đều mong muốn một ngày cuộc đời mình sẽ khác với hiện tại, song lại bị dòng đời cuốn trôi vùi dập. Họ bị hiện thực đánh bại, lặng lẽ sống một cuộc sống bình thường đến cuối đời. Nhưng Kazuo Inamori - Người được mệnh danh là một trong bốn huyền thoại kinh doanh của Nhật Bản thì không như vậy. Ông từng sống một tuổi trẻ bình thường, một gia cảnh bình thường, học một trường đại học bình thường, nhưng ông không để bản thân gục ngã trước cuộc đời mà tin rằng chỉ cần mình nỗ lực hơn nữa thì sẽ được đền đáp xứng đáng.', 22)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1052, N'Are You Really Ok? - Để Trở Thành Bác Sĩ Tâm Lý Của Chính Mình', N'1052.jpg', N'NXB Hồng Đức', N'Debra Fileta', 176000, CAST(N'1980-03-29' AS Date), 0, N'1002', N'1052_1.jpg', N'Bạn có nghĩ rằng mình tự hiểu hết bản thân, không có bất kỳ một vết thương nào sâu bên trong tâm hồn. Đôi lúc tôi có những suy nghĩ tiêu cực và hành động sai trái đến khi bình tĩnh lại tôi mới kiểm soát được bản thân. Để tìm ra giải pháp giúp bạn hiểu về sự thực đó "Are You Really OK?" sẽ là cuốn sách bào chữa vết thương và trở thành bác sĩ tâm lý của chính mình cho bạn. Bởi trong chúng ta ai cũng sẽ có lúc bế tắc hay khoảnh khắc đẹp, trước khi cuộc sống trải lụa hồng thì phải đi qua mảnh đất đầy gai góc, điều quan trọng phải vượt qua chúng như thế nào?', 55)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1053, N'Từ Đơn Giản Đến Trường Tồn	', N'1053.jpg', N'Hồng Đức', N'Jin Kang Moller', 188000, CAST(N'1980-03-29' AS Date), 0, N'1002', N'1053_1.jpg', N'Con người ngày nay khao khát sự đơn giản. Khi ta sống trong thời đại nhiễu loạn của quá nhiều thông tin, tính năng và sự lựa chọn. Người ta vô cùng khao khát những giải pháp giúp đơn giản hoá và nâng cao chất lượng cuộc sống. Cứ tưởng tượng mà xem, giữa hai sản phẩm có cùng công dụng, chúng ta ưu tiên lựa chọn sản phẩm nào dễ dàng sử dụng; khi phân vân giữa hai việc, chúng ta thường chọn những việc ít quy trình và ít rườm rà hơn.
Nhưng đừng nghĩ đơn giản là một thứ dễ dàng. Tạo ra một thứ phức tạp, nhiều quy trình, cồng kềnh không hề là một điều khó. Biến những thứ phức tạp trở nên đơn giản nhưng mang lại trải nghiệm đỉnh cao mới là điều khó. Làm thế nào để ta đơn giản hoá mọi thứ, làm thế nào để tạo ra các sản phẩm và hệ thống chỉ lấy con người làm trung tâm thay vì nhiều thứ thừa thãi? Làm thế nào để thật sự đổi mới? Đây quả thật là một bài toán khó.
Sự đơn giản được định nghĩa là tính chất dễ hiểu, dễ thực hiện. Nhưng tính chất của sự đơn giản không phải chỉ biến mọi thứ trở nên dễ dàng. Đó là chắt lọc những yếu tố cần thiết, hiểu được điều gì quan trọng nhất và giảm tải phần còn lại. Sự đơn giản là một trải nghiệm giúp mọi thứ trở nên dễ dàng đối với người dùng và mang lại hiệu ứng cảm xúc tích cực.
', 32)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1054, N'Manifest - 7 Bước Để Thay Đổi Cuộc Đời Bạn Mãi Mãi', N'1054.jpg', N'NXB Thế Giới', N'Roxie Nafousi', 80100, CAST(N'1980-03-29' AS Date), 0, N'1002', N'1054_1.jpg', N'Tôi ở đây để nói với bạn rằng bạn có thể.”
_ Roxie Nafousi _
Mở ra cánh cửa Manifest và giải phóng tiềm năng vô hạn của chính mình cùng cuốn sách MANIFEST – 7 bước để thay đổi cuộc đời bạn mãi mãi.
Cuốn sách này là một chỉ dẫn cần thiết cho bất kỳ ai muốn tự làm chủ cuộc đời mình. Chỉ với 7 bước cơ bản, bạn có thể hoàn toàn hiểu được Manifest thực sự là gì và tạo ra một cuộc sống mà bạn hằng mong ước.
Là một sự giao thoa giữa khoa học và sự thông thái, Manifest là một dạng rèn luyện phát triển bản thân, học cách yêu bản thân, giúp bạn vươn tới mục tiêu và sống một cuộc sống viên mãn nhất.
', 35)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1055, N'Giả Vờ Là Người Hướng Ngoại', N'1055.jpg', N'NXB Dân Trí', N'Dương Tư Viễn', 107100, CAST(N'1980-03-29' AS Date), 0, N'1002', N'1055_1.jpg', N'Đã bao giờ bạn tự thấy mình có những biểu hiện này chưa?
- Trong giao tiếp hằng ngày, bạn luôn để lại ấn tượng yêu đời và vui vẻ trước mặt mọi người, nhưng vẻ ngoài càng lạc quan thì trong lòng càng cô đơn.
- Luôn đeo lên chiếc mặt nạ của người trưởng thành, thường giúp đỡ người khác giải quyết vấn đề, nhưng vấn đề của bản thân lại chẳng ai quan tâm, chỉ có thể tự mình chầm chậm giải quyết.
- Hay tổn thương vì một lời nói của người khác, nhưng không muốn bị phát hiện.
- Khao khát gặp được một người thực sự hiểu mình, nhưng khi gặp được lại tránh né theo bản năng.
…
', 43)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1056, N'Sống Khai Vấn - Sống Tỉnh Thức', N'1056.jpg', N'NXB Dân Trí', N'Brianna Wiest', 188100, CAST(N'1980-03-29' AS Date), 0, N'1002', N'1056_1.jpg', N'Gốc rễ của việc làm người là học cách suy nghĩ. Từ điều đó, chúng ta biết học cách để yêu, chia sẻ, khoan dung và cho đi. Nhiệm vụ trước tiên và quan trọng nhất của con người ngay từ khi sinh ra là hiện thực hóa tiềm năng cho cả bản thân và cho thế giới.
Sống khai vấn – Sống tỉnh thức là tuyển tập các bài viết của tác giả Brianna Wiest đưa ra lý do tại sao bạn nên theo đuổi mục đích hơn là đam mê, chấp nhận suy nghĩ tiêu cực, thấu triệt sự sáng suốt trong thói quen hàng ngày và nhận thức được những thành kiến đang tạo ra cách bạn nhìn nhận cuộc sống của mình.
Mỗi bài luận được đề cập trong cuốn sách là nơi dừng chân để chúng ta suy nghĩ và chiêm nghiệm, đưa ra các ý tưởng để thay đổi cuộc đời. Cuốn sách đã giúp hàng triệu người trên thế giới nhìn nhận và phát triển bản thân trong hành trình sống ở hiện tại.
SỐNG KHAI VẤN – SỐNG TỈNH THỨC là một trong số những cuốn sách bán chạy nhất toàn cầu và trở thành một hiện tượng truyền thông xã hội ngay từ khi ra mắt bạn đọc.
', 31)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1057, N'Phần Đời Còn Lại, Hãy Làm Một Người Phụ Nữ Tự Tỏa Hào Quang', N'1057.jpg', N'NXb Thế Giới', N'Cách Thư', 98000, CAST(N'1980-03-29' AS Date), 0, N'1002', N'1057_1.jpg', N'“Không quấy nhiễu khoảng lặng của người khác, chính là khoan dung; không tổn thương lòng tự trọng của người khác, chính là lương thiện.”
Những người phụ nữ đáng ngưỡng mộ luôn mang theo ánh hào quang của riêng mình – không hề chói lòa hay khiến người ta khó chịu, mà lại giống như ánh nắng ngày đông, ôn hòa và ấm áp. Người phụ nữ tự tỏa sáng rạng ngời như thế, vừa dịu dàng vừa mạnh mẽ, cho dù có rơi vào nghịch cảnh tăm tối, trong nội tâm vẫn sẽ đong đầy tình yêu và ngọn lửa ấm nóng, làm rung động lòng người, khiến người khác vô thức mà muốn thân quen.
Mong bạn sẽ trở thành một phụ nữ như vậy, tự có hào quang của riêng mình, không làm khó người khác, càng không làm khó chính mình.
Chúc cho bạn, phần đời còn lại, thong dong tự tại, trong tim có nắng, trong thẻ có tiền, bình yên vui vẻ!
', 74)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1058, N'The Power Of Your Subconscious Mind - Sức Mạnh Tiềm Thức', N'1058.jpg', N'NXB Hồng Đức', N'Joseph Murphy', 151200, CAST(N'1980-03-29' AS Date), 0, N'1002', N'1058_1.jpg', N'Cuốn sách Sức mạnh tiềm thức: The Power of Your Subconscious Mind sẽ hướng dẫn bạn đạt đến vị trí thực sự của mình, giải quyết những khó khăn, cắt đứt ràng buộc về cảm xúc và thể xác để đặt bạn trên con đường vương giả dẫn đến tự do, hạnh phúc và bình yên trong tâm hồn!
Điều kỳ diệu của sức mạnh tiềm thức
Có một điều bạn nên biết, đó chính là bạn hoàn toàn không cần phải tìm kiếm sức mạnh này ở đâu cả bởi vì vốn dĩ bạn đã sở hữu nó rồi. Tận sâu bên trong tiềm thức của bạn là sự thông thái vô hạn, quyền năng vô hạn và nguồn cung vô hạn cho tất cả những điều cần thiết đang chờ được phát triển và bộc lộ.
', 12)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1059, N'Mặt Lợi Của Góc Tối', N'1059.jpg', N'NXB Thế Giới', N'Todd B. Kashdan, Robert Biswas-Diener', 117900, CAST(N'1980-03-29' AS Date), 0, N'1002', N'1059_1.jpg', N'Ai cũng có một mặt tối muốn giữ cho riêng mình. Đó có thể là sự ghen tị, nỗi sợ, lo âu, chần chừ, kiêu ngạo hay tự ti… Góc tối đó có phải nguồn gốc của nỗi đau mà ta cần làm mọi cách để loại bỏ hay che đậy? Thực chất, trải nghiệm cảm xúc tiêu cực là quyền và phẩm chất bẩm sinh của chúng ta, mang đến nhiều ý nghĩa như: sợ hãi khiến bạn biết tránh xa nguy hiểm, tức giận sản sinh adrenaline để chuẩn bị cho cơ chế chống trả kẻ thù, cảm giác tội lỗi giúp chúng ta nhìn nhận lại và học hỏi tốt hơn từ kinh nghiệm bản thân.
Vậy bạn có sẵn sàng đi tìm Mặt lợi của góc tối bên trong bản thân mình? Hành trình này hẳn là không dễ dàng, nhưng một khi đã sẵn sàng nhìn nhận những góc sâu nhất bên trong và ôm ấp chúng, bạn sẽ thấy được một vẻ đẹp toàn vẹn nhất.
', 32)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1060, N'Nghệ Thuật Kaizen Tuyệt Vời Của Toyota', N'1060.jpg', N'NXB Phụ Nữ Việt Nam', N'Yoshihito Wakamatsu', 112500, CAST(N'1980-03-29' AS Date), 0, N'1002', N'1060_1.jpg', N'Kaizen là hệ thống phát huy trí tuệ con người
Thu được thành quả lớn từ việc thực hiện những việc nhỏ
', 21)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1061, N'Tôi Ghét Thứ Gọi Là Lo Lắng', N'1061.jpg', N'NXB Thế Giới', N'Sarah Knight', 81000, CAST(N'1980-03-29' AS Date), 0, N'1002', N'1061_1.jpg', N'Mỗi sáng thức dậy, chúng ta loạng choạng bước đi trên một quả bom hẹn giờ đang xoay được gọi là Trái Đất, mục tiêu cơ bản của mỗi người là vượt qua một ngày trước mắt. Một vài người cố gắng kiếm tìm những thứ khác như thành công, sự thảnh thơi hay những lời yêu thương từ ai đó. Phần còn lại thì luôn trong trạng thái lo lắng và chỉ mong rằng mình không phải đối mặt với điều gì quá khủng khiếp. Trong đầu họ dường như lúc nào cũng tồn tại những câu hỏi đại loại là “Nếu như… thì sao?”.
Trong tất cả những nỗi lo đó sẽ có những điều là vô lý nhưng cũng sẽ có những điều thật sự có thể xảy ra. Rắc rối có thể ập đến bất kỳ lúc nào, đó chính là quy luật của cuộc sống.
Vậy, nếu vấn đề đó thật sự xảy ra, bạn sẽ phản ứng thế nào? Là sững sờ hay sợ sệt? Là khóa cửa phòng tắm lại và khóc hay ngửa cổ lên trời và hét to? Hay bạn sẽ cố để vờ như mọi chuyện chưa từng xảy ra?
Khi gặp khó khăn và rơi vào trạng thái lo lắng, bình tĩnh là điều mà chúng ta cần làm để có thể đối mặt và giải quyết vấn đề. Nhưng việc tự hét lên với bản thân rằng “Bình tĩnh lại!” chính là điều vô nghĩa nhất. Hay gặp gỡ và nhận những lời an ủi “Đừng lo, mọi chuyện rồi sẽ ổn thôi” từ những người xung quanh cũng sẽ chẳng giúp những rắc rối được tháo gỡ mà chỉ khiến bạn khó chịu, làm mất đi mối quan hệ tốt đẹp trước đó.
Thay vào đó, hãy để “TÔI GHÉT THỨ GỌI LÀ LO LẮNG” hướng dẫn bạn giải quyết triệt để những vấn đề trên. Cuốn sách sẽ cung cấp cho bạn bộ công cụ hiệu quả, giúp bạn vượt qua hội chứng lo âu bao gồm những lời khuyên vượt qua nỗi sợ, mẹo nhỏ rũ bỏ rắc rối và cả những phương pháp xử lý “mớ rác” tiêu cực để mỗi ngày bạn sống đều là những ngày vui vẻ.
', 4)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1062, N'Hoàng Tử Bé', N'1062.jpg', N'NXB Kim Đồng', N'Antoine De Saint-Exupéry', 33250, CAST(N'1980-03-29' AS Date), 0, N'1003', N'1062_1.jpg', N'Trong hơn nửa thế kỷ qua, " Hoàng Tử Bé - Le Petit Prince " của tác giả Antoine de Saint - Exupéry vẫn là cuốn sách tiếng Pháp được yêu thích nhất và được chuyển ngữ nhiều nhất trên thế giới. Thật kỳ lạ, bởi hàm ý, mục đích và chủ đề của cuốn sách ngụ ngôn này có vẻ xa vời với nhiều độc giả, thậm chí gần tám mươi năm sau lần xuất hiện đầu tiên.
Nhưng theo thời gian, sự chọn lựa và yêu thích của độc giả chính là thước đo gí trị chân thực nhất chứng minh cho vị trí đặc biệt của tác phẩm. Và " Hoàng Tử Bé " với câu truyện về chàng hoàng tử nhỏ cô đơn rời tiểu tinh cầu bé nhỏ của mình, du hành khắp vũ trụ, viếng thăm rồi lại lìa xa Trái Đất vẫn được xem là một trong những tác phẩm thơ mộng nhất của mọi thời đại. Cuốn sách kinh điển của Saint - Exupéry nay được Nhà sách Minh Thắng tái bản với những hình vẽ minh họa của họa sĩ Việt Đỗ, một bản dịch được rất nhiều độc giả yêu thích bởi ngôn từ giàu tình cảm, trong sáng và hình ảnh thú vị.
', 1)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1063, N'Chuyện Con Mèo Dạy Hải Âu Bay', N'1063.jpg', N'NXB Hội Nhà Văn', N'Luis Sepúlveda', 39200, CAST(N'1980-03-29' AS Date), 0, N'1003', N'1063_1.jpg', N'Chuyện con mèo dạy hải âu bay là kiệt tác dành cho thiếu nhi của nhà văn Chi Lê nổi tiếng Luis Sepúlveda – tác giả của cuốn Lão già mê đọc truyện tình đã bán được 18 triệu bản khắp thế giới. Tác phẩm không chỉ là một câu chuyện ấm áp, trong sáng, dễ thương về loài vật mà còn chuyển tải thông điệp về trách nhiệm với môi trường, về sự sẻ chia và yêu thương cũng như ý nghĩa của những nỗ lực – “Chỉ những kẻ dám mới có thể bay”.
Cuốn sách mở đầu cho mùa hè với minh họa dễ thương, hài hước là món quà dành cho mọi trẻ em và người lớn.
', 2)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1064, N'Tôi Vẽ - Phương Pháp Tự Học Vẽ Truyện Tranh', N'1064.jpg', N'NXb Đông A', N'Nhiều tác giả', 85000, CAST(N'1980-03-29' AS Date), 0, N'1003', N'1064_1.jpg', N'“Tôi vẽ với 300 trang sách bao gồm những kỹ năng cơ bản cần có của một họa sĩ truyện tranh, từ tạo hình nhân vật, thiết kế bối cảnh, biểu cảm, các kỹ thuật diễn họa cho đến luật phối cảnh. Đây là một cuốn cẩm nang tuyệt vời dành cho các bạn đang bắt đầu học vẽ truyện tranh. Những kiến thức này có thể không giúp các bạn vẽ đẹp ngay lập tức nhưng sẽ là nền tảng vững chắc giúp bạn hình thành các tiêu chuẩn chuyên nghiệp trong nghề và không mất thời gian tự mò mẫm. Phần minh họa cho các bài học cũng rất hấp dẫn và sáng tạo. Các tác giả đã sử dụng chính nhân vật và trang truyện của mình để làm rõ sự liên quan giữa lý thuyết và thực tế, tính ứng dụng rõ ràng của các kỹ thuật và quy trình sáng tác.
 Trên thị trường hiện tại không thiếu những quyển sách dạy vẽ truyện tranh được dịch và biên tập lại từ nhiều nguồn nhưng đa số là kiểu sách “cầm tay chỉ việc”, không thật sữ hữu ích với các bạn trẻ Việt Nam – những bạn không theo học chuyên ngành mỹ thuật, thiếu kiến thức nền tảng về hội họa… Ngược lại, trong quyển Tôi vẽ, mọi phần kiến thức từ lớn đến nhỏ đều được lý giải và phân tích khá kỹ kèm ảnh minh họa rõ ràng, giúp người xem hiểu được gốc rễ vấn đề đồng thời áp dụng áp dụng vào nhiều “ngữ cảnh” khác nhau trong lúc sáng tác. Hệ thống kiến thức trong sách cũng được sắp xếp hợp lý từ thấp đến cao, xen kẽ là những trang truyện và hình minh họa vui nhộn làm giảm áp lực cho phần lý thuyết hơi khô cứng như phần phối cảnh và anatony (giải phẫu)”
', 4)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1065, N'Chú Thuật Hồi Chiến: Trường Chuyên Chú Thuật Tokyo - Tập 0 ', N'1065.jpg', N'NXB Kim Đồng', N'Gege Akutami', 28500, CAST(N'1980-03-29' AS Date), 0, N'1003', N'1065_1.jpg', N'Chú Thuật Hồi Chiến: Trường Chuyên Chú Thuật Tokyo - Tập 0 - Bản Thường
Như vậy là sau thời gian dài "trong ngóng ngoài trông", cuối cùng thì dự án JUJUTSU KAISEN - Manga đình đám nhất tại Nhật Bản năm 2021, với tổng số lượng sách bán ra lên đến gần 40 triệu bản in (cho 17 tập) - sẽ chính thức có một cú nổ lớn tại Việt Nam, với tập truyện mang tính khởi đầu, đó chính là Vol.0: Trường chuyên chú thuật Tokyo!
Khốn khổ vì bị oán linh Rika ám, cậu học sinh trung học Yuta Okkotsu định kết liễu đời mình. Đúng lúc đó, Gojo Satoru - giáo viên của trường chuyên chú thuật, một nơi dạy cách giải trừ “lời nguyền” - đã yêu cầu Okkotsu chuyển tới ngôi trường này…!?
', 75)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1066, N'Chú Thuật Hồi Chiến: Tập 1', N'1066.jpg', N'NXB Kim Đồng', N'Gege Akutami', 28500, CAST(N'1980-03-29' AS Date), 0, N'1003', N'1066_1.jpg', N'Itadori Yuji là một học sinh cấp Ba sở hữu năng lực thể chất phi thường. Hằng ngày cậu thường tới bệnh viện chăm người ông đang ốm liệt giường. Nhưng một ngày nọ, phong ấn của “chú vật” vốn ngủ yên trong trường bị phá giải, quái vật xuất hiện. Để cứu hai anh chị khóa trên đang gặp nguy hiểm, Itadori đã xông vào trường và...', 88)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1067, N'Chú Thuật Hồi Chiến - Tập 2', N'1067.jpg', N'NXB Kim Đồng', N'Gege Akutami', 28500, CAST(N'1980-03-29' AS Date), 0, N'1003', N'1067_1.jpg', N'Chú thai bất ngờ xuất hiện tại trại cải tạo thanh thiếu niên. Nhóm Itadori, học sinh năm Nhất trường chuyên chú thuật, được cử đi cứu những người đang mắc kẹt bên trong. Nhưng chú thai sau khi hóa thành chú linh đã tấn công cả nhóm. Trước tình thế hiểm nghèo, Itadori đã trao quyền kiểm soát cơ thể cho Sukuna với hi vọng sẽ hạ gục chú linh, song...!? ', 55)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1068, N'Chú Thuật Hồi Chiến - Tập 3', N'1068.jpg', N'NXB Kim Đồng', N'Gege Akutami', 28500, CAST(N'1980-03-29' AS Date), 0, N'1003', N'1068_1.jpg', N'Todo Aoi và Zen’in Mai của trường chuyên chú thuật Kyoto xuất hiện trước mặt Fushiguro và Kugisaki! Todo hỏi Fushiguro thích kiểu con gái như thế nào và câu trả lời của cậu là...
Mặt khác, Itadori vẫn đang trong quá trình rèn luyện, để nâng cao kĩ năng thực chiến, cậu đã đến hiện trường án mạng do chú linh gây ra...
', 33)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1069, N'Chú Thuật Hồi Chiến: Tập 4', N'1069.jpg', N'NXB Kim Đồng', N'Gege Akutami', 28500, CAST(N'1980-03-29' AS Date), 0, N'1003', N'1069_1.jpg', N'Tại hiện trường án mạng do chú linh gây ra, Itadori đã gặp gỡ Junpei, cả hai tâm đầu ý hợp. Nhưng Junpei lại tôn sùng chú linh Mahito, thủ phạm của vụ án. Mahito lợi dụng Junpei, hòng li gián cậu và Itadori. Junpei rơi vào cạm bẫy của hắn và...', 12)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1070, N'Chú Thuật Hồi Chiến - Tập 5', N'1070.jpg', N'NXB Kim Đồng', N'Gege Akutami', 28500, CAST(N'1980-03-29' AS Date), 0, N'1003', N'1070_1.jpg', N'Giao lưu trường kết nghĩa Kyoto đã bắt đầu. Trong trận chiến đội ở ngày thứ nhất, bên nào thanh tẩy được chú linh cấp 2 trong khu vực thi đấu trước sẽ thắng. Với bản tính hiếu chiến, Todo đã lập tức tấn công bên Tokyo nhưng bị Itadori phục kích. Những thành viên khác của đội Kyoto cũng tham chiến hòng ám sát Itadori, khiến cậu rơi vào tình thế tiến thoái lưỡng nan!!', 212)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1071, N'Chú Thuật Hồi Chiến - Tập 6', N'1071.jpg', N'NXB Kim Đồng', N'Gege Akutami', 28500, CAST(N'1980-03-29' AS Date), 0, N'1003', N'1071_1.jpg', N'Phía Kyoto lợi dụng cơ hội giao lưu để trừ khử Itadori. Trong lúc đó, chú nguyền sư và chú linh do Mahito cầm đầu đã đột nhập vào khu vực diễn ra buổi giao lưu. Nhóm giáo viên định tới ứng cứu học sinh nhưng lại bị “màn” của phe địch cản bước...!? Bị chú linh đặc cấp Hanami tấn công, liệu Fushiguro và Inumaki có thoát khỏi vòng nguy hiểm!?', 33)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1072, N'Chú Thuật Hồi Chiến: Tập 7', N'1072.jpg', N'NXB Kim Đồng', N'Gege Akutami', 28500, CAST(N'1980-03-29' AS Date), 0, N'1003', N'1072_1.jpg', N'Chú linh đặc cấp Hanami và đồng bọn đã rút lui khỏi trường chuyên chú thuật, nhưng các ngón tay của Sukuna và chú vật đặc cấp “Chú thai cửu tương đồ” đã bị đánh cắp. Cửu tương đồ có được thực thể và trở thành mối nguy mới. Song nhóm Itadori lại chẳng hay biết gì về hiểm họa đó, vẫn lên đường làm nhiệm vụ tiêu diệt “Chú linh xuất hiện ở cánh cửa”...!?', 31)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1073, N'Chú Thuật Hồi Chiến - Tập 8', N'1073.jpg', N'NXB Kim Đồng', N'Gege Akutami', 28500, CAST(N'1980-03-29' AS Date), 0, N'1003', N'1073_1.jpg', N'Nhóm Itadori đã đánh bại anh hai và anh ba trong “Chú thai cửu tương đồ” và thu hồi ngón tay Sukuna. Nhờ đó họ đã được đề cử lên làm thuật sư cấp 1. Ý đồ của Gojo khi chọn cách đi đường vòng là gì…!?
Trong tập này, câu chuyện sẽ lội ngược dòng thời gian về sự kiện khi Gojo và Geto còn là học sinh năm Hai của trường chuyên chú thuật!!
', 32)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1074, N'Doraemon Movie Story Màu - Nobita Và Vùng Đất Lý Tưởng Trên Bầu Trời', N'1074.jpg', N'NXB Kim Đồng', N'Fujiko F Fujio', 33250, CAST(N'1980-03-29' AS Date), 0, N'1003', N'1074_1.jpg', N'Câu chuyện bắt đầu khi Nobita tìm thấy một hòn đảo hình lưỡi liềm trên trời mây. Ở nơi đó, tất cả đều hoàn hảo… đến mức cậu nhóc mê ngủ ngày như Nobita cũng có thể trở thành một thần đồng toán học, một siêu sao thể thao! Doraemon và nhóm bạn đã cùng sử dụng một món bảo bối độc đáo chưa từng xuất hiện trước đây để đến với vương quốc tuyệt vời này. Cùng với những người bạn ở đây, đặc biệt là chàng robot mèo Sonya, cả hội đã có chuyến hành trình tới vương quốc trên mây tuyệt vời… cho đến khi những bí mật đằng sau vùng đất lý tưởng này được hé lộ!', 11)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1075, N'Doraemon Movie Story: Nobita Và Người Khổng Lồ Xanh', N'1075.jpg', N'NXB Kim Đồng', N'Fujiko F Fujio', 33250, CAST(N'1980-03-29' AS Date), 0, N'1003', N'1075_1.jpg', N'Nobita đã dùng bảo bối "dung dịch giúp cây tự phát triển" để biến cái cây cậu nhặt về trên núi thành một cái cây có linh hồn biết cử động. Cái cây đó được Nobita đặt tên là Kibou. Bỗng một ngày, đang chơi trên ngọn núi sau nhà, Nobita và Kibou đã bị người thực vật đưa đến hành tinh xanh - Green. Và nhóm bạn biết được kế hoạch làm sống lại người khổng lồ xanh để cướp hết các loài thực vật và thôn tính Trái đất. Doraemon ơi, hãy cứu lấy Kibou và tương lai của Trái Đất nhé!', 34)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1076, N'Doraemon Movie Story: Nobita Và Những Hiệp Sĩ Không Gian - Vũ Trụ Anh Hùng Kí', N'1076.jpg', N'NXB Kim Đồng', N'Fujiko F Fujio', 33250, CAST(N'1980-03-29' AS Date), 0, N'1003', N'1076_1.jpg', N'Nhóm bạn Nobita vì ngưỡng mộ bộ phim “Vệ binh dải ngân hà” chiếu trên ti vi nên đã quyết định tự thực hiện một bộ phim về đề tài anh hùng. Nhờ bảo bối “Đạo diễn Burger”, bộ phim đã chính thức bấm máy! Nhóm bạn trở thành những siêu anh hùng sở hữu tuyệt chiêu riêng của từng người. Để giúp đỡ cậu bạn Aron tới Trái Đất nhằm tìm kiếm cứu tinh, cả nhóm đã đáp xuống hành tinh Pokkuru. Một tập phim tuyệt tác với những pha hành động gay cấn đến thót tim của 5 người bạn nhỏ!', 33)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1077, N'Thỏ Bảy Màu Và Những Người Nghĩ Nó Là Bạn', N'1077.jpg', N'NXB Dân Trí', N'HUỲNH THÁI NGỌC', 79200, CAST(N'1980-03-29' AS Date), 0, N'1003', N'1077_1.jpg', N'Thỏ Bảy Màu là fanpage sở hữu hơn 2,6tr lượt thích trên mạng xã hội. Với hình tượng nhân vật thú vị cùng phong cách sáng tạo độc đáo, Thỏ bảy màu vẫn luôn là thu hút được số lượng lớn người quan tâm thể hiện qua nhiều bài viết với hàng chục nghìn lượt like và share.
Thỏ Bảy Màu là một nhân vật hư cấu chẳng còn xa lạ gì với anh em dùng mạng xã hội với slogan “Nghe lời Thỏ, kiếp này coi như bỏ!”.
Thỏ Bảy Màu đơn giản chỉ là một con thỏ trắng với sự dở hơi, ngang ngược nhưng đáng yêu vô cùng tận. Nó luôn nghĩ rằng mình không có cuộc sống và không có bạn bè. Tuy nhiên, Thỏ lại chẳng bao giờ thấy cô đơn vì đến cô đơn cũng bỏ nó mà đi.
Cuốn sách là những mẩu chuyện nhỏ được ghi lại bằng tranh xoay quanh Thỏ Bảy Màu và những người nghĩ nó là bạn. Những mẩu chuyện được truyền tải rất “teen” đậm chất hài hước, châm biếm qua sự sáng tạo không kém phần “mặn mà” của tác giả càng trở nên độc đáo và thu hút.
', 55)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1078, N'Thất Tịch Không Mưa', N'1078.jpg', N'NXB Phụ Nữ', N'Lâu Vũ Tình', 73100, CAST(N'1980-03-29' AS Date), 0, N'1004', N'1078_1.jpg', N'Từ nhỏ cô đã thầm yêu anh, như số kiếp không thể thay đổi Tình yêu trong sáng ấy, như lần đầu được nếm mùi vị của quả khế mới chín. Sau đó cô và anh xa nhau, gặp lại đều cách nhau ba năm.
Tình yêu, giống như lần đầu được nếm thử quả khế mới chín.
Chua chua, chát chát, nhưng không kìm được, vẫn muốn nếm thêm lần nữa.
Trong quả khế chát xanh xanh, nụ cười ngốc nghếch, ngọt ngào của anh, tình đầu thơ ngây, trong sáng của em lặng lẽ nảy mầm.
', 31)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1079, N'Mãi Mãi Là Bao Xa', N'1079.jpg', N'NXB Thanh Niên', N'Diệp Lạc Vô Tâm', 114750, CAST(N'1980-03-29' AS Date), 0, N'1004', N'1079_1.jpg', N'Bạch Lăng Lăng, nữ sinh khoa Điện khí, trẻ trung, xinh đẹp và rất tự hào khi quen được một người bạn lý tưởng qua mạng, chàng du học sinh của một trường nổi tiếng của Mỹ, người mang biệt danh “nhà khoa học”: Mãi Mãi Là Bao Xa. Qua những cuộc chuyện trò trên QQ, Lăng Lăng đã gắn bó với chàng trai đó lúc nào cô cũng không hay, cảm xúc lớn dần, sự chia sẻ lớn dần và đến một ngày cô phát hiện ra mình đã yêu người con trai “tài giỏi” và không một chút khuyết điểm ấy.
Nhưng sự tỉnh táo giúp cô ý thức được rằng, thế giới mạng chỉ là ảo, họ ở cách nhau cả một đại dương mênh mông, anh lại quá xuất sắc và ưu tú, mối quan hệ của họ sẽ không có kết quả gì. Nhất là khi anh thông báo, nếu anh tiếp tục sự nghiệp nghiên cứu lần này, rất có thể anh phải định cư bên Mỹ, mãi mãi không trở về. Khi nghe tin đó, cô đã gục xuống trước màn hình máy tính và khóc. Tất cả như sụp đổ, tia hy vọng cuối cùng dập tắt, anh sẽ không về nước nữa, khoảng cách giữa họ là mãi mãi… Cô cay đắng nói với anh lời từ biệt và đưa nick của anh vào danh sách đen, không bao giờ xuất hiện khi cô đăng nhập QQ nữa…
', 33)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1080, N'Vẽ Em Bằng Màu Nỗi Nhớ', N'1080.jpg', N'NXB Dân Trí', N'Tâm Phạm', 108800, CAST(N'1980-03-29' AS Date), 0, N'1004', N'1080_1.jpg', N'Vẽ em bằng màu nỗi nhớ là một câu chuyện tình yêu có thật, đã làm thổn thức biết bao trái tim người đọc. Câu chuyện là hồi ký của nhân vật Khanh trong khoảng thời gian quay trở lại Việt Nam, đan xen cùng những ký ức của 6 năm trước đó. Khanh trở về quê hương khi có biết bao điều đã đổi thay, chỉ duy tình cảm của bà con, của những người bạn cũ là vẫn không thay đổi. Tại Sài Gòn, Khanh đã gặp lại Linh - người con gái của miền ký ức xưa, và Miu - cô gái tưởng như xa lạ mà lại rất đỗi thân thuộc. Liệu anh có quên được Linh - người con gái năm xưa anh từng yêu say đắm? Và liệu anh có nhận ra Miu - cô gái bé nhỏ với tình cách buồn vui thất thường? Câu chuyện xoay quanh cuộc sống thường ngày của những thanh niên trẻ trung và năng động, ở đó không chỉ có tình yêu đôi lứa, mà còn có cả tình bạn, tình thầy cô, tình cảm gia đình, tình đồng bào của những người con xa xứ… Tất cả mang đến thật nhiều cung bậc cảm xúc, từ hài hước cho đến tò mò, đôi khi là cả những giọt nước mắt đầy xúc động.', 11)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1081, N'Em Vốn Thích Cô Độc, Cho Đến Khi Có Anh', N'1081.jpg', N'NXB Văn Học', N'Diệp Lạc Vô Tâm', 91800, CAST(N'1980-03-29' AS Date), 0, N'1004', N'1081_1.jpg', N'Một hôm, tôi đi làm lại quên mang điện thoại. Tôi muốn về nhà lấy, nhưng lại bận không dứt ra được, đang lúc băn khoăn thì nhìn thấy Kẻ phiền phức bước thẳng vào phòng, điềm đạm đặt chiếc di động mà tôi đang cần lên bàn.
“Yêu anh quá đi!” Tôi vội vàng thì thầm vào tai hắn, rồi lập tức lấy điện thoại xem.
“Rốt cuộc thì có chuyện gì em mới không quên đây hả?” Kẻ phiền phức chán nản nói.
Tôi lặng lẽ liếc nhìn hắn một cái, nói nhỏ: “… Yêu anh!”
Mặt hắn đang hầm hầm bỗng trở nên rạng rỡ.
Lúc rời khỏi văn phòng tôi, khóe mắt hắn còn mang ý cười.
', 31)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1082, N'Anh Giả Vờ Sẽ Không Yêu Em', N'1082.jpg', N'NXB Thanh Niên', N'Bánh Donut Của Trẫm', 129200, CAST(N'1980-03-29' AS Date), 0, N'1004', N'1082_1.jpg', N'Từ Tri Châu – thiếu gia nhà họ Từ, đồng thời cũng là một ca sĩ ẩn danh nổi tiếng trên mạng. Cậu chủ Từ vì muốn trải qua một cuộc sống đại học bình thường nên đã cố tình che giấu thân phận thực sự của mình, trở thành một chàng sinh viên “nghèo” điển trai, học giỏi, có nghị lực sống và được bạn bè hết lòng yêu quý.
Lý Dao Nguyệt – đàn em cùng trường của Từ Tri Châu, một cô gái luôn bị các bạn học xa lánh, coi thường vì nghĩ rằng cô là kẻ ham tiền tài vật chất, chim sẻ muốn hóa phượng hoàng.
Duyên phận trêu ngươi khiến Từ Tri Châu và Lý Dao Nguyệt vô tình quen biết rồi dần dần rơi vào lưới tình. Chỉ có điều, câu chuyện tình yêu giữa hai người họ vốn bắt đầu bằng những lời nói dối, những ngốc nghếch và bồng bột của tuổi trẻ, thế nên khi sự thật được phơi bày, trái tim họ cũng không tránh khỏi phải đối mặt với những đắn đo. Liệu rằng sau tất cả, họ có thể tha thứ cho đối phương, chấp nhận thân phận thật của nhau để viết nốt câu chuyện tình yêu còn đang dang dở hay không?
', 32)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1083, N'Người Là Biển Rộng, Kẻ Là Mặt Trời', N'1083.jpg', N'NXB Hà Nội', N'Hạ Chí', 126650, CAST(N'1980-03-29' AS Date), 0, N'1004', N'1083_1.jpg', N'Hạ Sơ Nhất – một cô gái bình thường đến không thể nào bình thường hơn. Suốt những năm tháng cấp 3, cô hoàn toàn chẳng nổi bật, cũng chẳng có một sở trường gì đặc biệt, chỉ biết ngày ngày cố gắng không ngừng. Có lẽ điều duy nhất cô hơn người, chính là tính cách lạc quan của cô. Ấy vậy mà chỉ vài năm sau khi tốt nghiệp, cô đã trưởng thành hơn, chin chắn hơn, là cánh tay đắc lực của Chủ tịch. Sức mạnh để cô thay đổi bản thân chính là Lục Phỉ Nhiên.
Lục Phỉ Nhiên, ngay từ ban đầu, anh đã là một ánh mặt trời sáng chói. Là học bá của trường, là học sinh ưu tú của các thầy cô, lúc nào cũng xếp hạng nhất, anh còn nổi tiếng với vẻ đẹp trai của mình. Những tưởng Thanh Hoa sẽ là đích đến cho vị học bá toàn năng này, vậy mà cuối cùng lại lựa chọn học lại một năm. Hóa ra, anh cũng đã đem lòng yêu Sơ Nhất, muốn bảo vệ cô cả đời.
Mối tình của Hạ Sơ Nhất và Lục Phỉ Nhiên trôi qua một cách bình dị trong một thời gian dài, không có cãi vã, cùng chẳng hề phai nhạt, kể cả khi phải yêu xa. Có những ngày gọi điện cho nhau cả tiếng đồng hồ chỉ vì nỗi nhớ không hề vơi đi. Có những ngày đặc biệt cần ở bên nhau, cũng chỉ có thể nghe thấy tiếng nói của đối phương qua điện thoại.
', 11)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1084, N'Tịch Mịch', N'1084.jpg', N'NXB Văn Học', N'Phỉ Ngã Tư Tồn', 92650, CAST(N'1980-03-29' AS Date), 0, N'1004', N'1084_1.jpg', N'Ngày quanh quẩn sắp tối, quyết định quay người về. Cắn tay, xé vạt váy, gửi gắm một bức thư. Một tấc lụa đáng thương, từng chữ thẫm màu máu. Chữ chữ ý xót xa, một lòng luôn không đổi. Phu quân nếu nhận thiếp, thiếp cam chịu trăm roi. Nếu không, xin nguyện chết, để chôn trên đất quân. Hóa thành đoạn trường hoa, cũng sẽ mọc đất này.', 32)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1085, N'Ngày Nào Đi Học Cũng Bị Cà Khịa', N'1085.jpg', N'NXB Hà Nội', N'Chước Dạ', 118150, CAST(N'1980-03-29' AS Date), 0, N'1004', N'1085_1.jpg', N'Cả lớp A2 đều biết, lớp phó môn Toán Tiết Diệm và lớp phó môn Văn Thẩm Tịch là hai kẻ thù không đội trời chung, kỵ nhau như nước với lửa.
Một Thẩm Tịch hoạt bát, năng nổ, đôi lúc lại ngốc nghếch đến đáng yêu. Khi bị trêu chọc chỉ biết khó chịu mà lại không dám làm gì người ta cả.
Một Tiết Diệm độc miệng, rất cợt nhả lại vô cùng lạnh nhạt, ấy thế mà lại vừa mắt cô bạn cùng bàn kiêm hàng xóm ngốc nghếch.
Tưởng như chẳng có một điểm chung nào, bỗng dung một ngày, có người vô tình bắt gặp cặp đôi đến chết cũng không qua lại với nhau trong truyền thuyết ấy đang ngồi ôm nhau trong cánh rừng nhỏ, một người cười như kẻ ngốc, một người cười như kẻ khờ.
Tưởng như là kẻ thù không đội trời chung, ấy vậy mà khi yêu nhau lại có thể ngọt ngào đến vậy. Một người đắm chìm trong mật ngọt tình yêu, một người lại chiều chuộng đến mức vô pháp vô thiên.
', 13)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1086, N'Gánh Gánh Gồng Gồng', N'1086.jpg', N'NXB Tổng Hợp Thành Phố Hồ Chí Minh', N'Nguyễn Thị Xuân Phượng', 144000, CAST(N'1980-03-29' AS Date), 0, N'1005', N'1086_1.jpg', N'Cuốn hồi ký gồm những câu chuyện về những thăng trầm cuộc đời của bà Nguyễn Thị Xuân Phượng từ năm 1945. Vào những năm 1967, khi đang là bác sĩ công tác tại Ủy ban Liên lạc văn hóa với người nước ngoài, do giỏi tiếng Pháp, bà Nguyễn Thị Xuân Phượng được Chủ tịch Hồ Chí Minh giao trọng trách chăm sóc sức khỏe cho vợ chồng đạo diễn người Hà Lan Joris Ivens và Marceline Loridan khi họ làm phim tại Vĩnh Linh. Cơ duyên này đã tạo nên bước ngoặt, khiến bà quyết định trở thành nữ đạo diễn phim tài liệu. Năm 1968, bà trở thành nữ đạo diễn, phóng viên chiến trường duy nhất ở Việt Nam làm việc tại Phòng Truyền hình, tiền thân của Đài truyền hình Việt Nam bây giờ. Bà đã thực hiện hàng loạt phim tài liệu mang tính thời sự, phản ánh những sự kiện chiến sự tại chiến trường Campuchia, biên giới phía bắc, và là một trong những phóng viên đầu tiên vào Dinh Độc lập theo trung đoàn xe tăng vào ngày 30.4.1975…', 2)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1087, N'Khi Hơi Thở Hóa Thinh Không', N'1087.jpg', N'NXB Thanh Niên', N'Bánh Donut Của Trẫm', 129200, CAST(N'1980-03-29' AS Date), 0, N'1005', N'1087_1.jpg', N'Khi hơi thở hóa thinh không là tự truyện của một bác sĩ bị mắc bệnh ung thư phổi. Trong cuốn sách này, tác giả đã chia sẻ những trải nghiệm từ khi mới bắt đầu học ngành y, tiếp xúc với bệnh nhân cho tới khi phát hiện ra mình bị ung thư và phải điều trị lâu dài.
Kalanithi rất yêu thích văn chương nên câu chuyện của anh đã được thuật lại theo một phong cách mượt mà, dung dị và đầy cảm xúc. Độc giả cũng được hiểu thêm về triết lý sống, triết lý nghề y của Kalanithi, thông qua ký ức về những ngày anh còn là sinh viên, rồi thực tập, cho đến khi chính thức hành nghề phẫu thuật thần kinh. “Đối với bệnh nhân và gia đình, phẫu thuật não là sự kiện bi thảm nhất mà họ từng phải đối mặt và nó có tác động như bất kỳ một biến cố lớn lao trong đời. Trong những thời điểm nguy cấp đó, câu hỏi không chỉ đơn thuần là sống hay chết mà còn là cuộc sống nào đáng sống.” – Kalanithi luôn biết cách đưa vào câu chuyện những suy nghĩ sâu sắc và đầy sự đồng cảm như thế.
Bạn bè và gia đình đã dành tặng những lời trìu mến nhất cho con người đáng kính trọng cả về tài năng lẫn nhân cách này. Dù không thể vượt qua cơn bệnh nan y, nhưng thông điệp của tác giả sẽ còn khiến người đọc nhớ mãi.
', 12)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1088, N'Điệp Viên Hoàn Hảo X6 - Phạm Xuân Ẩn', N'1088.jpg', N'NXB Dân Trí', N'Larry Berman', 142400, CAST(N'1980-03-29' AS Date), 0, N'1005', N'1088_1.jpg', N'Ấn bản mới này có bổ sung Lời giới thiệu của tác giả cho lần tái bản 2013 “Sáu năm sau: hồi tưởng về sách Điệp Viên Hoàn Hảo”. Larry Berman viết: “…cuộc đời của Ẩn không chỉ là một câu chuyện chiến tranh mà còn là câu chuyện về hàn gắn, về lòng trung thành với đất nước và bạn bè.
Trong ấn bản mới, tôi đã thêm vào những câu chuyện và tình tiết mới mà hồi năm 2007 chưa thể kể ra. Tôi cũng phản ánh lại việc một số độc giả dân sự và quân sự Mỹ đã phản ứng về cuốn sách của tôi cũng như về nhân vật/con người Phạm Xuân Ẩn như thế nào. Tuy nhiên, điều làm cho ấn bản mới này trở nên rất quan trọng đó là bản dịch mới. Độc giả Việt Nam sẽ lần đầu tiên được đọc câu chuyện về cuộc đời phi thường của Phạm Xuân Ẩn như chính những gì mà ông đã kể với tôi, một người Mỹ viết hồi ký cho ông. Điều này làm cho ấn bản của First News - Trí Việt vừa rất đặc biệt, vừa là một cuốn sách mới chứa đựng rất nhiều thông tin lần đầu tiên công bố…”.
Đặc biệt trong lần in mới này công bố bức thư xúc động của bà Thu Nhàn, vợ thiếu tướng Phạm Xuân Ẩn, gửi tác giả Larry Berman: “Do mắt kém, tôi phải đọc cuốn sách của ông ba lần trong suốt ba ngày, dù tôi muốn đọc xong ngay lập tức: ba ngày đầy cảm xúc, ba ngày đầy nước mắt nhớ thương, đầy tình yêu và sự tiếc nuối… Và giờ đây, mỗi lần đọc lại là tôi không cầm được nước mắt! Một ít người bạn của tôi cũng có cảm xúc như vậy… Nhưng tôi muốn đọc lại nhiều lần để nhớ về chồng tôi.
', 51)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1089, N'Trịnh Công Sơn - Thư Tình Gửi Một Người', N'1089.jpg', N'NXB Trẻ', N'Trịnh Công Sơn', 129200, CAST(N'1980-03-29' AS Date), 0, N'1005', N'1089_1.jpg', N'Tập Thư tình gửi một người của Nhà xuất bản Trẻ ra mắt nhân kỷ niệm mười năm ngày nhạc sĩ Trịnh Công Sơn từ trần (1/4/2001 - 1/4/2011); đầu sách này cũng ở trong số các ấn phẩm đặc biệt ra đời trong tháng kỷ niệm 30 năm ngày thành lập Nhà xuất bản Trẻ (1981 - 2011).
Thông qua những lá thư của nhạc sĩ Trịnh Công Sơn gửi cô gái Huế có tên Ngô Vũ Dao Ánh, người đọc không chỉ tìm thấy vẻ đẹp kỳ diệu của một tình yêu huyền nhiệm mà còn hiểu được những lo âu, dằn vặt triền miên của nhạc sĩ về kiếp người, về lòng tin và những điều tốt đẹp đang bị mai một dần trong cõi nhân gian. Bên cạnh gia tài đồ sộ về âm nhạc của Trịnh Công Sơn, đây có thể được xem là một áng văn chương thật ấn tượng trong đời hoạt động nghệ thuật của ông.
', 21)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1090, N'Cuộc Đời Kỳ Lạ Của Nikola Tesla ', N'1090.jpg', N'Kinh Tế Thành Phố Hồ Chí Minh', N'Nikola Tesla', 76500, CAST(N'1980-03-29' AS Date), 0, N'1005', N'1090_1.jpg', N'Được mệnh danh là “nhà khoa học điên” của giới vật lý, Tesla là người đi tiên phong đưa kỹ thuật điện, điện từ vào đời sống. Với cách tư duy kỳ lạ của mình, ông đã có đến khoảng 300 bằng phát minh, tiêu biểu như động cơ điện không đồng bộ hay lõi Tesla. Rất nhiều phát minh của Tesla đang được ứng dụng trong các thiết bị điện xung quanh ta ngày nay.
Thật không dễ để hiểu thấu hết những gì đang diễn ra trong đầu Tesla, một thiên tài với trí nhớ hình ảnh, biết tám thứ tiếng và có tầm nhìn vượt thời đại. Những gì ông đã viết trong quyển sách này có thể kỳ lạ và khó tin, nhưng hãy nhớ rằng, người ta đã mất gần một thế kỷ để biết những gì Tesla đề xuất là chính xác và khả thi!
Hy vọng quý bạn đọc có thể nhìn ra được điều gì đó mới mẻ trong những câu chữ của Tesla, bởi đó có thể là những hiểu biết giúp ta thay đổi cả thế giới này.
', 12)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1091, N'Bác Hồ Với Thiếu Niên Nhi Đồng', N'1091.jpg', N'NXB Văn Học', N'Tuệ Minh', 48600, CAST(N'1980-03-29' AS Date), 0, N'1005', N'1091_1.jpg', N'Cả cuộc đời vì nước, vì dân, Bác Hồ là biểu tượng cao đẹp nhất của chủ nghĩa yêu nước và chủ nghĩa anh hùng cách mạng Việt Nam. Tấm gương đạo đức trong sáng, phong cách sống và làm việc của Người là mẫu mực, có sức cảm hóa và thúc đẩy cho mọi thế hệ cán bộ, đảng viên và nhân dân học tập, noi theo.
Sáu cuốn sách: Bác Hồ của chúng em, Chuyện kể từ làng Sen, Bác Hồ cầu hiền tài, Bác Hồ - tấm gương sáng mãi, Bác Hồ với thiếu niên nhi đồng, Học Bác lòng ta trong sáng hơn là những câu chuyện nhỏ xung quanh cuộc đời của vị lãnh tụ kính yêu kể từ khi còn nhỏ sống cùng mẹ cha nơi làng Sen đầy ắp yêu thương cho đến khi bước lên tàu từ bến cảng Nhà Rồng ra đi tìm đường cứu nước. Hay những câu câu chuyện, ghi lại tình cảm ấm áp của Bác với thiếu niên nhi đồng trong và ngoài nước. Mỗi câu chuyện là một kỷ niệm xúc động về tình cảm chan chứa yêu thương của Bác dành cho thiếu nhi. Bao giờ, lúc nào, ở đâu Bác cũng luôn dành tình cảm yêu thương bao la vô bờ bến cho các cháu thiếu niên nhi đồng.
', 21)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1092, N'Kể Chuyện Cuộc Đời Các Thiên Tài: Alfred Nobel Và Bản Di Chúc Bất Hủ', N'1092.jpg', N'NXB Thanh Niên', N'Rasmus Hoài Nam', 55250, CAST(N'1980-03-29' AS Date), 0, N'1005', N'1092_1.jpg', N'Cuốn sách gồm những câu chuyện viết về cuộc đời của Alfred Nobel – nhà hoá học, người kĩ sư tài năng, nhà sản xuất vũ khí, người phát minh ra các loại thuốc nổ và là nhà triệu phú người Thuỵ Điển. Con đường đi tới thành công của Alfred Nobel trải đầy bi kịch, nhưng ông luôn vững niềm tin để nuôi dưỡng những ý tưởng tốt đẹp. Sau khi Nobel mất, bản di chúc bất hủ đã được công bố. Cả thế giới đều ngưỡng mộ và khâm phục trước tấm lòng cao cả của ông. Trong di chúc, ông quyết định dùng toàn bộ tài sản của mình để sáng lập ra giải thưởng Nobel nhằm vinh danh những bậc thiên tài, có cống hiến lớn cho nhân loại trong các lĩnh vực Vật lí, Hoá học, Sinh lí học và Y khoa, Văn học và Hòa bình.', 221)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1093, N'Nick Vujicic - Cuộc Sống Không Giới Hạn', N'1093.jpg', N'NXB Tổng Hợp TPHCM', N'Nick Vujicic', 125800, CAST(N'1980-03-29' AS Date), 0, N'1005', N'1093_1.jpg', N'Cuộc sống là do mỗi người đặt ra cho mình, giới hạn ấy thể hiện rõ khả năng và sự nỗ lực của bạn trong việc ước mơ và chinh phục ước mơ. Giới hạn ấy, tất nhiên, là hoàn cảnh sống, là tính cách, là con người, là khả năng tài chính, là điều kiện giáo dục,... Và đôi khi, chúng ta đổ lỗi cho chúng vì sự thất bại của mình.
Nhưng vốn dĩ cuộc sống thực sự không có giới hạn nào cả, chỉ cần bạn có đủ sức mạnh, ý chí và khả năng để chinh phục thì giới hạn cuộc sống vĩnh viễn nằm ở điểm vô cực.
', 23)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1094, N'Kể Chuyện Cuộc Đời Các Thiên Tài: Albert Einstein - Tuổi Thơ Gian Khó Và Cuộc Đời Khoa Học Vĩ Đại', N'1094.jpg', N'NXB Thanh Niên', N'Rasmus Hoài Nam', 144000, CAST(N'1980-03-29' AS Date), 0, N'1005', N'1094_1.jpg', N'Cuốn sách gồm những âu chuyện viết về cuộc đời của nhà khoa học thiên tài Albert Einstein, người đã làm thay đổi cả thế giới cũng như quan niệm khoa học đương thời.
Do xuất thân có nguồn gốc Do Thái nên ngay từ khi bắt đầu đi học Albert Einstein đã chịu nhiều sự phân biệt kì thị. Cuộc đời nghiên cứu khoa học của Albert Einstein cũng gặp nhiều khó khăn do hoàn cảnh khách quan và thời cuộc đem lại, nhưng bằng trí tuệ phi thường, ông đã cho ra những công trình nghiên cứu làm thay đổi khoa học hiện đại.
Vào năm 1999, ông được tạp chi Time của Mỹ vinh danh là con người của Thế kỷ. Trước khi qua đời, ông đã viết giấy hiến tặng bộ óc của mình cho các nhà nhân chủng học nghiên cứu. Đại văn hào Bernard Shaw đã gọi Albert Einstein là “VĨ NHÂN THỨ TÁM” của thế giới khoa học, sau Pythagoras, Aristotle, Ptolemy, Copernicus, Galileo, Kepler và Newton.
', 11)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1095, N'Kể Chuyện Cuộc Đời Các Thiên Tài: Lev Tolstoy - Nhà Văn Hiện Thực Thiên Tài', N'1095.jpg', N'NXB Thanh Niên', N'Rasmus Hoài Nam', 59500, CAST(N'1980-03-29' AS Date), 0, N'1005', N'1095_1.jpg', N'Cuốn sách gồm những câu chuyện viết về cuộc đời và sự nghiệp sáng tác của đại văn hào người Nga Lev Nikolayevich Tolstoy, từ những ngày thơ ấu ở Yasnaya Polyana đến những ngày trải qua biến cố của gia đình ở Moscow. Từ khi tình yêu văn học bắt đầu nảy nở cho đến khi ông tạo dựng cho mình một hành trang quý giá trên con đường cầm bút và viết nên những tác phẩm để đời.
Cuộc sống trong quân ngũ và những ngày tháng du ngoạn ở Tây Âu, Samara… đã giúp Lev Tolstoy hiểu sâu sắc hơn về mọi tầng lớp trong xã hội, nhận thấy sự bất công, ông thương cảm cho những người lao động nghèo khổ, muốn thay đổi cuộc sống của họ nhưng học thuyết ông đưa ra lại không tưởng. Mâu thuẫn giữa tư tưởng và hiện thực mà ông đang sống đã dẫn đến những bi kịch trong chính gia đình ông.
Lev Tolstoy đã để lại một di sản văn học vô cùng giá trị gồm nhiều thể loại. Ông là mẫu mực của nghệ thuật chân chính, là cây đại thụ tỏa bóng mát cho nhiều thế hệ nhà văn, mang đến thành tựu lớn của cả một thời đại rực rỡ trong văn học Nga thế kỉ XIX.
', 11)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1096, N'Kể Chuyện Cuộc Đời Các Thiên Tài: Beethoven - Nhà Soạn Nhạc Cổ Điển Vĩ Đại Thế Giới', N'1096.jpg', N'NXB Thanh Niên', N'Rasmus Hoài Nam', 51000, CAST(N'1980-03-29' AS Date), 0, N'1005', N'1096_1.jpg', N'Beethoven sinh ngày 17 tháng 12 năm 1770, mất ngày 26 tháng 3 năm 1827. Ông là một hình tượng âm nhạc quan trọng trong giai đoạn giao thời từ thời kì âm nhạc cổ điển sang thời kì âm nhạc lãng mạn. Ông được cả thế giới công nhận là nhà soạn nhạc vĩ đại, nổi tiếng nhất và có ảnh hưởng tới rất nhiều nhà soạn nhạc, nhạc sĩ và khán giả về sau.
Cuốn sách gồm các câu chuyện về tuổi thơ, những năm tháng trưởng thành, cùng quá trình sáng tác những kiệt tác âm nhạc bất hủ của Beethoven.
Beethoven được coi là người dọn đường cho thời kì âm nhạc lãng mạn. Cuộc sống của ông cũng có rất nhiều khó khăn. Cha ông là một người nghiện và thô lỗ, mẹ ông lại hay đau ốm, bản thân ông cũng phải chịu đựng sự hành hạ đau đớn về thể xác. Nhưng chúng ta có thể tìm thấy trong âm nhạc của ông là tinh thần vượt qua nghịch cảnh, chiến thắng sự tuyệt vọng và đau buồn để trở thành một thiên tài âm nhạc với những kiệt tác bất hủ.
', 11)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1097, N'Hành Trình Một Đời Người: Những Đúc Kết Từ 15 Năm Ở Vị Trí Ceo Công Ty Walt Disney', N'1097.jpg', N'NXB Trẻ', N'Robert Iger', 136000, CAST(N'1980-03-29' AS Date), 0, N'1005', N'1097_1.jpg', N'Robert Iger trở thành Giám đốc điều hành Công ty Walt Disney vào năm 2005, trong một thời kỳ khó khăn. Cạnh tranh khốc liệt hơn bao giờ hết và công nghệ thay đổi nhanh hơn bất kỳ thời điểm nào trong lịch sử của công ty. Tầm nhìn của ông đưa ra ba ý tưởng rõ ràng: Tuân thủ quan niệm rằng chất lượng là vấn đề quan trọng, đi theo công nghệ thay vì chống lại nó, và nghĩ lớn hơn — tư duy toàn cầu — và biến Disney thành một thương hiệu mạnh hơn trên thị trường quốc tế.
Ngày nay, Disney là công ty truyền thông lớn nhất, được ngưỡng mộ nhất trên thế giới, tính cả Pixar, Marvel, Lucasfilm và 21th Century Fox trong số các tài sản của nó. Giá trị công ty tăng gần gấp năm lần so với khi Iger tiếp quản, và ông được công nhận là một trong những CEO thành công và sáng tạo nhất trong thời đại của chúng ta.
Trong Hành trình một đời người, Robert Iger chia sẻ những bài học đúc kết được khi điều hành Disney và lãnh đạo hơn 220.000 nhân viên của hãng, và khám phá những phẩm chất lãnh đạo đích thực.
Cuốn sách này nói về sự tò mò không ngừng đã thúc đẩy Iger trong suốt 45 năm, kể từ ngày ông bắt đầu làm công việc thấp nhất ở ABC. Đó cũng là về sự thấu đáo và tôn trọng, cũng như cách tiếp cận ngay thẳng-thắng-tiền bạc đã trở thành nền tảng cho mọi dự án và quan hệ đối tác mà Iger theo đuổi, từ tình bạn sâu sắc với Steve Jobs trong những năm cuối đời cho đến tình yêu vĩnh cửu dành cho thần thoại Chiến tranh giữa các vì sao.
', 11)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1098, N'Elon Musk - Đặt Cả Thế Giới Lên Bốn Bánh Xe Điện', N'1098.jpg', N'NXB Tài Chính', N'Hamish McKenzie', 169150, CAST(N'1980-03-29' AS Date), 0, N'1005', N'1098_1.jpg', N'Cuốn sách “Elon Musk - Đặt cả thế giới lên bốn bánh xe điện” mang đến cho độc giả hành trình chinh phục giấc mơ hoang dã của một công ty khởi nghiệp tại Thung lũng Silicon. Giấc mơ đó có đủ đầy sóng gió, khó khăn và sự thông tuệ của người đứng đầu - Elon Musk.
Tesla, hãng ô tô điện được Elon Musk thành lập, đã đứng lên chống lại sức mạnh không chỉ của các nhà sản xuất xe hơi Detroit được chính phủ hậu thuẫn mà còn cả sức mạnh khổng lồ của Big Oil và những nhà tài phiệt đứng sau nó - anh em nhà Koch khét tiếng. Tesla đã mang đến cho thế giới những nhận thức mới và những thành công đáng ngưỡng mộ bên cạnh tranh cãi về ô tô điện và ô tô truyền thống.
', 22)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1099, N'Pep Guardiola - Một Cách Thắng Khác', N'1099.jpg', N'NXB Hà Nội', N'Gulliem Balague', 194650, CAST(N'1980-03-29' AS Date), 0, N'1005', N'1099_1.jpg', N'Tôi từng để hụt Pep Guardiola khi anh ấy còn đang thi đấu, vào thời điểm anh ấy nhận ra rằng mình không có tương lai ở Barcelona nữa.
Dù không có lý do nào rõ ràng để anh ấy rời đội bóng, chúng tôi vẫn nói chuyện với Guardiola và tôi đã nghĩ rằng mình đang có một cơ hội tốt để có được anh. Có thể là tôi đã chọn sai thời điểm. Nếu thành công, đó sẽ là một vụ chuyển nhượng thú vị. Guardiola chính là mẫu cầu thủ mà sau này Paul Scholes phát triển thành: Anh ấy là đội trưởng, thủ lĩnh và tiền vệ tổ chức lối chơi trong đội hình Dream Team của Barcelona do Johan Cruyff xây dựng. Sự điềm tĩnh, khả năng điều khiển trái bóng và kiểm soát nhịp độ trận đấu là những phẩm chất khiến anh trở thành một trong những cầu thủ vĩ đại nhất thế hệ mình. Đó cũng là những phẩm chất mà tôi đang tìm kiếm. Chính vì những lý do đó mà tôi đã mua Juan Sebastián Verón. Đôi lúc, ta nhìn lại một cầu thủ ở đẳng cấp hàng đầu và tự hỏi: “Không biết điều gì sẽ xảy ra nếu anh ta tới chơi bóng cho United nhỉ?” Đó chính là trường hợp của Pep Guardiola.
', 21)
GO
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1100, N'Tiểu Sử Steve Jobs', N'1100.jpg', N'NXB Lao Động', N'Walter Isaacson', 404100, CAST(N'1980-03-29' AS Date), 0, N'1005', N'1100_1.jpg', N'Cuốn tiểu sử với tiêu đề ngắn gọn Steve Jobs do cựu thư ký tòa soạn của tạp chí Time, Walter Isaacson biên soạn, dựa trên 40 cuộc phỏng vấn với Steve Jobs trong 2 năm qua cùng các cuộc phỏng vấn với hơn 100 người thân, bạn bè, đồng nghiệp và đối thủ của ông, phát hành trên Amazon vào ngày 24/10 đang liên tục đứng vị trí số 1 danh sách sách bán chạy nhất của cả Amazon lẫn Barnes & Nobles. Đây cũng là cuốn tiểu sử đầu tiên và duy nhất nhận được sự đồng ý của Steve Jobs. Walter Isaacson cũng là người viết tiểu sử nổi tiếng, với 2 tác phẩm viết về Benjamin Franklin và Albert Einstein.', 221)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1101, N'Nick Vujicic - Sống Cho Điều Ý Nghĩa Hơn', N'1101.jpg', N'NXB Tổng Hợp TPHCM', N'Nick Vujicic', 83600, CAST(N'1980-03-29' AS Date), 0, N'1005', N'1101_1.jpg', N'Sau hai cuốn tự truyện gây sốt cho độc giả: Cuộc Sống Không Giới Hạn và Đừng Bao Giờ Từ Bỏ Khát Vọng, một lần nữa độc giả Việt Nam lại được hội ngộ cùng Nick Vujicic thông qua tác phẩm Limitless – Sống Cho Điều Ý Nghĩa Hơn. Tựa sách được đặt từ ý nghĩa của bài hát nổi tiếng nhất của Nick Something More, do Công ty Văn hóa Sáng tạo Trí Việt – First News ấn hành vào ngày 16/05/2013 nhân sự kiện chàng trai đặc biệt nhất hành tinh Nick Vujicic sang thăm Việt Nam và gặp gỡ, trò chuyện cùng mọi người.
Sinh ra không có một cơ thể lành lặn, Nick chào đời trong tình trạng không tay không chân. Từng có ý định tự tử, tuyệt vọng đến mức tin rằng cuộc sống của mình sẽ chẳng có giá trị gì hết và anh sẽ mãi mãi là gánh nặng cho những người mà anh yêu thương. Nhưng qua thời gian, Nick đã tự nhận thức được về ý nghĩa đặc biệt của sự khuyết thiếu tay chân khi anh được sinh ra, đó là sứ mạng trở thành người truyền cảm hứng và khích lệ tinh thần tất cả những người khác trên trái đất này.
Nick nhận ra: “Cuộc sống không có giới hạn nào ngoài những giới hạn ta tự đặt ra cho chính bản thân mình”.
', 214)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1102, N'Atlat Địa lí Việt Nam', N'1102.jpg', N'NXB Hà Nội', N'Nhiều Tác Giả', 27900, CAST(N'1980-03-29' AS Date), 0, N'1006', N'1102_1.jpg', N'Bản đồ là phương tiện giảng dạy và học tập điạ lý không thể thiếu trong nhà trường phổ thông. Cùng với sách giáo khoa, Atlat địa lí Việt Nam là nguồn cung cấp kiến thức, thông tin tổng hợp và hệ thống giúp giáo viên đổi mới phương pháp dạy học, hỗ trợ học.
Để đáp ứng nhu cầu bức thiết đó, NXB Giáo dục Việt Nam trân trọng giới thiệu tập Atlat địa lý Việt Nam gồm 21 bản đồ, được in màu rõ nét, liên quan đến các lĩnh vực kinh tế - xã hội. Các bản đồ được xây dựng theo nguồn số liệu của Nhà xuất bản thống kê - Tổng cục thống kê. Đây là tài liệu được phép mang vào phòng thi tốt nghiệp THPT môn Địa lý do Bộ Giáo dục và Đào tạo quy định.
', 42)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1103, N'Sách Giáo Khoa Bộ Lớp 12 - Sách Bài Học (Bộ 13 Cuốn - Không Tiếng Anh', N'1103.jpg', N'NXB Giáo Dục Việt Nam', N'Bộ Giáo Dục Và Đào Tạo', 163000, CAST(N'1980-03-29' AS Date), 0, N'1006', N'1103_1.jpg', NULL, 51)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1104, N'Move Up 4', N'1104.jpg', N'NXB Giáo Dục Việt Nam', N'Nhiều Tác Giả', 55000, CAST(N'1980-03-29' AS Date), 0, N'1006', N'1104_1.jpg', N'Những năm gần đây, học sinh Tiểu học luôn được tiếp cận với rất nhiều chương trình học đa dạng các nguồn tài liệu phong phú và chất lượng; Cũng như các kì thi đánh giá năng lựcTiếng Anh quốc tế đang rất phổ biến hiện nay.
Bộ sách MOVE UP ĐƯỢC dùng như là bộ tài liệu bổ trợ cho Sách ! giáo khoa Tiếng Anh FAMILY AND FRIENDS (National Edition).
', 12)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1105, N'Tổng Ôn Ngữ Pháp Tiếng Anh ', N'1105.jpg', N'NXB Hồng Đức', N'Trang Anh', 189000, CAST(N'1980-03-29' AS Date), 0, N'1006', N'1105_1.jpg', N'Đầy đủ nhất với 30 CHUYÊN ĐỀ NGỮ PHÁP Trong Tiếng Anh của cô Trang Anh.
Dày 606 trang gần 7.000 bài tập - SỐ LƯỢNG BÀI NHIỀU NHẤT.
TỔNG ÔN TẬP ngữ pháp tiếng anh- CHẮC CHẮN CÓ trong đề thi.
Lý thuyết được đơn giản hoá, trình bày MINDMAP dễ hiểu và siêu dễ nhớ.
Mức độ bài tập đi từ CỰC DỄ đến KHÔNG THỂ KHÓ HƠN.
', 14)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1106, N'Sổ Tay Kiến Thức Vật Lí Trung Học Phổ Thông', N'1106.jpg', N'NXB Đại Học Quốc Gia Hà Nội', N'ThS Nguyễn Phú Đồng, ThS Võ Văn Thế', 102000, CAST(N'1980-03-29' AS Date), 0, N'1006', N'1106_1.jpg', N'Nhằm giúp các em học sinh bậc trung học phổ thông (THPT) nắm vững được kiến thức và kĩ năng của chương trình Vật lí trong quá trình học và ôn tập, chúng tôi biên soạn cuốn sách Sổ tay kiến thức Vật Lí trung học phổ thông.
Với mong muốn cuốn sách sẽ là "All in One" thật tiện ích cho các em, trong mỗi chủ đề chúng tôi hệ thống những kiến thức cơ bản, bổ sung những kiến thức nâng cao và trình bày phương pháp giải các dạng bài tập thường gặp trong chương trình Vật lí THPT. Với cách trình bày, chúng tôi hi vọng sẽ giúp các em vừa nắm vững và vận dụng được kiến thức, vừa có cái nhìn bao quát toàn bộ chương trình Vật lí trải dài từ lớp 10 đến lớp 12. 
Trong quá trình biên soạn cuốn sách chắc chắn sẽ không tránh khỏi những hạn chế, sai sót. Chúng tôi rất mong nhận được sự góp ý chân thành từ độc giả để những lần tái bản sau được hoàn thiện hơn. 
', 12)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1107, N'50 Đề Minh Họa 2023 Môn Toán Học', N'1107.jpg', N'NXB Thanh Niên', N'Lê Văn Tuấn, Nguyễn Thế Duy', 170000, CAST(N'1980-03-29' AS Date), 0, N'1006', N'1107_1.jpg', N'Phân tích đề và hướng ra đề của bộ giáo dục.
Định hướng làm bài tập và làm đề hiệu quả.
Sách gồm 50 đề trắc nghiệm ôn thi THPTQG môn toán do thầy Lê Văn Tuấn biên soạn.
Cập nhật các đề thi chính thức, đề minh hoạ của bộ các năm trước. - Livestream chữa đề và
', 33)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1109, N'Chinh Phục Các Chuyên Đề Vật Lý Trong Đề Thi Tốt Nghiệp THPT Bằng Máy Tính Casio FX-580VN X', N'1109.jpg', N'NXB Đại Học Sư Phạm TP Hồ Chí Minh', N'Trung Tâm Nghiên Cứu Ứng Dụng Giáo Dục', 93500, CAST(N'1980-03-29' AS Date), 0, N'1006', N'1109_1.jpg', N'Nội dung cuốn sách: "Chinh phục các chuyên đề Vật lý trong đề thi tốt nghiệp THPT bằng máy tính FX-580VN X". Dưới dạng cẩm nang, cuốn sách sẽ hướng dẫn sử dụng máy tính FX-580VN X một cách hiệu quả, hỗ trợ đắc lực cho quá trình học của học sinh cũng như nâng cao năng lực dạy Vật lý cho giáo viên. Nhờ đó, quá trình chinh phục bộ môn Vật lý trong bối cảnh đổi mới giáo dục trở nên thuận tiện và toàn diện hơn rất nhiều.', 112)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1110, N'Bộ Đề Luyện Thi THPT Môn Tiếng Anh ', N'1110.jpg', N'NXB Đà Nẵng', N'Mai Lan Hương, Phạm văn Luận', 60760, CAST(N'1980-03-29' AS Date), 0, N'1006', N'1110_1.jpg', N'Nhằm giúp các em học sinh ôn luyện để làm tốt bài thi môn tiếng Anh trong kỳ thi trung học phổ thông quốc gia, chúng tôi biên soạn Bộ Đề Luyện Thi Trung Học Phổ Thông môn tiếng Anh.
Bộ đề gồm 20 đề luyện thi được biên soạn theo cấu trúc đề thi THPT quốc gia của Bộ Giáo Dục & Đào Tạo, với nội dung theo sát chương trình tiếng Anh trung học phổ thông.
', 23)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1111, N'Giải Chi Tiết Bộ Đề Luyện Thi Thử THPT Quốc Gia Môn Toán', N'1111.jpg', N'NXB Đại Học Quốc Gia Hà Nội', N'Nhiều Tác Giả', 161500, CAST(N'1980-03-29' AS Date), 0, N'1006', N'1111_1.jpg', N'Giải Chi Tiết Bộ Đề Luyện Thi Thử THPT Quốc Gia Môn Toán', 112)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1112, N'Các Chuyên Đề Bám Sát Đề Thi THPT Quốc Gia Môn Sinh Học', N'1112.jpg', N'NXB Đại Học Quốc Gia Hà Nội', N'TS Phan Khắc Nghệ', 117300, CAST(N'1980-03-29' AS Date), 0, N'1006', N'1112_1.jpg', N'Bộ Giáo Dục và Đào Tạo đang có lộ trình hướng tới một kỳ thi quốc gia chuẩn mực "2 trong 1" để vừa xét tốt nghiệp THPT vừa xét đầu vào cho các trường Đại Học và Cao Đẳng cũng như khuyến khích các trường tự chủ trong công tác tuyển sinh.
Vào Đại Học là một công việc có nhiều ý nghĩa đỗi với mỗi học sinh. Một kết quả tốt trong kì thi này không những mở ra cách cửa rộng lớn để xây dựng tương lai sáng cho bản thân các em mà còn là thước đo năng lực trí tuệ, thái độ trong học tập của các em nữa. Kết quả tốt trong kỳ thi này còn thể hiện phần nào sự báo đáp, tri ân của các em dành cho cha mẹ, người thân và thầy cô.
', 11)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1113, N'Tóm Tắt Kiến Thức Toán Phổ Thông', N'1113.jpg', N'NXB Thế Giới', N'Đỗ Minh Triết', 123250, CAST(N'1980-03-29' AS Date), 0, N'1006', N'1113_1.jpg', N'Đúng như tên gọi, Tóm tắt kiến thức toán phổ thông tổng hợp những kiến thức mà học sinh cần có trong quá trình học tập môn Toán ở hai bậc học Trung học cơ sở và Trung học phổ thông. Đó là những kiến thức căn bản không chỉ giúp học sinh giải quyết các bài tập, các yêu cầu học và thi trong nhà trường, mà còn giúp các em hình thành một nền tảng tư duy toán học có thể áp dụng vào thực tiễn đời sống.
Điểm độc đáo là cuốn sách được thiết kế theo phong cách ghi chép sổ tay bullet journal. Thay vì những gạch đầu dòng nhàm chán, các kiến thức được tổng hợp luôn gắn với những ký hiệu sinh động, những tranh ảnh minh họa bắt mắt. Sẽ thật thú vị khi bạn phát hiện ra việc gắn kết số nguyên tố với hình ảnh những chú ve sầu không phải là ngẫu nhiên, hay như hình vẽ hyperbol lại được gợi lên qua những rặng san hô xinh đẹp.
', 12)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1118, N'Phát Triển Năng Lực Thi Trắc Nghiệm Môn Địa Lí ', N'1114.jpg', N'NXB Dân Trí', N'Nguyễn Yến - Nguyễn Thị Kiều Hoa', 98100, CAST(N'2023-10-23' AS Date), 0, N'1006', N'1114_1.jpg', N'Để tự tin và hoàn thành tốt các bài thi trắc nghiệm, các em học sinh không chỉ cần trang bị cho mình vốn kiến thức vững vàng mà còn cần được hình thành kỹ năng để xử lý các câu hỏi trong đề thi một cách chính xác, nhanh chóng. Để hiểu được điều đó, các tác giả đã dành nhiều thời gian và tâm huyết để biên soạn tài liệu tự học cho các em học sinh.
Nội dung sách được xây dựng một cách bao quát, hệ thống, bám sát chương trình THPT hiện hành theo 04 mức độ đánh giá năng lực học sinh (nhận biết, thông hiểu, vận dụng thấp và vận dụng cao). Do đó, các em học sinh các khối lớp 10, 11, 12 đều có thể sử dụng và sử dụng cuốn sách như một tài liệu tự học thống nhất, xuyên suốt, nâng cao.
', 43)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1121, N'Tuyển Tập Đề Thi Học Sinh Giỏi Ngữ Văn THPT Qua Các Kì Thi', N'1115.jpg', N'NXB Thanh Niên', N'Nguyễn Thành Huân, Đỗ Trung Kiên', 210800, CAST(N'2023-10-21' AS Date), 0, N'1006', N'1115_1.jqg', N'“Những trang sách suốt đời đi vẫn nhớ,/ Như đám  mây ngũ sắc ngủ  trên đầu.” (Nghĩ lại về Pau-tốp-xki, Bằng Việt). Ôi thân thương biết bao với những trang sách như dòng sông sóng vỗ về miền xanh thẳm của đại dương kiến thức!
Nhằm đáp ứng nhu cầu nhận diện đề và cấu trúc đề cũng như rèn  kĩ năng giải đề thi môn Ngữ văn THPT, chuẩn bị cho các kì thi Học sinh giỏi cấp thành phố, tỉnh, khu vực và Quốc gia của học sinh trên toàn quốc. Chính vì vậy mà chúng tôi đã dày công sưu tầm và biên soạn một số đề thi học sinh giỏi qua các kì thi và tập hợp thành cuốn sách TUYỂN TẬP ĐỀ THI HỌC SINH GIỎI NGỮ VĂN THPT QUA CÁC KÌ THI.
', 21)
INSERT [dbo].[Products] ([Id], [Name], [Image], [NXB], [TG], [Price], [CreateDate], [Available], [CategoryId], [HeadImage], [GioiThieu], [SoLuong]) VALUES (1123, N'Tuyển Chọn 3000 Bài Tập Điện Xoay Chiều Và Dao Động Điện Từ', N'1116.jpg', N'NXB Đại Học Quốc Gia Hà Nội', N'Lại Đắc Hợp, Nguyễn Thị Lượng', 139000, CAST(N'2023-10-21' AS Date), 0, N'1006', N'1116_1.jpg', N'Điện xoay chiều và dao động điện từ là những chương quan trọng trong chương trình Vật lý 12. Số lượng câu hỏi của những phần này trong đề thi đại học các năm gần đây thường chiếm khoảng 25% - 30%. Với nội dung kiến thức đa dạng, phong phú nên các bài tập của hai chương này xuất hiện đầy đủ ở các mức độ câu hỏi từ dễ đến khó ở trong đề thi chính thức.
Về nội dung cuốn sách, chúng tôi đã chia nhỏ các bài tập theo các chủ đề trong đó chương Điện xoay chiều gồm 17 chủ đề và chương Dao động điện từ gồm 2 chủ đề.
Trong các chủ đề chúng tôi tiếp tục chia nhỏ thành các dạng bài tập, các bài tập được sắp xếp theo mức độ từ cơ bản đến nâng cao. Điểm nổi bật của cuốn sách là toàn bộ bài tập tự luyện đều dưới dạng trắc nghiệm và đáp án đúng ở cuối sách, tuy nhiên các em có thể tra cứu lời giải chi tiết cho từng bài tập thông qua chức năng tìm kiếm theo mã câu hỏi (ID) trên trang M Ngoài ra, các dạng bài tập sẽ được đồng bộ với hệ thống video bài giảng giúp các em có thể khai thác các nội dung lý thuyết kèm theo một cách đơn giản và hiệu quả nhất. 
', 12)
SET IDENTITY_INSERT [dbo].[Products] OFF
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'CUST', N'Customers')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'DIRE', N'Directors')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'STAF', N'Staffs')
ALTER TABLE [dbo].[Accounts] ADD  CONSTRAINT [DF_Customers_Photo]  DEFAULT (N'Photo.gif') FOR [Photo]
GO
ALTER TABLE [dbo].[OrderDetails] ADD  CONSTRAINT [DF_Order_Details_UnitPrice]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[OrderDetails] ADD  CONSTRAINT [DF_Order_Details_Quantity]  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_OrderDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_Image]  DEFAULT (N'Product.gif') FOR [Image]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_UnitPrice]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_ProductDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_Available]  DEFAULT ((1)) FOR [Available]
GO
ALTER TABLE [dbo].[Authorities]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Authorities] CHECK CONSTRAINT [FK_UserRoles_Roles]
GO
ALTER TABLE [dbo].[Authorities]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Users] FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Authorities] CHECK CONSTRAINT [FK_UserRoles_Users]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK3ess0s7i9qs6sim1pf9kxhkpq] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK3ess0s7i9qs6sim1pf9kxhkpq]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã khách hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts', @level2type=N'COLUMN',@level2name=N'Username'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mật khẩu đăng nhập' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts', @level2type=N'COLUMN',@level2name=N'Password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Họ và tên' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts', @level2type=N'COLUMN',@level2name=N'Fullname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Email' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Hình ảnh' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts', @level2type=N'COLUMN',@level2name=N'Photo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã loại' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Categories', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tên tiếng Việt' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Categories', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã chi tiết' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDetails', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã hóa đơn' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDetails', @level2type=N'COLUMN',@level2name=N'OrderId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã hàng hóa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDetails', @level2type=N'COLUMN',@level2name=N'ProductId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Đơn giá bán' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDetails', @level2type=N'COLUMN',@level2name=N'Price'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số lượng mua' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDetails', @level2type=N'COLUMN',@level2name=N'Quantity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã hóa đơn' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã khách hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'Username'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngày đặt hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Địa chỉ nhận' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã hàng hóa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tên hàng hóa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Hình ảnh' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Image'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Đơn giá' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Price'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngày sản xuất' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Đang kinh doanh ?' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Available'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã loại, FK' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'CategoryId'
GO
USE [master]
GO
ALTER DATABASE [BBStore1] SET  READ_WRITE 
GO
