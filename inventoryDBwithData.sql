USE [master]
GO
/****** Object:  Database [inventoryDB]    Script Date: 6/25/2022 11:28:46 PM ******/
CREATE DATABASE [inventoryDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'inventoryDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLSERVEREXPRESS\MSSQL\DATA\inventoryDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'inventoryDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLSERVEREXPRESS\MSSQL\DATA\inventoryDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [inventoryDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [inventoryDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [inventoryDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [inventoryDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [inventoryDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [inventoryDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [inventoryDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [inventoryDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [inventoryDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [inventoryDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [inventoryDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [inventoryDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [inventoryDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [inventoryDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [inventoryDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [inventoryDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [inventoryDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [inventoryDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [inventoryDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [inventoryDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [inventoryDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [inventoryDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [inventoryDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [inventoryDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [inventoryDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [inventoryDB] SET  MULTI_USER 
GO
ALTER DATABASE [inventoryDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [inventoryDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [inventoryDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [inventoryDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [inventoryDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [inventoryDB] SET QUERY_STORE = OFF
GO
USE [inventoryDB]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 6/25/2022 11:28:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[cat_id] [int] IDENTITY(1,1) NOT NULL,
	[cat_name] [varchar](30) NOT NULL,
	[cat_status] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cat_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 6/25/2022 11:28:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[pro_id] [int] IDENTITY(1,1) NOT NULL,
	[pro_name] [varchar](80) NOT NULL,
	[pro_barcode] [nvarchar](50) NOT NULL,
	[pro_location] [nvarchar](50) NULL,
	[pro_quantity] [int] NOT NULL,
	[p_description] [varchar](200) NULL,
	[p_price] [money] NULL,
	[pro_catID] [int] NULL,
	[pro_image] [varchar](max) NULL,
 CONSTRAINT [PK__products__335E4CA603BCE50B] PRIMARY KEY CLUSTERED 
(
	[pro_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[purchase]    Script Date: 6/25/2022 11:28:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[purchase](
	[p_id] [bigint] IDENTITY(1,1) NOT NULL,
	[p_date] [date] NOT NULL,
	[p_suppId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[p_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[purchaseDetails]    Script Date: 6/25/2022 11:28:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[purchaseDetails](
	[pd_id] [bigint] IDENTITY(1,1) NOT NULL,
	[pd_purchaseId] [bigint] NOT NULL,
	[pd_proId] [int] NOT NULL,
	[pd_quantity] [int] NOT NULL,
	[pd_buyingPrice] [money] NOT NULL,
 CONSTRAINT [PK__purchase__F7562CCFF67CB8FC] PRIMARY KEY CLUSTERED 
(
	[pd_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 6/25/2022 11:28:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[r_id] [int] IDENTITY(1,1) NOT NULL,
	[r_name] [varchar](30) NOT NULL,
	[r_status] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[r_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[suppliers]    Script Date: 6/25/2022 11:28:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[suppliers](
	[sup_id] [int] IDENTITY(1,1) NOT NULL,
	[sup_name] [varchar](100) NOT NULL,
	[sup_address] [varchar](100) NOT NULL,
	[sup_phone] [varchar](15) NOT NULL,
	[sup_balance] [int] NULL,
 CONSTRAINT [PK__supplier__FB8F785FB3599C9D] PRIMARY KEY CLUSTERED 
(
	[sup_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 6/25/2022 11:28:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[u_id] [int] IDENTITY(1,1) NOT NULL,
	[u_name] [varchar](40) NOT NULL,
	[u_username] [varchar](40) NOT NULL,
	[u_password] [varchar](20) NOT NULL,
	[u_phone] [varchar](15) NOT NULL,
	[u_email] [varchar](25) NOT NULL,
	[u_status] [tinyint] NOT NULL,
	[u_roleId] [int] NOT NULL,
	[u_st_address] [varchar](40) NOT NULL,
	[u_city] [varchar](40) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[u_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[categories] ON 

INSERT [dbo].[categories] ([cat_id], [cat_name], [cat_status]) VALUES (1, N'Dairy', 1)
INSERT [dbo].[categories] ([cat_id], [cat_name], [cat_status]) VALUES (3, N'Utensils', 1)
INSERT [dbo].[categories] ([cat_id], [cat_name], [cat_status]) VALUES (4, N'Frozen Products', 1)
INSERT [dbo].[categories] ([cat_id], [cat_name], [cat_status]) VALUES (5, N'Meat', 0)
INSERT [dbo].[categories] ([cat_id], [cat_name], [cat_status]) VALUES (6, N'Snacks', 1)
INSERT [dbo].[categories] ([cat_id], [cat_name], [cat_status]) VALUES (8, N'Fruits&Vegetables', 1)
INSERT [dbo].[categories] ([cat_id], [cat_name], [cat_status]) VALUES (9, N'Cans', 1)
INSERT [dbo].[categories] ([cat_id], [cat_name], [cat_status]) VALUES (10, N'Drinks', 1)
SET IDENTITY_INSERT [dbo].[categories] OFF
GO
SET IDENTITY_INSERT [dbo].[products] ON 

INSERT [dbo].[products] ([pro_id], [pro_name], [pro_barcode], [pro_location], [pro_quantity], [p_description], [p_price], [pro_catID], [pro_image]) VALUES (25, N'Ataulfo Mango', N'12345678912', N'A-12-A-08', 64, N'No ', 2.0000, 8, N'/image/ataulfomango221221149.jpg')
INSERT [dbo].[products] ([pro_id], [pro_name], [pro_barcode], [pro_location], [pro_quantity], [p_description], [p_price], [pro_catID], [pro_image]) VALUES (26, N'Dairy Milk', N'56272121823', N'A-01-B-02', 7, N'No', 2.0000, 6, N'/image/dairyMilk221416865.jpg')
INSERT [dbo].[products] ([pro_id], [pro_name], [pro_barcode], [pro_location], [pro_quantity], [p_description], [p_price], [pro_catID], [pro_image]) VALUES (27, N'Green Onions', N'21892112122', N'A-01-B-21', 19, N'No', 3.0000, 8, N'/image/greenonions221541606.jpg')
INSERT [dbo].[products] ([pro_id], [pro_name], [pro_barcode], [pro_location], [pro_quantity], [p_description], [p_price], [pro_catID], [pro_image]) VALUES (29, N'Pan', N'32243234323', N'A-10-B-02', 25, N'No', 5.0000, 3, N'/image/Pan221649831.jpg')
INSERT [dbo].[products] ([pro_id], [pro_name], [pro_barcode], [pro_location], [pro_quantity], [p_description], [p_price], [pro_catID], [pro_image]) VALUES (30, N'Red Beans', N'21290122122', N'A-01-B-09', 55, N'No', 4.0000, 9, N'/image/redbean221745039.jpg')
INSERT [dbo].[products] ([pro_id], [pro_name], [pro_barcode], [pro_location], [pro_quantity], [p_description], [p_price], [pro_catID], [pro_image]) VALUES (31, N'Mixed Vegetable', N'12219312132', N'A-08-E-12', 21, N'No', 7.0000, 4, N'/image/vege221900119.jpg')
INSERT [dbo].[products] ([pro_id], [pro_name], [pro_barcode], [pro_location], [pro_quantity], [p_description], [p_price], [pro_catID], [pro_image]) VALUES (33, N'Yellow Lays', N'12283212132', N'A-01-B-02', 214, N'No', 3.0000, 1, N'/image/yellowlays222523207.jpg')
INSERT [dbo].[products] ([pro_id], [pro_name], [pro_barcode], [pro_location], [pro_quantity], [p_description], [p_price], [pro_catID], [pro_image]) VALUES (34, N'Red Lays', N'21223132132', N'A-01-B-01', 260, N'No', 200.0000, 6, N'/image/ataulfomango224322620.jpg')
SET IDENTITY_INSERT [dbo].[products] OFF
GO
SET IDENTITY_INSERT [dbo].[purchase] ON 

INSERT [dbo].[purchase] ([p_id], [p_date], [p_suppId]) VALUES (23, CAST(N'2022-06-01' AS Date), 1)
INSERT [dbo].[purchase] ([p_id], [p_date], [p_suppId]) VALUES (24, CAST(N'2022-02-09' AS Date), 1)
INSERT [dbo].[purchase] ([p_id], [p_date], [p_suppId]) VALUES (25, CAST(N'2021-12-27' AS Date), 1)
INSERT [dbo].[purchase] ([p_id], [p_date], [p_suppId]) VALUES (26, CAST(N'2022-06-24' AS Date), 2)
INSERT [dbo].[purchase] ([p_id], [p_date], [p_suppId]) VALUES (27, CAST(N'2022-02-10' AS Date), 1)
INSERT [dbo].[purchase] ([p_id], [p_date], [p_suppId]) VALUES (28, CAST(N'2022-06-15' AS Date), 3)
SET IDENTITY_INSERT [dbo].[purchase] OFF
GO
SET IDENTITY_INSERT [dbo].[purchaseDetails] ON 

INSERT [dbo].[purchaseDetails] ([pd_id], [pd_purchaseId], [pd_proId], [pd_quantity], [pd_buyingPrice]) VALUES (18, 23, 25, 50, 80.0000)
INSERT [dbo].[purchaseDetails] ([pd_id], [pd_purchaseId], [pd_proId], [pd_quantity], [pd_buyingPrice]) VALUES (20, 25, 29, 15, 50.0000)
INSERT [dbo].[purchaseDetails] ([pd_id], [pd_purchaseId], [pd_proId], [pd_quantity], [pd_buyingPrice]) VALUES (21, 26, 30, 15, 200.0000)
INSERT [dbo].[purchaseDetails] ([pd_id], [pd_purchaseId], [pd_proId], [pd_quantity], [pd_buyingPrice]) VALUES (22, 27, 33, 200, 500.0000)
INSERT [dbo].[purchaseDetails] ([pd_id], [pd_purchaseId], [pd_proId], [pd_quantity], [pd_buyingPrice]) VALUES (23, 28, 34, 200, 600.0000)
SET IDENTITY_INSERT [dbo].[purchaseDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[roles] ON 

INSERT [dbo].[roles] ([r_id], [r_name], [r_status]) VALUES (1, N'admin', 1)
INSERT [dbo].[roles] ([r_id], [r_name], [r_status]) VALUES (2, N'Employee', 1)
SET IDENTITY_INSERT [dbo].[roles] OFF
GO
SET IDENTITY_INSERT [dbo].[suppliers] ON 

INSERT [dbo].[suppliers] ([sup_id], [sup_name], [sup_address], [sup_phone], [sup_balance]) VALUES (1, N'Gordon(GFS)', N'4220, Griffth Street', N'8912319123', 600)
INSERT [dbo].[suppliers] ([sup_id], [sup_name], [sup_address], [sup_phone], [sup_balance]) VALUES (2, N'Chez Louis', N'9012, Griffth Street', N'9021123294', 9221)
INSERT [dbo].[suppliers] ([sup_id], [sup_name], [sup_address], [sup_phone], [sup_balance]) VALUES (3, N'Lasalle College', N'2000, Rue Saint Catherine', N'526112112', -1212222)
SET IDENTITY_INSERT [dbo].[suppliers] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([u_id], [u_name], [u_username], [u_password], [u_phone], [u_email], [u_status], [u_roleId], [u_st_address], [u_city]) VALUES (1, N'Atul Rana', N'Atul2020', N'Rana', N'5145826722', N'hema.atul@yahoo.com', 1, 1, N'2815, Avenue Barclay', N'Montreal')
INSERT [dbo].[users] ([u_id], [u_name], [u_username], [u_password], [u_phone], [u_email], [u_status], [u_roleId], [u_st_address], [u_city]) VALUES (2, N'kaka', N'kaka', N'Atul', N'1234567897', N'atul@yahoo.com', 1, 2, N'sdqwokjldqo12', N'asklda')
INSERT [dbo].[users] ([u_id], [u_name], [u_username], [u_password], [u_phone], [u_email], [u_status], [u_roleId], [u_st_address], [u_city]) VALUES (3, N'Rahul', N'RahulMadan', N'Rahul', N'5145672823', N'r@gmail.com', 1, 1, N'2910, Avenue Carlton', N'Montreal')
INSERT [dbo].[users] ([u_id], [u_name], [u_username], [u_password], [u_phone], [u_email], [u_status], [u_roleId], [u_st_address], [u_city]) VALUES (5, N'Rana', N'Rana21', N'Atul', N'5521121222', N'atul@gmail.com', 1, 1, N'oasdnkodsajdskalj', N'Montreal')
INSERT [dbo].[users] ([u_id], [u_name], [u_username], [u_password], [u_phone], [u_email], [u_status], [u_roleId], [u_st_address], [u_city]) VALUES (6, N'Sam', N'Sam2001', N'Rana', N'5128292112', N'sam@gmail.com', 1, 1, N'kldhaslkjdsal', N'Montreal')
SET IDENTITY_INSERT [dbo].[users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_products]    Script Date: 6/25/2022 11:28:46 PM ******/
ALTER TABLE [dbo].[products] ADD  CONSTRAINT [IX_products] UNIQUE NONCLUSTERED 
(
	[pro_barcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_users]    Script Date: 6/25/2022 11:28:46 PM ******/
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [IX_users] UNIQUE NONCLUSTERED 
(
	[u_email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[products] ADD  CONSTRAINT [DF_products_pro_quantity]  DEFAULT ((0)) FOR [pro_quantity]
GO
ALTER TABLE [dbo].[suppliers] ADD  CONSTRAINT [DF__suppliers__sup_b__60A75C0F]  DEFAULT ((0)) FOR [sup_balance]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [FK__products__pro_ca__1BC821DD] FOREIGN KEY([pro_catID])
REFERENCES [dbo].[categories] ([cat_id])
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [FK__products__pro_ca__1BC821DD]
GO
ALTER TABLE [dbo].[purchase]  WITH CHECK ADD  CONSTRAINT [FK__purchase__p_supp__6383C8BA] FOREIGN KEY([p_suppId])
REFERENCES [dbo].[suppliers] ([sup_id])
GO
ALTER TABLE [dbo].[purchase] CHECK CONSTRAINT [FK__purchase__p_supp__6383C8BA]
GO
ALTER TABLE [dbo].[purchaseDetails]  WITH CHECK ADD  CONSTRAINT [FK__purchaseD__pd_pu__66603565] FOREIGN KEY([pd_purchaseId])
REFERENCES [dbo].[purchase] ([p_id])
GO
ALTER TABLE [dbo].[purchaseDetails] CHECK CONSTRAINT [FK__purchaseD__pd_pu__66603565]
GO
ALTER TABLE [dbo].[purchaseDetails]  WITH CHECK ADD  CONSTRAINT [FK_purchaseDetails_products] FOREIGN KEY([pd_proId])
REFERENCES [dbo].[products] ([pro_id])
GO
ALTER TABLE [dbo].[purchaseDetails] CHECK CONSTRAINT [FK_purchaseDetails_products]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD FOREIGN KEY([u_roleId])
REFERENCES [dbo].[roles] ([r_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
/****** Object:  StoredProcedure [dbo].[st_getRoleuser]    Script Date: 6/25/2022 11:28:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[st_getRoleuser]
@user varchar(40)
as
select r.r_name as 'Role' from users u inner join roles r
on r.r_id = u.u_roleId
where u_username = @user 
GO
/****** Object:  StoredProcedure [dbo].[st_getRoleuserNew]    Script Date: 6/25/2022 11:28:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[st_getRoleuserNew]
@user varchar(40)
as
select r.r_name as 'Role' from users u inner join roles r
on r.r_id = u.u_roleId
where u_username = @user or u_email = @user
GO
/****** Object:  StoredProcedure [dbo].[st_getUserId]    Script Date: 6/25/2022 11:28:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[st_getUserId]
@user varchar (40)
as

select u.u_id from users u 
where u_username = @user or u_email = @user
GO
USE [master]
GO
ALTER DATABASE [inventoryDB] SET  READ_WRITE 
GO
