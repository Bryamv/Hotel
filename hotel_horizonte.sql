/****** Object:  Database [hotel_horizonte] ******/
CREATE DATABASE [hotel_horizonte];
GO
USE [hotel_horizonte];
GO

/****** Object:  Table [dbo].[CuposDisponibles] ******/
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

/****** Object:  Table [dbo].[fechas_inactivas] ******/
CREATE TABLE [dbo].[fechas_inactivas](
	[id] [int] NOT NULL,
	[tipo] [varchar](50) NULL,
	[fecha_inicio] [date] NULL,
	[fecha_fin] [date] NULL,
	[descripcion] [text] NULL,
	PRIMARY KEY CLUSTERED ([id] ASC)
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
GO

/****** Object:  Table [dbo].[habitaciones] ******/
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

/****** Object:  Table [dbo].[reserva_compartida] ******/
CREATE TABLE [dbo].[reserva_compartida](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[numero_habitacion] [int] NULL,
	[codigo_reserva] [varchar](50) NULL,
	[correo] [varchar](100) NULL,
	[fecha_inicio] [date] NULL,
	[fecha_fin] [date] NULL,
	[desayuno] [bit] NULL,
	[almuerzo] [bit] NULL,
	[cena] [bit] NULL,
	[transporte] [bit] NULL,
	[parqueadero] [bit] NULL,
	[lavanderia] [bit] NULL,
	[guia] [bit] NULL,
	[menores] [bit] NULL,
	CONSTRAINT [PK_reserva_compartida] PRIMARY KEY CLUSTERED ([id] ASC)
) ON [PRIMARY];
GO

/****** Object:  Table [dbo].[reservas] ******/
CREATE TABLE [dbo].[reservas](
	[id_reserva] [int] IDENTITY(1,1) NOT NULL,
	[codigo_reserva] [varchar](100) NULL,
	[correo] [varchar](100) NULL,
	[id_habitacion] [int] NULL,
	[fecha_inicio] [date] NULL,
	[fecha_fin] [date] NULL,
	[num_personas] [int] NULL,
	[desayuno] [bit] NULL,
	[almuerzo] [bit] NULL,
	[cena] [bit] NULL,
	[transporte] [bit] NULL,
	[parqueadero] [bit] NULL,
	[lavanderia] [bit] NULL,
	[guia] [bit] NULL,
	[menores] [bit] NULL,
	CONSTRAINT [PK__reservas__423CBE5D8F69824F] PRIMARY KEY CLUSTERED ([id_reserva] ASC)
) ON [PRIMARY];
GO

ALTER TABLE [dbo].[reserva_compartida] ADD CONSTRAINT [FK_reserva_compartida_habitaciones] FOREIGN KEY([numero_habitacion]) REFERENCES [dbo].[habitaciones] ([id]);
GO

ALTER TABLE [dbo].[reservas] ADD CONSTRAINT [FK_id_habitaciones] FOREIGN KEY([id_habitacion]) REFERENCES [dbo].[habitaciones] ([id]);
GO
SET IDENTITY_INSERT [dbo].[habitaciones] ON 

INSERT [dbo].[habitaciones] ([id], [numero_habitacion], [tipo], [acomodacion], [camas_disponibles], [price], [descripcion]) VALUES (21, 101, N'Ordinaria', N'Cama doble', 1, CAST(100.00 AS Decimal(10, 2)), N'Habitación acogedora con vista al jardín')
INSERT [dbo].[habitaciones] ([id], [numero_habitacion], [tipo], [acomodacion], [camas_disponibles], [price], [descripcion]) VALUES (22, 202, N'Ordinaria', N'Cama doble', 1, CAST(100.00 AS Decimal(10, 2)), N'Habitación amplia con balcón privado')
INSERT [dbo].[habitaciones] ([id], [numero_habitacion], [tipo], [acomodacion], [camas_disponibles], [price], [descripcion]) VALUES (23, 505, N'Ordinaria', N'Cama doble', 1, CAST(100.00 AS Decimal(10, 2)), N'Habitación luminosa con escritorio')
INSERT [dbo].[habitaciones] ([id], [numero_habitacion], [tipo], [acomodacion], [camas_disponibles], [price], [descripcion]) VALUES (24, 703, N'Ordinaria', N'Cama doble', 1, CAST(100.00 AS Decimal(10, 2)), N'Habitación con baño privado y amenities')
INSERT [dbo].[habitaciones] ([id], [numero_habitacion], [tipo], [acomodacion], [camas_disponibles], [price], [descripcion]) VALUES (25, 405, N'Ordinaria', N'Cama doble', 1, CAST(100.00 AS Decimal(10, 2)), N'Habitación con minibar y servicio a la habitación')
INSERT [dbo].[habitaciones] ([id], [numero_habitacion], [tipo], [acomodacion], [camas_disponibles], [price], [descripcion]) VALUES (26, 201, N'Ordinaria', N'Cama doble', 1, CAST(100.00 AS Decimal(10, 2)), N'Habitación con TV de pantalla plana y canales por cable')
INSERT [dbo].[habitaciones] ([id], [numero_habitacion], [tipo], [acomodacion], [camas_disponibles], [price], [descripcion]) VALUES (27, 602, N'Ordinaria', N'Cama doble', 1, CAST(100.00 AS Decimal(10, 2)), N'Habitación con acceso a Internet de alta velocidad')
INSERT [dbo].[habitaciones] ([id], [numero_habitacion], [tipo], [acomodacion], [camas_disponibles], [price], [descripcion]) VALUES (28, 503, N'Ordinaria', N'Cama doble', 1, CAST(100.00 AS Decimal(10, 2)), N'Habitación con aire acondicionado y calefacción')
INSERT [dbo].[habitaciones] ([id], [numero_habitacion], [tipo], [acomodacion], [camas_disponibles], [price], [descripcion]) VALUES (29, 402, N'Ordinaria', N'Cama doble', 1, CAST(100.00 AS Decimal(10, 2)), N'Habitación con servicio de limpieza diario')
INSERT [dbo].[habitaciones] ([id], [numero_habitacion], [tipo], [acomodacion], [camas_disponibles], [price], [descripcion]) VALUES (30, 501, N'Ordinaria', N'Cama doble', 1, CAST(100.00 AS Decimal(10, 2)), N'Habitación con armario y espacio de almacenamiento')
INSERT [dbo].[habitaciones] ([id], [numero_habitacion], [tipo], [acomodacion], [camas_disponibles], [price], [descripcion]) VALUES (31, 303, N'Ordinaria', N'Cama doble', 1, CAST(100.00 AS Decimal(10, 2)), N'Habitación con bañera de hidromasaje')
INSERT [dbo].[habitaciones] ([id], [numero_habitacion], [tipo], [acomodacion], [camas_disponibles], [price], [descripcion]) VALUES (32, 702, N'Ordinaria', N'Cama doble', 1, CAST(100.00 AS Decimal(10, 2)), N'Habitación con vistas panorámicas a la ciudad')
INSERT [dbo].[habitaciones] ([id], [numero_habitacion], [tipo], [acomodacion], [camas_disponibles], [price], [descripcion]) VALUES (33, 903, N'Ordinaria', N'Cama doble', 1, CAST(100.00 AS Decimal(10, 2)), N'Habitación con vistas al mar')
INSERT [dbo].[habitaciones] ([id], [numero_habitacion], [tipo], [acomodacion], [camas_disponibles], [price], [descripcion]) VALUES (34, 404, N'Ordinaria', N'Cama doble', 1, CAST(100.00 AS Decimal(10, 2)), N'Habitación con terraza privada')
INSERT [dbo].[habitaciones] ([id], [numero_habitacion], [tipo], [acomodacion], [camas_disponibles], [price], [descripcion]) VALUES (35, 601, N'Ordinaria', N'Cama doble', 1, CAST(100.00 AS Decimal(10, 2)), N'Habitación con acceso para personas con movilidad reducida')
INSERT [dbo].[habitaciones] ([id], [numero_habitacion], [tipo], [acomodacion], [camas_disponibles], [price], [descripcion]) VALUES (36, 203, N'Ordinaria', N'Cama sencilla', 1, CAST(60.00 AS Decimal(10, 2)), N'Habitación acogedora con escritorio')
INSERT [dbo].[habitaciones] ([id], [numero_habitacion], [tipo], [acomodacion], [camas_disponibles], [price], [descripcion]) VALUES (37, 204, N'Ordinaria', N'Cama sencilla', 1, CAST(60.00 AS Decimal(10, 2)), N'Habitación con vistas al jardín')
INSERT [dbo].[habitaciones] ([id], [numero_habitacion], [tipo], [acomodacion], [camas_disponibles], [price], [descripcion]) VALUES (38, 205, N'Ordinaria', N'Cama sencilla', 1, CAST(60.00 AS Decimal(10, 2)), N'Habitación con minibar y servicio a la habitación')
INSERT [dbo].[habitaciones] ([id], [numero_habitacion], [tipo], [acomodacion], [camas_disponibles], [price], [descripcion]) VALUES (39, 206, N'Ordinaria', N'Cama sencilla', 1, CAST(60.00 AS Decimal(10, 2)), N'Habitación con acceso a Internet')
INSERT [dbo].[habitaciones] ([id], [numero_habitacion], [tipo], [acomodacion], [camas_disponibles], [price], [descripcion]) VALUES (40, 207, N'Ordinaria', N'Cama sencilla', 1, CAST(60.00 AS Decimal(10, 2)), N'Habitación con aire acondicionado')
INSERT [dbo].[habitaciones] ([id], [numero_habitacion], [tipo], [acomodacion], [camas_disponibles], [price], [descripcion]) VALUES (41, 208, N'Ordinaria', N'Cama sencilla', 1, CAST(60.00 AS Decimal(10, 2)), N'Habitación con servicio de limpieza diario')
INSERT [dbo].[habitaciones] ([id], [numero_habitacion], [tipo], [acomodacion], [camas_disponibles], [price], [descripcion]) VALUES (42, 209, N'Ordinaria', N'Cama sencilla', 1, CAST(60.00 AS Decimal(10, 2)), N'Habitación con armario y espacio de almacenamiento')
INSERT [dbo].[habitaciones] ([id], [numero_habitacion], [tipo], [acomodacion], [camas_disponibles], [price], [descripcion]) VALUES (43, 210, N'Ordinaria', N'Cama sencilla', 1, CAST(60.00 AS Decimal(10, 2)), N'Habitación con bañera')
INSERT [dbo].[habitaciones] ([id], [numero_habitacion], [tipo], [acomodacion], [camas_disponibles], [price], [descripcion]) VALUES (44, 211, N'Ordinaria', N'Cama sencilla', 1, CAST(60.00 AS Decimal(10, 2)), N'Habitación con vistas panorámicas')
INSERT [dbo].[habitaciones] ([id], [numero_habitacion], [tipo], [acomodacion], [camas_disponibles], [price], [descripcion]) VALUES (45, 212, N'Ordinaria', N'Cama sencilla', 1, CAST(60.00 AS Decimal(10, 2)), N'Habitación con acceso para personas con movilidad reducida')
INSERT [dbo].[habitaciones] ([id], [numero_habitacion], [tipo], [acomodacion], [camas_disponibles], [price], [descripcion]) VALUES (46, 213, N'Ordinaria', N'Cama sencilla', 1, CAST(60.00 AS Decimal(10, 2)), N'Habitación con balcón privado')
INSERT [dbo].[habitaciones] ([id], [numero_habitacion], [tipo], [acomodacion], [camas_disponibles], [price], [descripcion]) VALUES (47, 214, N'Ordinaria', N'Cama sencilla', 1, CAST(60.00 AS Decimal(10, 2)), N'Habitación con TV y canales por cable')
INSERT [dbo].[habitaciones] ([id], [numero_habitacion], [tipo], [acomodacion], [camas_disponibles], [price], [descripcion]) VALUES (48, 215, N'Ordinaria', N'Cama sencilla', 1, CAST(60.00 AS Decimal(10, 2)), N'Habitación con baño privado y amenities')
INSERT [dbo].[habitaciones] ([id], [numero_habitacion], [tipo], [acomodacion], [camas_disponibles], [price], [descripcion]) VALUES (49, 216, N'Ordinaria', N'Cama sencilla', 1, CAST(60.00 AS Decimal(10, 2)), N'Habitación con minibar y vistas al mar')
INSERT [dbo].[habitaciones] ([id], [numero_habitacion], [tipo], [acomodacion], [camas_disponibles], [price], [descripcion]) VALUES (50, 217, N'Ordinaria', N'Cama sencilla', 1, CAST(60.00 AS Decimal(10, 2)), N'Habitación con acceso a gimnasio y piscina')
INSERT [dbo].[habitaciones] ([id], [numero_habitacion], [tipo], [acomodacion], [camas_disponibles], [price], [descripcion]) VALUES (51, 301, N'Uso compartido', N'Cama sencilla', 1, CAST(40.00 AS Decimal(10, 2)), N'Habitación compartida con taquillas individuales')
INSERT [dbo].[habitaciones] ([id], [numero_habitacion], [tipo], [acomodacion], [camas_disponibles], [price], [descripcion]) VALUES (52, 302, N'Uso compartido', N'Cama sencilla', 1, CAST(40.00 AS Decimal(10, 2)), N'Habitación compartida con área de descanso')
INSERT [dbo].[habitaciones] ([id], [numero_habitacion], [tipo], [acomodacion], [camas_disponibles], [price], [descripcion]) VALUES (53, 803, N'Uso compartido', N'Cama sencilla', 1, CAST(40.00 AS Decimal(10, 2)), N'Habitación compartida con cocina común')
INSERT [dbo].[habitaciones] ([id], [numero_habitacion], [tipo], [acomodacion], [camas_disponibles], [price], [descripcion]) VALUES (54, 304, N'Uso compartido', N'Cama sencilla', 1, CAST(40.00 AS Decimal(10, 2)), N'Habitación compartida con zona de trabajo')
INSERT [dbo].[habitaciones] ([id], [numero_habitacion], [tipo], [acomodacion], [camas_disponibles], [price], [descripcion]) VALUES (55, 305, N'Uso compartido', N'Cama sencilla', 1, CAST(40.00 AS Decimal(10, 2)), N'Habitación compartida con baños compartidos')
INSERT [dbo].[habitaciones] ([id], [numero_habitacion], [tipo], [acomodacion], [camas_disponibles], [price], [descripcion]) VALUES (56, 306, N'Uso compartido', N'Cama sencilla', 1, CAST(40.00 AS Decimal(10, 2)), N'Habitación compartida con área de recreación')
INSERT [dbo].[habitaciones] ([id], [numero_habitacion], [tipo], [acomodacion], [camas_disponibles], [price], [descripcion]) VALUES (57, 307, N'Uso compartido', N'Cama sencilla', 1, CAST(40.00 AS Decimal(10, 2)), N'Habitación compartida con vistas panorámicas')
INSERT [dbo].[habitaciones] ([id], [numero_habitacion], [tipo], [acomodacion], [camas_disponibles], [price], [descripcion]) VALUES (58, 308, N'Uso compartido', N'Cama sencilla', 1, CAST(40.00 AS Decimal(10, 2)), N'Habitación compartida con servicio de limpieza')
INSERT [dbo].[habitaciones] ([id], [numero_habitacion], [tipo], [acomodacion], [camas_disponibles], [price], [descripcion]) VALUES (59, 309, N'Uso compartido', N'Cama sencilla', 1, CAST(40.00 AS Decimal(10, 2)), N'Habitación compartida con conexión Wi-Fi')
INSERT [dbo].[habitaciones] ([id], [numero_habitacion], [tipo], [acomodacion], [camas_disponibles], [price], [descripcion]) VALUES (60, 310, N'Uso compartido', N'Cama sencilla', 1, CAST(40.00 AS Decimal(10, 2)), N'Habitación compartida con armarios individuales')
SET IDENTITY_INSERT [dbo].[habitaciones] OFF
GO
