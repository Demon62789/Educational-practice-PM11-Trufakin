USE [master]
GO
/****** Object:  Database [ХранительПРО]    Script Date: 19.04.2024 10:12:30 ******/
CREATE DATABASE [ХранительПРО]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ХранительПРО', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ХранительПРО.mdf' , SIZE = 9216KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ХранительПРО_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ХранительПРО_log.ldf' , SIZE = 3136KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ХранительПРО] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ХранительПРО].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ХранительПРО] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ХранительПРО] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ХранительПРО] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ХранительПРО] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ХранительПРО] SET ARITHABORT OFF 
GO
ALTER DATABASE [ХранительПРО] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ХранительПРО] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ХранительПРО] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ХранительПРО] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ХранительПРО] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ХранительПРО] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ХранительПРО] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ХранительПРО] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ХранительПРО] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ХранительПРО] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ХранительПРО] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ХранительПРО] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ХранительПРО] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ХранительПРО] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ХранительПРО] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ХранительПРО] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ХранительПРО] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ХранительПРО] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ХранительПРО] SET  MULTI_USER 
GO
ALTER DATABASE [ХранительПРО] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ХранительПРО] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ХранительПРО] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ХранительПРО] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ХранительПРО] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ХранительПРО]
GO
/****** Object:  User [Sergei]    Script Date: 19.04.2024 10:12:31 ******/
CREATE USER [Sergei] FOR LOGIN [Sergei] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [Sergei]
GO
/****** Object:  Table [dbo].[Авторизация]    Script Date: 19.04.2024 10:12:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Авторизация](
	[ID_Авторизации] [int] IDENTITY(1,1) NOT NULL,
	[Логин] [nvarchar](100) NULL,
	[Пароль] [nvarchar](50) NOT NULL,
	[Шифрование] [nvarchar](100) NULL,
	[Почта] [nvarchar](100) NULL,
 CONSTRAINT [PK_Данные_Авторизации] PRIMARY KEY CLUSTERED 
(
	[ID_Авторизации] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Заявка]    Script Date: 19.04.2024 10:12:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Заявка](
	[ID_Заявки] [int] IDENTITY(1,1) NOT NULL,
	[ID_Постетителя] [int] NULL,
	[Дата_подачи] [date] NOT NULL,
	[Желаемый_срок_начала_пропуска] [date] NOT NULL,
	[Желаемый_срок_окончания_пропуска] [date] NOT NULL,
	[Групповая_запись] [bit] NOT NULL,
	[Статус_заявки] [int] NOT NULL,
	[Коментарий] [nchar](10) NULL,
	[Ответственное_подразделение] [int] NOT NULL,
	[ID_Принимающего] [int] NOT NULL,
 CONSTRAINT [PK_Заявка] PRIMARY KEY CLUSTERED 
(
	[ID_Заявки] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Отдел]    Script Date: 19.04.2024 10:12:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Отдел](
	[ID_Отдела] [int] NOT NULL,
	[Название_отдела] [nvarchar](50) NULL,
 CONSTRAINT [PK_Отдел] PRIMARY KEY CLUSTERED 
(
	[ID_Отдела] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Подразделение]    Script Date: 19.04.2024 10:12:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Подразделение](
	[ID_Подразделения] [int] NOT NULL,
	[Название_подразделения] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Подразделение] PRIMARY KEY CLUSTERED 
(
	[ID_Подразделения] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Посетитель]    Script Date: 19.04.2024 10:12:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Посетитель](
	[ID_Посетителя] [int] IDENTITY(1,1) NOT NULL,
	[Фамилия] [nvarchar](50) NULL,
	[Имя] [nvarchar](50) NULL,
	[Отчество] [nvarchar](50) NULL,
	[Телефон] [char](20) NULL,
	[Почта] [nvarchar](100) NULL,
	[Организация] [nvarchar](50) NULL,
	[Примечание] [nvarchar](50) NULL,
	[Дата_рождения] [date] NULL,
	[Серия_паспорта] [int] NULL,
	[Номер_паспорта] [int] NULL,
	[Фотография_посетителя] [varbinary](max) NULL,
	[Скан_паспорта] [varbinary](max) NULL,
	[ID_Авторизации] [int] NULL,
	[ID_Заявки] [int] NULL,
 CONSTRAINT [PK_Посетитель] PRIMARY KEY CLUSTERED 
(
	[ID_Посетителя] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Посетитель_Заявка]    Script Date: 19.04.2024 10:12:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Посетитель_Заявка](
	[ID_Списка] [int] IDENTITY(1,1) NOT NULL,
	[ID_Заявки] [int] NULL,
	[ID_Посетителя] [int] NULL,
 CONSTRAINT [PK_Посетитель_Заявка] PRIMARY KEY CLUSTERED 
(
	[ID_Списка] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Сотрудник]    Script Date: 19.04.2024 10:12:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Сотрудник](
	[ID_Сотруника] [int] NOT NULL,
	[Фамилия] [nvarchar](50) NOT NULL,
	[Имя] [nvarchar](50) NOT NULL,
	[Отчество] [nvarchar](50) NOT NULL,
	[ID_Подразделения] [int] NOT NULL,
	[ID_Отдела] [int] NULL,
 CONSTRAINT [PK_Сотрудник] PRIMARY KEY CLUSTERED 
(
	[ID_Сотруника] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Статус]    Script Date: 19.04.2024 10:12:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Статус](
	[ID_Статуса] [int] NOT NULL,
	[Название_статус] [nvarchar](50) NULL,
 CONSTRAINT [PK_Статус] PRIMARY KEY CLUSTERED 
(
	[ID_Статуса] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ViewListRequests]    Script Date: 19.04.2024 10:12:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewListRequests] AS
SELECT 
    z.ID_Заявки,
    z.Дата_подачи,
    z.Желаемый_срок_начала_пропуска,
    z.Желаемый_срок_окончания_пропуска,
    p.Название_подразделения AS Подразделение,
    s.Название_статус AS Статус,
    v.Фамилия + ' ' + v.Имя + ' ' + v.Отчество AS ФИО_Посетителя,
    v.Организация,
    z.Коментарий
FROM 
    Заявка z
INNER JOIN 
    Подразделение p ON z.Ответственное_подразделение = p.ID_Подразделения
INNER JOIN 
    Статус s ON z.Статус_заявки = s.ID_Статуса
LEFT JOIN 
    Посетитель v ON z.ID_Постетителя = v.ID_Посетителя;
GO
ALTER TABLE [dbo].[Заявка]  WITH CHECK ADD  CONSTRAINT [FK_Заявка_Подразделение] FOREIGN KEY([Ответственное_подразделение])
REFERENCES [dbo].[Подразделение] ([ID_Подразделения])
GO
ALTER TABLE [dbo].[Заявка] CHECK CONSTRAINT [FK_Заявка_Подразделение]
GO
ALTER TABLE [dbo].[Заявка]  WITH CHECK ADD  CONSTRAINT [FK_Заявка_Посетитель] FOREIGN KEY([ID_Постетителя])
REFERENCES [dbo].[Посетитель] ([ID_Посетителя])
GO
ALTER TABLE [dbo].[Заявка] CHECK CONSTRAINT [FK_Заявка_Посетитель]
GO
ALTER TABLE [dbo].[Заявка]  WITH CHECK ADD  CONSTRAINT [FK_Заявка_Сотрудник] FOREIGN KEY([ID_Принимающего])
REFERENCES [dbo].[Сотрудник] ([ID_Сотруника])
GO
ALTER TABLE [dbo].[Заявка] CHECK CONSTRAINT [FK_Заявка_Сотрудник]
GO
ALTER TABLE [dbo].[Заявка]  WITH CHECK ADD  CONSTRAINT [FK_Заявка_Статус] FOREIGN KEY([Статус_заявки])
REFERENCES [dbo].[Статус] ([ID_Статуса])
GO
ALTER TABLE [dbo].[Заявка] CHECK CONSTRAINT [FK_Заявка_Статус]
GO
ALTER TABLE [dbo].[Посетитель]  WITH CHECK ADD  CONSTRAINT [FK_Посетитель_Авторизация] FOREIGN KEY([ID_Авторизации])
REFERENCES [dbo].[Авторизация] ([ID_Авторизации])
GO
ALTER TABLE [dbo].[Посетитель] CHECK CONSTRAINT [FK_Посетитель_Авторизация]
GO
ALTER TABLE [dbo].[Посетитель_Заявка]  WITH CHECK ADD  CONSTRAINT [FK_Посетитель_Заявка_Заявка] FOREIGN KEY([ID_Заявки])
REFERENCES [dbo].[Заявка] ([ID_Заявки])
GO
ALTER TABLE [dbo].[Посетитель_Заявка] CHECK CONSTRAINT [FK_Посетитель_Заявка_Заявка]
GO
ALTER TABLE [dbo].[Посетитель_Заявка]  WITH CHECK ADD  CONSTRAINT [FK_Посетитель_Заявка_Посетитель] FOREIGN KEY([ID_Посетителя])
REFERENCES [dbo].[Посетитель] ([ID_Посетителя])
GO
ALTER TABLE [dbo].[Посетитель_Заявка] CHECK CONSTRAINT [FK_Посетитель_Заявка_Посетитель]
GO
ALTER TABLE [dbo].[Сотрудник]  WITH CHECK ADD  CONSTRAINT [FK_Сотрудник_Отдел] FOREIGN KEY([ID_Отдела])
REFERENCES [dbo].[Отдел] ([ID_Отдела])
GO
ALTER TABLE [dbo].[Сотрудник] CHECK CONSTRAINT [FK_Сотрудник_Отдел]
GO
ALTER TABLE [dbo].[Сотрудник]  WITH CHECK ADD  CONSTRAINT [FK_Сотрудник_Подразделение] FOREIGN KEY([ID_Подразделения])
REFERENCES [dbo].[Подразделение] ([ID_Подразделения])
GO
ALTER TABLE [dbo].[Сотрудник] CHECK CONSTRAINT [FK_Сотрудник_Подразделение]
GO
/****** Object:  StoredProcedure [dbo].[FilteringRequests]    Script Date: 19.04.2024 10:12:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FilteringRequests]
    @GroupApplication bit = NULL,
    @DepartmentId int = NULL,
    @StatusId int = NULL
AS
BEGIN
    SELECT 
        z.ID_Заявки,
        z.Дата_подачи,
        z.Желаемый_срок_начала_пропуска,
        z.Желаемый_срок_окончания_пропуска,
        p.Название_подразделения AS Подразделение,
        s.Название_статус AS Статус,
        v.Фамилия + ' ' + v.Имя + ' ' + v.Отчество AS ФИО_Посетителя,
        v.Организация,
        z.Коментарий
    FROM 
        Заявка z
    INNER JOIN 
        Подразделение p ON z.Ответственное_подразделение = p.ID_Подразделения
    INNER JOIN 
        Статус s ON z.Статус_заявки = s.ID_Статуса
    LEFT JOIN 
        Посетитель v ON z.ID_Постетителя = v.ID_Посетителя
    WHERE
        (@GroupApplication IS NULL OR z.Групповая_запись = @GroupApplication)
        AND (@DepartmentId IS NULL OR z.Ответственное_подразделение = @DepartmentId)
        AND (@StatusId IS NULL OR z.Статус_заявки = @StatusId);
END;
GO
USE [master]
GO
ALTER DATABASE [ХранительПРО] SET  READ_WRITE 
GO
