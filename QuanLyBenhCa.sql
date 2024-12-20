CREATE DATABASE [QuanLyBenhCa]
GO

USE [QuanLyBenhCa]
GO
/****** Object:  Table [dbo].[AnhBenhCa]    Script Date: 26/11/2024 5:53:37 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnhBenhCa](
	[MaImg] [int] IDENTITY(1,1) NOT NULL,
	[MaBC] [int] NOT NULL,
	[DuongDanAnh] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaImg] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BaiDang]    Script Date: 26/11/2024 5:53:37 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BaiDang](
	[MaBD] [int] NOT NULL,
	[MoTa] [nvarchar](max) NULL,
	[MaNNC] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaBD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BenhCa]    Script Date: 26/11/2024 5:53:37 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BenhCa](
	[MaBC] [int] NOT NULL,
	[TenBC] [nvarchar](100) NULL,
	[MoTaChiTietBenhCa] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaBC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BienPhapPhongNgua]    Script Date: 26/11/2024 5:53:37 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BienPhapPhongNgua](
	[MaBPPN] [int] NOT NULL,
	[TenBPPN] [nvarchar](max) NULL,
	[MaBenhCa] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaBPPN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanCa]    Script Date: 26/11/2024 5:53:37 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanCa](
	[MaDC] [int] NOT NULL,
	[TenDanCa] [nvarchar](100) NULL,
	[SoLuong] [int] NULL,
	[TrangThai] [nvarchar](50) NULL,
	[MaNNC] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KetQuaChuanDoan]    Script Date: 26/11/2024 5:53:37 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KetQuaChuanDoan](
	[MaBC] [int] NOT NULL,
	[MaTCBC] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaBC] ASC,
	[MaTCBC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LichSuBenh]    Script Date: 26/11/2024 5:53:37 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LichSuBenh](
	[NgayPhatHien] [date] NOT NULL,
	[KetQuaDieuTri] [nvarchar](100) NULL,
	[MaDC] [int] NOT NULL,
	[MaBC] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[NgayPhatHien] ASC,
	[MaDC] ASC,
	[MaBC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LichSuChuanDoan]    Script Date: 26/11/2024 5:53:37 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LichSuChuanDoan](
	[MaLSCD] [int] IDENTITY(1,1) NOT NULL,
	[MaBC] [int] NOT NULL,
	[NgayTao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLSCD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 26/11/2024 5:53:37 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguoiDung](
	[MaND] [int] NOT NULL,
	[TenND] [nvarchar](100) NULL,
	[MatKhau] [nvarchar](100) NULL,
	[QuyenNguoiDung] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaND] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NguoiNuoiCa]    Script Date: 26/11/2024 5:53:37 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguoiNuoiCa](
	[MaNNC] [int] NOT NULL,
	[HoTenNNC] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[SDT] [nvarchar](15) NULL,
	[DiaChi] [nvarchar](200) NULL,
	[MaND] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNNC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhuongPhapDieuTri]    Script Date: 26/11/2024 5:53:37 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhuongPhapDieuTri](
	[MaPPDT] [int] NOT NULL,
	[TenPPDT] [nvarchar](max) NULL,
	[MaBenhCa] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPPDT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TinTucDichBenh]    Script Date: 26/11/2024 5:53:37 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TinTucDichBenh](
	[MaTTDB] [int] NOT NULL,
	[TenTTDB] [nvarchar](100) NULL,
	[NgayDang] [date] NULL,
	[MoTa] [nvarchar](max) NULL,
	[MaBC] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTTDB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrieuChungBenhCa]    Script Date: 26/11/2024 5:53:37 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrieuChungBenhCa](
	[MaTCBC] [int] NOT NULL,
	[TenTrieuChung] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTCBC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AnhBenhCa] ON 

INSERT [dbo].[AnhBenhCa] ([MaImg], [MaBC], [DuongDanAnh]) VALUES (4, 2, N'/images/uploaded-ngocanhbna-2018_03_19-_516754345_1932018.jpg')
INSERT [dbo].[AnhBenhCa] ([MaImg], [MaBC], [DuongDanAnh]) VALUES (5, 3, N'/images/uploaded-ngocanhbna-2018_03_19-_46565350_1932018.jpg')
INSERT [dbo].[AnhBenhCa] ([MaImg], [MaBC], [DuongDanAnh]) VALUES (6, 4, N'/images/uploaded-ngocanhbna-2018_03_19-_7389024_1932018.jpg')
INSERT [dbo].[AnhBenhCa] ([MaImg], [MaBC], [DuongDanAnh]) VALUES (7, 5, N'/images/uploaded-ngocanhbna-2018_03_19-_66870346_1932018.jpg')
INSERT [dbo].[AnhBenhCa] ([MaImg], [MaBC], [DuongDanAnh]) VALUES (8, 6, N'/images/tải xuống.jfif')
INSERT [dbo].[AnhBenhCa] ([MaImg], [MaBC], [DuongDanAnh]) VALUES (9, 7, N'/images/uploaded-ngocanhbna-2018_03_19-_614039250_1932018.jpg')
INSERT [dbo].[AnhBenhCa] ([MaImg], [MaBC], [DuongDanAnh]) VALUES (10, 8, N'/images/tải xuống (1).jfif')
SET IDENTITY_INSERT [dbo].[AnhBenhCa] OFF
GO
INSERT [dbo].[BaiDang] ([MaBD], [MoTa], [MaNNC]) VALUES (4, N'Gia đình tôi thích ăn một số loại cá như cá thu, hồi, tôm, cua... song lo ngại nhiễm độc thủy ngân nên hạn chế, điều này có nên? (Liên, 35 tuổi, Quảng Ninh)
Trả lời:
Cá là một trong những thực phẩm lành mạnh nhất cho sức khỏe, cung cấp nguồn axit béo omega-3, protein, vi chất dinh dưỡng và chất béo lành mạnh. Tuy nhiên, nhiều người lo ngại một số loại cá có thể chứa hàm lượng thủy ngân cao, gây độc cho cơ thể nên hạn chế ăn.

Thủy ngân là một kim loại nặng có trong không khí, nước và đất. Con người có thể tiếp xúc với chất độc này theo nhiều cách, như hít phải hơi thủy ngân trong quá trình khai thác mỏ và làm việc trong các hoạt động công nghiệp. Một số loại cá và động vật có vỏ nguy cơ hấp thụ một lượng nhỏ nồng độ thủy ngân trong nguồn nước bị ô nhiễm. Nhiều trường hợp bị phơi nhiễm thủy ngân do ăn phải thực phẩm nói trên.

Thực tế, các chuyên gia dinh dưỡng đều khuyến nghị mọi người nên ăn ít nhất hai khẩu phần cá mỗi tuần (khoảng 340 g). Song cần cẩn trọng với các loại chứa hàm lượng thủy ngân cao, ưu tiên chọn những loại an toàn hơn.

Nhìn chung, những loại cá lớn hơn và sống lâu hơn có xu hướng chứa nhiều thủy ngân, bao gồm: Cá mập, kiếm, cá ngừ tươi, cá marlin, cá thu vua. Những loài này có xu hướng ăn nhiều loại cá nhỏ hơn, bản thân những cá nhỏ này cũng đã chứa một lượng nhỏ thủy ngân. Vì chất này không dễ bài tiết ra khỏi cơ thể nên hàm lượng thủy ngân trong cá sẽ tích tụ theo thời gian.

Một số loại an toàn hơn bao gồm: cá hồi, cá cơm, cá mòi, cá thu, cá da trơn, tôm, cua, sò huyết.', 2)
GO
INSERT [dbo].[BenhCa] ([MaBC], [TenBC], [MoTaChiTietBenhCa]) VALUES (2, N'Bệnh nấm thủy mi (bệnh mốc nước)', N'Bệnh xảy ra ở hầu hết các loài cá nước ngọt như cá chép, cá mè, cá trắm cỏ, cá trê, cá trôi, cá bống tượng... Bệnh phát triển thuận lợi trong các ao nuôi nước tù, hàm lượng chất hữu cơ cao...
Tác nhân gây bệnh: Là một số giống nấm nh­ư: Leptolegnia, Aphanomices, Sarolegnia, Achlya.')
INSERT [dbo].[BenhCa] ([MaBC], [TenBC], [MoTaChiTietBenhCa]) VALUES (3, N'Bệnh Streptocosis', N'Bệnh xảy ra ở một số loài cá nước ngọt như cá rô phi, cá chép... và một số loài cá biển như cá vược; bệnh thường bùng phát khi thời tiết ở nhiệt độ 20 - 30 độC.
Tác nhân gây bệnh: do vi khuẩn Streptococcus sp (liên cầu khuẩn) gây ra trên tất cả các giai đoạn phát triển của cá.')
INSERT [dbo].[BenhCa] ([MaBC], [TenBC], [MoTaChiTietBenhCa]) VALUES (4, N'Bệnh trùng mỏ neo', N'Bệnh gặp nhiều trên cá trắm cỏ, cá mè hoa, mè trắng, cá chép... chúng ký sinh trên da, vẩy, mang, hốc mũi, hốc mắt, miệng... Bệnh phát triển mạnh ở thời điểm cuối mùa xuân khi nhiệt độ từ 20 - 25 độ C.
Tác nhân gây bệnh: Là trùng mỏ neo thuộc giống Leronaea.')
INSERT [dbo].[BenhCa] ([MaBC], [TenBC], [MoTaChiTietBenhCa]) VALUES (5, N'Hội chứng lở loét', N'Rất nhiều loài cá khác nhau bị ảnh hưởng bởi bệnh này, trong đó có một số loài có tính nhạy cảm cao với bệnh như cá quả, cá trôi, cá trê, chép... Bệnh lây lan chủ yếu theo dòng nước và sự di chuyển của cá mang mầm bệnh.
Tác nhân gây bệnh: Do nấm Alphanomyces Invadan phát triển len lỏi ăn sâu vào trong thịt cá. Ngoài ra còn có những tác nhân gây bệnh cơ hội khác như:­ virut, vi khuẩn, ký sinh trùng.')
INSERT [dbo].[BenhCa] ([MaBC], [TenBC], [MoTaChiTietBenhCa]) VALUES (6, N'Bệnh nhiễm khuẩn huyết do vi khuẩn Aeromonas', N'Hầu hết các loài cá nuôi nước ngọt có thể bị ảnh hưởng bởi bệnh này; Bệnh thường bùng phát khi cuối mùa xuân, đầu mùa hè. Cá con dễ mẫn cảm hơn cá trưởng thành, có thể gây chết đến 80%

Tác nhân gây bệnh: Do nhóm vi khuẩn thuộc giống Aeromonas: A. hydrophila, A. caviae, A. sobria.')
INSERT [dbo].[BenhCa] ([MaBC], [TenBC], [MoTaChiTietBenhCa]) VALUES (7, N'Bệnh trùng quả dưa (bệnh đốm trắng)', N'Bệnh thường xảy ra ở cá chép, cá mè, cá trắm cỏ, cá trê, cá trôi... Bệnh phát triển thuận lợi khi thời tiết giao mùa - cuối mùa xuân sang đầu mùa hè
Tác nhân gây bệnh: do loài trùng quả dưa Ichthyophthirius multifiliis gây ra.')
INSERT [dbo].[BenhCa] ([MaBC], [TenBC], [MoTaChiTietBenhCa]) VALUES (8, N'Bệnh đốm đỏ do vi khuẩn', N'Nhiều loài các khác nhau bị ảnh hưởng bởi bệnh này, trong đó có một số loài có tính nhạy cảm cao với bệnh như cá rô phi, cá trôi, cá chép...')
GO
INSERT [dbo].[BienPhapPhongNgua] ([MaBPPN], [TenBPPN], [MaBenhCa]) VALUES (2, N'Thực hiện kỹ thuật tẩy dọn ao trước mỗi vụ nuôi. Nuôi cá với mật độ thích hợp, tránh tác động cơ học hoặc do ký sinh trùng làm cá bị tổn thương; duy trì và ổn định nhiệt độ trong ao bằng nhiều cách như duy trì mực nước ao 1,5m, phủ bèo tây 2/3 ,mặt ao...', 2)
INSERT [dbo].[BienPhapPhongNgua] ([MaBPPN], [TenBPPN], [MaBenhCa]) VALUES (3, N'Duy trì mức nước tối thiểu 1,2 m trong ao nuôi; tăng cường thay nước, quạt nước về đêm và sáng sớm nhằm cung cấp đủ hàm lượng oxy hòa tan cho cá.', 3)
INSERT [dbo].[BienPhapPhongNgua] ([MaBPPN], [TenBPPN], [MaBenhCa]) VALUES (4, N'Áp dụng các biện pháp phòng bệnh tổng hợp. Trư­ớc khi thả cá nên dùng lá xoan bón lót xuống ao với lư­ợng 0,2 - 0,3 kg/m3 n­ước để diệt ấu trùng của trùng mỏ neo có trong ao.

Nếu có điều kiện nên thay toàn bộ nước trong ao đồng thời khử trùng nước thay.', 4)
INSERT [dbo].[BienPhapPhongNgua] ([MaBPPN], [TenBPPN], [MaBenhCa]) VALUES (5, N'Đối với bệnh lở loét biện pháp hiệu quả nhất để phòng bệnh đó là lựa chọn các loài cá có khả năng kháng bệnh cao. Ngoài ra, có các biện pháp ngăn chặn nấm vào trong ao như: Tẩy dọn ao trước mội vụ nuôi.

Trong quá trình nuôi, định kỳ 2 tuần/lần hòa vôi (CaO) té đều khắp mặt ao với liều lượng 2 kg/100m3 nước.', 5)
INSERT [dbo].[BienPhapPhongNgua] ([MaBPPN], [TenBPPN], [MaBenhCa]) VALUES (6, N'Tránh tạo ra các tác nhân cơ hội như nhiễm ký sinh trùng; tránh làm xây xát cá, vệ sinh đúng quy định, không mật độ quá quá dày...', 6)
INSERT [dbo].[BienPhapPhongNgua] ([MaBPPN], [TenBPPN], [MaBenhCa]) VALUES (7, N'Dùng vaccin phòng bệnh; giảm mật độ nuôi; cung cấp nguồn nước tốt; tắm KMnO4 liều dùng là 0,4g/100 lít nước không quy định thời gian', 8)
GO
INSERT [dbo].[DanCa] ([MaDC], [TenDanCa], [SoLuong], [TrangThai], [MaNNC]) VALUES (1, N'Ðàn cá Koi', 150, N'Tốt', 2)
INSERT [dbo].[DanCa] ([MaDC], [TenDanCa], [SoLuong], [TrangThai], [MaNNC]) VALUES (2, N'Ðàn cá vàng', 200, N'Bình Thường', 2)
GO
INSERT [dbo].[KetQuaChuanDoan] ([MaBC], [MaTCBC]) VALUES (2, 2)
INSERT [dbo].[KetQuaChuanDoan] ([MaBC], [MaTCBC]) VALUES (2, 3)
INSERT [dbo].[KetQuaChuanDoan] ([MaBC], [MaTCBC]) VALUES (2, 10)
INSERT [dbo].[KetQuaChuanDoan] ([MaBC], [MaTCBC]) VALUES (3, 4)
INSERT [dbo].[KetQuaChuanDoan] ([MaBC], [MaTCBC]) VALUES (3, 5)
INSERT [dbo].[KetQuaChuanDoan] ([MaBC], [MaTCBC]) VALUES (3, 6)
INSERT [dbo].[KetQuaChuanDoan] ([MaBC], [MaTCBC]) VALUES (3, 9)
INSERT [dbo].[KetQuaChuanDoan] ([MaBC], [MaTCBC]) VALUES (3, 10)
INSERT [dbo].[KetQuaChuanDoan] ([MaBC], [MaTCBC]) VALUES (4, 3)
INSERT [dbo].[KetQuaChuanDoan] ([MaBC], [MaTCBC]) VALUES (4, 7)
INSERT [dbo].[KetQuaChuanDoan] ([MaBC], [MaTCBC]) VALUES (4, 8)
INSERT [dbo].[KetQuaChuanDoan] ([MaBC], [MaTCBC]) VALUES (5, 8)
INSERT [dbo].[KetQuaChuanDoan] ([MaBC], [MaTCBC]) VALUES (5, 9)
INSERT [dbo].[KetQuaChuanDoan] ([MaBC], [MaTCBC]) VALUES (6, 4)
INSERT [dbo].[KetQuaChuanDoan] ([MaBC], [MaTCBC]) VALUES (6, 7)
INSERT [dbo].[KetQuaChuanDoan] ([MaBC], [MaTCBC]) VALUES (6, 10)
INSERT [dbo].[KetQuaChuanDoan] ([MaBC], [MaTCBC]) VALUES (7, 3)
INSERT [dbo].[KetQuaChuanDoan] ([MaBC], [MaTCBC]) VALUES (7, 11)
INSERT [dbo].[KetQuaChuanDoan] ([MaBC], [MaTCBC]) VALUES (8, 7)
INSERT [dbo].[KetQuaChuanDoan] ([MaBC], [MaTCBC]) VALUES (8, 8)
INSERT [dbo].[KetQuaChuanDoan] ([MaBC], [MaTCBC]) VALUES (8, 9)
GO
SET IDENTITY_INSERT [dbo].[LichSuChuanDoan] ON 

INSERT [dbo].[LichSuChuanDoan] ([MaLSCD], [MaBC], [NgayTao]) VALUES (9, 2, CAST(N'2024-11-26T17:40:15.707' AS DateTime))
INSERT [dbo].[LichSuChuanDoan] ([MaLSCD], [MaBC], [NgayTao]) VALUES (10, 3, CAST(N'2024-11-26T17:40:25.573' AS DateTime))
INSERT [dbo].[LichSuChuanDoan] ([MaLSCD], [MaBC], [NgayTao]) VALUES (11, 3, CAST(N'2024-11-26T17:40:30.300' AS DateTime))
INSERT [dbo].[LichSuChuanDoan] ([MaLSCD], [MaBC], [NgayTao]) VALUES (12, 2, CAST(N'2024-11-26T17:40:36.363' AS DateTime))
INSERT [dbo].[LichSuChuanDoan] ([MaLSCD], [MaBC], [NgayTao]) VALUES (13, 8, CAST(N'2024-11-26T17:40:40.290' AS DateTime))
INSERT [dbo].[LichSuChuanDoan] ([MaLSCD], [MaBC], [NgayTao]) VALUES (14, 3, CAST(N'2024-11-26T17:40:48.770' AS DateTime))
INSERT [dbo].[LichSuChuanDoan] ([MaLSCD], [MaBC], [NgayTao]) VALUES (15, 4, CAST(N'2024-11-26T17:40:52.987' AS DateTime))
INSERT [dbo].[LichSuChuanDoan] ([MaLSCD], [MaBC], [NgayTao]) VALUES (16, 7, CAST(N'2024-11-26T17:40:57.867' AS DateTime))
INSERT [dbo].[LichSuChuanDoan] ([MaLSCD], [MaBC], [NgayTao]) VALUES (17, 5, CAST(N'2024-11-26T17:41:21.783' AS DateTime))
INSERT [dbo].[LichSuChuanDoan] ([MaLSCD], [MaBC], [NgayTao]) VALUES (18, 4, CAST(N'2024-11-26T17:49:37.287' AS DateTime))
INSERT [dbo].[LichSuChuanDoan] ([MaLSCD], [MaBC], [NgayTao]) VALUES (19, 7, CAST(N'2024-11-26T17:49:45.667' AS DateTime))
INSERT [dbo].[LichSuChuanDoan] ([MaLSCD], [MaBC], [NgayTao]) VALUES (20, 3, CAST(N'2024-11-26T17:50:22.040' AS DateTime))
INSERT [dbo].[LichSuChuanDoan] ([MaLSCD], [MaBC], [NgayTao]) VALUES (21, 6, CAST(N'2024-11-26T17:50:27.247' AS DateTime))
SET IDENTITY_INSERT [dbo].[LichSuChuanDoan] OFF
GO
INSERT [dbo].[NguoiDung] ([MaND], [TenND], [MatKhau], [QuyenNguoiDung]) VALUES (1, N'admin', N'JAvlGPq9JyTdtvBO6x2llnRI1+gxwIyPqCKAn3THIKk=', N'admin')
INSERT [dbo].[NguoiDung] ([MaND], [TenND], [MatKhau], [QuyenNguoiDung]) VALUES (2, N'user', N'MGLfTNTxPm/gBQu6hc5BKfssWeW4418ICZMapsCCJtI=', N'user')
INSERT [dbo].[NguoiDung] ([MaND], [TenND], [MatKhau], [QuyenNguoiDung]) VALUES (5, N'duc', N'RMRxvpiyZDHBwCz0oxShFTjpaXWYurscJJv72nKAZYI=', N'user')
GO
INSERT [dbo].[NguoiNuoiCa] ([MaNNC], [HoTenNNC], [Email], [SDT], [DiaChi], [MaND]) VALUES (1, N'Trần Thị Bích', N'tranthib@example.com', N'0987654321', N'Hồ Chí Minh', 2)
INSERT [dbo].[NguoiNuoiCa] ([MaNNC], [HoTenNNC], [Email], [SDT], [DiaChi], [MaND]) VALUES (2, N'Huỳnh Hữu Đức', N'huynhhuuduc5031@gmail.com', N'0123456798', N'Hồ Chí Minh', 1)
GO
INSERT [dbo].[PhuongPhapDieuTri] ([MaPPDT], [TenPPDT], [MaBenhCa]) VALUES (2, N'Dùng thuốc diệt nấm cho cá. Có thể dùng một số hóa chất để trị bệnh nấm thủy mi: Methylen 2 - 3g/m3, KMnO4 1 - 2g/m3 tạt xuống ao và lặp lại 2 lần trong 1 tuần. Hoặc dùng dung dịch muối ăn 3% tắm cá trong 15 phút.', 2)
INSERT [dbo].[PhuongPhapDieuTri] ([MaPPDT], [TenPPDT], [MaBenhCa]) VALUES (3, N'Định kỳ bổ sung vitamin tổng hợp vào thức ăn liên tục trong 7 ngày; khử trùng nước bằng viên sủi Vicato 20-30 ngày/lần, liều lượng theo hướng dẫn.

Dùng phương pháp trộn kháng sinh vào thức ăn, như Erythromycin, Ciprofloxacin, Enrofloxacin; liều 25-50mg/1kg cá/ngày, cho ăn 4 - 7 ngày.

Sử dụng thảo dược TD3, vitamin tổng hợp trộn vào thức ăn hàng ngày cho cá nhằm tăng sức đề kháng và hạn chế tác nhân vi khuẩn lây lan, bùng phát trong ao nuôi.', 3)
INSERT [dbo].[PhuongPhapDieuTri] ([MaPPDT], [TenPPDT], [MaBenhCa]) VALUES (4, N'Dùng lá xoan 0,4 - 0,5 kg/m3 nước bón vào ao nuôi cá bị bệnh có thể tiêu diệt được ký sinh trùng Lernaea. Do lá xoan phân hủy nhanh tiêu hao nhiều ôxy và thải khí độc, nhất là mùa hè nhiệt độ cao, do đó phải theo dõi cấp nước kịp thời khi thiết.

Tắm cá trong dung dịch thuốc tím KMnO4 nồng độ 10 - 12g/m3 tắm từ 1 - 2h.', 4)
INSERT [dbo].[PhuongPhapDieuTri] ([MaPPDT], [TenPPDT], [MaBenhCa]) VALUES (5, N'Trong quá trình nuôi, định kỳ 2 tuần/lần hòa vôi (CaO) té đều khắp mặt ao với liều lượng 2 kg/100m3 nước.

Đàn cá giống trước khi thả cần tắm NaCl 2-3% trong 5-15 phút để tẩy trùng tác nhân bên ngoài; tránh các tác động cơ học làm tổn thương đến cơ thể cá.', 5)
INSERT [dbo].[PhuongPhapDieuTri] ([MaPPDT], [TenPPDT], [MaBenhCa]) VALUES (6, N'Dùng thuốc tím ( KmnO4) tắm cá, liều dùng là 0,4g/100 lít nước, xử lý lập lại sau 3 ngày; định kỳ tắm cá 1 tuần, 2 tuần hoặc 1tháng/lần, tùy thuộc vào tình trạng sức khỏe cá.

Dùng thuốc trộn vào thức ăn như Oxytetracyline: 55-77 mg/kg thể trọng cá nuôi, cho ăn 7-10 ngày (nên hạn chế sử dụng); Enrofloxacin: 20 mg/kg thể trọng cá nuôi, cho ăn 7-10 ngày; Streptomycin: 50-75 mg/kg thể trọng cá nuôi, cho ăn 5-7 ngày; Kanamycin: 50 mg/kg thể trọng cá nuôi, cho ăn 7 ngày...', 6)
INSERT [dbo].[PhuongPhapDieuTri] ([MaPPDT], [TenPPDT], [MaBenhCa]) VALUES (7, N'Dùng formalin để phun xuống ao mỗi tuần 2 lần với nồng độ 150 - 200 ml/m3, sau đó thay nước; hoặc tắm formalin cho cá với nồng độ 200 - 250 ml/m3 trong vòng 30 - 60 phút.', 7)
INSERT [dbo].[PhuongPhapDieuTri] ([MaPPDT], [TenPPDT], [MaBenhCa]) VALUES (8, N'Có thể dùng các loại kháng sinh để điều khi như trong bệnh nhiễm khuẩn huyết do Aeromonas. Trị bệnh: dùng thuốc tiên đắc 100g/50kg cá ngày liên tục, cung cấp thêm VitaminC.', 8)
GO
INSERT [dbo].[TrieuChungBenhCa] ([MaTCBC], [TenTrieuChung]) VALUES (2, N'da cá có các vùng trắng xám')
INSERT [dbo].[TrieuChungBenhCa] ([MaTCBC], [TenTrieuChung]) VALUES (3, N'Cá bơi bất thường')
INSERT [dbo].[TrieuChungBenhCa] ([MaTCBC], [TenTrieuChung]) VALUES (4, N'màu sắc cá chuyển dần sang đen tối')
INSERT [dbo].[TrieuChungBenhCa] ([MaTCBC], [TenTrieuChung]) VALUES (5, N'xuất huyết ở các vây và xương nắp mang')
INSERT [dbo].[TrieuChungBenhCa] ([MaTCBC], [TenTrieuChung]) VALUES (6, N'Cá bơi xoắn, không định hướng')
INSERT [dbo].[TrieuChungBenhCa] ([MaTCBC], [TenTrieuChung]) VALUES (7, N'mình cá có các vết nhỏ màu đỏ')
INSERT [dbo].[TrieuChungBenhCa] ([MaTCBC], [TenTrieuChung]) VALUES (8, N'Cá ít ăn, bỏ ăn, hoạt động chậm chạp')
INSERT [dbo].[TrieuChungBenhCa] ([MaTCBC], [TenTrieuChung]) VALUES (9, N'thân cá bệnh có các vết lở')
INSERT [dbo].[TrieuChungBenhCa] ([MaTCBC], [TenTrieuChung]) VALUES (10, N'vảy dễ rơi rụng; mắt lồi, mờ đục')
INSERT [dbo].[TrieuChungBenhCa] ([MaTCBC], [TenTrieuChung]) VALUES (11, N'Da, mang cá bị bệnh có nhiều nhợt, màu sắc nhợt nhạt')
GO
/****** Object:  Index [UQ_BienPhapPhongNgua_MaBenhCa]    Script Date: 26/11/2024 5:53:50 CH ******/
ALTER TABLE [dbo].[BienPhapPhongNgua] ADD  CONSTRAINT [UQ_BienPhapPhongNgua_MaBenhCa] UNIQUE NONCLUSTERED 
(
	[MaBenhCa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ_PhuongPhapDieuTri_MaBenhCa]    Script Date: 26/11/2024 5:53:50 CH ******/
ALTER TABLE [dbo].[PhuongPhapDieuTri] ADD  CONSTRAINT [UQ_PhuongPhapDieuTri_MaBenhCa] UNIQUE NONCLUSTERED 
(
	[MaBenhCa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[LichSuChuanDoan] ADD  DEFAULT (getdate()) FOR [NgayTao]
GO
ALTER TABLE [dbo].[AnhBenhCa]  WITH CHECK ADD  CONSTRAINT [FK_AnhBenhCa_BenhCa] FOREIGN KEY([MaBC])
REFERENCES [dbo].[BenhCa] ([MaBC])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AnhBenhCa] CHECK CONSTRAINT [FK_AnhBenhCa_BenhCa]
GO
ALTER TABLE [dbo].[BaiDang]  WITH CHECK ADD FOREIGN KEY([MaNNC])
REFERENCES [dbo].[NguoiNuoiCa] ([MaNNC])
GO
ALTER TABLE [dbo].[BienPhapPhongNgua]  WITH CHECK ADD FOREIGN KEY([MaBenhCa])
REFERENCES [dbo].[BenhCa] ([MaBC])
GO
ALTER TABLE [dbo].[DanCa]  WITH CHECK ADD FOREIGN KEY([MaNNC])
REFERENCES [dbo].[NguoiNuoiCa] ([MaNNC])
GO
ALTER TABLE [dbo].[KetQuaChuanDoan]  WITH CHECK ADD FOREIGN KEY([MaTCBC])
REFERENCES [dbo].[TrieuChungBenhCa] ([MaTCBC])
GO
ALTER TABLE [dbo].[KetQuaChuanDoan]  WITH CHECK ADD FOREIGN KEY([MaBC])
REFERENCES [dbo].[BenhCa] ([MaBC])
GO
ALTER TABLE [dbo].[LichSuBenh]  WITH CHECK ADD FOREIGN KEY([MaBC])
REFERENCES [dbo].[BenhCa] ([MaBC])
GO
ALTER TABLE [dbo].[LichSuBenh]  WITH CHECK ADD FOREIGN KEY([MaDC])
REFERENCES [dbo].[DanCa] ([MaDC])
GO
ALTER TABLE [dbo].[LichSuChuanDoan]  WITH CHECK ADD  CONSTRAINT [FK_LichSuChuanDoan_BenhCa] FOREIGN KEY([MaBC])
REFERENCES [dbo].[BenhCa] ([MaBC])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LichSuChuanDoan] CHECK CONSTRAINT [FK_LichSuChuanDoan_BenhCa]
GO
ALTER TABLE [dbo].[NguoiNuoiCa]  WITH CHECK ADD FOREIGN KEY([MaND])
REFERENCES [dbo].[NguoiDung] ([MaND])
GO
ALTER TABLE [dbo].[PhuongPhapDieuTri]  WITH CHECK ADD FOREIGN KEY([MaBenhCa])
REFERENCES [dbo].[BenhCa] ([MaBC])
GO
ALTER TABLE [dbo].[TinTucDichBenh]  WITH CHECK ADD FOREIGN KEY([MaBC])
REFERENCES [dbo].[BenhCa] ([MaBC])
GO
