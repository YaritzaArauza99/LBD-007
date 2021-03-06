USE [CentralYAAG]
GO
/****** Object:  Table [dbo].[BoletoAutobus]    Script Date: 27/10/2018 01:33:28 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BoletoAutobus](
	[iIdVenta] [int] NOT NULL,
	[dFecha] [date] NOT NULL,
	[iIdViaje] [int] NOT NULL,
	[tAsiento] [tinyint] NOT NULL,
	[iCostoBoleto] [int] NOT NULL,
	[iIdEmpleado] [int] NOT NULL,
 CONSTRAINT [PK_BoletoAutobus] PRIMARY KEY CLUSTERED 
(
	[iCostoBoleto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CostoBoleto]    Script Date: 27/10/2018 01:33:28 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CostoBoleto](
	[iCostoBoleto] [int] NOT NULL,
	[tTipoBoleto] [tinyint] NOT NULL,
 CONSTRAINT [PK_CostoBoleto] PRIMARY KEY CLUSTERED 
(
	[iCostoBoleto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 27/10/2018 01:33:28 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Empleado](
	[iIdEmpleado] [int] NOT NULL,
	[vNombre] [varchar](100) NOT NULL,
	[vApellido] [varchar](100) NOT NULL,
	[cTipoEmpleado] [char](10) NOT NULL,
 CONSTRAINT [PK_Empleado] PRIMARY KEY CLUSTERED 
(
	[iIdEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoBoleto]    Script Date: 27/10/2018 01:33:28 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoBoleto](
	[iCostoBoleto] [int] NOT NULL,
	[cBoletoNiño] [char](10) NOT NULL,
	[cBoletoEstudiante] [char](10) NOT NULL,
	[cBoletoAdulto] [char](10) NOT NULL,
	[cBoletoAdultoMayor] [char](10) NOT NULL,
 CONSTRAINT [PK_TipoBoleto] PRIMARY KEY CLUSTERED 
(
	[iCostoBoleto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoEmpleado]    Script Date: 27/10/2018 01:33:28 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoEmpleado](
	[iIdEmpleado] [int] NOT NULL,
	[cChofer] [char](10) NOT NULL,
	[cVendedorMostrador] [char](10) NOT NULL,
	[cMantenimiento] [char](10) NOT NULL,
	[cMecanico] [char](10) NOT NULL,
	[cLimpieza] [char](10) NOT NULL,
 CONSTRAINT [PK_TipoEmpleado] PRIMARY KEY CLUSTERED 
(
	[iIdEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[BoletoAutobus]  WITH CHECK ADD  CONSTRAINT [FK_BoletoAutobus_TipoEmpleado] FOREIGN KEY([iIdEmpleado])
REFERENCES [dbo].[TipoEmpleado] ([iIdEmpleado])
GO
ALTER TABLE [dbo].[BoletoAutobus] CHECK CONSTRAINT [FK_BoletoAutobus_TipoEmpleado]
GO
ALTER TABLE [dbo].[CostoBoleto]  WITH CHECK ADD  CONSTRAINT [FK_CostoBoleto_BoletoAutobus] FOREIGN KEY([iCostoBoleto])
REFERENCES [dbo].[BoletoAutobus] ([iCostoBoleto])
GO
ALTER TABLE [dbo].[CostoBoleto] CHECK CONSTRAINT [FK_CostoBoleto_BoletoAutobus]
GO
ALTER TABLE [dbo].[CostoBoleto]  WITH CHECK ADD  CONSTRAINT [FK_CostoBoleto_TipoBoleto] FOREIGN KEY([iCostoBoleto])
REFERENCES [dbo].[TipoBoleto] ([iCostoBoleto])
GO
ALTER TABLE [dbo].[CostoBoleto] CHECK CONSTRAINT [FK_CostoBoleto_TipoBoleto]
GO
ALTER TABLE [dbo].[TipoBoleto]  WITH CHECK ADD  CONSTRAINT [FK_TipoBoleto_BoletoAutobus] FOREIGN KEY([iCostoBoleto])
REFERENCES [dbo].[BoletoAutobus] ([iCostoBoleto])
GO
ALTER TABLE [dbo].[TipoBoleto] CHECK CONSTRAINT [FK_TipoBoleto_BoletoAutobus]
GO
ALTER TABLE [dbo].[TipoEmpleado]  WITH CHECK ADD  CONSTRAINT [FK_TipoEmpleado_Empleado] FOREIGN KEY([iIdEmpleado])
REFERENCES [dbo].[Empleado] ([iIdEmpleado])
GO
ALTER TABLE [dbo].[TipoEmpleado] CHECK CONSTRAINT [FK_TipoEmpleado_Empleado]
GO
