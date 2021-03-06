USE [master]
GO
/****** Object:  Database [DealerShip]    Script Date: 4/11/2018 6:21:17 PM ******/
CREATE DATABASE [DealerShip]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DealerShip', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\DealerShip.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DealerShip_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\DealerShip_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DealerShip] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DealerShip].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DealerShip] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DealerShip] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DealerShip] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DealerShip] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DealerShip] SET ARITHABORT OFF 
GO
ALTER DATABASE [DealerShip] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DealerShip] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DealerShip] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DealerShip] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DealerShip] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DealerShip] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DealerShip] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DealerShip] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DealerShip] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DealerShip] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DealerShip] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DealerShip] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DealerShip] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DealerShip] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DealerShip] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DealerShip] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DealerShip] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DealerShip] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DealerShip] SET  MULTI_USER 
GO
ALTER DATABASE [DealerShip] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DealerShip] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DealerShip] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DealerShip] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DealerShip] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DealerShip] SET QUERY_STORE = OFF
GO
USE [DealerShip]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [DealerShip]
GO
/****** Object:  Table [dbo].[CarData]    Script Date: 4/11/2018 6:21:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarData](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Make] [nvarchar](50) NOT NULL,
	[Model] [nvarchar](50) NOT NULL,
	[Year] [int] NOT NULL,
 CONSTRAINT [PK_CarData] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cars]    Script Date: 4/11/2018 6:21:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cars](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Color] [nvarchar](50) NOT NULL,
	[VinNumber] [nvarchar](50) NOT NULL,
	[DateAddedToLot] [date] NOT NULL,
	[AvailableForLease] [bit] NOT NULL,
	[MilesDriven] [int] NOT NULL,
	[CarDataID] [int] NULL,
 CONSTRAINT [PK_Cars] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 4/11/2018 6:21:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[PhoneNumber] [nvarchar](50) NOT NULL,
	[FavoredCustomer] [bit] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LeaseAgreement]    Script Date: 4/11/2018 6:21:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeaseAgreement](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LeaseID] [int] NULL,
	[CustomerID] [int] NULL,
 CONSTRAINT [PK_Contract] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Leases]    Script Date: 4/11/2018 6:21:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Leases](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ExpirationDate] [date] NOT NULL,
	[TotalCost] [decimal](18, 2) NOT NULL,
	[UpFrontCost] [decimal](18, 2) NOT NULL,
	[CostPerMonth] [decimal](18, 2) NOT NULL,
	[CarID] [int] NULL,
 CONSTRAINT [PK_Leases] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cars]  WITH CHECK ADD  CONSTRAINT [FK_Cars_CarData] FOREIGN KEY([CarDataID])
REFERENCES [dbo].[CarData] ([ID])
GO
ALTER TABLE [dbo].[Cars] CHECK CONSTRAINT [FK_Cars_CarData]
GO
ALTER TABLE [dbo].[Leases]  WITH CHECK ADD  CONSTRAINT [FK_Leases_Cars] FOREIGN KEY([CarID])
REFERENCES [dbo].[Cars] ([ID])
GO
ALTER TABLE [dbo].[Leases] CHECK CONSTRAINT [FK_Leases_Cars]
GO
USE [master]
GO
ALTER DATABASE [DealerShip] SET  READ_WRITE 
GO
