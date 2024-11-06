CREATE DATABASE [WebsiteBanHang]
GO

USE [WebsiteBanHang]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 07-12-2023 7:58:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Avatar] [nvarchar](100) NULL,
	[Slug] [varchar](100) NULL,
	[ShowOnHomePage] [bit] NULL,
	[DisplayOrder] [int] NULL,
	[CreatedOnUtc] [datetime] NULL,
	[UpdatedOnUtc] [datetime] NULL,
	[Deleted] [bit] NULL,
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 07-12-2023 7:58:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Avatar] [nchar](100) NULL,
	[Slug] [varchar](100) NULL,
	[ShowOnHomePage] [bit] NULL,
	[DisplayOrder] [int] NULL,
	[Deleted] [bit] NULL,
	[CreatedOnUtc] [datetime] NULL,
	[UpdatedOnUtc] [datetime] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 07-12-2023 7:58:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[ProductId] [int] NULL,
	[Price] [float] NULL,
	[Status] [int] NULL,
	[CreatedOnUtc] [datetime] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 07-12-2023 7:58:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NULL,
	[ProductId] [int] NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 07-12-2023 7:58:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Avatar] [nchar](100) NULL,
	[CategoryId] [int] NULL,
	[ShortDes] [nvarchar](100) NULL,
	[FullDescription] [nvarchar](100) NULL,
	[Price] [float] NULL,
	[PriceDiscount] [float] NULL,
	[TypeId] [int] NULL,
	[Slug] [varchar](50) NULL,
	[BrandId] [int] NULL,
	[Deleted] [bit] NULL,
	[ShowOnHomePage] [bit] NULL,
	[DisplayOrder] [int] NULL,
	[CreatedOnUtc] [datetime] NULL,
	[UpdatedOnUtc] [datetime] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 07-12-2023 7:58:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[IsAdmin] [bit] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Deleted]) VALUES (1, N'MKB', N'mkb.jpg', N'MKB', 1, 1, NULL, NULL, 0)
