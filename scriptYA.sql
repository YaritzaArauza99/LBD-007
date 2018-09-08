USE [YaritzaArauza]
GO
/****** Object:  Table [dbo].[Autobuses]    Script Date: 08/09/2018 09:31:45 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Autobuses](
	[IdCamion] [int] NOT NULL,
	[Capacidad] [int] NOT NULL,
	[NomChofer] [varchar](50) NOT NULL,
	[HoraSalida] [time](7) NOT NULL,
	[Destino] [varchar](50) NOT NULL,
	[LineaAutobuses] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Autobuses] PRIMARY KEY CLUSTERED 
(
	[IdCamion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Boleto]    Script Date: 08/09/2018 09:31:45 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Boleto](
	[Folio] [int] NOT NULL,
	[NumAsiento] [tinyint] NOT NULL,
	[Fecha] [date] NOT NULL,
	[Destino] [nchar](50) NOT NULL,
	[Origen] [varchar](50) NOT NULL,
	[NomPasajero] [varchar](50) NOT NULL,
	[Precio] [float] NOT NULL,
	[LineaAutobuses] [nchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Camion]    Script Date: 08/09/2018 09:31:45 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Camion](
	[IdCamion] [int] NOT NULL,
	[Destino] [varchar](50) NOT NULL,
	[NomChofer] [varchar](50) NOT NULL,
	[IdChofer] [int] NOT NULL,
	[LineaAutobuses] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Camion] PRIMARY KEY CLUSTERED 
(
	[IdCamion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Chofer]    Script Date: 08/09/2018 09:31:45 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chofer](
	[NomChofer] [varchar](50) NOT NULL,
	[IdChofer] [int] NOT NULL,
	[LineaAutobuses] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Chofer] PRIMARY KEY CLUSTERED 
(
	[IdChofer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pasajero]    Script Date: 08/09/2018 09:31:45 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pasajero](
	[NomPasajero] [varchar](50) NOT NULL,
	[Edad] [int] NOT NULL,
	[Correo] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Pasajero] PRIMARY KEY CLUSTERED 
(
	[NomPasajero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
