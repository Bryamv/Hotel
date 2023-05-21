/****** Object: Database [hotel_horizonte] ******/
CREATE DATABASE [hotel_horizonte];
GO
USE [hotel_horizonte];
GO

/****** Object: Table [dbo].[CuposDisponibles] ******/
CREATE TABLE [dbo].[CuposDisponibles](
	[ID] [int] NOT NULL,
	[Fecha] [date] NULL,
	[guia] [int] NULL,
	[Desayuno] [int] NULL,
	[Almuerzo] [int] NULL,
	[Cena] [int] NULL,
	[Transporte] [int] NULL,
	[Lavanderia] [int] NULL,
	[Parqueadero] [int] NULL,
	PRIMARY KEY CLUSTERED ([ID] ASC)
) ON [PRIMARY];
GO

/****** Object: Table [dbo].[fechas_inactivas] ******/
CREATE TABLE [dbo].[fechas_inactivas](
	[id] [int] NOT NULL,
	[tipo] [varchar](50) NULL,
	[fecha_inicio] [date] NULL,
	[fecha_fin] [date] NULL,
	[descripcion] [text] NULL,
	PRIMARY KEY CLUSTERED ([id] ASC)
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
GO

/****** Object: Table [dbo].[habitaciones] ******/
CREATE TABLE [dbo].[habitaciones](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[numero_habitacion] [int] NULL,
	[tipo] [varchar](50) NULL,
	[acomodacion] [varchar](50) NULL,
	[camas_disponibles] [int] NULL,
	[price] [decimal](10, 2) NULL,
	[descripcion] [varchar](255) NULL,
	CONSTRAINT [PK__habitaci__3213E83FA0CABCC0] PRIMARY KEY CLUSTERED ([id] ASC)
) ON [PRIMARY];
GO

/****** Object: Table [dbo].[reserva_compartida] ******/
CREATE TABLE [dbo].[reserva_compartida](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[numero_habitacion] [int] NULL,
	[codigo_reserva] [varchar](50) NULL,
	[id_cliente] [int] NULL,
	[fecha_inicio] [datetime] NULL,
	[fecha_fin] [datetime] NULL,
	[desayuno] [bit] NULL,
	[almuerzo] [bit] NULL,
	[cena] [bit] NULL,
	[transporte] [bit] NULL,
	[parqueadero] [bit] NULL,
	[lavanderia] [bit] NULL,
	[guia] [bit] NULL,
	[descipcion] [varchar](50) NULL,
	CONSTRAINT [PK_reserva_compartida] PRIMARY KEY CLUSTERED ([id] ASC)
) ON [PRIMARY];
GO

/****** Object: Table [dbo].[reservas] ******/
CREATE TABLE [dbo].[reservas](
	[id_reserva] [int] IDENTITY(1,1) NOT NULL,
	[codigo_reserva] [varchar](100) NULL,
	[id_cliente] [int] NULL,
	[id_habitacion] [int] NULL,
	[fecha_inicio] [datetime] NULL,
	[fecha_fin] [datetime] NULL,
	[num_personas] [int] NULL,
	[desayuno] [bit] NULL,
	[almuerzo] [bit] NULL,
	[cena] [bit] NULL,
	[transporte] [bit] NULL,
	[parqueadero] [bit] NULL,
	[lavanderia] [bit] NULL,
	[guia] [bit] NULL,
	[descripcion] [text] NULL,
	CONSTRAINT [PK__reservas__423CBE5D8F69824F] PRIMARY KEY CLUSTERED ([id_reserva] ASC)
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
GO

ALTER TABLE [dbo].[reserva_compartida] ADD CONSTRAINT [FK_reserva_compartida_habitaciones] FOREIGN KEY([numero_habitacion]) REFERENCES [dbo].[habitaciones] ([id]);
GO

ALTER TABLE [dbo].[reservas] ADD CONSTRAINT [FK_id_habitaciones] FOREIGN KEY([id_habitacion]) REFERENCES [dbo].[habitaciones] ([id]);
GO
