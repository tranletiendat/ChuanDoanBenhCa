CREATE DATABASE [QuanLyBenhCa]
GO

USE [QuanLyBenhCa]
GO
/****** Object:  Table [dbo].[BaiDang]    Script Date: 10/11/2024 3:07:30 CH ******/
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
/****** Object:  Table [dbo].[BenhCa]    Script Date: 10/11/2024 3:07:31 CH ******/
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
/****** Object:  Table [dbo].[BienPhapPhongNgua]    Script Date: 10/11/2024 3:07:31 CH ******/
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
/****** Object:  Table [dbo].[DanCa]    Script Date: 10/11/2024 3:07:31 CH ******/
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
/****** Object:  Table [dbo].[KetQuaChuanDoan]    Script Date: 10/11/2024 3:07:31 CH ******/
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
/****** Object:  Table [dbo].[LichSuBenh]    Script Date: 10/11/2024 3:07:31 CH ******/
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
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 10/11/2024 3:07:31 CH ******/
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
/****** Object:  Table [dbo].[NguoiNuoiCa]    Script Date: 10/11/2024 3:07:31 CH ******/
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
/****** Object:  Table [dbo].[PhuongPhapDieuTri]    Script Date: 10/11/2024 3:07:31 CH ******/
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
/****** Object:  Table [dbo].[TinTucDichBenh]    Script Date: 10/11/2024 3:07:31 CH ******/
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
/****** Object:  Table [dbo].[TrieuChungBenhCa]    Script Date: 10/11/2024 3:07:31 CH ******/
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
INSERT [dbo].[BaiDang] ([MaBD], [MoTa], [MaNNC]) VALUES (4, N'Gia đình tôi thích ăn một số loại cá như cá thu, hồi, tôm, cua... song lo ngại nhiễm độc thủy ngân nên hạn chế, điều này có nên? (Liên, 35 tuổi, Quảng Ninh)
Trả lời:
Cá là một trong những thực phẩm lành mạnh nhất cho sức khỏe, cung cấp nguồn axit béo omega-3, protein, vi chất dinh dưỡng và chất béo lành mạnh. Tuy nhiên, nhiều người lo ngại một số loại cá có thể chứa hàm lượng thủy ngân cao, gây độc cho cơ thể nên hạn chế ăn.

Thủy ngân là một kim loại nặng có trong không khí, nước và đất. Con người có thể tiếp xúc với chất độc này theo nhiều cách, như hít phải hơi thủy ngân trong quá trình khai thác mỏ và làm việc trong các hoạt động công nghiệp. Một số loại cá và động vật có vỏ nguy cơ hấp thụ một lượng nhỏ nồng độ thủy ngân trong nguồn nước bị ô nhiễm. Nhiều trường hợp bị phơi nhiễm thủy ngân do ăn phải thực phẩm nói trên.

Thực tế, các chuyên gia dinh dưỡng đều khuyến nghị mọi người nên ăn ít nhất hai khẩu phần cá mỗi tuần (khoảng 340 g). Song cần cẩn trọng với các loại chứa hàm lượng thủy ngân cao, ưu tiên chọn những loại an toàn hơn.

Nhìn chung, những loại cá lớn hơn và sống lâu hơn có xu hướng chứa nhiều thủy ngân, bao gồm: Cá mập, kiếm, cá ngừ tươi, cá marlin, cá thu vua. Những loài này có xu hướng ăn nhiều loại cá nhỏ hơn, bản thân những cá nhỏ này cũng đã chứa một lượng nhỏ thủy ngân. Vì chất này không dễ bài tiết ra khỏi cơ thể nên hàm lượng thủy ngân trong cá sẽ tích tụ theo thời gian.

Một số loại an toàn hơn bao gồm: cá hồi, cá cơm, cá mòi, cá thu, cá da trơn, tôm, cua, sò huyết.', 2)
GO
INSERT [dbo].[BenhCa] ([MaBC], [TenBC], [MoTaChiTietBenhCa]) VALUES (1, N'Bệnh trùng bánh xe trên cá', N'Nguyên nhân
Bệnh trùng bánh xe trên cá thường do trùng bánh xe gây ra. Đây là loại trùng ký sinh sống trên da và vây của cá. Bệnh thường phát triển nhanh chóng trong môi trường nước ô nhiễm. Bệnh có khả năng gây nhiễm trùng khi hệ thống miễn dịch của cá yếu hoặc khi cá bị tổn thương.

Triệu chứng
Khi cá mắc bệnh trùng bánh xe, chúng thường có những biểu hiện sau:

Trên thân cá xuất hiện nhớt trắng đục.
Da của cá chuyển sang màu xám.
Cá thường ngứa ngáy, khó chịu và nổi từng đám trên mặt nước.
Một số con cá tách ra khỏi đàn và bơi lơ đờ quanh ao.
Cá bệnh nặng có thể bơi không định hướng, lật bụng, chìm xuống đáy ao và sau cùng sẽ chết.
Cách phòng bệnh
Để phòng ngừa và điều trị bệnh trùng bánh xe trên cá, người nuôi cá cần áp dụng các biện pháp sau:

Quản lý chất lượng nước: Đảm bảo chất lượng nước trong ao nuôi luôn tốt. Bạn nên sử dụng hóa chất xử lý nước diệt khuẩn BKC 80% hoặc đồng Sulphate để phòng trị bệnh cá tốt nhất.
Kiểm soát lượng thức ăn: Cung cấp lượng thức ăn phù hợp, tránh tình trạng quá cảnh thức ăn và làm sạch thừa thức ăn trên ao.
Sử dụng thuốc phòng bệnh: Sử dụng thuốc kháng ký sinh và các sản phẩm hóa học phù hợp để ngăn chặn và điều trị bệnh khi phát hiện các triệu chứng ban đầu.
Kiểm tra và xử lý cá bệnh: Khi phát hiện cá bị bệnh, cần tách cá bệnh ra khỏi nhóm cá khỏe mạnh để tránh sự lây lan nhanh chóng.
Tăng cường vệ sinh ao nuôi: Định kỳ làm sạch và xử lý nước ao nuôi bằng đồng Sulphate để loại bỏ trùng bánh xe và giảm nguy cơ lây lan bệnh.')
INSERT [dbo].[BenhCa] ([MaBC], [TenBC], [MoTaChiTietBenhCa]) VALUES (2, N'Bệnh trùng mỏ neo ở cá', N'Nguyên nhân
Bệnh mỏ neo ở cá thường do ký sinh trùng Lernea (còn gọi là trùng mỏ neo) gây ra. Ký sinh trùng này có hình dạng giống chiếc mỏ neo của tàu thuyền, với cơ thể dài khoảng 8-16mm, có hình que và đầu có mấu. Khi ký sinh, nó cắm sâu vào cơ thể cá và ký sinh hút chất dinh dưỡng từ cá.

Triệu chứng
Khi cá bệnh mỏ neo, chúng thường thể hiện các dấu hiệu sau:

Da cá bị viêm và loét, đặc biệt ở vây, mang và xoang miệng.
Các vết loét này tạo điều kiện thuận lợi cho ký sinh trùng, nấm và vi khuẩn khác xâm nhập và gây bệnh.
Cá thường biểu hiện tình trạng ngứa ngáy, khó chịu và kém ăn.
Màu sắc da cá thay đổi, mất đi sắc màu bình thường.
Cá bơi lờ đờ và có phản ứng kém, yếu ớt, tình trạng nặng dẫn đến chết.
Cách phòng bệnh
Sau khi thu hoạch cá nên tháo sạch nước, bón vôi và phơi đáy ao 5-7 ngày. Sau đó có thể dùng TCCA hoặc Chlorine để xử lý nước trước khi thả cá giống.
Định kì xử lý nước bằng các sản phẩm diệt khuẩn, nấm, kí sinh trùng như Glutaraldehyde, BKC, Bronopol…và dùng các sản phẩm vi sinh Pro-B Powder, Pro-B Tablets xử lý đáy nước định kỳ, giúp cân bằng môi trường ao nuôi.
Không cho thức ăn quá nhiều, tránh dư thừa thức ăn làm môi trường nước ô nhiễm.
Bổ sung các khoáng chất, men tiêu hóa, vitamin để nâng cao sức đề kháng của cá.')
INSERT [dbo].[BenhCa] ([MaBC], [TenBC], [MoTaChiTietBenhCa]) VALUES (3, N'Bệnh đốm đỏ ở cá', N'Nguyên nhân
Bệnh đốm đỏ ở cá là một trong các bệnh của cá thường gặp. Bệnh thường xuất phát từ vi khuẩn hình que như Aeromonas hydrophila hoặc Pseudomonas. Vi khuẩn này thường phát triển trong môi trường nước ô nhiễm và có khả năng gây nhiễm trùng khi hệ thống miễn dịch của cá yếu hoặc khi cá bị tổn thương. Bệnh đốm đỏ thường gặp ở nuôi cá trắm cỏ.

Triệu chứng
Khi cá mắc bệnh đốm đỏ, chúng thường có những biểu hiện sau:

Giảm hoặc bỏ ăn, bơi lờ đờ trên mặt nước.
Da cá chuyển sang màu tối sẫm.
Xuất hiện các điểm xuất huyết đỏ trên thân cá.
Vẩy da rụng dạng mảng.
Gốc vây xuất hiện dấu hiệu xuất huyết và tia vây bị rách nát.
Các điểm xuất huyết thường kèm theo viêm, tấy, loét, có mủ và máu.
Xung quanh các điểm xuất huyết có nấm ký sinh.
Mắt của cá có thể lồi ra và xuất hiện xuất huyết.
Cá có thể tái nhợt hoặc xuất huyết.
Cách phòng bệnh
Để phòng ngừa và điều trị bệnh đốm đỏ ở cá, có một số biện pháp cần áp dụng:

Quản lý chất lượng nước: Đảm bảo chất lượng nước trong ao nuôi hoặc lồng nuôi luôn tốt, với độ pH và hàm lượng oxy phù hợp để hỗ trợ sức khỏe và hệ thống miễn dịch của cá.
Kiểm soát lượng thức ăn: Cung cấp lượng thức ăn phù hợp, tránh đưa quá nhiều thức ăn vào ao, đặc biệt trong môi trường nước không thuận lợi. Trong khẩu phần ăn cần bổ sung các loại vitamin như MIAVITA GOLD để tăng khả năng miễn dịch, sức đề kháng của cá.
Sử dụng vaccin phòng bệnh.
Kiểm tra và xử lý cá bệnh: Khi phát hiện cá bị bệnh, cần tách cá bệnh ra khỏi nhóm cá khỏe mạnh. Đối với cá giống thì dùng phương pháp tắm cho cá bằng kháng sinh, liều lượng và thời gian phụ thuộc vào mức độ bệnh của cá. Đối với cá thịt: trộn kháng sinh cho ăn trong vòng 5-7 ngày. Xử lý nước diệt khuẩn, kí sinh trùng, nấm bằng các sản phẩm như BKC, Glutaraldehyde, Lodine, Bronopol. Bổ sung thêm các sản phẩm men đường ruột Rosszyme, bổ gan Herbaliv, các loại vitamin để tăng cường sức đề kháng, hệ tiêu hóa, chức năng gan và mật của cá.
')
GO
INSERT [dbo].[BienPhapPhongNgua] ([MaBPPN], [TenBPPN], [MaBenhCa]) VALUES (2, N'Sau khi thu hoạch cá nên tháo sạch nước, bón vôi và phơi đáy ao 5-7 ngày. Sau đó có thể dùng TCCA hoặc Chlorine để xử lý nước trước khi thả cá giống.
Định kì xử lý nước bằng các sản phẩm diệt khuẩn, nấm, kí sinh trùng như Glutaraldehyde, BKC, Bronopol…và dùng các sản phẩm vi sinh Pro-B Powder, Pro-B Tablets xử lý đáy nước định kỳ, giúp cân bằng môi trường ao nuôi.
Không cho thức ăn quá nhiều, tránh dư thừa thức ăn làm môi trường nước ô nhiễm.
Bổ sung các khoáng chất, men tiêu hóa, vitamin để nâng cao sức đề kháng của cá.', 2)
INSERT [dbo].[BienPhapPhongNgua] ([MaBPPN], [TenBPPN], [MaBenhCa]) VALUES (3, N'Để phòng ngừa và điều trị bệnh đốm đỏ ở cá, có một số biện pháp cần áp dụng:  Quản lý chất lượng nước: Đảm bảo chất lượng nước trong ao nuôi hoặc lồng nuôi luôn tốt, với độ pH và hàm lượng oxy phù hợp để hỗ trợ sức khỏe và hệ thống miễn dịch của cá. Kiểm soát lượng thức ăn: Cung cấp lượng thức ăn phù hợp, tránh đưa quá nhiều thức ăn vào ao, đặc biệt trong môi trường nước không thuận lợi. Trong khẩu phần ăn cần bổ sung các loại vitamin như MIAVITA GOLD để tăng khả năng miễn dịch, sức đề kháng của cá. Sử dụng vaccin phòng bệnh. Kiểm tra và xử lý cá bệnh: Khi phát hiện cá bị bệnh, cần tách cá bệnh ra khỏi nhóm cá khỏe mạnh. Đối với cá giống thì dùng phương pháp tắm cho cá bằng kháng sinh, liều lượng và thời gian phụ thuộc vào mức độ bệnh của cá. Đối với cá thịt: trộn kháng sinh cho ăn trong vòng 5-7 ngày. Xử lý nước diệt khuẩn, kí sinh trùng, nấm bằng các sản phẩm như BKC, Glutaraldehyde, Lodine, Bronopol. Bổ sung thêm các sản phẩm men đường ruột Rosszyme, bổ gan Herbaliv, các loại vitamin để tăng cường sức đề kháng, hệ tiêu hóa, chức năng gan và mật của cá.', 3)
INSERT [dbo].[BienPhapPhongNgua] ([MaBPPN], [TenBPPN], [MaBenhCa]) VALUES (4, N'Để phòng ngừa và điều trị bệnh trùng bánh xe trên cá, người nuôi cá cần áp dụng các biện pháp sau:

Quản lý chất lượng nước: Đảm bảo chất lượng nước trong ao nuôi luôn tốt. Bạn nên sử dụng hóa chất xử lý nước diệt khuẩn BKC 80% hoặc đồng Sulphate để phòng trị bệnh cá tốt nhất.
Kiểm soát lượng thức ăn: Cung cấp lượng thức ăn phù hợp, tránh tình trạng quá cảnh thức ăn và làm sạch thừa thức ăn trên ao.
Sử dụng thuốc phòng bệnh: Sử dụng thuốc kháng ký sinh và các sản phẩm hóa học phù hợp để ngăn chặn và điều trị bệnh khi phát hiện các triệu chứng ban đầu.
Kiểm tra và xử lý cá bệnh: Khi phát hiện cá bị bệnh, cần tách cá bệnh ra khỏi nhóm cá khỏe mạnh để tránh sự lây lan nhanh chóng.
Tăng cường vệ sinh ao nuôi: Định kỳ làm sạch và xử lý nước ao nuôi bằng đồng Sulphate để loại bỏ trùng bánh xe và giảm nguy cơ lây lan bệnh.', 1)
GO
INSERT [dbo].[DanCa] ([MaDC], [TenDanCa], [SoLuong], [TrangThai], [MaNNC]) VALUES (1, N'Ðàn cá Koi', 150, N'Tốt', 2)
INSERT [dbo].[DanCa] ([MaDC], [TenDanCa], [SoLuong], [TrangThai], [MaNNC]) VALUES (2, N'Ðàn cá vàng', 200, N'Bình Thường', 2)
GO
INSERT [dbo].[KetQuaChuanDoan] ([MaBC], [MaTCBC]) VALUES (1, 1)
INSERT [dbo].[KetQuaChuanDoan] ([MaBC], [MaTCBC]) VALUES (1, 2)
INSERT [dbo].[KetQuaChuanDoan] ([MaBC], [MaTCBC]) VALUES (1, 3)
INSERT [dbo].[KetQuaChuanDoan] ([MaBC], [MaTCBC]) VALUES (2, 3)
GO
INSERT [dbo].[LichSuBenh] ([NgayPhatHien], [KetQuaDieuTri], [MaDC], [MaBC]) VALUES (CAST(N'2024-04-10' AS Date), N'Khỏi hoàn toàn', 1, 1)
INSERT [dbo].[LichSuBenh] ([NgayPhatHien], [KetQuaDieuTri], [MaDC], [MaBC]) VALUES (CAST(N'2024-05-15' AS Date), N'Đang điều trị', 2, 2)
GO
INSERT [dbo].[NguoiDung] ([MaND], [TenND], [MatKhau], [QuyenNguoiDung]) VALUES (1, N'admin', N'admin123', N'admin')
INSERT [dbo].[NguoiDung] ([MaND], [TenND], [MatKhau], [QuyenNguoiDung]) VALUES (2, N'user', N'user123', N'user')
INSERT [dbo].[NguoiDung] ([MaND], [TenND], [MatKhau], [QuyenNguoiDung]) VALUES (3, N'abc', N'abc', N'user')
INSERT [dbo].[NguoiDung] ([MaND], [TenND], [MatKhau], [QuyenNguoiDung]) VALUES (4, N'xyz', N'xyz', N'user')
GO
INSERT [dbo].[NguoiNuoiCa] ([MaNNC], [HoTenNNC], [Email], [SDT], [DiaChi], [MaND]) VALUES (1, N'Trần Thị Bích', N'tranthib@example.com', N'0987654321', N'Hồ Chí Minh', 2)
INSERT [dbo].[NguoiNuoiCa] ([MaNNC], [HoTenNNC], [Email], [SDT], [DiaChi], [MaND]) VALUES (2, N'Huỳnh Hữu Đức', N'huynhhuuduc5031@gmail.com', N'0123456798', N'Hồ Chí Minh', 1)
GO
INSERT [dbo].[PhuongPhapDieuTri] ([MaPPDT], [TenPPDT], [MaBenhCa]) VALUES (1, N'Điều trị bệnh trùng bánh xe', 1)
INSERT [dbo].[PhuongPhapDieuTri] ([MaPPDT], [TenPPDT], [MaBenhCa]) VALUES (2, N'Điều trị bệnh trùng mỏ neo', 2)
INSERT [dbo].[PhuongPhapDieuTri] ([MaPPDT], [TenPPDT], [MaBenhCa]) VALUES (3, N'Trường hợp 1: Cá đơn thuần nhiễm ký sinh trùng
+ Cắt mồi và xử lý kí sinh DE AGA, lưu ý dùng khi nước đứng hoặc bao xung quanh bè để xử lý hiệu quả.
+ Giảm 50-70% thức ăn và kết hợp sử dụng VB-PRAZI_concentrated + GATONIC pro, 2 ngày liên tiếp.
+ Sau khi xổ sử dụng BIO-X_pro (1L/15 tấn cá) để tăng cường hỗ trợ vi sinh tiêu hóa, chức năng gan.', 3)
GO
INSERT [dbo].[TinTucDichBenh] ([MaTTDB], [TenTTDB], [NgayDang], [MoTa], [MaBC]) VALUES (1, N'Tin tức về bệnh đốm đỏ trên cá', CAST(N'2024-11-10' AS Date), N'Bệnh đốm đỏ là gì?
Bệnh đốm đỏ gọi là bệnh viêm ruột ở cá, một bệnh nguy hiểm trên cá. Bệnh thường gặp ở cá trên 1 tuổi, nên còn gọi bệnh viêm ruột cá 2 tuổi và là loại bệnh đường ruột. Bệnh có thể xuất hiện quanh năm nhưng thường gặp vào 2 mùa chính là tháng 3-4 và tháng 7-8 trong năm.

Dấu hiệu bệnh lý
Cá kém ăn hoặc bỏ ăn, xuất hiện các đốm đỏ lở loét trên thân, vẩy rụng, cá mất nhớt, khô ráp, vây xuất huyết, rách nát cụt dần; xuất huyết từng đốm nhỏ trên da, xung quanh miệng và nắp mang, phía mặt bụng.', 3)
INSERT [dbo].[TinTucDichBenh] ([MaTTDB], [TenTTDB], [NgayDang], [MoTa], [MaBC]) VALUES (2, N'Tin tức về bệnh trùng mỏ neo trên cá', CAST(N'2024-11-10' AS Date), N'Bệnh ký sinh trùng nói chung và bệnh trùng mỏ neo nói riêng là bệnh thường gặp trên các loại cá nuôi như: cá trắm, cá chép, cá trôi, cá rô phi...và các loại cá cảnh như: cá koi, cá chép nhật, cá rồng, cá chép koi, cá đĩa.. Việc phòng trị bệnh trùng mỏ neo, trùng bánh xe, ký sinh trùng làm cho đàn cá nuôi khỏe mạnh mau lớn. tuy nhiên việc phòng trị trùng mỏ neo, ký sinh trùng như thế nào ? và dùng thuốc gì để trị trùng mỏ neo cho cá ? mua thuốc đặc trị ký sinh trùng, trùng mỏ neo ở đâu ? là những câu hỏi sẽ được giải đáp trong bài viết này:', 2)
INSERT [dbo].[TinTucDichBenh] ([MaTTDB], [TenTTDB], [NgayDang], [MoTa], [MaBC]) VALUES (3, N'Bệnh trùng mỏ neo', CAST(N'2024-11-10' AS Date), N'Bệnh ký sinh trùng nói chung và bệnh trùng mỏ neo nói riêng là bệnh thường gặp trên các loại cá nuôi như: cá trắm, cá chép, cá trôi, cá rô phi...và các loại cá cảnh như: cá koi, cá chép nhật, cá rồng, cá chép koi, cá đĩa.. Việc phòng trị bệnh trùng mỏ neo, trùng bánh xe, ký sinh trùng làm cho đàn cá nuôi khỏe mạnh mau lớn. tuy nhiên việc phòng trị trùng mỏ neo, ký sinh trùng như thế nào ? và dùng thuốc gì để trị trùng mỏ neo cho cá ? mua thuốc đặc trị ký sinh trùng, trùng mỏ neo ở đâu ? là những câu hỏi sẽ được giải đáp trong bài viết này:', 2)
INSERT [dbo].[TinTucDichBenh] ([MaTTDB], [TenTTDB], [NgayDang], [MoTa], [MaBC]) VALUES (4, N'Tin tức bệnh trùng bánh xe ở cá', CAST(N'2024-11-10' AS Date), N'Bệnh ở cá cũng như bệnh ở các động vật thuỷ sản khác xảy ra là do sự tương tác giữa vật chủ có tính mẫn cảm với bệnh, trong điều kiện môi trường không thuận lợi, cùng với sinh vật gây bệnh có sẵn trong môi trường cũng như cơ thể cá. Bệnh trùng bánh xe là một trong những bệnh mà các hộ nuôi trồng gặp phải. Hãy cùng BIO CHEM tìm hiểu về vấn đề và cách phòng trị bệnh ở bài viết dưới đây nhé.

Biểu hiện của bệnh trùng bánh xe
Khi mới mắc bệnh trên thân cá có nhiều nhớt màu hơi trắng đục, ở dưới nước thấy rõ hơn khi bắt cá lên cạn. Da cá chuyển màu xám, cá thường có nổi từng đàn trên mặt nước và thích tập trung nơi nước chảy. Thích cọ mình vào thành bể và cây cỏ cảm giác như ngứa ngáy, riêng cá tra giống thường nhô hẳn đầu lên trên mặt nước và lắc mạnh.', 1)
GO
INSERT [dbo].[TrieuChungBenhCa] ([MaTCBC], [TenTrieuChung]) VALUES (1, N'Phân trắng')
INSERT [dbo].[TrieuChungBenhCa] ([MaTCBC], [TenTrieuChung]) VALUES (2, N'Da nhợt nhạt')
INSERT [dbo].[TrieuChungBenhCa] ([MaTCBC], [TenTrieuChung]) VALUES (3, N'Bụng sưng to')
INSERT [dbo].[TrieuChungBenhCa] ([MaTCBC], [TenTrieuChung]) VALUES (4, N'Trên thân cá xuất hiện nhớt trắng đục.')
INSERT [dbo].[TrieuChungBenhCa] ([MaTCBC], [TenTrieuChung]) VALUES (6, N'Cá thường ngứa ngáy, khó chịu và nổi từng đám trên mặt nước.')
INSERT [dbo].[TrieuChungBenhCa] ([MaTCBC], [TenTrieuChung]) VALUES (7, N'Một số con cá tách ra khỏi đàn và bơi lơ đờ quanh ao.')
INSERT [dbo].[TrieuChungBenhCa] ([MaTCBC], [TenTrieuChung]) VALUES (11, N'Màu sắc da cá thay đổi, mất đi sắc màu bình thường.')
INSERT [dbo].[TrieuChungBenhCa] ([MaTCBC], [TenTrieuChung]) VALUES (12, N'Cá bơi lờ đờ và có phản ứng kém, yếu ớt')
INSERT [dbo].[TrieuChungBenhCa] ([MaTCBC], [TenTrieuChung]) VALUES (13, N'Giảm hoặc bỏ ăn, bơi lờ đờ trên mặt nước.')
GO
/****** Object:  Index [UQ_BienPhapPhongNgua_MaBenhCa]    Script Date: 10/11/2024 3:07:42 CH ******/
ALTER TABLE [dbo].[BienPhapPhongNgua] ADD  CONSTRAINT [UQ_BienPhapPhongNgua_MaBenhCa] UNIQUE NONCLUSTERED 
(
	[MaBenhCa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ_PhuongPhapDieuTri_MaBenhCa]    Script Date: 10/11/2024 3:07:42 CH ******/
ALTER TABLE [dbo].[PhuongPhapDieuTri] ADD  CONSTRAINT [UQ_PhuongPhapDieuTri_MaBenhCa] UNIQUE NONCLUSTERED 
(
	[MaBenhCa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
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
ALTER TABLE [dbo].[NguoiNuoiCa]  WITH CHECK ADD FOREIGN KEY([MaND])
REFERENCES [dbo].[NguoiDung] ([MaND])
GO
ALTER TABLE [dbo].[PhuongPhapDieuTri]  WITH CHECK ADD FOREIGN KEY([MaBenhCa])
REFERENCES [dbo].[BenhCa] ([MaBC])
GO
ALTER TABLE [dbo].[TinTucDichBenh]  WITH CHECK ADD FOREIGN KEY([MaBC])
REFERENCES [dbo].[BenhCa] ([MaBC])
GO
