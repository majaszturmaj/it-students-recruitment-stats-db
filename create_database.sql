USE [master]
GO
/****** Object:  Database [UczelnianePraktykiIT]    Script Date: 03.05.2023 18:01:30 ******/
CREATE DATABASE [UczelnianePraktykiIT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UczelnianePraktykiIT', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLINELO22\MSSQL\DATA\UczelnianePraktykiIT.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'UczelnianePraktykiIT_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLINELO22\MSSQL\DATA\UczelnianePraktykiIT_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [UczelnianePraktykiIT] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UczelnianePraktykiIT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UczelnianePraktykiIT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UczelnianePraktykiIT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UczelnianePraktykiIT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UczelnianePraktykiIT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UczelnianePraktykiIT] SET ARITHABORT OFF 
GO
ALTER DATABASE [UczelnianePraktykiIT] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UczelnianePraktykiIT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UczelnianePraktykiIT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UczelnianePraktykiIT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UczelnianePraktykiIT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UczelnianePraktykiIT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UczelnianePraktykiIT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UczelnianePraktykiIT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UczelnianePraktykiIT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UczelnianePraktykiIT] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UczelnianePraktykiIT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UczelnianePraktykiIT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UczelnianePraktykiIT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UczelnianePraktykiIT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UczelnianePraktykiIT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UczelnianePraktykiIT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UczelnianePraktykiIT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UczelnianePraktykiIT] SET RECOVERY FULL 
GO
ALTER DATABASE [UczelnianePraktykiIT] SET  MULTI_USER 
GO
ALTER DATABASE [UczelnianePraktykiIT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UczelnianePraktykiIT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UczelnianePraktykiIT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UczelnianePraktykiIT] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [UczelnianePraktykiIT] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [UczelnianePraktykiIT] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'UczelnianePraktykiIT', N'ON'
GO
ALTER DATABASE [UczelnianePraktykiIT] SET QUERY_STORE = ON
GO
ALTER DATABASE [UczelnianePraktykiIT] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [UczelnianePraktykiIT]
GO
/****** Object:  Schema [dict]    Script Date: 03.05.2023 18:01:31 ******/
CREATE SCHEMA [dict]
GO
/****** Object:  Table [dbo].[CV]    Script Date: 03.05.2023 18:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CV](
	[CV_ID] [smallint] IDENTITY(1,1) NOT NULL,
	[KandydatID] [varchar](7) NOT NULL,
	[Doswiadczenie] [varchar](8) NOT NULL,
	[Edukacja] [varchar](8) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CV_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CV_JezykiObce]    Script Date: 03.05.2023 18:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CV_JezykiObce](
	[CV_ID] [smallint] NOT NULL,
	[Polski] [char](2) NULL,
	[Angielski] [char](2) NULL,
	[Niemiecki] [char](2) NULL,
	[Inny] [nvarchar](64) NULL,
PRIMARY KEY CLUSTERED 
(
	[CV_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CV_Umiejetnosci]    Script Date: 03.05.2023 18:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CV_Umiejetnosci](
	[CV_ID] [smallint] NOT NULL,
	[Git] [tinyint] NULL,
	[Linux] [tinyint] NULL,
	[MachineLearning] [tinyint] NULL,
	[Bash] [tinyint] NULL,
	[JavaScript] [tinyint] NULL,
	[Python] [tinyint] NULL,
	[Java] [tinyint] NULL,
	[Kotlin] [tinyint] NULL,
	[PHP] [tinyint] NULL,
	[C#] [tinyint] NULL,
	[R] [tinyint] NULL,
	[Ruby] [tinyint] NULL,
	[C] [tinyint] NULL,
	[Cpp] [tinyint] NULL,
	[Matlab] [tinyint] NULL,
	[SQL_] [tinyint] NULL,
	[HTML] [tinyint] NULL,
	[CSS] [tinyint] NULL,
	[Rust] [tinyint] NULL,
	[Perl] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[CV_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kandydaci]    Script Date: 03.05.2023 18:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kandydaci](
	[KandydatID] [varchar](7) NOT NULL,
	[Imie] [nvarchar](32) NOT NULL,
	[Nazwisko] [nvarchar](32) NOT NULL,
	[Plec] [char](1) NOT NULL,
	[RokUrodzenia] [smallint] NOT NULL,
	[TrybStudiow] [char](1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[KandydatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Podania]    Script Date: 03.05.2023 18:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Podania](
	[PodanieID] [smallint] IDENTITY(1,1) NOT NULL,
	[KandydatID] [varchar](7) NOT NULL,
	[FirmaID] [varchar](16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CV_ID] [smallint] NOT NULL,
	[Stan] [varchar](32) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PodanieID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StatystykiCV]    Script Date: 03.05.2023 18:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatystykiCV](
	[CV_ID] [smallint] NOT NULL,
	[Liczba_zlozonych_CV] [smallint] NULL,
	[Odrzucenia] [smallint] NULL,
	[Rozmowy_rekrutacyjne] [smallint] NULL,
	[Przyjecia] [smallint] NULL,
PRIMARY KEY CLUSTERED 
(
	[CV_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StatystykiFirmy]    Script Date: 03.05.2023 18:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatystykiFirmy](
	[FirmaID] [varchar](16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Odrzucenia] [smallint] NULL,
	[Przyjecia] [smallint] NULL,
PRIMARY KEY CLUSTERED 
(
	[FirmaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StatystykiKandydatow]    Script Date: 03.05.2023 18:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatystykiKandydatow](
	[KandydatID] [varchar](7) NOT NULL,
	[Liczba_zlozonych_wnioskow] [smallint] NULL,
	[Odrzucenia] [smallint] NULL,
	[Rozmowy_rekrutacyjne] [tinyint] NULL,
	[Przyjecia] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[KandydatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dict].[DoswiadczeniaZawodowe]    Script Date: 03.05.2023 18:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dict].[DoswiadczeniaZawodowe](
	[DoswiadczenieID] [varchar](8) NOT NULL,
	[Opis] [nvarchar](128) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DoswiadczenieID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dict].[Firmy]    Script Date: 03.05.2023 18:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dict].[Firmy](
	[FirmaID] [varchar](16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Nazwa] [nvarchar](64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[FirmaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dict].[Plcie]    Script Date: 03.05.2023 18:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dict].[Plcie](
	[PlecID] [char](1) NOT NULL,
	[Opis] [nvarchar](16) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PlecID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dict].[PoziomyJezyka]    Script Date: 03.05.2023 18:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dict].[PoziomyJezyka](
	[PoziomID] [char](2) NOT NULL,
	[Opis] [nvarchar](64) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PoziomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dict].[PoziomyUmiejetnosci]    Script Date: 03.05.2023 18:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dict].[PoziomyUmiejetnosci](
	[PoziomID] [tinyint] NOT NULL,
	[Opis] [nvarchar](64) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PoziomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dict].[StatusyPodan]    Script Date: 03.05.2023 18:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dict].[StatusyPodan](
	[StatusID] [varchar](32) NOT NULL,
	[Opis] [nvarchar](128) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dict].[Szkoly]    Script Date: 03.05.2023 18:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dict].[Szkoly](
	[SzkolaID] [varchar](8) NOT NULL,
	[Opis] [nvarchar](128) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SzkolaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dict].[TrybyStudiow]    Script Date: 03.05.2023 18:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dict].[TrybyStudiow](
	[TrybID] [char](1) NOT NULL,
	[Opis] [nvarchar](16) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TrybID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CV]  WITH CHECK ADD FOREIGN KEY([Doswiadczenie])
REFERENCES [dict].[DoswiadczeniaZawodowe] ([DoswiadczenieID])
GO
ALTER TABLE [dbo].[CV]  WITH CHECK ADD FOREIGN KEY([Edukacja])
REFERENCES [dict].[Szkoly] ([SzkolaID])
GO
ALTER TABLE [dbo].[CV]  WITH CHECK ADD FOREIGN KEY([KandydatID])
REFERENCES [dbo].[Kandydaci] ([KandydatID])
GO
ALTER TABLE [dbo].[CV_JezykiObce]  WITH CHECK ADD FOREIGN KEY([Angielski])
REFERENCES [dict].[PoziomyJezyka] ([PoziomID])
GO
ALTER TABLE [dbo].[CV_JezykiObce]  WITH CHECK ADD FOREIGN KEY([CV_ID])
REFERENCES [dbo].[CV] ([CV_ID])
GO
ALTER TABLE [dbo].[CV_JezykiObce]  WITH CHECK ADD FOREIGN KEY([Niemiecki])
REFERENCES [dict].[PoziomyJezyka] ([PoziomID])
GO
ALTER TABLE [dbo].[CV_JezykiObce]  WITH CHECK ADD FOREIGN KEY([Polski])
REFERENCES [dict].[PoziomyJezyka] ([PoziomID])
GO
ALTER TABLE [dbo].[CV_Umiejetnosci]  WITH CHECK ADD FOREIGN KEY([CV_ID])
REFERENCES [dbo].[CV] ([CV_ID])
GO
ALTER TABLE [dbo].[CV_Umiejetnosci]  WITH CHECK ADD FOREIGN KEY([JavaScript])
REFERENCES [dict].[PoziomyUmiejetnosci] ([PoziomID])
GO
ALTER TABLE [dbo].[CV_Umiejetnosci]  WITH CHECK ADD FOREIGN KEY([Kotlin])
REFERENCES [dict].[PoziomyUmiejetnosci] ([PoziomID])
GO
ALTER TABLE [dbo].[CV_Umiejetnosci]  WITH CHECK ADD FOREIGN KEY([Linux])
REFERENCES [dict].[PoziomyUmiejetnosci] ([PoziomID])
GO
ALTER TABLE [dbo].[CV_Umiejetnosci]  WITH CHECK ADD FOREIGN KEY([MachineLearning])
REFERENCES [dict].[PoziomyUmiejetnosci] ([PoziomID])
GO
ALTER TABLE [dbo].[CV_Umiejetnosci]  WITH CHECK ADD FOREIGN KEY([Matlab])
REFERENCES [dict].[PoziomyUmiejetnosci] ([PoziomID])
GO
ALTER TABLE [dbo].[CV_Umiejetnosci]  WITH CHECK ADD FOREIGN KEY([Python])
REFERENCES [dict].[PoziomyUmiejetnosci] ([PoziomID])
GO
ALTER TABLE [dbo].[CV_Umiejetnosci]  WITH CHECK ADD FOREIGN KEY([Bash])
REFERENCES [dict].[PoziomyUmiejetnosci] ([PoziomID])
GO
ALTER TABLE [dbo].[CV_Umiejetnosci]  WITH CHECK ADD FOREIGN KEY([HTML])
REFERENCES [dict].[PoziomyUmiejetnosci] ([PoziomID])
GO
ALTER TABLE [dbo].[CV_Umiejetnosci]  WITH CHECK ADD FOREIGN KEY([Java])
REFERENCES [dict].[PoziomyUmiejetnosci] ([PoziomID])
GO
ALTER TABLE [dbo].[CV_Umiejetnosci]  WITH CHECK ADD FOREIGN KEY([Perl])
REFERENCES [dict].[PoziomyUmiejetnosci] ([PoziomID])
GO
ALTER TABLE [dbo].[CV_Umiejetnosci]  WITH CHECK ADD FOREIGN KEY([Ruby])
REFERENCES [dict].[PoziomyUmiejetnosci] ([PoziomID])
GO
ALTER TABLE [dbo].[CV_Umiejetnosci]  WITH CHECK ADD FOREIGN KEY([Rust])
REFERENCES [dict].[PoziomyUmiejetnosci] ([PoziomID])
GO
ALTER TABLE [dbo].[CV_Umiejetnosci]  WITH CHECK ADD FOREIGN KEY([SQL_])
REFERENCES [dict].[PoziomyUmiejetnosci] ([PoziomID])
GO
ALTER TABLE [dbo].[CV_Umiejetnosci]  WITH CHECK ADD FOREIGN KEY([Cpp])
REFERENCES [dict].[PoziomyUmiejetnosci] ([PoziomID])
GO
ALTER TABLE [dbo].[CV_Umiejetnosci]  WITH CHECK ADD FOREIGN KEY([CSS])
REFERENCES [dict].[PoziomyUmiejetnosci] ([PoziomID])
GO
ALTER TABLE [dbo].[CV_Umiejetnosci]  WITH CHECK ADD FOREIGN KEY([Git])
REFERENCES [dict].[PoziomyUmiejetnosci] ([PoziomID])
GO
ALTER TABLE [dbo].[CV_Umiejetnosci]  WITH CHECK ADD FOREIGN KEY([PHP])
REFERENCES [dict].[PoziomyUmiejetnosci] ([PoziomID])
GO
ALTER TABLE [dbo].[CV_Umiejetnosci]  WITH CHECK ADD FOREIGN KEY([C#])
REFERENCES [dict].[PoziomyUmiejetnosci] ([PoziomID])
GO
ALTER TABLE [dbo].[CV_Umiejetnosci]  WITH CHECK ADD FOREIGN KEY([C])
REFERENCES [dict].[PoziomyUmiejetnosci] ([PoziomID])
GO
ALTER TABLE [dbo].[CV_Umiejetnosci]  WITH CHECK ADD FOREIGN KEY([R])
REFERENCES [dict].[PoziomyUmiejetnosci] ([PoziomID])
GO
ALTER TABLE [dbo].[Kandydaci]  WITH CHECK ADD FOREIGN KEY([Plec])
REFERENCES [dict].[Plcie] ([PlecID])
GO
ALTER TABLE [dbo].[Kandydaci]  WITH CHECK ADD FOREIGN KEY([TrybStudiow])
REFERENCES [dict].[TrybyStudiow] ([TrybID])
GO
ALTER TABLE [dbo].[Podania]  WITH CHECK ADD FOREIGN KEY([KandydatID])
REFERENCES [dbo].[Kandydaci] ([KandydatID])
GO
ALTER TABLE [dbo].[Podania]  WITH CHECK ADD FOREIGN KEY([CV_ID])
REFERENCES [dbo].[CV] ([CV_ID])
GO
ALTER TABLE [dbo].[Podania]  WITH CHECK ADD FOREIGN KEY([FirmaID])
REFERENCES [dict].[Firmy] ([FirmaID])
GO
ALTER TABLE [dbo].[Podania]  WITH CHECK ADD FOREIGN KEY([Stan])
REFERENCES [dict].[StatusyPodan] ([StatusID])
GO
ALTER TABLE [dbo].[StatystykiCV]  WITH CHECK ADD FOREIGN KEY([CV_ID])
REFERENCES [dbo].[CV] ([CV_ID])
GO
ALTER TABLE [dbo].[StatystykiFirmy]  WITH CHECK ADD FOREIGN KEY([FirmaID])
REFERENCES [dict].[Firmy] ([FirmaID])
GO
ALTER TABLE [dbo].[StatystykiKandydatow]  WITH CHECK ADD FOREIGN KEY([KandydatID])
REFERENCES [dbo].[Kandydaci] ([KandydatID])
GO
ALTER TABLE [dbo].[Kandydaci]  WITH CHECK ADD CHECK  (([RokUrodzenia]>=(1900) AND [RokUrodzenia]<=(2023)))
GO
USE [master]
GO
ALTER DATABASE [UczelnianePraktykiIT] SET  READ_WRITE 
GO

-- zapełnianie tabeli słownikowych
USE UczelnianePraktykiIT;

INSERT INTO [dict].[DoswiadczeniaZawodowe] ([DoswiadczenieID], [Opis])
VALUES ('brak', 'Brak doświadczenia'),
       ('posiada', 'Pracował/Pracowała już w branży')

INSERT INTO [dict].[Plcie] ([PlecID], [Opis])
VALUES ('K', 'Kobieta'),
       ('M', 'Mężczyzna')

INSERT INTO [dict].[PoziomyJezyka] ([PoziomID], [Opis])
VALUES ('A1', 'Podstawowy'),
       ('A2', 'Podstawowy plus'),
       ('B1', 'Średnio zaawansowany'),
       ('B2', 'Wyższy średnio zaawansowany'),
       ('C1', 'Zaawansowany'),
       ('C2', 'Biegły'),
       ('na', 'Natywny')

INSERT INTO [dict].[PoziomyUmiejetnosci] ([PoziomID], [Opis])
VALUES (1, 'Zaznajomiony'),
       (2, 'Zna podstawy'),
       (3, 'Potrafi zrobić własny projekt'),
       (4, 'Pracuje z tym od dłuższego czasu'),
       (5, 'Mistrzostwo')

INSERT INTO [dict].[StatusyPodan] ([StatusID], [Opis])
VALUES ('zlozono', 'Dopiero złożono'),
       ('odrzucono', 'Odrzucono w pierwszym etapie'),
       ('rozmowa_poz', 'Przyjęto po rozmowie'),
       ('rozmowa_neg', 'Odrzucono po rozmowie'),
       ('przyjeto', 'Przyjęto na praktyki')

INSERT INTO [dict].[Szkoly] ([SzkolaID], [Opis])
VALUES ('tech_inf', 'technikum informatyczne'),
       ('tech_tel', 'technikum teleinformatyczne'),
       ('tech_pro', 'technikum programistyczne'),
       ('tech_inn', 'inne technikum'),
       ('lic_mat', 'liceum matematyczne'),
       ('lic_inf', 'liceum informatyczne'),
       ('lic_inn', 'inne liceum')

INSERT INTO [dict].[TrybyStudiow] ([TrybID], [Opis])
VALUES ('S', 'Stacjonarne'),
       ('N', 'Niestacjonarne')


----- DODANIE PROCEDUR SKŁADOWANYCH -----

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- Procedury składowane dla INSERT, UPDATE

CREATE PROCEDURE dodanie_kandydata_cv_podania
    @KandydatID varchar(7),  -- 3 litery imienia + 3 litery nazwiska + 1, jeśli ID już istnieje
    @Imie nvarchar(50),
    @Nazwisko nvarchar(50),
    @Plec char(1),             -- 'K' lub 'M'
    @RokUrodzenia smallint,
    @TrybStudiow char(1),          -- 'S' lub 'N'
    -- DO TABELI CV ------------------------------------
    @Doswiadczenie varchar(8) = 'brak',      -- 'brak' lub 'posiada'
    @Edukacja varchar(8) = 'lic_inf',
    -- DO TABELI CV_JEZYKI OBCE
    @Polski char(2) = 'na',  -- 'na' jako native lub od A1 do C2 lub puste
    @Angielski char(2) = NULL,
    @Niemiecki char(2) = NULL,
    @Inny nvarchar(64) = NULL,
    -- DO TABELI CV_UMIEJĘTNOŚCI
    @Git tinyint = NULL,     -- od 1 do 5 lub puste
    @Linux tinyint = NULL,       
    @MachineLearning tinyint = NULL,
    @Bash tinyint = NULL,
    @JavaScript tinyint = NULL,
    @Python tinyint = NULL,
    @Java tinyint = NULL,
    @Kotlin tinyint = NULL,
    @PHP tinyint = NULL,
    @C# tinyint = NULL,
    @R tinyint = NULL,
    @Ruby tinyint = NULL,
    @C tinyint = NULL,
    @Cpp tinyint = NULL,
    @Matlab tinyint = NULL,
    @SQL_ tinyint = NULL,
    @HTML tinyint = NULL,
    @CSS tinyint = NULL,
    @Rust tinyint = NULL,
    @Perl tinyint = NULL,
    -- DO TABELI PODANIA
    @FirmaID varchar(16), --FK
    @Stan nvarchar(32) = 'zlozono' --FK do wyboru 'zlozono', 'odrzucono', 'przyjeto', 'rozmowa', 'rozmowa_neg'
AS
BEGIN -- start procedury

SET NOCOUNT ON;
---------------------------------------------------------------------------
DECLARE @FIRMA_CREATED bit = 0
IF NOT EXISTS(SELECT @FirmaID FROM dict.Firmy WHERE FirmaID = @FirmaID)
BEGIN
    EXEC dodaj_nowa_firme @FirmaID;
    SET @FIRMA_CREATED = 1
END


INSERT INTO Kandydaci(KandydatID, Imie, Nazwisko, Plec, RokUrodzenia, TrybStudiow)
VALUES (@KandydatID, @Imie, @Nazwisko, @Plec, @RokUrodzenia, @TrybStudiow)
PRINT 'Dodano kandydata od ID ' + @KandydatID + '.'

INSERT INTO CV (KandydatID, Doswiadczenie, Edukacja)
VALUES (@KandydatID, @Doswiadczenie, @Edukacja)

DECLARE @NoweCV_ID smallint;
SELECT @NoweCV_ID = CV_ID
FROM CV
WHERE KandydatID = @KandydatID;

INSERT INTO CV_JezykiObce (CV_ID, Polski, Angielski, Inny)
VALUES (@NoweCV_ID, @Polski, @Angielski, @Inny)

INSERT INTO CV_Umiejetnosci (CV_ID, Git, Linux, MachineLearning, Bash, JavaScript, Python, Java, Kotlin, PHP,
                C#, R, Ruby, C, Cpp, Matlab, SQL_, HTML, CSS, Rust, Perl)
VALUES (@NoweCV_ID, @Git, @Linux, @MachineLearning, @Bash, @JavaScript, @Python, @Java, @Kotlin, @PHP,
    @C#, @R, @Ruby, @C, @Cpp, @Matlab, @SQL_, @HTML, @CSS, @Rust, @Perl)
PRINT 'Dodano CV o ID ' + CAST(@NoweCV_ID AS VARCHAR)

INSERT INTO Podania (KandydatID, FirmaID, CV_ID, Stan)
VALUES (@KandydatID, @FirmaID, @NoweCV_ID, @Stan)
DECLARE @NowePodanieID smallint;
SELECT @NowePodanieID = PodanieID FROM Podania WHERE KandydatID = @KandydatID;
PRINT 'Dodano podanie o ID ' + CAST(@NowePodanieID AS VARCHAR)

------ DODAWANIE STATYSTYK ------

-- Kandydat jest świeżo dodany, więc trzeba dodać go również do StatystykKandydatów, wraz z
-- pierwszymi informacjami


INSERT INTO StatystykiKandydatow (KandydatID, Liczba_zlozonych_wnioskow, Odrzucenia, Rozmowy_rekrutacyjne, Przyjecia)
VALUES (@KandydatID,
    1,
    CASE WHEN (@Stan = 'odrzucono' OR @Stan = 'rozmowa_neg') THEN 1 ELSE 0 END,
    CASE WHEN (@Stan = 'rozmowa_neg' OR @Stan = 'rozmowa_poz') THEN 1 ELSE 0 END,
    CASE WHEN (@Stan = 'przyjeto' OR @Stan = 'rozmowa_poz') THEN 1 ELSE 0 END)
PRINT 'Statystyki kandydatów powiększone o kandydata ' + @KandydatID + '.'

-- Skoro zostało dodane nowe CV to trzeba dodać je też do Statystyk
INSERT INTO StatystykiCV (CV_ID, Liczba_zlozonych_CV, Odrzucenia, Rozmowy_rekrutacyjne, Przyjecia)
VALUES (@NoweCV_ID,
    1,
    CASE WHEN (@Stan = 'odrzucono' OR @Stan = 'rozmowa_neg') THEN 1 ELSE 0 END,
    CASE WHEN (@Stan = 'rozmowa_neg' OR @Stan = 'rozmowa_poz') THEN 1 ELSE 0 END,
    CASE WHEN (@Stan = 'przyjeto' OR @Stan = 'rozmowa_poz') THEN 1 ELSE 0 END)
PRINT 'Statystyki CV powiększone o CV o ID ' + CONVERT(varchar(10), @NoweCV_ID) + '.'

-- Jeśli w procesie została dodana nowa firma, to trzeba dodać ją do StatystykiFirmy
IF @FIRMA_CREATED = 1
BEGIN
    INSERT INTO StatystykiFirmy (FirmaID, Odrzucenia, Przyjecia)
    VALUES (@FirmaID,
        CASE WHEN (@Stan = 'odrzucono' OR @Stan = 'rozmowa_neg') THEN 1 ELSE 0 END,
        CASE WHEN (@Stan = 'przyjeto' OR @Stan = 'rozmowa_poz')THEN 1 ELSE 0 END)
    PRINT 'Statystyki firm powiększone o firmę ' + @FirmaID + '.'
END
ELSE
BEGIN -- Jeśli była dodana już wcześniej to po prostu ją aktualizujemy
    
    UPDATE StatystykiFirmy
    SET Odrzucenia = CASE WHEN @Stan IN ('odrzucono', 'rozmowa_neg') THEN Odrzucenia + 1 ELSE Odrzucenia END,
            Przyjecia = CASE WHEN @Stan IN ('przyjeto', 'rozmowa_poz') THEN Przyjecia + 1 ELSE Przyjecia END
    WHERE FirmaID = @FirmaID;
    PRINT 'Zaktualizowano statystyki firmy ' + @FirmaID + '.'
END

END -- koniec procedury

GO

CREATE PROCEDURE akt_statusu_podania
    @NOWY_STAN varchar(32) = 'zlozono',	-- może być 'zlozono', 'odrzucono', 'rozmowa', 'rozmowa_neg', 'przyjęto'
    @PodanieID smallint = 0,
    @Utworz bit = 0
AS
BEGIN -- start procedury
SET NOCOUNT ON;
    IF (@Utworz = 0) -- Jeśli aktualizujemy istniejące podanie, sprawdzamy czy rzeczywiście istnieje
		     -- i jeśli tak to je aktualizujemy 
    BEGIN
        -- Sprawdzenie, czy istnieje podanie o podanym identyfikatorze
        IF NOT EXISTS(SELECT 1 FROM Podania WHERE PodanieID = @PodanieID)
        BEGIN
            PRINT 'Nie znaleziono podania o identyfikatorze ' + CAST(@PodanieID AS VARCHAR) + '.'
            RETURN
        END
        ELSE 
        BEGIN
            -- Aktualizacja statusu podania w tabeli Podania
            UPDATE Podania SET Stan = @NOWY_STAN WHERE PodanieID = @PodanieID
	    PRINT 'Zaktualizowano status podania o identyfikatorze ' + CAST(@PodanieID AS VARCHAR) + ' na ' + @NOWY_STAN + '.'
        END
    END

EXECUTE [dbo].[akt_statystyk] @NOWY_STAN, @PodanieID;

END -- koniec procedury


GO

CREATE PROCEDURE akt_statystyk
    @NOWY_STAN varchar(32) = 'zlozono',	-- może być 'zlozono', 'odrzucono', 'rozmowa', 'rozmowa_neg', 'przyjęto'
    @PodanieID smallint = 0
AS
BEGIN -- start procedury
SET NOCOUNT ON;
-- Aktualizacja statystyk w tabelach StatystykiKandydatow, StatystykiCV i StatystykiFirmy
IF (@NOWY_STAN = 'odrzucono')
BEGIN
    -- Aktualizacja kolumny Odrzucenia w tabeli StatystykiKandydatow
    UPDATE StatystykiKandydatow SET Odrzucenia = Odrzucenia + 1 WHERE KandydatID = (SELECT KandydatID FROM Podania WHERE PodanieID = @PodanieID)
    
    -- Aktualizacja kolumny Odrzucenia w tabeli StatystykiCV
    UPDATE StatystykiCV SET Odrzucenia = Odrzucenia + 1 WHERE CV_ID = (SELECT CV_ID FROM Podania WHERE PodanieID = @PodanieID)
    
    -- Aktualizacja kolumny Odrzucenia w tabeli StatystykiFirmy
    UPDATE StatystykiFirmy SET Odrzucenia = Odrzucenia + 1 WHERE FirmaID = (SELECT FirmaID FROM Podania JOIN CV ON Podania.CV_ID = CV.CV_ID WHERE PodanieID = @PodanieID)

END
ELSE IF (@NOWY_STAN = 'przyjeto')
BEGIN
    -- Aktualizacja kolumny Przyjecia w tabeli StatystykiKandydatow
    UPDATE StatystykiKandydatow SET Przyjecia = Przyjecia + 1 WHERE KandydatID = (SELECT KandydatID FROM Podania WHERE PodanieID = @PodanieID)
    
    -- Aktualizacja kolumny Przyjecia w tabeli StatystykiCV
    UPDATE StatystykiCV SET Przyjecia = Przyjecia + 1 WHERE CV_ID = (SELECT CV_ID FROM Podania WHERE PodanieID = @PodanieID)
    
    -- Aktualizacja kolumny Przyjecia w tabeli StatystykiFirmy
    UPDATE StatystykiFirmy SET Przyjecia = Przyjecia + 1 WHERE FirmaID = (SELECT FirmaID FROM Podania JOIN CV ON Podania.CV_ID = CV.CV_ID WHERE PodanieID = @PodanieID)
END
ELSE IF (@NOWY_STAN = 'rozmowa_poz')
BEGIN
    -- Aktualizacja kolumny Rozmowy_rekrutacyjne w tabeli StatystykiKandydatow
    UPDATE StatystykiKandydatow SET Rozmowy_rekrutacyjne = Rozmowy_rekrutacyjne + 1 WHERE KandydatID = (SELECT KandydatID FROM Podania WHERE PodanieID = @PodanieID)

    -- Aktualizacja kolumny Rozmowy_rekrutacyjne w tabeli StatystykiCV
    UPDATE StatystykiCV SET Rozmowy_rekrutacyjne = Rozmowy_rekrutacyjne + 1 WHERE CV_ID = (SELECT CV_ID FROM Podania WHERE PodanieID = @PodanieID)

    -- Aktualizacja kolumny Przyjecia w tabeli StatystykiKandydatow
    UPDATE StatystykiKandydatow SET Przyjecia = Przyjecia + 1 WHERE KandydatID = (SELECT KandydatID FROM Podania WHERE PodanieID = @PodanieID)
    
    -- Aktualizacja kolumny Przyjecia w tabeli StatystykiCV
    UPDATE StatystykiCV SET Przyjecia = Przyjecia + 1 WHERE CV_ID = (SELECT CV_ID FROM Podania WHERE PodanieID = @PodanieID)
    
    -- Aktualizacja kolumny Przyjecia w tabeli StatystykiFirmy
    UPDATE StatystykiFirmy SET Przyjecia = Przyjecia + 1 WHERE FirmaID = (SELECT FirmaID FROM Podania JOIN CV ON Podania.CV_ID = CV.CV_ID WHERE PodanieID = @PodanieID)
END
ELSE IF (@NOWY_STAN = 'rozmowa_neg')
BEGIN
    -- Aktualizacja kolumny Rozmowy_rekrutacyjne w tabeli StatystykiKandydatow
    UPDATE StatystykiKandydatow SET Rozmowy_rekrutacyjne = Rozmowy_rekrutacyjne + 1 WHERE KandydatID = (SELECT KandydatID FROM Podania WHERE PodanieID = @PodanieID)

    -- Aktualizacja kolumny Rozmowy_rekrutacyjne w tabeli StatystykiCV
    UPDATE StatystykiCV SET Rozmowy_rekrutacyjne = Rozmowy_rekrutacyjne + 1 WHERE CV_ID = (SELECT CV_ID FROM Podania WHERE PodanieID = @PodanieID)

    -- Aktualizacja kolumny Odrzucenia w tabeli StatystykiKandydatow
    UPDATE StatystykiKandydatow SET Odrzucenia = Odrzucenia + 1 WHERE KandydatID = (SELECT KandydatID FROM Podania WHERE PodanieID = @PodanieID)
    
    -- Aktualizacja kolumny Odrzucenia w tabeli StatystykiCV
    UPDATE StatystykiCV SET Odrzucenia = Odrzucenia + 1 WHERE CV_ID = (SELECT CV_ID FROM Podania WHERE PodanieID = @PodanieID)
    
    -- Aktualizacja kolumny Odrzucenia w tabeli StatystykiFirmy
    UPDATE StatystykiFirmy SET Odrzucenia = Odrzucenia + 1 WHERE FirmaID = (SELECT FirmaID FROM Podania JOIN CV ON Podania.CV_ID = CV.CV_ID WHERE PodanieID = @PodanieID)
END
PRINT 'Zaktualizowano statystyki.'


END -- koniec procedury

GO

CREATE PROCEDURE dodaj_nowa_firme
    @FirmaID varchar(16)
AS
BEGIN -- start procedury
SET NOCOUNT ON;
	INSERT INTO dict.Firmy (FirmaID, Nazwa)
    	VALUES (@FirmaID, @FirmaID)
		PRINT 'Do tabeli Firmy dodano firmę ' + @FirmaID + '.'
END -- koniec procedury

GO

CREATE PROCEDURE dodanie_cv
    @KandydatID varchar(7),
    -- DO TABELI CV ------------------------------------
    @Doswiadczenie varchar(8) = 'brak',      -- 'brak' lub 'posiada'
    @Edukacja varchar(8),
    -- DO TABELI CV_JEZYKI OBCE
    @Polski char(2) = 'na',  -- 'na' jako native lub od A1 do C2 lub puste
    @Angielski char(2) = NULL,
    @Niemiecki char(2) = NULL,
    @Inny nvarchar(64) = NULL,
    -- DO TABELI CV_UMIEJĘTNOŚCI
    @Git tinyint = NULL,     -- od 1 do 5 lub puste
    @Linux tinyint = NULL,       
    @MachineLearning tinyint = NULL,
    @Bash tinyint = NULL,
    @JavaScript tinyint = NULL,
    @Python tinyint = NULL,
    @Java tinyint = NULL,
    @Kotlin tinyint = NULL,
    @PHP tinyint = NULL,
    @C# tinyint = NULL,
    @R tinyint = NULL,
    @Ruby tinyint = NULL,
    @C tinyint = NULL,
    @Cpp tinyint = NULL,
    @Matlab tinyint = NULL,
    @SQL_ tinyint = NULL,
    @HTML tinyint = NULL,
    @CSS tinyint = NULL,
    @Rust tinyint = NULL,
    @Perl tinyint = NULL
AS
BEGIN -- start procedury
SET NOCOUNT ON;
-- Sprawdzenie, czy kandydat istnieje
IF NOT EXISTS(SELECT * FROM Kandydaci WHERE KandydatID = @KandydatID)
BEGIN
    PRINT 'Kandydat o podanym ID nie istnieje'
    RETURN
END

-- Dodanie nowego CV
INSERT INTO CV (KandydatID, Doswiadczenie, Edukacja) VALUES (@KandydatID, @Doswiadczenie, @Edukacja)

DECLARE @NoweCV_ID smallint;
SELECT @NoweCV_ID = MAX(CV_ID) FROM CV WHERE KandydatID = @KandydatID;
--Dodaj nowe CV dla kandydata cz. 2 - detale
INSERT INTO CV_JezykiObce (CV_ID, Polski, Angielski, Inny)
VALUES (@NoweCV_ID, @Polski, @Angielski, @Inny)

INSERT INTO CV_Umiejetnosci (CV_ID, Git, Linux, MachineLearning, Bash, JavaScript, Python, Java, Kotlin, PHP, C#, R, Ruby, C, Cpp, Matlab, SQL_, HTML, CSS, Rust, Perl)
VALUES (@NoweCV_ID, @Git, @Linux, @MachineLearning, @Bash, @JavaScript, @Python, @Java, @Kotlin, @PHP,
		@C#, @R, @Ruby, @C, @Cpp, @Matlab, @SQL_, @HTML, @CSS, @Rust, @Perl)

-- Skoro zostało dodane nowe CV to trzeba dodać je też do Statystyk
INSERT INTO StatystykiCV (CV_ID, Liczba_zlozonych_CV, Odrzucenia, Rozmowy_rekrutacyjne, Przyjecia)
VALUES (@NoweCV_ID, 1, 0, 0, 0)
PRINT 'Statystyki CV powiększone o CV o ID ' + CONVERT(varchar(10), @NoweCV_ID) + '.'

PRINT 'Do kandydata ' + @KandydatID + ' zostało dodane CV o ID ' + CAST(@NoweCV_ID AS VARCHAR)

END -- koniec procedury

GO

CREATE PROCEDURE dodanie_kandydata
    @KandydatID varchar(7),  
    @Imie nvarchar(50),
    @Nazwisko nvarchar(50),
    @Plec char(1),             
    @RokUrodzenia smallint,
    @TrybStudiow char(1)    
AS
BEGIN -- start procedury
SET NOCOUNT ON;
---------------------------------------------------------------------------

INSERT INTO Kandydaci(KandydatID, Imie, Nazwisko, Plec, RokUrodzenia, TrybStudiow)
VALUES (@KandydatID, @Imie, @Nazwisko, @Plec, @RokUrodzenia, @TrybStudiow)

PRINT 'Dodano kandydata ' + @KandydatID + '.'

------ DODAWANIE STATYSTYK ------

-- Kandydat jest świeżo dodany, więc trzeba dodać go również do StatystykKandydatów, wraz z
-- pierwszymi informacjami


INSERT INTO StatystykiKandydatow (KandydatID, Liczba_zlozonych_wnioskow, Odrzucenia, Rozmowy_rekrutacyjne, Przyjecia)
VALUES (@KandydatID, 0, 0, 0, 0)
PRINT 'Statystyki kandydatów powiększone o kandydata ' + @KandydatID + '.'

END -- koniec procedury

GO

CREATE PROCEDURE dodanie_podania
    @CV_ID smallint,
    @FirmaID varchar(16),
    @NOWY_STAN varchar(32) = 'zlozono'	-- może być 'zlozono', 'odrzucono', 'rozmowa', 'rozmowa_neg', 'przyjęto'
AS
BEGIN -- start procedury

SET NOCOUNT ON;
-- Sprawdź, czy CV istnieje. Jeśli nie, to komunikat o błędzie.
IF NOT EXISTS (SELECT 1 FROM CV WHERE CV_ID = @CV_ID)
BEGIN
    RAISERROR('CV o podanym ID nie istnieje.', 16, 1)
    RETURN
END
ELSE BEGIN
-- Sprawdź, czy firma istnieje. Jeśli nie, to ją dodaj (też do statystyk).
IF NOT EXISTS (SELECT 1 FROM dict.Firmy WHERE FirmaID = @FirmaID)
BEGIN
    EXEC dodaj_nowa_firme @FirmaID;
    INSERT INTO StatystykiFirmy (FirmaID, Odrzucenia, Przyjecia)
    VALUES (@FirmaID,
        CASE WHEN (@NOWY_STAN = 'odrzucono' OR @NOWY_STAN = 'rozmowa_neg') THEN 1 ELSE 0 END,
        CASE WHEN (@NOWY_STAN = 'przyjeto' OR @NOWY_STAN = 'rozmowa_poz')THEN 1 ELSE 0 END)
    PRINT 'Statystyki firm powiększone o firmę ' + @FirmaID + '.'
END
ELSE BEGIN
	-- Pobierz KandydatID na podstawie CV_ID i dodaj nowe Podanie

	DECLARE @KandydatID varchar(7);

	SELECT @KandydatID = KandydatID FROM CV WHERE CV_ID = @CV_ID;

	INSERT INTO Podania (KandydatID, FirmaID, CV_ID, Stan)
	VALUES (@KandydatID, @FirmaID, @CV_ID, @NOWY_STAN)
	PRINT 'Do kandydata ' + @KandydatID + ' dodano nowe podanie.'


	----------- Zaktualizowanie statystyk poprzez wywołanie Aktualizacji Statusu Podania -------------
	EXECUTE [dbo].[akt_statusu_podania] @NOWY_STAN = @NOWY_STAN, @Utworz = 1;

END
END
END -- koniec procedury

GO

-- Procedury składowane DELETE

CREATE PROCEDURE usun_kandydata
    @KandydatID varchar(7)
AS
BEGIN
    SET NOCOUNT ON;
    
	BEGIN TRAN;
    BEGIN TRY

    -- Usuń statystyki Kandydata
    DELETE FROM StatystykiKandydata WHERE KandydatID = @KandydatID;
	PRINT 'Usunięto kandydata ' + @KandydatID + '.'

    -- Usuń Kandydata
    DELETE FROM Kandydaci WHERE KandydatID = @KandydatID;
    PRINT 'Usunięto statystyki kandydata ' + @KandydatID + '.'

	COMMIT;
    END TRY
    BEGIN CATCH
        ROLLBACK;
        THROW;
    END CATCH;

END
GO

CREATE PROCEDURE usun_cv_i_powiazane
    @CV_ID SMALLINT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRAN;

    BEGIN TRY
        -- usuwanie podań związanych z danym CV
        DELETE FROM Podania WHERE CV_ID = @CV_ID;
		PRINT 'Usunięto podania dla CV ' + @CV_ID + '.'

        -- usuwanie umiejętności związanych z danym CV
        DELETE FROM CV_Umiejetnosci WHERE CV_ID = @CV_ID;
		PRINT 'Usunięto podania dla CV ' + @CV_ID + '.'

        -- usuwanie języków obcych związanych z danym CV
        DELETE FROM CV_JezykiObce WHERE CV_ID = @CV_ID;

        -- usuwanie CV
        DELETE FROM CV WHERE CV_ID = @CV_ID;

        COMMIT;
    END TRY
    BEGIN CATCH
        ROLLBACK;
        THROW;
    END CATCH;
END

GO

--- Skrypty SELECT

-- Wyświetlanie pełnych informacji o kandydacie na podstawie tabeli Kandydaci oraz CV kandydata

CREATE PROCEDURE szukaj_kandydatow
    @KandydatIDs NVARCHAR(MAX)
AS
BEGIN
    SELECT k.KandydatID, k.Imie, k.Nazwisko, k.Plec, k.RokUrodzenia, t.Opis, s.Opis, c.Doswiadczenie, 
        j.Polski, j.Angielski, j.Niemiecki, j.Inny,
        u.Git, u.Linux, u.MachineLearning, u.Bash, u.JavaScript, u.Python, u.Java,
        u.Kotlin, u.PHP, u.C#, u.R, u.Ruby, u.C, u.Cpp, u.Matlab, u.SQL_, u.HTML,
        u.CSS, u.Rust, u.Perl
    FROM Kandydaci k
    JOIN CV c ON k.KandydatID = c.KandydatID
    JOIN dict.TrybyStudiow t ON k.TrybStudiow = t.TrybID 
    JOIN dict.Szkoly s ON c.Edukacja = s.SzkolaID
    JOIN CV_JezykiObce j ON c.CV_ID = j.CV_ID
    JOIN CV_Umiejetnosci u ON c.CV_ID = u.CV_ID
    WHERE k.KandydatID IN (SELECT value FROM STRING_SPLIT(@KandydatIDs, ','));
END

GO

----------Wyświetlanie Imienia i Nazwiska Kandydata wraz ze wszystkimi jego Podaniami

CREATE PROCEDURE pokaz_podania_kandydata
    @KandydatID varchar(7)
AS
BEGIN
    SELECT K.Imie, K.Nazwisko, P.*
    FROM Kandydaci K
    INNER JOIN Podania P ON K.KandydatID = P.KandydatID
    WHERE K.KandydatID = @KandydatID
    ORDER BY P.PodanieID DESC;
END

GO

CREATE PROCEDURE przyjmowane_cv_przez_firmy
    @Firma varchar(16)
AS
BEGIN
    SELECT DISTINCT K.Imie, K.Nazwisko, C.CV_ID, COALESCE(P.Stan, '') AS Stan,
        J.Polski, J.Angielski, J.Niemiecki, J.Inny,
        U.Git, U.Linux, U.MachineLearning, U.Bash, U.JavaScript, U.Python, U.Java,
        U.Kotlin, U.PHP, U.C#, U.R, U.Ruby, U.C, U.Cpp, U.Matlab, U.SQL_, U.HTML,
        U.CSS, U.Rust, U.Perl
    FROM Kandydaci K
    INNER JOIN CV C ON K.KandydatID = C.KandydatID
    LEFT JOIN Podania P ON C.CV_ID = P.CV_ID AND P.FirmaID = @Firma
    LEFT JOIN CV_JezykiObce J ON C.CV_ID = J.CV_ID
    LEFT JOIN CV_Umiejetnosci U ON C.CV_ID = U.CV_ID
    WHERE (P.Stan = 'przyjeto' OR P.Stan = 'rozmowa_poz') AND P.FirmaID = @Firma
    ORDER BY K.Nazwisko ASC
END

GO