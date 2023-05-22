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
INSERT INTO fechas_inactivas (id, tipo, fecha_inicio, fecha_fin, descripcion)
VALUES (1, 'Paro_Armado', '2023-07-10', '2023-07-25', 'La guerilla de Colombia haciendo de las suyas');
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
SET IDENTITY_INSERT [dbo].[CuposDisponibles] ON 
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (1, CAST(N'2023-05-20' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (2, CAST(N'2023-05-21' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (3, CAST(N'2023-05-22' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (4, CAST(N'2023-05-23' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (5, CAST(N'2023-05-24' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (6, CAST(N'2023-05-25' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (7, CAST(N'2023-05-26' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (8, CAST(N'2023-05-27' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (9, CAST(N'2023-05-28' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (10, CAST(N'2023-05-29' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (11, CAST(N'2023-05-30' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (12, CAST(N'2023-05-31' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (13, CAST(N'2023-06-01' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (14, CAST(N'2023-06-02' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (15, CAST(N'2023-06-03' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (16, CAST(N'2023-06-04' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (17, CAST(N'2023-06-05' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (18, CAST(N'2023-06-06' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (19, CAST(N'2023-06-07' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (20, CAST(N'2023-06-08' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (21, CAST(N'2023-06-09' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (22, CAST(N'2023-06-10' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (23, CAST(N'2023-06-11' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (24, CAST(N'2023-06-12' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (25, CAST(N'2023-06-13' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (26, CAST(N'2023-06-14' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (27, CAST(N'2023-06-15' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (28, CAST(N'2023-06-16' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (29, CAST(N'2023-06-17' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (30, CAST(N'2023-06-18' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (31, CAST(N'2023-06-19' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (32, CAST(N'2023-06-20' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (33, CAST(N'2023-06-21' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (34, CAST(N'2023-06-22' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (35, CAST(N'2023-06-23' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (36, CAST(N'2023-06-24' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (37, CAST(N'2023-06-25' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (38, CAST(N'2023-06-26' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (39, CAST(N'2023-06-27' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (40, CAST(N'2023-06-28' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (41, CAST(N'2023-06-29' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (42, CAST(N'2023-06-30' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (43, CAST(N'2023-07-01' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (44, CAST(N'2023-07-02' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (45, CAST(N'2023-07-03' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (46, CAST(N'2023-07-04' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (47, CAST(N'2023-07-05' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (48, CAST(N'2023-07-06' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (49, CAST(N'2023-07-07' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (50, CAST(N'2023-07-08' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (51, CAST(N'2023-07-09' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (52, CAST(N'2023-07-10' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (53, CAST(N'2023-07-11' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (54, CAST(N'2023-07-12' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (55, CAST(N'2023-07-13' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (56, CAST(N'2023-07-14' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (57, CAST(N'2023-07-15' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (58, CAST(N'2023-07-16' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (59, CAST(N'2023-07-17' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (60, CAST(N'2023-07-18' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (61, CAST(N'2023-07-19' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (62, CAST(N'2023-07-20' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (63, CAST(N'2023-07-21' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (64, CAST(N'2023-07-22' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (65, CAST(N'2023-07-23' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (66, CAST(N'2023-07-24' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (67, CAST(N'2023-07-25' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (68, CAST(N'2023-07-26' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (69, CAST(N'2023-07-27' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (70, CAST(N'2023-07-28' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (71, CAST(N'2023-07-29' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (72, CAST(N'2023-07-30' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (73, CAST(N'2023-07-31' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (74, CAST(N'2023-08-01' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (75, CAST(N'2023-08-02' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (76, CAST(N'2023-08-03' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (77, CAST(N'2023-08-04' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (78, CAST(N'2023-08-05' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (79, CAST(N'2023-08-06' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (80, CAST(N'2023-08-07' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (81, CAST(N'2023-08-08' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (82, CAST(N'2023-08-09' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (83, CAST(N'2023-08-10' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (84, CAST(N'2023-08-11' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (85, CAST(N'2023-08-12' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (86, CAST(N'2023-08-13' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (87, CAST(N'2023-08-14' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (88, CAST(N'2023-08-15' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (89, CAST(N'2023-08-16' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (90, CAST(N'2023-08-17' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (91, CAST(N'2023-08-18' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (92, CAST(N'2023-08-19' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (93, CAST(N'2023-08-20' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (94, CAST(N'2023-08-21' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (95, CAST(N'2023-08-22' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (96, CAST(N'2023-08-23' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (97, CAST(N'2023-08-24' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (98, CAST(N'2023-08-25' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (99, CAST(N'2023-08-26' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (100, CAST(N'2023-08-27' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (101, CAST(N'2023-08-28' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (102, CAST(N'2023-08-29' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (103, CAST(N'2023-08-30' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (104, CAST(N'2023-08-31' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (105, CAST(N'2023-09-01' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (106, CAST(N'2023-09-02' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (107, CAST(N'2023-09-03' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (108, CAST(N'2023-09-04' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (109, CAST(N'2023-09-05' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (110, CAST(N'2023-09-06' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (111, CAST(N'2023-09-07' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (112, CAST(N'2023-09-08' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (113, CAST(N'2023-09-09' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (114, CAST(N'2023-09-10' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (115, CAST(N'2023-09-11' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (116, CAST(N'2023-09-12' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (117, CAST(N'2023-09-13' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (118, CAST(N'2023-09-14' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (119, CAST(N'2023-09-15' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (120, CAST(N'2023-09-16' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (121, CAST(N'2023-09-17' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (122, CAST(N'2023-09-18' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (123, CAST(N'2023-09-19' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (124, CAST(N'2023-09-20' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (125, CAST(N'2023-09-21' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (126, CAST(N'2023-09-22' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (127, CAST(N'2023-09-23' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (128, CAST(N'2023-09-24' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (129, CAST(N'2023-09-25' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (130, CAST(N'2023-09-26' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (131, CAST(N'2023-09-27' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (132, CAST(N'2023-09-28' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (133, CAST(N'2023-09-29' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (134, CAST(N'2023-09-30' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (135, CAST(N'2023-10-01' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (136, CAST(N'2023-10-02' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (137, CAST(N'2023-10-03' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (138, CAST(N'2023-10-04' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (139, CAST(N'2023-10-05' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (140, CAST(N'2023-10-06' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (141, CAST(N'2023-10-07' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (142, CAST(N'2023-10-08' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (143, CAST(N'2023-10-09' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (144, CAST(N'2023-10-10' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (145, CAST(N'2023-10-11' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (146, CAST(N'2023-10-12' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (147, CAST(N'2023-10-13' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (148, CAST(N'2023-10-14' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (149, CAST(N'2023-10-15' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (150, CAST(N'2023-10-16' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (151, CAST(N'2023-10-17' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (152, CAST(N'2023-10-18' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (153, CAST(N'2023-10-19' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (154, CAST(N'2023-10-20' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (155, CAST(N'2023-10-21' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (156, CAST(N'2023-10-22' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (157, CAST(N'2023-10-23' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (158, CAST(N'2023-10-24' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (159, CAST(N'2023-10-25' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (160, CAST(N'2023-10-26' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (161, CAST(N'2023-10-27' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (162, CAST(N'2023-10-28' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (163, CAST(N'2023-10-29' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (164, CAST(N'2023-10-30' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (165, CAST(N'2023-10-31' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (166, CAST(N'2023-11-01' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (167, CAST(N'2023-11-02' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (168, CAST(N'2023-11-03' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (169, CAST(N'2023-11-04' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (170, CAST(N'2023-11-05' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (171, CAST(N'2023-11-06' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (172, CAST(N'2023-11-07' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (173, CAST(N'2023-11-08' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (174, CAST(N'2023-11-09' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (175, CAST(N'2023-11-10' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (176, CAST(N'2023-11-11' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (177, CAST(N'2023-11-12' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (178, CAST(N'2023-11-13' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (179, CAST(N'2023-11-14' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (180, CAST(N'2023-11-15' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (181, CAST(N'2023-11-16' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (182, CAST(N'2023-11-17' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (183, CAST(N'2023-11-18' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (184, CAST(N'2023-11-19' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (185, CAST(N'2023-11-20' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (186, CAST(N'2023-11-21' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (187, CAST(N'2023-11-22' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (188, CAST(N'2023-11-23' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (189, CAST(N'2023-11-24' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (190, CAST(N'2023-11-25' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (191, CAST(N'2023-11-26' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (192, CAST(N'2023-11-27' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (193, CAST(N'2023-11-28' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (194, CAST(N'2023-11-29' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (195, CAST(N'2023-11-30' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (196, CAST(N'2023-12-01' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (197, CAST(N'2023-12-02' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (198, CAST(N'2023-12-03' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (199, CAST(N'2023-12-04' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (200, CAST(N'2023-12-05' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (201, CAST(N'2023-12-06' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (202, CAST(N'2023-12-07' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (203, CAST(N'2023-12-08' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (204, CAST(N'2023-12-09' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (205, CAST(N'2023-12-10' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (206, CAST(N'2023-12-11' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (207, CAST(N'2023-12-12' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (208, CAST(N'2023-12-13' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (209, CAST(N'2023-12-14' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (210, CAST(N'2023-12-15' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (211, CAST(N'2023-12-16' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (212, CAST(N'2023-12-17' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (213, CAST(N'2023-12-18' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (214, CAST(N'2023-12-19' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (215, CAST(N'2023-12-20' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (216, CAST(N'2023-12-21' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (217, CAST(N'2023-12-22' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (218, CAST(N'2023-12-23' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (219, CAST(N'2023-12-24' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (220, CAST(N'2023-12-25' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (221, CAST(N'2023-12-26' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (222, CAST(N'2023-12-27' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (223, CAST(N'2023-12-28' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (224, CAST(N'2023-12-29' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (225, CAST(N'2023-12-30' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (226, CAST(N'2023-12-31' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (227, CAST(N'2024-01-01' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (228, CAST(N'2024-01-02' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (229, CAST(N'2024-01-03' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (230, CAST(N'2024-01-04' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (231, CAST(N'2024-01-05' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (232, CAST(N'2024-01-06' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (233, CAST(N'2024-01-07' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (234, CAST(N'2024-01-08' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (235, CAST(N'2024-01-09' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (236, CAST(N'2024-01-10' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (237, CAST(N'2024-01-11' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (238, CAST(N'2024-01-12' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (239, CAST(N'2024-01-13' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (240, CAST(N'2024-01-14' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (241, CAST(N'2024-01-15' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (242, CAST(N'2024-01-16' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (243, CAST(N'2024-01-17' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (244, CAST(N'2024-01-18' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (245, CAST(N'2024-01-19' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (246, CAST(N'2024-01-20' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (247, CAST(N'2024-01-21' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (248, CAST(N'2024-01-22' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (249, CAST(N'2024-01-23' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (250, CAST(N'2024-01-24' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (251, CAST(N'2024-01-25' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (252, CAST(N'2024-01-26' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (253, CAST(N'2024-01-27' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (254, CAST(N'2024-01-28' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (255, CAST(N'2024-01-29' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (256, CAST(N'2024-01-30' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (257, CAST(N'2024-01-31' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (258, CAST(N'2024-02-01' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (259, CAST(N'2024-02-02' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (260, CAST(N'2024-02-03' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (261, CAST(N'2024-02-04' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (262, CAST(N'2024-02-05' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (263, CAST(N'2024-02-06' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (264, CAST(N'2024-02-07' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (265, CAST(N'2024-02-08' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (266, CAST(N'2024-02-09' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (267, CAST(N'2024-02-10' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (268, CAST(N'2024-02-11' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (269, CAST(N'2024-02-12' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (270, CAST(N'2024-02-13' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (271, CAST(N'2024-02-14' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (272, CAST(N'2024-02-15' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (273, CAST(N'2024-02-16' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (274, CAST(N'2024-02-17' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (275, CAST(N'2024-02-18' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (276, CAST(N'2024-02-19' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (277, CAST(N'2024-02-20' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (278, CAST(N'2024-02-21' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (279, CAST(N'2024-02-22' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (280, CAST(N'2024-02-23' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (281, CAST(N'2024-02-24' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (282, CAST(N'2024-02-25' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (283, CAST(N'2024-02-26' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (284, CAST(N'2024-02-27' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (285, CAST(N'2024-02-28' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (286, CAST(N'2024-02-29' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (287, CAST(N'2024-03-01' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (288, CAST(N'2024-03-02' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (289, CAST(N'2024-03-03' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (290, CAST(N'2024-03-04' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (291, CAST(N'2024-03-05' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (292, CAST(N'2024-03-06' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (293, CAST(N'2024-03-07' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (294, CAST(N'2024-03-08' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (295, CAST(N'2024-03-09' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (296, CAST(N'2024-03-10' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (297, CAST(N'2024-03-11' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (298, CAST(N'2024-03-12' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (299, CAST(N'2024-03-13' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (300, CAST(N'2024-03-14' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (301, CAST(N'2024-03-15' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (302, CAST(N'2024-03-16' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (303, CAST(N'2024-03-17' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (304, CAST(N'2024-03-18' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (305, CAST(N'2024-03-19' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (306, CAST(N'2024-03-20' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (307, CAST(N'2024-03-21' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (308, CAST(N'2024-03-22' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (309, CAST(N'2024-03-23' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (310, CAST(N'2024-03-24' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (311, CAST(N'2024-03-25' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (312, CAST(N'2024-03-26' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (313, CAST(N'2024-03-27' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (314, CAST(N'2024-03-28' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (315, CAST(N'2024-03-29' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (316, CAST(N'2024-03-30' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (317, CAST(N'2024-03-31' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (318, CAST(N'2024-04-01' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (319, CAST(N'2024-04-02' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (320, CAST(N'2024-04-03' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (321, CAST(N'2024-04-04' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (322, CAST(N'2024-04-05' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (323, CAST(N'2024-04-06' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (324, CAST(N'2024-04-07' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (325, CAST(N'2024-04-08' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (326, CAST(N'2024-04-09' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (327, CAST(N'2024-04-10' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (328, CAST(N'2024-04-11' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (329, CAST(N'2024-04-12' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (330, CAST(N'2024-04-13' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (331, CAST(N'2024-04-14' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (332, CAST(N'2024-04-15' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (333, CAST(N'2024-04-16' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (334, CAST(N'2024-04-17' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (335, CAST(N'2024-04-18' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (336, CAST(N'2024-04-19' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (337, CAST(N'2024-04-20' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (338, CAST(N'2024-04-21' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (339, CAST(N'2024-04-22' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (340, CAST(N'2024-04-23' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (341, CAST(N'2024-04-24' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (342, CAST(N'2024-04-25' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (343, CAST(N'2024-04-26' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (344, CAST(N'2024-04-27' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (345, CAST(N'2024-04-28' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (346, CAST(N'2024-04-29' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (347, CAST(N'2024-04-30' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (348, CAST(N'2024-05-01' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (349, CAST(N'2024-05-02' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (350, CAST(N'2024-05-03' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (351, CAST(N'2024-05-04' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (352, CAST(N'2024-05-05' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (353, CAST(N'2024-05-06' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (354, CAST(N'2024-05-07' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (355, CAST(N'2024-05-08' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (356, CAST(N'2024-05-09' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (357, CAST(N'2024-05-10' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (358, CAST(N'2024-05-11' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (359, CAST(N'2024-05-12' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (360, CAST(N'2024-05-13' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (361, CAST(N'2024-05-14' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (362, CAST(N'2024-05-15' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (363, CAST(N'2024-05-16' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (364, CAST(N'2024-05-17' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (365, CAST(N'2024-05-18' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (366, CAST(N'2024-05-19' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (367, CAST(N'2024-05-20' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (368, CAST(N'2024-05-21' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (369, CAST(N'2024-05-22' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (370, CAST(N'2024-05-23' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (371, CAST(N'2024-05-24' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (372, CAST(N'2024-05-25' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (373, CAST(N'2024-05-26' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (374, CAST(N'2024-05-27' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (375, CAST(N'2024-05-28' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (376, CAST(N'2024-05-29' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (377, CAST(N'2024-05-30' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (378, CAST(N'2024-05-31' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (379, CAST(N'2024-06-01' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (380, CAST(N'2024-06-02' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (381, CAST(N'2024-06-03' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (382, CAST(N'2024-06-04' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (383, CAST(N'2024-06-05' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (384, CAST(N'2024-06-06' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (385, CAST(N'2024-06-07' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (386, CAST(N'2024-06-08' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (387, CAST(N'2024-06-09' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (388, CAST(N'2024-06-10' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (389, CAST(N'2024-06-11' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (390, CAST(N'2024-06-12' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (391, CAST(N'2024-06-13' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (392, CAST(N'2024-06-14' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (393, CAST(N'2024-06-15' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (394, CAST(N'2024-06-16' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (395, CAST(N'2024-06-17' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (396, CAST(N'2024-06-18' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (397, CAST(N'2024-06-19' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (398, CAST(N'2024-06-20' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (399, CAST(N'2024-06-21' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (400, CAST(N'2024-06-22' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (401, CAST(N'2024-06-23' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (402, CAST(N'2024-06-24' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (403, CAST(N'2024-06-25' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (404, CAST(N'2024-06-26' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (405, CAST(N'2024-06-27' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (406, CAST(N'2024-06-28' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (407, CAST(N'2024-06-29' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (408, CAST(N'2024-06-30' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (409, CAST(N'2024-07-01' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (410, CAST(N'2024-07-02' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (411, CAST(N'2024-07-03' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (412, CAST(N'2024-07-04' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (413, CAST(N'2024-07-05' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (414, CAST(N'2024-07-06' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (415, CAST(N'2024-07-07' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (416, CAST(N'2024-07-08' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (417, CAST(N'2024-07-09' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (418, CAST(N'2024-07-10' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (419, CAST(N'2024-07-11' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (420, CAST(N'2024-07-12' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (421, CAST(N'2024-07-13' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (422, CAST(N'2024-07-14' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (423, CAST(N'2024-07-15' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (424, CAST(N'2024-07-16' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (425, CAST(N'2024-07-17' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (426, CAST(N'2024-07-18' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (427, CAST(N'2024-07-19' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (428, CAST(N'2024-07-20' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (429, CAST(N'2024-07-21' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (430, CAST(N'2024-07-22' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (431, CAST(N'2024-07-23' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (432, CAST(N'2024-07-24' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (433, CAST(N'2024-07-25' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (434, CAST(N'2024-07-26' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (435, CAST(N'2024-07-27' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (436, CAST(N'2024-07-28' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (437, CAST(N'2024-07-29' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (438, CAST(N'2024-07-30' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (439, CAST(N'2024-07-31' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (440, CAST(N'2024-08-01' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (441, CAST(N'2024-08-02' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (442, CAST(N'2024-08-03' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (443, CAST(N'2024-08-04' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (444, CAST(N'2024-08-05' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (445, CAST(N'2024-08-06' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (446, CAST(N'2024-08-07' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (447, CAST(N'2024-08-08' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (448, CAST(N'2024-08-09' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (449, CAST(N'2024-08-10' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (450, CAST(N'2024-08-11' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (451, CAST(N'2024-08-12' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (452, CAST(N'2024-08-13' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (453, CAST(N'2024-08-14' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (454, CAST(N'2024-08-15' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (455, CAST(N'2024-08-16' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (456, CAST(N'2024-08-17' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (457, CAST(N'2024-08-18' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (458, CAST(N'2024-08-19' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (459, CAST(N'2024-08-20' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (460, CAST(N'2024-08-21' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (461, CAST(N'2024-08-22' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (462, CAST(N'2024-08-23' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (463, CAST(N'2024-08-24' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (464, CAST(N'2024-08-25' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (465, CAST(N'2024-08-26' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (466, CAST(N'2024-08-27' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (467, CAST(N'2024-08-28' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (468, CAST(N'2024-08-29' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (469, CAST(N'2024-08-30' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (470, CAST(N'2024-08-31' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (471, CAST(N'2024-09-01' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (472, CAST(N'2024-09-02' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (473, CAST(N'2024-09-03' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (474, CAST(N'2024-09-04' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (475, CAST(N'2024-09-05' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (476, CAST(N'2024-09-06' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (477, CAST(N'2024-09-07' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (478, CAST(N'2024-09-08' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (479, CAST(N'2024-09-09' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (480, CAST(N'2024-09-10' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (481, CAST(N'2024-09-11' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (482, CAST(N'2024-09-12' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (483, CAST(N'2024-09-13' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (484, CAST(N'2024-09-14' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (485, CAST(N'2024-09-15' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (486, CAST(N'2024-09-16' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (487, CAST(N'2024-09-17' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (488, CAST(N'2024-09-18' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (489, CAST(N'2024-09-19' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (490, CAST(N'2024-09-20' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (491, CAST(N'2024-09-21' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (492, CAST(N'2024-09-22' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (493, CAST(N'2024-09-23' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (494, CAST(N'2024-09-24' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (495, CAST(N'2024-09-25' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (496, CAST(N'2024-09-26' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (497, CAST(N'2024-09-27' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (498, CAST(N'2024-09-28' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (499, CAST(N'2024-09-29' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (500, CAST(N'2024-09-30' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (501, CAST(N'2024-10-01' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (502, CAST(N'2024-10-02' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (503, CAST(N'2024-10-03' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (504, CAST(N'2024-10-04' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (505, CAST(N'2024-10-05' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (506, CAST(N'2024-10-06' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (507, CAST(N'2024-10-07' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (508, CAST(N'2024-10-08' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (509, CAST(N'2024-10-09' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (510, CAST(N'2024-10-10' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (511, CAST(N'2024-10-11' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (512, CAST(N'2024-10-12' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (513, CAST(N'2024-10-13' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (514, CAST(N'2024-10-14' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (515, CAST(N'2024-10-15' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (516, CAST(N'2024-10-16' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (517, CAST(N'2024-10-17' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (518, CAST(N'2024-10-18' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (519, CAST(N'2024-10-19' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (520, CAST(N'2024-10-20' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (521, CAST(N'2024-10-21' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (522, CAST(N'2024-10-22' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (523, CAST(N'2024-10-23' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (524, CAST(N'2024-10-24' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (525, CAST(N'2024-10-25' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (526, CAST(N'2024-10-26' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (527, CAST(N'2024-10-27' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (528, CAST(N'2024-10-28' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (529, CAST(N'2024-10-29' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (530, CAST(N'2024-10-30' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (531, CAST(N'2024-10-31' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (532, CAST(N'2024-11-01' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (533, CAST(N'2024-11-02' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (534, CAST(N'2024-11-03' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (535, CAST(N'2024-11-04' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (536, CAST(N'2024-11-05' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (537, CAST(N'2024-11-06' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (538, CAST(N'2024-11-07' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (539, CAST(N'2024-11-08' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (540, CAST(N'2024-11-09' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (541, CAST(N'2024-11-10' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (542, CAST(N'2024-11-11' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (543, CAST(N'2024-11-12' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (544, CAST(N'2024-11-13' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (545, CAST(N'2024-11-14' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (546, CAST(N'2024-11-15' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (547, CAST(N'2024-11-16' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (548, CAST(N'2024-11-17' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (549, CAST(N'2024-11-18' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (550, CAST(N'2024-11-19' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (551, CAST(N'2024-11-20' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (552, CAST(N'2024-11-21' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (553, CAST(N'2024-11-22' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (554, CAST(N'2024-11-23' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (555, CAST(N'2024-11-24' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (556, CAST(N'2024-11-25' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (557, CAST(N'2024-11-26' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (558, CAST(N'2024-11-27' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (559, CAST(N'2024-11-28' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (560, CAST(N'2024-11-29' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (561, CAST(N'2024-11-30' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (562, CAST(N'2024-12-01' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (563, CAST(N'2024-12-02' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (564, CAST(N'2024-12-03' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (565, CAST(N'2024-12-04' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (566, CAST(N'2024-12-05' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (567, CAST(N'2024-12-06' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (568, CAST(N'2024-12-07' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (569, CAST(N'2024-12-08' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (570, CAST(N'2024-12-09' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (571, CAST(N'2024-12-10' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (572, CAST(N'2024-12-11' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (573, CAST(N'2024-12-12' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (574, CAST(N'2024-12-13' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (575, CAST(N'2024-12-14' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (576, CAST(N'2024-12-15' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (577, CAST(N'2024-12-16' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (578, CAST(N'2024-12-17' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (579, CAST(N'2024-12-18' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (580, CAST(N'2024-12-19' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (581, CAST(N'2024-12-20' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (582, CAST(N'2024-12-21' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (583, CAST(N'2024-12-22' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (584, CAST(N'2024-12-23' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (585, CAST(N'2024-12-24' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (586, CAST(N'2024-12-25' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (587, CAST(N'2024-12-26' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (588, CAST(N'2024-12-27' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (589, CAST(N'2024-12-28' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (590, CAST(N'2024-12-29' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (591, CAST(N'2024-12-30' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (592, CAST(N'2024-12-31' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (593, CAST(N'2025-01-01' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (594, CAST(N'2025-01-02' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (595, CAST(N'2025-01-03' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (596, CAST(N'2025-01-04' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (597, CAST(N'2025-01-05' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (598, CAST(N'2025-01-06' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (599, CAST(N'2025-01-07' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (600, CAST(N'2025-01-08' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (601, CAST(N'2025-01-09' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (602, CAST(N'2025-01-10' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (603, CAST(N'2025-01-11' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (604, CAST(N'2025-01-12' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (605, CAST(N'2025-01-13' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (606, CAST(N'2025-01-14' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (607, CAST(N'2025-01-15' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (608, CAST(N'2025-01-16' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (609, CAST(N'2025-01-17' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (610, CAST(N'2025-01-18' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (611, CAST(N'2025-01-19' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (612, CAST(N'2025-01-20' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (613, CAST(N'2025-01-21' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (614, CAST(N'2025-01-22' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (615, CAST(N'2025-01-23' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (616, CAST(N'2025-01-24' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (617, CAST(N'2025-01-25' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (618, CAST(N'2025-01-26' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (619, CAST(N'2025-01-27' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (620, CAST(N'2025-01-28' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (621, CAST(N'2025-01-29' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (622, CAST(N'2025-01-30' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (623, CAST(N'2025-01-31' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (624, CAST(N'2025-02-01' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (625, CAST(N'2025-02-02' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (626, CAST(N'2025-02-03' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (627, CAST(N'2025-02-04' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (628, CAST(N'2025-02-05' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (629, CAST(N'2025-02-06' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (630, CAST(N'2025-02-07' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (631, CAST(N'2025-02-08' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (632, CAST(N'2025-02-09' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (633, CAST(N'2025-02-10' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (634, CAST(N'2025-02-11' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (635, CAST(N'2025-02-12' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (636, CAST(N'2025-02-13' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (637, CAST(N'2025-02-14' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (638, CAST(N'2025-02-15' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (639, CAST(N'2025-02-16' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (640, CAST(N'2025-02-17' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (641, CAST(N'2025-02-18' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (642, CAST(N'2025-02-19' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (643, CAST(N'2025-02-20' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (644, CAST(N'2025-02-21' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (645, CAST(N'2025-02-22' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (646, CAST(N'2025-02-23' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (647, CAST(N'2025-02-24' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (648, CAST(N'2025-02-25' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (649, CAST(N'2025-02-26' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (650, CAST(N'2025-02-27' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (651, CAST(N'2025-02-28' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (652, CAST(N'2025-03-01' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (653, CAST(N'2025-03-02' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (654, CAST(N'2025-03-03' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (655, CAST(N'2025-03-04' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (656, CAST(N'2025-03-05' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (657, CAST(N'2025-03-06' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (658, CAST(N'2025-03-07' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (659, CAST(N'2025-03-08' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (660, CAST(N'2025-03-09' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (661, CAST(N'2025-03-10' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (662, CAST(N'2025-03-11' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (663, CAST(N'2025-03-12' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (664, CAST(N'2025-03-13' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (665, CAST(N'2025-03-14' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (666, CAST(N'2025-03-15' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (667, CAST(N'2025-03-16' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (668, CAST(N'2025-03-17' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (669, CAST(N'2025-03-18' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (670, CAST(N'2025-03-19' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (671, CAST(N'2025-03-20' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (672, CAST(N'2025-03-21' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (673, CAST(N'2025-03-22' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (674, CAST(N'2025-03-23' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (675, CAST(N'2025-03-24' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (676, CAST(N'2025-03-25' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (677, CAST(N'2025-03-26' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (678, CAST(N'2025-03-27' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (679, CAST(N'2025-03-28' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (680, CAST(N'2025-03-29' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (681, CAST(N'2025-03-30' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (682, CAST(N'2025-03-31' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (683, CAST(N'2025-04-01' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (684, CAST(N'2025-04-02' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (685, CAST(N'2025-04-03' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (686, CAST(N'2025-04-04' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (687, CAST(N'2025-04-05' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (688, CAST(N'2025-04-06' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (689, CAST(N'2025-04-07' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (690, CAST(N'2025-04-08' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (691, CAST(N'2025-04-09' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (692, CAST(N'2025-04-10' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (693, CAST(N'2025-04-11' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (694, CAST(N'2025-04-12' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (695, CAST(N'2025-04-13' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (696, CAST(N'2025-04-14' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (697, CAST(N'2025-04-15' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (698, CAST(N'2025-04-16' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (699, CAST(N'2025-04-17' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (700, CAST(N'2025-04-18' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (701, CAST(N'2025-04-19' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (702, CAST(N'2025-04-20' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (703, CAST(N'2025-04-21' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (704, CAST(N'2025-04-22' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (705, CAST(N'2025-04-23' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (706, CAST(N'2025-04-24' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (707, CAST(N'2025-04-25' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (708, CAST(N'2025-04-26' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (709, CAST(N'2025-04-27' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (710, CAST(N'2025-04-28' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (711, CAST(N'2025-04-29' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (712, CAST(N'2025-04-30' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (713, CAST(N'2025-05-01' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (714, CAST(N'2025-05-02' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (715, CAST(N'2025-05-03' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (716, CAST(N'2025-05-04' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (717, CAST(N'2025-05-05' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (718, CAST(N'2025-05-06' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (719, CAST(N'2025-05-07' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (720, CAST(N'2025-05-08' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (721, CAST(N'2025-05-09' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (722, CAST(N'2025-05-10' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (723, CAST(N'2025-05-11' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (724, CAST(N'2025-05-12' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (725, CAST(N'2025-05-13' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (726, CAST(N'2025-05-14' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (727, CAST(N'2025-05-15' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (728, CAST(N'2025-05-16' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (729, CAST(N'2025-05-17' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (730, CAST(N'2025-05-18' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (731, CAST(N'2025-05-19' AS Date), 30, 40, 40, 40, 20, 30, 25)
GO
INSERT [dbo].[CuposDisponibles] ([ID], [Fecha], [Guia], [Desayuno], [Almuerzo], [Cena], [Transporte], [Lavanderia], [Parqueadero]) VALUES (732, CAST(N'2025-05-20' AS Date), 30, 40, 40, 40, 20, 30, 25)