INSERT [dbo].[Brand] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Deleted]) VALUES (2, N'RoyalCanin', N'royal.jpg', N'RoyalCanin', 1, 2, NULL, NULL, 0)
INSERT [dbo].[Brand] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Deleted]) VALUES (3, N'WhisKas', N'whiskas.jpg', N'WhisKas', 1, 3, NULL, NULL, 0)
INSERT [dbo].[Brand] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Deleted]) VALUES (4, N'PurinaProPlan', N'purina.jpg', N'PurinaProPlan', 1, 4, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[Brand] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [Deleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (1, N'Thức Ăn', N'thucan.jpg                                                                                          ', N'thucan', 1, 1, 0, NULL, NULL)
INSERT [dbo].[Category] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [Deleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (2, N'Pate và Nước Sốt', N'pate.jpg                                                                                            ', N'pate', 1, 2, 0, NULL, NULL)
INSERT [dbo].[Category] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [Deleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (3, N'Súp Thưởng Ăn Liền', N'sup.jpg                                                                                             ', N'supthuong', 1, 3, 0, NULL, NULL)
INSERT [dbo].[Category] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [Deleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (4, N'Xúc xích thịt hộp', N'xucxich.jpg                                                                                         ', N'xucxich', 1, 4, 0, NULL, NULL)
INSERT [dbo].[Category] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [Deleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (5, N'Xương gặm với bánh thưởng', N'xuonggam.jpg                                                                                        ', N'xuonggam', 1, 5, 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Id], [Name], [ProductId], [Price], [Status], [CreatedOnUtc]) VALUES (1, N'DonHang-20230916200303', NULL, NULL, 1, CAST(N'2023-09-16T20:03:03.030' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [ProductId], [Price], [Status], [CreatedOnUtc]) VALUES (2, N'DonHang-20231206210152', NULL, NULL, 1, CAST(N'2023-12-06T21:01:52.557' AS DateTime))
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (1, 1, 5, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (2, 2, 5, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (3, 2, 4, 1)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (1, N'Thức ăn cho chó con cỡ nhỏ Royal Canin Mini Puppy', N'thucanchopuppy.jpg                                                                                  ', 1, N'Thức ăn cho chó con cỡ nhỏ ROYAL CANIN Mini Puppy', N'Thức ăn cho chó con cỡ nhỏ royal canin mini dành cho các giống chó con dưới 10 tháng tuổi', 1500000, 10, 1, N'', 1, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (2, N'Thức ăn cho chó Poodle con ROYAL CANIN Poodle Puppy', N'thucanchopoodle.jpg                                                                                 ', 1, N'Thức ăn cho chó Poodle con ROYAL CANIN Poodle Puppy', N'Thức ăn cho chó con cỡ nhỏ royal canin mini dành cho các giống chó con dưới 10 tháng tuổi', 2000000, 6, 1, N'', 1, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (3, N'Thức ăn cho chó Poodle trưởng thành ROYAL CANIN Poodle Adult', N'thucanchopoodleadult.jpg                                                                            ', 1, N'Thức ăn cho chó Poodle trưởng thành ROYAL CANIN Poodle Adult', N'Thức ăn cho chó con cỡ nhỏ royal canin mini dành cho các giống chó con dưới 10 tháng tuổi', 2200000, 15, 2, N'', 1, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (4, N'Thức ăn cho chó trưởng thành cỡ nhỏ ROYAL CANIN Mini Adult', N'thucanchominiadult.jpg                                                                              ', 1, N'Thức ăn cho chó trưởng thành cỡ nhỏ ROYAL CANIN Mini Adult', N'Thức ăn cho chó con cỡ nhỏ royal canin mini dành cho các giống chó con dưới 10 tháng tuổi', 2500000, 10, 2, N'', 1, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (5, N'Thức ăn cho chó trưởng thành cỡ lớn ROYAL CANIN Maxi Adult', N'thucanchomaxiadult.jpg                                                                              ', 1, N'Thức ăn cho chó trưởng thành cỡ lớn ROYAL CANIN Maxi Adult', N'Thức ăn cho chó con cỡ nhỏ royal canin mini dành cho các giống chó con dưới 10 tháng tuổi', 5000000, 7, 2, N'donghogucci', 1, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (6, N'Pate cho chó vị thịt bò IRIS OHYAMA One Care Beef', N'pateiris.jpg                                                                                        ', 1, N'Pate cho chó vị thịt bò IRIS OHYAMA One Care Beef', N'Pate cho chó vị thịt bò iris ohyama one care', 6000000, 5, 1, N'aovuitton', 2, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (8, N'Pate cho chó hỗ trợ chức năng gan và sáng mắt IRIS OHYAMA Benefit For Eyes & Liver', N'pateiris2.jpg                                                                                       ', 3, N'Pate cho chó hỗ trợ chức năng gan và sáng mắt IRIS OHYAMA Benefit For Eyes & Liver', N'Pate cho chó vị thịt bò iris ohyama one care', 7500000, 6, 2, N'giayvuitton', 2, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (9, N'Pate cho chó hỗ trợ hệ tiêu hóa IRIS OHYAMA Benefit For Enteric Canal', N'pateiris3.jpg                                                                                       ', 4, N'Pate cho chó hỗ trợ hệ tiêu hóa IRIS OHYAMA Benefit For Enteric Canal', N'Pate cho chó vị thịt bò iris ohyama one care', 8800000, 6, 2, N'tuixachvuitton', 2, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (10, N'Pate cho chó vị thịt bò trộn rau củ IRIS OHYAMA Chicken Beef Vegetable', N'pateiris4.jpg                                                                                       ', 5, N'
Pate cho chó vị thịt bò trộn rau củ IRIS OHYAMA Chicken Beef Vegetable', N'Pate cho chó vị thịt bò iris ohyama one care', 9000000, 8, 2, N'donghovuitton', 2, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (11, N'Súp thưởng cho chó tiêu hóa tốt INABA WANG Gastrointestinal Health', N'supinaba.jpg                                                                                        ', 1, N'Súp thưởng cho chó tiêu hóa tốt INABA WANG Gastrointestinal Health', N'Súp thưởng cho chó tiêu hóa tốt inabawang chứa Fructo giúp phòng ngừa cho đường ruột và dạ dày', 9500000, 7, 1, N'aohermes', 3, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (12, N'Súp thưởng cho chó vị thịt bò INABA Beef Flavor', N'supinaba1.jpg                                                                                       ', 2, N'Súp thưởng cho chó vị thịt bò INABA Beef Flavor', N'Súp thưởng cho chó tiêu hóa tốt inabawang chứa Fructo giúp phòng ngừa cho đường ruột và dạ dày', 7000000, 9, 1, N'quanhermes', 3, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (13, N'Súp thưởng cho chó chắc xương INABA WANG Joint Health', N'supinaba2.jpg                                                                                       ', 3, N'Súp thưởng cho chó chắc xương INABA WANG Joint Health', N'Súp thưởng cho chó tiêu hóa tốt inabawang chứa Fructo giúp phòng ngừa cho đường ruột và dạ dày', 7500000, 10, 2, N'giayhermes', 3, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (14, N'Súp ăn liền cho chó vị gà và khoai tây INABA WANG Chicken & Potatoes', N'supinaba3.jpg                                                                                       ', 4, N'Súp ăn liền cho chó vị gà và khoai tây INABA WANG Chicken & Potatoes', N'Súp thưởng cho chó tiêu hóa tốt inabawang chứa Fructo giúp phòng ngừa cho đường ruột và dạ dày', 8000000, 10, 2, N'tuixachhermes', 3, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (15, N'Súp thưởng cho chó thơm miệng INABA WANG Oral Health', N'supinaba4.jpg                                                                                       ', 5, N'Súp thưởng cho chó thơm miệng INABA WANG Oral Health', N'Súp thưởng cho chó tiêu hóa tốt inabawang chứa Fructo giúp phòng ngừa cho đường ruột và dạ dày', 8500000, 8, 2, N'donghohermes', 3, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (16, N'Xúc xích cho chó vị thịt bò gà JERHIGH Hot Dog Bar Beef Flavour', N'xucxichjerhigh.jpg                                                                                  ', 1, N'Xúc xích cho chó vị thịt bò gà JERHIGH Hot Dog Bar Beef Flavour', N'Xúc xích cho chó vị thịt gà với thiết kế hoàn toàn mới', 7000000, 7, 1, N'aosomiprada', 4, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (17, N'Xúc xích cho chó vị rau thịt gà JERHIGH Hot Dog Bar Chicken Meat Vegetable', N'xucxichjerhigh1.jpg                                                                                 ', 2, N'Xúc xích cho chó vị rau thịt gà JERHIGH Hot Dog Bar Chicken Meat Vegetable', N'Xúc xích cho chó vị thịt gà với thiết kế hoàn toàn mới', 7500000, 12, 1, N'quanprada', 4, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (18, N'Xúc xích cho chó vị gan thịt gà JERHIGH Hot Dog Bar Chicken Meat Liver', N'xucxichjerhigh2.jpg                                                                                 ', 3, N'Xúc xích cho chó vị gan thịt gà JERHIGH Hot Dog Bar Chicken Meat Liver', N'Xúc xích cho chó vị thịt gà với thiết kế hoàn toàn mới', 8000000, 10, 2, N'giayprada', 4, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (19, N'Xúc xích cho chó vị thịt gà JERHIGH Hot Dog Bar Chicken Meat', N'xucxichjerhigh3.jpg                                                                                 ', 4, N'Xúc xích cho chó vị thịt gà JERHIGH Hot Dog Bar Chicken Meat', N'Xúc xích cho chó vị thịt gà với thiết kế hoàn toàn mới', 8500000, 8, 2, N'tuixachprada', 4, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (20, N'Xúc xích cho chó vị thịt bò BIOLINE Beef Sausage', N'xucxichbioline.jpg                                                                                  ', 5, N'Xúc xích cho chó vị thịt gà BIOLINE Chicken Sausage', N'Xúc xích cho chó vị thịt gà với thiết kế hoàn toàn mới', 9000000, 7, 2, N'donghoprada', 4, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (21, N'Xúc xích cho chó vị thịt gà BIOLINE Chicken Sausage', N'xucxichbioline1.jpg                                                                                 ', 3, N'Xúc xích cho chó vị phô mai que BOWWOW Mozzarella Cheese Stick', N'Xúc xích cho chó vị thịt gà với thiết kế hoàn toàn mới', 9500000, 8, 2, N'giaythethaogucci', 1, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (22, N'Xúc xích cho chó vị cá biển BIOLINE Cod Sausage', N'xucxichbiolin2.jpg                                                                                  ', 3, N'Xúc xích cho chó vị cá biển BIOLINE Cod Sausage', N'Túi xách Vuitton đỏ nâu sang trọng', 9800000, 6, 2, N'tuixachvuitton', 1, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (25, N'Thời trang nam', N'pate.jpg                                                                                            ', 1, N'abc', N'abcde', 500000, 5, 1, N'1', 1, NULL, 1, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (1, N'Nguy?n Thành', N'Phát', N'phat16102002abcd@gmail.com', N'ea1aaba0d0b1f031357e1c85ae361b22', NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (2, N'Nguy?n Thành', N'Phát', N'a3@gmail.com', N'33be2ceeb0df224b0479fa82f1c6c391', NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (3, N'Nguy?n Thành', N'Phát', N'phat16102002abc@gmail.com', N'202cb962ac59075b964b07152d234b70', 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1: Giảm giá sốc,2 :' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Product', @level2type=N'COLUMN',@level2name=N'TypeId'
GO
