USE [master]
GO
/****** Object:  Database [HTMLPreviewer]    Script Date: 30.8.2021 г. 1:23:28 ******/
CREATE DATABASE [HTMLPreviewer]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HTMLPreviewer', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\HTMLPreviewer.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HTMLPreviewer_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\HTMLPreviewer_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [HTMLPreviewer] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HTMLPreviewer].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HTMLPreviewer] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HTMLPreviewer] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HTMLPreviewer] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HTMLPreviewer] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HTMLPreviewer] SET ARITHABORT OFF 
GO
ALTER DATABASE [HTMLPreviewer] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HTMLPreviewer] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HTMLPreviewer] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HTMLPreviewer] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HTMLPreviewer] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HTMLPreviewer] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HTMLPreviewer] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HTMLPreviewer] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HTMLPreviewer] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HTMLPreviewer] SET  ENABLE_BROKER 
GO
ALTER DATABASE [HTMLPreviewer] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HTMLPreviewer] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HTMLPreviewer] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HTMLPreviewer] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HTMLPreviewer] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HTMLPreviewer] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [HTMLPreviewer] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HTMLPreviewer] SET RECOVERY FULL 
GO
ALTER DATABASE [HTMLPreviewer] SET  MULTI_USER 
GO
ALTER DATABASE [HTMLPreviewer] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HTMLPreviewer] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HTMLPreviewer] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HTMLPreviewer] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HTMLPreviewer] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HTMLPreviewer] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'HTMLPreviewer', N'ON'
GO
ALTER DATABASE [HTMLPreviewer] SET QUERY_STORE = OFF
GO
USE [HTMLPreviewer]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 30.8.2021 г. 1:23:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HTMLs]    Script Date: 30.8.2021 г. 1:23:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HTMLs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[ModifiedOn] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_HTMLs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HTMLVersions]    Script Date: 30.8.2021 г. 1:23:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HTMLVersions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](max) NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[HTMLId] [int] NOT NULL,
 CONSTRAINT [PK_HTMLVersions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210828123410_InitialCreate', N'5.0.9')
GO
SET IDENTITY_INSERT [dbo].[HTMLs] ON 

INSERT [dbo].[HTMLs] ([Id], [Content], [CreatedOn], [ModifiedOn]) VALUES (1, N'<h1>hi</h1>', CAST(N'2021-08-29T21:43:01.6795060' AS DateTime2), CAST(N'2021-08-29T21:50:22.4395408' AS DateTime2))
INSERT [dbo].[HTMLs] ([Id], [Content], [CreatedOn], [ModifiedOn]) VALUES (2, N'<ol style="color: rgba(255, 0, 0, 1)">
<li>testing</li>
<li>ordered</li>
<li>lists</li>
</ol>

<ul style="list-style-type: square">
	<li>one</li>
	<li>two</li>
</ul>
<ol style="list-style-type: circle">
	<li>item 1</li>
	<li>item 2</li>
</ol>', CAST(N'2021-08-29T22:07:09.0350916' AS DateTime2), CAST(N'2021-08-29T22:18:02.3494736' AS DateTime2))
INSERT [dbo].[HTMLs] ([Id], [Content], [CreatedOn], [ModifiedOn]) VALUES (3, N'<h1> Karate Cat at 6 o''clock! </h1>

<img src="https://1.bp.blogspot.com/-U6Md9eJ2s-U/YHfdAXwT5KI/AAAAAAAAAZU/OZMy_qHcclIUhIAQQgzyx4JyiHQ0aRufgCLcBGAsYHQ/s554/images%2B-%2B2021-04-15T114831.139.jpeg" width="400" height="500">', CAST(N'2021-08-29T22:12:57.8056690' AS DateTime2), CAST(N'2021-08-29T22:15:46.4487601' AS DateTime2))
SET IDENTITY_INSERT [dbo].[HTMLs] OFF
GO
SET IDENTITY_INSERT [dbo].[HTMLVersions] ON 

INSERT [dbo].[HTMLVersions] ([Id], [Content], [CreatedOn], [HTMLId]) VALUES (1, N'<h1> Hello </h1>', CAST(N'2021-08-29T21:43:15.3131522' AS DateTime2), 1)
INSERT [dbo].[HTMLVersions] ([Id], [Content], [CreatedOn], [HTMLId]) VALUES (2, N'<h1 style="color: rgba(0, 128, 0, 1); background-color: rgba(128, 128, 128, 1)"> Hello </h1>', CAST(N'2021-08-29T21:43:34.7071197' AS DateTime2), 1)
INSERT [dbo].[HTMLVersions] ([Id], [Content], [CreatedOn], [HTMLId]) VALUES (3, N'<h1 style="color: rgba(0, 128, 0, 1); background-color: rgba(128, 128, 128, 1)"> HelIo </h1>', CAST(N'2021-08-29T21:43:55.2339815' AS DateTime2), 1)
INSERT [dbo].[HTMLVersions] ([Id], [Content], [CreatedOn], [HTMLId]) VALUES (4, N'<h1> Nice meeting you </h1>', CAST(N'2021-08-29T21:46:41.9112817' AS DateTime2), 1)
INSERT [dbo].[HTMLVersions] ([Id], [Content], [CreatedOn], [HTMLId]) VALUES (5, N'<h1> Bye bye </h1>', CAST(N'2021-08-29T21:48:06.7312279' AS DateTime2), 1)
INSERT [dbo].[HTMLVersions] ([Id], [Content], [CreatedOn], [HTMLId]) VALUES (6, N'<h1 style="color: rgba(255, 0, 0, 1)"> Bye bye </h1>', CAST(N'2021-08-29T21:49:03.2288243' AS DateTime2), 1)
INSERT [dbo].[HTMLVersions] ([Id], [Content], [CreatedOn], [HTMLId]) VALUES (7, N'<h1 style="color: rgba(221, 221, 221, 1)"> Bye bye </h1>', CAST(N'2021-08-29T21:50:07.4695521' AS DateTime2), 1)
INSERT [dbo].[HTMLVersions] ([Id], [Content], [CreatedOn], [HTMLId]) VALUES (8, N'<h1>hi</h1>', CAST(N'2021-08-29T21:50:18.0288839' AS DateTime2), 1)
INSERT [dbo].[HTMLVersions] ([Id], [Content], [CreatedOn], [HTMLId]) VALUES (9, N'<h1>hiii</h1>', CAST(N'2021-08-29T21:50:22.4367823' AS DateTime2), 1)
INSERT [dbo].[HTMLVersions] ([Id], [Content], [CreatedOn], [HTMLId]) VALUES (10, N'<ul>
<li>testing</li>
<li>unordered</li>
<li>lists</li>
</ul>

<ul style="list-style-type: square">
	<li>item 1</li>
	<li>item 2</li>
</ul>
<ul>
	<li>item 1</li>
	<li>item 2</li>
</ul>', CAST(N'2021-08-29T22:08:25.5847667' AS DateTime2), 2)
INSERT [dbo].[HTMLVersions] ([Id], [Content], [CreatedOn], [HTMLId]) VALUES (11, N'<h1> Coding Cat at 6 o''clock! </h1>

<img src="https://i.redd.it/mvq3682s8ck21.jpg" width="400" height="500">', CAST(N'2021-08-29T22:13:59.5017983' AS DateTime2), 3)
INSERT [dbo].[HTMLVersions] ([Id], [Content], [CreatedOn], [HTMLId]) VALUES (12, N'<h1> Jet Cat at 6 o''clock! </h1>

<img src="https://external-preview.redd.it/TeESRXka6k2gkoU87M639foflvQDSDN78dVnlJ_jokM.jpg?auto=webp&amp;s=dbb6fc5efb03019607fa71aca3bd57813246baaf" width="400" height="500">', CAST(N'2021-08-29T22:15:46.4460325' AS DateTime2), 3)
INSERT [dbo].[HTMLVersions] ([Id], [Content], [CreatedOn], [HTMLId]) VALUES (13, N'<ol>
<li>testing</li>
<li>ordered</li>
<li>lists</li>
</ol>

<ul style="list-style-type: square">
	<li>one</li>
	<li>two</li>
</ul>
<ol style="list-style-type: circle">
	<li>item 1</li>
	<li>item 2</li>
</ol>', CAST(N'2021-08-29T22:18:02.3478804' AS DateTime2), 2)
SET IDENTITY_INSERT [dbo].[HTMLVersions] OFF
GO
/****** Object:  Index [IX_HTMLVersions_HTMLId]    Script Date: 30.8.2021 г. 1:23:28 ******/
CREATE NONCLUSTERED INDEX [IX_HTMLVersions_HTMLId] ON [dbo].[HTMLVersions]
(
	[HTMLId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[HTMLVersions]  WITH CHECK ADD  CONSTRAINT [FK_HTMLVersions_HTMLs_HTMLId] FOREIGN KEY([HTMLId])
REFERENCES [dbo].[HTMLs] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HTMLVersions] CHECK CONSTRAINT [FK_HTMLVersions_HTMLs_HTMLId]
GO
USE [master]
GO
ALTER DATABASE [HTMLPreviewer] SET  READ_WRITE 
GO
