USE [master]
GO
/****** Object:  Database [TRACNGHIEM]    Script Date: 08/11/2024 15:28:51 ******/
CREATE DATABASE [TRACNGHIEM]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TRACNGHIEM', FILENAME = N'D:\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\TRACNGHIEM.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TRACNGHIEM_log', FILENAME = N'D:\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\TRACNGHIEM_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [TRACNGHIEM] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TRACNGHIEM].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TRACNGHIEM] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TRACNGHIEM] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TRACNGHIEM] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TRACNGHIEM] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TRACNGHIEM] SET ARITHABORT OFF 
GO
ALTER DATABASE [TRACNGHIEM] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TRACNGHIEM] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TRACNGHIEM] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TRACNGHIEM] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TRACNGHIEM] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TRACNGHIEM] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TRACNGHIEM] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TRACNGHIEM] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TRACNGHIEM] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TRACNGHIEM] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TRACNGHIEM] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TRACNGHIEM] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TRACNGHIEM] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TRACNGHIEM] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TRACNGHIEM] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TRACNGHIEM] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TRACNGHIEM] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TRACNGHIEM] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TRACNGHIEM] SET  MULTI_USER 
GO
ALTER DATABASE [TRACNGHIEM] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TRACNGHIEM] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TRACNGHIEM] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TRACNGHIEM] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TRACNGHIEM] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TRACNGHIEM] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [TRACNGHIEM] SET QUERY_STORE = ON
GO
ALTER DATABASE [TRACNGHIEM] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [TRACNGHIEM]
GO
/****** Object:  Table [dbo].[BAILAM]    Script Date: 08/11/2024 15:28:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BAILAM](
	[CauSo] [int] NULL,
	[MaSV] [char](12) NOT NULL,
	[MaHP] [varchar](10) NULL,
	[MaCH] [varchar](10) NOT NULL,
	[NoiDung] [nvarchar](4000) NULL,
	[DapAn] [char](1) NULL,
	[TraLoi] [char](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CAUHOI]    Script Date: 08/11/2024 15:28:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CAUHOI](
	[MaCH] [varchar](10) NOT NULL,
	[MaHP] [varchar](10) NULL,
	[NoiDung] [nvarchar](4000) NULL,
	[DapAn] [char](1) NULL,
 CONSTRAINT [PK_CAUHOI] PRIMARY KEY CLUSTERED 
(
	[MaCH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GIANGVIEN]    Script Date: 08/11/2024 15:28:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GIANGVIEN](
	[MaGV] [varchar](10) NOT NULL,
	[HoDem] [nvarchar](30) NULL,
	[Ten] [nvarchar](10) NULL,
	[MatKhau] [varchar](20) NULL,
	[Khoa] [nvarchar](100) NULL,
	[VaiTro] [int] NULL,
 CONSTRAINT [PK_GIANGVIEN] PRIMARY KEY CLUSTERED 
(
	[MaGV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KETQUA]    Script Date: 08/11/2024 15:28:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KETQUA](
	[MaSV] [char](12) NOT NULL,
	[MaHP] [varchar](10) NOT NULL,
	[TenHP] [nvarchar](100) NULL,
	[SoCau] [int] NOT NULL,
	[TGLamBai] [int] NULL,
	[NgayThi] [date] NULL,
	[GioThi] [time](0) NULL,
	[Diem] [float] NULL,
	[LanThi] [int] NULL,
	[TGNopBai] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MONTHI]    Script Date: 08/11/2024 15:28:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MONTHI](
	[MaHP] [varchar](10) NOT NULL,
	[TenHP] [nvarchar](100) NULL,
	[SoCau] [int] NOT NULL,
	[TGLamBai] [int] NULL,
	[NgayThi] [date] NULL,
	[GioThi] [time](0) NULL,
 CONSTRAINT [PK_MONTHI] PRIMARY KEY CLUSTERED 
(
	[MaHP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SINHVIEN]    Script Date: 08/11/2024 15:28:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SINHVIEN](
	[MaSV] [char](12) NOT NULL,
	[HoDem] [nvarchar](30) NULL,
	[Ten] [nvarchar](10) NULL,
	[NgaySinh] [date] NULL,
	[MatKhau] [varchar](20) NULL,
	[Lop] [varchar](10) NULL,
	[Nganh] [nvarchar](100) NULL,
	[VaiTro] [int] NULL,
 CONSTRAINT [PK_SINHVIEN] PRIMARY KEY CLUSTERED 
(
	[MaSV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (1, N'21111063239 ', N'NNTA103', N'NNTA103036', N'Tìm lỗi sai trong câu sau:
Little have people done to alleviate the sea pollution caused by the factories in central Vietnam, haven’t they?
A. have people done     
B. caused
C. in central     
D. haven’t they', N'D', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (20, N'21111063239 ', N'NNTA103', N'NNTA103038', N'Tìm lỗi sai trong câu sau:
Unlike the old one, this new copier can perform their functions in half the time.
A. unlike     
B. can perform
C. their functions     
D. in half the time', N'C', N'D')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (1, N'21111063120 ', N'NNTA103', N'NNTA103025', N'Tìm lỗi sai trong câu sau:
It is vitally important that she takes this medication night and morning.
A. vitally     
B. that     
C. takes     
D. medication', N'C', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (2, N'21111063120 ', N'NNTA103', N'NNTA103005', N'Tìm lỗi sai trong câu sau:
A novel is a story long enough to fill a complete book, in that the characters and events are usually imaginary.
A. long enough      
B. complete     
C. that     
D. imaginary', N'C', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (3, N'21111063120 ', N'NNTA103', N'NNTA103059', N'Tìm lỗi sai trong câu sau:
The two children tried as hardly as they could to bring about a reconciliation between their parents.
A. children      
B. hardly     
C. between      
D. to bring about', N'B', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (4, N'21111063120 ', N'NNTA103', N'NNTA103008', N'Tìm lỗi sai trong câu sau:
Not until he got home he realized he had forgotten to give her the present.
A. got     
B. he realized     
C. her     
D. the present', N'B', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (5, N'21111063120 ', N'NNTA103', N'NNTA103031', N'Tìm lỗi sai trong câu sau:
For thousands of years, man has created sweet-smelling substances from wood, herbs and flowers and using them for perfumes or medicine.
A. man     
B. sweet-smelling     
C. using them     
D. or', N'C', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (4, N'21111063145 ', N'CTKM107', N'CTKM107056', N'Số 247(10) tương ứng với giá trị nhị phân nào trong các giá trị sau đây: 
A. 10001011(2) 
B. 11100111(2) 
C. 11110111(2)
D. 11010111(2)', N'C', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (6, N'21111063120 ', N'NNTA103', N'NNTA103046', N'Tìm lỗi sai trong câu sau:
English is speaking in many countries in the world.
A. English      
B. speaking      
C. many countries     
D. the world', N'B', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (7, N'21111063120 ', N'NNTA103', N'NNTA103056', N'Tìm lỗi sai trong câu sau:
In most countries music songs are deeply personal and deal with themes of love, lonely, and separation.
A. most countries      
B. deeply     
C. deal with      
D. lonely', N'D', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (8, N'21111063120 ', N'NNTA103', N'NNTA103035', N'Tìm lỗi sai trong câu sau:
Sometimes it takes me about three hours finishing my round.
A. sometimes     
B. me     
C. hours     
D. finishing', N'D', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (9, N'21111063120 ', N'NNTA103', N'NNTA103019', N'Tìm lỗi sai trong câu sau:
If you work hard, you would be successful in anything you do.
A. you work     
B. would be     
C. in     
D. anything', N'B', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (10, N'21111063120 ', N'NNTA103', N'NNTA103015', N'Tìm lỗi sai trong câu sau:
Each of the beautiful cars in the shop was quickly sold to their owner
A. Each     
B. cars     
C. quickly     
D. their', N'D', N' ')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (11, N'21111063120 ', N'NNTA103', N'NNTA103020', N'Tìm lỗi sai trong câu sau:
Mrs. Loan, along with her talented students, are going to be on the summer camp to USA.
A. along with     
B. talented     
C. are going     
D. summer', N'C', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (12, N'21111063120 ', N'NNTA103', N'NNTA103055', N'Tìm lỗi sai trong câu sau:
A dangerously situation was created by the bad roads.
A. dangerously      
B. was      
C. created      
D. bad roads', N'A', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (13, N'21111063120 ', N'NNTA103', N'NNTA103006', N'Tìm lỗi sai trong câu sau:
The leader demanded from his members a serious attitude towards work, good team spirit, and that they work hard.
A. leader      
B. his members  
C. attitude     
D. that they work hard', N'D', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (14, N'21111063120 ', N'NNTA103', N'NNTA103045', N'Tìm lỗi sai trong câu sau:
Paris is much more exciting as I expected.
A. much      
B. exciting      
C. as      
D. expected', N'A', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (17, N'21111063120 ', N'NNTA103', N'NNTA103003', N'Tìm lỗi sai trong câu sau:
Developing new technologies are time-consuming and expensive.
A. developing      
B. technologies      
C. are      
D. time-consuming', N'C', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (18, N'21111063120 ', N'NNTA103', N'NNTA103043', N'Tìm lỗi sai trong câu sau:
I’m not used to go to school late. I prefer punctuation.
A. I’m not used to     
B. go
C. late     
D. prefer', N'B', N' ')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (22, N'21111063120 ', N'NNTA103', N'NNTA103048', N'Tìm lỗi sai trong câu sau:
He is the second person be killed in that way.
A. is      
B. the      
C. be killed      
D. way', N'C', N'D')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (21, N'21111063239 ', N'NNTA103', N'NNTA103025', N'Tìm lỗi sai trong câu sau:
It is vitally important that she takes this medication night and morning.
A. vitally     
B. that     
C. takes     
D. medication', N'C', N'D')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (22, N'21111063239 ', N'NNTA103', N'NNTA103056', N'Tìm lỗi sai trong câu sau:
In most countries music songs are deeply personal and deal with themes of love, lonely, and separation.
A. most countries      
B. deeply     
C. deal with      
D. lonely', N'D', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (23, N'21111063239 ', N'NNTA103', N'NNTA103044', N'Tìm lỗi sai trong câu sau:
Despite the long history of the rights of property ownership, there have been a great deal of disagreement over what such rights entail.
A. what such rights entail     
B. have been
C. Despite      
D. a great deal of', N'B', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (24, N'21111063239 ', N'NNTA103', N'NNTA103002', N'The substance is very toxic. Protective clothing must be worn at all times.

A. Since the substance is very toxic, so protective clothing must be worn at all times.

B. So toxic is the substance that protective clothing must be worn at all times.

C. The substance is such toxic that protective clothing must be worn at all times.

D. The substance is too toxic to wear protective clothing at all times.', N'B', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (25, N'21111063239 ', N'NNTA103', N'NNTA103011', N'Tìm lỗi sai trong câu sau:
People in every part of the world readily and easily communicates by means of electronic mail.
A. every part     
B. readlily     
C. communicates     
D. by means', N'C', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (5, N'21111063145 ', N'CTKM107', N'CTKM107032', N'Trong hệ La mã số LD nhận giá trị thập phân nào trong các giá trị sau đây: 
A. 350 
B. 450
C. 550 
D. 650', N'B', N' ')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (6, N'21111063145 ', N'CTKM107', N'CTKM107070', N'Tổng hai số nhị phân 1001101(2) và 1101001(2) bằng số nhị phân nào trong các số sau: 
A. 10010010(2) 
B. 10100000(2) 
C. 10110110(2)
D. 10001000(2)', N'C', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (1, N'21111063171 ', N'CTKM107', N'CTKM107071', N'Tích hai số nhị phân 110(2) và 1011(2) bằng số nhị phân nào trong các số sau: A. 1000010(2)
B. 1010000(2) 
C. 1010110(2) 
D. 1001000(2)', N'A', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (2, N'21111063171 ', N'CTKM107', N'CTKM107061', N'Số 799(10) tương ứng với giá trị bát phân nào trong các giá trị sau đây: 
A. 1545(8) 
B. 1403(8) 
C. 1437(8) 
D. 1565(8)', N'C', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (3, N'21111063171 ', N'CTKM107', N'CTKM107051', N'Trong hệ đếm thập lục phân số 34F5(16) tương ứng với giá trị thập phân nào trong các giá trị sau đây: 
A. 13557 
B. 15775 
C. 15459 
D. 13267', N'A', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (4, N'21111063171 ', N'CTKM107', N'CTKM107043', N'Trong hệ nhị phân số 11101.01(2) tương ứng với giá trị thập phân nào trong các giá trị sau đây: 
A. 27.75 
B. 29.75 
C. 27.25 
D. 29.25', N'D', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (5, N'21111063171 ', N'CTKM107', N'CTKM107021', N'Trong hệ đếm thập phân, giá trị của mỗi con số phụ thuộc vào: 
A. Bản thân chữ số đó 
B. Vị trí của nó 
C. Bản thân chữ số đó và vị trí của nó
D. Mối quan hệ với các chữ số trước và sau nó', N'C', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (6, N'21111063171 ', N'CTKM107', N'CTKM107031', N'Trong hệ La mã số DC nhận giá trị thập phân nào trong các giá trị sauđây: 
A. 600
B. 400 
C. 500 
D. 200', N'A', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (7, N'21111063171 ', N'CTKM107', N'CTKM107091', N'Bus nào trong máy tính có nhiệm vụ là đường truyền dẫn giữa CPU và các chip hỗ trợ trung gian?
A.Bus trong bộ vi xử lý
B.Bus bộ vi xử lý
C.Bus ngoại vi
D.Bus hệ thống', N'B', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (8, N'21111063171 ', N'CTKM107', N'CTKM107038', N'Trong hệ La mã số MCD nhận giá trị thập phân nào trong các giá trị sau đây: A. 1400
B. 1450 
C. 1600 
D. 1650', N'A', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (9, N'21111063171 ', N'CTKM107', N'CTKM107087', N'Mã NBCD biểu diễn mỗi chữ số thập phân bằng bao nhiêu bit? 
A. 3 bit 
B. 4 bit 
C. 6 bit 
D. 8 bit', N'B', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (10, N'21111063171 ', N'CTKM107', N'CTKM107068', N'Tổng hai số nhị phân 1011101(2) và 1101011(2) bằng số nhị phân nào trong các số sau: 
A. 10011000(2) 
B. 11100000(2) 
C. 11010000(2) 
D. 11001000(2)', N'D', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (11, N'21111063171 ', N'CTKM107', N'CTKM107002', N'Máy tính đầu tiên ENIAC sử dụng linh kiện nào trong số các linh kiện sau?
A. Transistor lưỡng cực 
B. Transistor trường 
C. Đèn điện tử 
D. IC bán dẫn', N'C', N'D')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (12, N'21111063171 ', N'CTKM107', N'CTKM107072', N'Tích hai số nhị phân 1110(2) và 1011(2) bằng số nhị phân nào trong các số sau: 
A. 10000110(2) 
B. 10011010(2)
C. 10101010(2) 
D. 10010010(2)', N'B', N'D')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (15, N'21111063171 ', N'CTKM107', N'CTKM107059', N'Số 899(10) tương ứng với giá trị bát phân nào trong các giá trị sau đây: 
A. 1505(8) 
B. 1603(8)
C. 1607(8) 
D. 1705(8)', N'B', N'D')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (16, N'21111063171 ', N'CTKM107', N'CTKM107075', N'Tích hai số nhị phân 1101(2) và 1010(2) bằng số nhị phân nào trong các số sau: 
A. 10000110(2) 
B. 10000010(2)
C. 10100110(2) 
D. 10010010(2)', N'B', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (15, N'21111063120 ', N'NNTA103', N'NNTA103017', N'Tìm lỗi sai trong câu sau:
After spending two days arguing about where to go for their holidays, is was decided that they shouldn’t go anywhere.
A. arguing     
B. for     
C. is was decided     
D. shouldn’t go', N'C', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (16, N'21111063120 ', N'NNTA103', N'NNTA103042', N'Tìm lỗi sai trong câu sau:
Higher education in the United States specifically refers to post -secondary institutions, that offer associate degrees, master degrees or Ph.d. degrees or equivalents.
A. specifically refers      
B. institutions      
C. that      
D. or equivalents', N'C', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (19, N'21111063120 ', N'NNTA103', N'NNTA103022', N'Tìm lỗi sai trong câu sau:
It is important that cancer is diagnosed and treated as early as possible in order to assure a successful cure.
A. is diagnosed     
B. treated
C. as early as possible     
D. to assure', N'A', N'D')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (20, N'21111063120 ', N'NNTA103', N'NNTA103057', N'Tìm lỗi sai trong câu sau:
One of the best ways to encourage your children to read are to provide interesting titles for them to enjoy.
A. the best      
B. to read     
C. are      
D. for', N'C', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (21, N'21111063120 ', N'NNTA103', N'NNTA103011', N'Tìm lỗi sai trong câu sau:
People in every part of the world readily and easily communicates by means of electronic mail.
A. every part     
B. readlily     
C. communicates     
D. by means', N'C', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (23, N'21111063120 ', N'NNTA103', N'NNTA103021', N'Tìm lỗi sai trong câu sau:
Most bothersome flies belong to the family Sarcophagidae and are popular known as flesh flies because the larvae feed on flesh.
A. belong to     
B. popular known     
C. because     
D. feed on', N'B', N'D')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (25, N'21111063120 ', N'NNTA103', N'NNTA103053', N'Tìm lỗi sai trong câu sau:
The telephone rang several times and then stop before I could answer it.
A. times      
B. then      
C. stop      
D. could', N'C', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (1, N'21111063239 ', N'CTKM107', N'CTKM107032', N'Trong hệ La mã số LD nhận giá trị thập phân nào trong các giá trị sau đây: 
A. 350 
B. 450
C. 550 
D. 650', N'B', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (2, N'21111063239 ', N'CTKM107', N'CTKM107069', N'Kết quả cộng hai số nhị phân 1010111(2) và 1101011(2) bằng số nhị phân nào trong các số sau: 
A. 10011000(2) 
B. 11000010(2)
C. 10010000(2) 
D. 10001000(2)', N'B', N' ')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (1, N'21111063117 ', N'NNTA103', N'NNTA103048', N'Tìm lỗi sai trong câu sau:
He is the second person be killed in that way.
A. is      
B. the      
C. be killed      
D. way', N'C', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (7, N'21111063145 ', N'CTKM107', N'CTKM107098', N'Cấu tạo của một ô nhớ SRAM như thế nào?
A.Gồm hai tụ điện và ba Transistor 
B.Gồm ba tụ điện và hai Transistor 
C.Gồm bốn tụ điện và hai Transistor 
D.Gồm sáu Transistor', N'D', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (9, N'21111063145 ', N'CTKM107', N'CTKM107051', N'Trong hệ đếm thập lục phân số 34F5(16) tương ứng với giá trị thập phân nào trong các giá trị sau đây: 
A. 13557 
B. 15775 
C. 15459 
D. 13267', N'A', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (10, N'21111063145 ', N'CTKM107', N'CTKM107093', N'Bus nào trong máy tính có nhiệm vụ kết nối bộ vi xử lý với bộ nhớ chính và bộ nhớ Cache?
A.Bus trong bộ vi xử lý
B.Bus bộ vi xử lý
C.Bus ngoại vi
D.Bus hệ thống', N'D', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (2, N'21111063117 ', N'NNTA103', N'NNTA103029', N'Tìm lỗi sai trong câu sau:
After the police had tried unsuccessfully to determine to who the car belonged, they towed it to the station.
A. the police     
B. unsuccessfully     
C. who     
D. it to', N'C', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (3, N'21111063117 ', N'NNTA103', N'NNTA103045', N'Tìm lỗi sai trong câu sau:
Paris is much more exciting as I expected.
A. much      
B. exciting      
C. as      
D. expected', N'A', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (4, N'21111063117 ', N'NNTA103', N'NNTA103047', N'Tìm lỗi sai trong câu sau:
Chemical engineering is based in the principles of physics, chemistry, and mathematics.
A. in      
B. principles      
C. chemistry      
D. mathematics', N'A', N'D')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (5, N'21111063117 ', N'NNTA103', N'NNTA103004', N'Tìm lỗi sai trong câu sau:
The assumption that smoking has bad effects on our health have been proved.
A. that      
B. effects      
C. on      
D. have been proved', N'D', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (6, N'21111063117 ', N'NNTA103', N'NNTA103043', N'Tìm lỗi sai trong câu sau:
I’m not used to go to school late. I prefer punctuation.
A. I’m not used to     
B. go
C. late     
D. prefer', N'B', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (9, N'21111063117 ', N'NNTA103', N'NNTA103051', N'Tìm lỗi sai trong câu sau:
Dogs that are trained to lead the blind must be loyalty, intelligent and calm.
A. dogs that     
B. trained      
C. the      
D. loyalty', N'D', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (24, N'21111063120 ', N'NNTA103', N'NNTA103060', N'Tìm lỗi sai trong câu sau:
Education, whether it happens at school or anywhere else, is a important part in our life.
A. Education      
B. whether      
C. or      
D. a important part', N'D', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (1, N'21111063145 ', N'NNTA103', N'NNTA103027', N'Tìm lỗi sai trong câu sau:
The number of women earning Master''s Degrees have risen sharply in recent years.
A. number     
B. earning     
C. have risen     
D. recent years', N'C', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (2, N'21111063145 ', N'NNTA103', N'NNTA103050', N'Tìm lỗi sai trong câu sau:
The most sensitive way to resolve a family problem is by open discussion.
A. the      
B. sensitive      
C. by      
D. open', N'D', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (3, N'21111063145 ', N'NNTA103', N'NNTA103025', N'Tìm lỗi sai trong câu sau:
It is vitally important that she takes this medication night and morning.
A. vitally     
B. that     
C. takes     
D. medication', N'C', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (4, N'21111063145 ', N'NNTA103', N'NNTA103044', N'Tìm lỗi sai trong câu sau:
Despite the long history of the rights of property ownership, there have been a great deal of disagreement over what such rights entail.
A. what such rights entail     
B. have been
C. Despite      
D. a great deal of', N'B', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (5, N'21111063145 ', N'NNTA103', N'NNTA103053', N'Tìm lỗi sai trong câu sau:
The telephone rang several times and then stop before I could answer it.
A. times      
B. then      
C. stop      
D. could', N'C', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (11, N'21111063145 ', N'CTKM107', N'CTKM107099', N'Tốc độ truy nhập của bộ nhớ SRAM so với bộ nhớ DRAM như thế nào?
A.Chậm hơn
B.Nhanh hơn
C.Bằng nhau
D.Không xác định được', N'B', N'D')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (6, N'21111063145 ', N'NNTA103', N'NNTA103036', N'Tìm lỗi sai trong câu sau:
Little have people done to alleviate the sea pollution caused by the factories in central Vietnam, haven’t they?
A. have people done     
B. caused
C. in central     
D. haven’t they', N'D', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (7, N'21111063145 ', N'NNTA103', N'NNTA103010', N'Tìm lỗi sai trong câu sau:
For thousands of years, man has created sweet-smelling substances from wood, herbs and flowers and using them for perfumes or medicine.
A. man     
B. sweet-smelling     
C. using them     
D. or', N'C', N'D')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (8, N'21111063145 ', N'NNTA103', N'NNTA103045', N'Tìm lỗi sai trong câu sau:
Paris is much more exciting as I expected.
A. much      
B. exciting      
C. as      
D. expected', N'A', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (9, N'21111063145 ', N'NNTA103', N'NNTA103029', N'Tìm lỗi sai trong câu sau:
After the police had tried unsuccessfully to determine to who the car belonged, they towed it to the station.
A. the police     
B. unsuccessfully     
C. who     
D. it to', N'C', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (10, N'21111063145 ', N'NNTA103', N'NNTA103003', N'Tìm lỗi sai trong câu sau:
Developing new technologies are time-consuming and expensive.
A. developing      
B. technologies      
C. are      
D. time-consuming', N'C', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (11, N'21111063145 ', N'NNTA103', N'NNTA103017', N'Tìm lỗi sai trong câu sau:
After spending two days arguing about where to go for their holidays, is was decided that they shouldn’t go anywhere.
A. arguing     
B. for     
C. is was decided     
D. shouldn’t go', N'C', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (12, N'21111063145 ', N'NNTA103', N'NNTA103004', N'Tìm lỗi sai trong câu sau:
The assumption that smoking has bad effects on our health have been proved.
A. that      
B. effects      
C. on      
D. have been proved', N'D', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (13, N'21111063145 ', N'NNTA103', N'NNTA103058', N'Tìm lỗi sai trong câu sau:
Had I been interested in that subject, I would try to learn more about it.
A. in      
B. try to learn      
C. Had      
D. about', N'B', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (14, N'21111063145 ', N'NNTA103', N'NNTA103014', N'Tìm lỗi sai trong câu sau:
By the time Robert will finish writing the first draft of his paper, most of the other students will have completed their final draft
A. will finish     
B. writing     
C. most     
D. their', N'A', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (18, N'21111063145 ', N'NNTA103', N'NNTA103028', N'Tìm lỗi sai trong câu sau:
Some species of bats are dormant each days and active every night.
A. species of     
B. each days
C. every night     
D. are dormant', N'B', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (19, N'21111063145 ', N'NNTA103', N'NNTA103046', N'Tìm lỗi sai trong câu sau:
English is speaking in many countries in the world.
A. English      
B. speaking      
C. many countries     
D. the world', N'B', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (20, N'21111063145 ', N'NNTA103', N'NNTA103012', N'Tìm lỗi sai trong câu sau:
The grass needs cutting, so let us have one of the men to take lawn-mower and do it.
A. needs     
B. cutting     
C. let     
D. to take', N'D', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (15, N'21111063145 ', N'NNTA103', N'NNTA103060', N'Tìm lỗi sai trong câu sau:
Education, whether it happens at school or anywhere else, is a important part in our life.
A. Education      
B. whether      
C. or      
D. a important part', N'D', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (16, N'21111063145 ', N'NNTA103', N'NNTA103042', N'Tìm lỗi sai trong câu sau:
Higher education in the United States specifically refers to post -secondary institutions, that offer associate degrees, master degrees or Ph.d. degrees or equivalents.
A. specifically refers      
B. institutions      
C. that      
D. or equivalents', N'C', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (17, N'21111063145 ', N'NNTA103', N'NNTA103031', N'Tìm lỗi sai trong câu sau:
For thousands of years, man has created sweet-smelling substances from wood, herbs and flowers and using them for perfumes or medicine.
A. man     
B. sweet-smelling     
C. using them     
D. or', N'C', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (21, N'21111063145 ', N'NNTA103', N'NNTA103013', N'Tìm lỗi sai trong câu sau:
What we know about certain diseases are still not sufficient to prevent them from spreading easily among the population.
A. What we know     
B. are     
C. from spreading     
D. among', N'B', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (22, N'21111063145 ', N'NNTA103', N'NNTA103021', N'Tìm lỗi sai trong câu sau:
Most bothersome flies belong to the family Sarcophagidae and are popular known as flesh flies because the larvae feed on flesh.
A. belong to     
B. popular known     
C. because     
D. feed on', N'B', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (23, N'21111063145 ', N'NNTA103', N'NNTA103030', N'Tìm lỗi sai trong câu sau:
Those who had already purchased tickets were instructed to go to gate first immediately.
A. Those 
B. had already purchased
C. gate first     
D. immediately', N'C', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (24, N'21111063145 ', N'NNTA103', N'NNTA103054', N'Tìm lỗi sai trong câu sau:
The teacher asked him why hadn’t he done his homework, but he said nothing.
A. why      
B. hadn’t he done
C. but     
 D. said nothing', N'B', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (25, N'21111063145 ', N'NNTA103', N'NNTA103016', N'Tìm lỗi sai trong câu sau:
United States is aimed at develop friendly relations among nations based on respect for the principle of equal rights and self-determination of people.
A. develop 
B. based 
C. principle 
D. people', N'A', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (5, N'21111063239 ', N'CTKM107', N'CTKM107090', N'Mã ASSCII của chữ cái A bằng bao nhiêu? 
A. 35H 
B. 37H
C. 39H 
D. 41H', N'D', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (6, N'21111063239 ', N'CTKM107', N'CTKM107074', N'Tích hai số nhị phân 1110(2) và 1010(2) bằng số nhị phân nào trong các số sau: 
A. 10000100(2) 
B. 10100100(2) 
C. 10101100(2) 
D. 10001100(2)', N'D', N' ')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (12, N'21111063145 ', N'CTKM107', N'CTKM107033', N'Trong hệ La mã số MD nhận giá trị thập phân nào trong các giá trị sau đây: 
A. 1400 
B. 1500
C. 1600 
D. 1700', N'B', N'D')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (13, N'21111063145 ', N'CTKM107', N'CTKM107048', N'Trong hệ đếm bát phân số 237.04(8) tương ứng với giá trị thập phân nào trong các giá trị sau đây: 
A. 157.0625 
B. 157.8125 
C. 159.0625
D. 159.8125', N'C', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (14, N'21111063145 ', N'CTKM107', N'CTKM107050', N'Trong hệ đếm bát phân số 237.04(8) tương ứng với giá trị thập phân nào trong các giá trị sau đây: 
A. 157.0625 
B. 157.8125 
C. 159.0625
D. 159.8125', N'C', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (15, N'21111063145 ', N'CTKM107', N'CTKM107039', N'Trong hệ La mã số MMCMLXXVI nhận giá trị thập phân nào trong các giá trị sau đây: 
A. 1846 
B. 2756 
C. 2866 
D. 2976 *', N'D', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (7, N'21111063117 ', N'NNTA103', N'NNTA103018', N'Tìm lỗi sai trong câu sau:
Regarding as one of the leading figures in the development of the short story, O Henry is the author of many well- known American novels.
A. Regarding as     
B. leading figures     
C. the     
D. novels', N'A', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (8, N'21111063117 ', N'NNTA103', N'NNTA103010', N'Tìm lỗi sai trong câu sau:
For thousands of years, man has created sweet-smelling substances from wood, herbs and flowers and using them for perfumes or medicine.
A. man     
B. sweet-smelling     
C. using them     
D. or', N'C', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (12, N'21111063117 ', N'NNTA103', N'NNTA103033', N'Tìm lỗi sai trong câu sau:
She only had a twenty-dollars bill with her when she landed at Healthrow airport.
A. had     
B. twenty-dollars bill     
C. when     
D. at', N'B', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (16, N'21111063117 ', N'NNTA103', N'NNTA103058', N'Tìm lỗi sai trong câu sau:
Had I been interested in that subject, I would try to learn more about it.
A. in      
B. try to learn      
C. Had      
D. about', N'B', N'D')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (22, N'21111063117 ', N'NNTA103', N'NNTA103008', N'Tìm lỗi sai trong câu sau:
Not until he got home he realized he had forgotten to give her the present.
A. got     
B. he realized     
C. her     
D. the present', N'B', N'D')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (10, N'21111063117 ', N'NNTA103', N'NNTA103027', N'Tìm lỗi sai trong câu sau:
The number of women earning Master''s Degrees have risen sharply in recent years.
A. number     
B. earning     
C. have risen     
D. recent years', N'C', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (7, N'21111063239 ', N'CTKM107', N'CTKM107093', N'Bus nào trong máy tính có nhiệm vụ kết nối bộ vi xử lý với bộ nhớ chính và bộ nhớ Cache?
A.Bus trong bộ vi xử lý
B.Bus bộ vi xử lý
C.Bus ngoại vi
D.Bus hệ thống', N'D', N'D')
GO
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (8, N'21111063239 ', N'CTKM107', N'CTKM107034', N'Trong hệ La mã số CM nhận giá trị thập phân nào trong các giá trị sau đây: 
A. 1600 
B. 1500 
C. 1100 
D. 900', N'D', N'D')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (9, N'21111063239 ', N'CTKM107', N'CTKM107005', N'Phần dẻo (Firmware) trong máy tính là gì? 
A. Phần mềm được đặt vào bên trong các mạch điện tử trong quá trình sản xuất 
B. Hệ điều hành 
C. Các Driver cho các thiết bị phần cứng và các mạch hỗ trợ phối ghépvào ra cho máy tính 
D. Phần mềm hệ thống', N'A', N' ')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (10, N'21111063239 ', N'CTKM107', N'CTKM107083', N'Bộ mã ASSCII mở rộng gồm bao nhiêu kí tự? 
A. 128 
B. 256
C. 512 
D. 1024', N'B', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (11, N'21111063239 ', N'CTKM107', N'CTKM107051', N'Trong hệ đếm thập lục phân số 34F5(16) tương ứng với giá trị thập phân nào trong các giá trị sau đây: 
A. 13557 
B. 15775 
C. 15459 
D. 13267', N'A', N' ')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (12, N'21111063239 ', N'CTKM107', N'CTKM107011', N'Một trong các nội dung của nguyên lý Von Newmann là: 
A. Máy tính có thể hoạt động theo một chương trình đã được lưu trữ
B. Máy tính có thể điều khiển mọi hoạt động bằng một chương trình duy nhất C. Bộ nhớ máy tính không thể địa chỉ hóa được 
D. Mỗi câu lệnh phải có một vùng nhớ chứa địa chỉ lệnh tiếp theo', N'A', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (13, N'21111063239 ', N'CTKM107', N'CTKM107038', N'Trong hệ La mã số MCD nhận giá trị thập phân nào trong các giá trị sau đây: A. 1400
B. 1450 
C. 1600 
D. 1650', N'A', N' ')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (14, N'21111063239 ', N'CTKM107', N'CTKM107086', N'Các kí tự được bổ sung trong bộ mã ASSCII mở rộng là các kí tự gì? 
A. Kí tự điều khiển 
B. Kí tự đồ họa
C. Kí tự chữ cái 
D. Kí tự chữ số', N'B', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (15, N'21111063239 ', N'CTKM107', N'CTKM107040', N'Trong hệ nhị phân số 11101.11(2) tương ứng với giá trị thập phân nào trong các giá trị sau đây: 
A. 26,75 
B. 29,75 
C. 29,65 
D. 26,65', N'B', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (16, N'21111063239 ', N'CTKM107', N'CTKM107022', N'Trong hệ đếm La Mã, giá trị của mỗi chữ số phụ thuộc vào: 
A. Bản thân chữ số đó 
B. Vị trí của nó 
C. Bản thân chữ số đó và vị trí của nó
D. Mối quan hệ với các chữ số trước và sau nó', N'A', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (17, N'21111063239 ', N'CTKM107', N'CTKM107021', N'Trong hệ đếm thập phân, giá trị của mỗi con số phụ thuộc vào: 
A. Bản thân chữ số đó 
B. Vị trí của nó 
C. Bản thân chữ số đó và vị trí của nó
D. Mối quan hệ với các chữ số trước và sau nó', N'C', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (18, N'21111063239 ', N'CTKM107', N'CTKM107010', N'Trong các bộ phận sau, bộ phận nào không thuộc bộ xử lý trung tâm: 
A. Bộ nhớ trong
B. Khối số học và logic 
C. Tập các thanh ghi đa năng 
D. Khối điều khiển để thi hành lệnh một cách tuần tự và tác động lêncác mạch chức năng nhằm thi hành lệnh.', N'A', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (20, N'21111063239 ', N'CTKM107', N'CTKM107050', N'Trong hệ đếm bát phân số 237.04(8) tương ứng với giá trị thập phân nào trong các giá trị sau đây: 
A. 157.0625 
B. 157.8125 
C. 159.0625
D. 159.8125', N'C', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (21, N'21111063239 ', N'CTKM107', N'CTKM107044', N'Trong hệ nhị phân số 10111.1(2) tương ứng với giá trị thập phân nào trong các giá trị sau đây: 
A. 23.5
B. 23.25 
C. 25.5 
D. 25.25', N'A', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (22, N'21111063239 ', N'CTKM107', N'CTKM107071', N'Tích hai số nhị phân 110(2) và 1011(2) bằng số nhị phân nào trong các số sau: A. 1000010(2)
B. 1010000(2) 
C. 1010110(2) 
D. 1001000(2)', N'A', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (16, N'21111063145 ', N'CTKM107', N'CTKM107085', N'Bộ mã ASSCII cơ sở gồm các kí tự được mã hóa bằng bao nhiêu bit? 
A. 6 bit 
B. 7 bit
C. 8 bit
D. 9 bit', N'B', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (17, N'21111063145 ', N'CTKM107', N'CTKM107097', N'Chương trình BIOS trong các máy tính hiện đại thường được lưu trữ trong bộ nhớ loại nào?
A.PROM 
B.EPROM 
C.EEPROM
D.Flash ROM', N'C', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (23, N'21111063117 ', N'NNTA103', N'NNTA103055', N'Tìm lỗi sai trong câu sau:
A dangerously situation was created by the bad roads.
A. dangerously      
B. was      
C. created      
D. bad roads', N'A', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (24, N'21111063117 ', N'NNTA103', N'NNTA103003', N'Tìm lỗi sai trong câu sau:
Developing new technologies are time-consuming and expensive.
A. developing      
B. technologies      
C. are      
D. time-consuming', N'C', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (25, N'21111063117 ', N'NNTA103', N'NNTA103023', N'Tìm lỗi sai trong câu sau:
Had it not been for you help me, I wouldn''t have succeeded.
A. not     
B. you help me     
C. wouldn’t     
D. succeeded', N'B', N'D')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (19, N'21111063239 ', N'CTKM107', N'CTKM107014', N'Phát biểu sau đây thuộc nội dung của nguyên lý Von Newmann? 
A. Các chương trình chỉ được nạp khi thực hiện 
B. Máy tính có thể điều khiển mọi hoạt động bằng một chương trình duy nhất C. Bộ nhớ máy tính không thể địa chỉ hóa được 
D. Bộ nhớ của máy tính được địa chỉ hóa', N'D', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (23, N'21111063239 ', N'CTKM107', N'CTKM107029', N'Chữ số D trong hệ đếm La mã tương ứng với giá trị thập phân nào trong các giá trị sau đây: 
A. 100 
B. 200 
C. 500
D. 1000', N'C', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (24, N'21111063239 ', N'CTKM107', N'CTKM107084', N'Bộ mã ASSCII cơ sở gồm bao nhiêu kí tự? 
A. 128
B. 256
C. 512 
D. 1024', N'A', N'D')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (25, N'21111063239 ', N'CTKM107', N'CTKM107066', N'Tổng hai số nhị phân 1010101(2) và 1100011(2) bằng số nhị phân nào trong các số sau: 
A. 11000000(2) 
B. 10111000(2)
C. 10011000(2) 
D. 10001000(2)', N'B', N'D')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (26, N'21111063239 ', N'CTKM107', N'CTKM107015', N'Theo nguyên lý Von Newmann, để thay đổi thứ tự các lệnh được thực hiện, ta chỉ cần: 
A. Thay đổi nội dung thanh ghi con trỏ lệnh bằng địa chỉ lệnh cần thực hiện tiếp
B. Thay đổi nội dung trong vùng nhớ chứa địa chỉ chương trình đang thực hiện
C. Thay đổi nội dung thanh ghi mảng mã lệnh 
D. Thay đổi nội dung thanh ghi mảng dữ liệu', N'A', N'D')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (27, N'21111063239 ', N'CTKM107', N'CTKM107006', N'Một ví dụ về phần dẻo (Firmware) trong máy tính là: 
A. Hệ điều hành MS DOS 
B. Chương trình điều khiển trong ROM BIOS
C. Chương trình Driver cho Card màn hình của máy tính 
D. Phần mềm ứng dụng của người dùng', N'B', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (28, N'21111063239 ', N'CTKM107', N'CTKM107008', N'Phần mềm của máy tính là: 
A. Các bộ điều phối thiết bị giúp cho việc ghép nối và ra được thực hiện một cách linh hoạt.
B. Cơ cấu trao đổi dữ liệu giữa các thiết bị phần cứng trong máy tính 
C. Chương trình được cài đặt trong bộ nhớ ROM 
D. Bộ vi xử lý và các vi mạch hỗ trợ cho nó', N'C', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (29, N'21111063239 ', N'CTKM107', N'CTKM107004', N'Các thành phần cơ bản của một máy tính gồm:
A. Bộ nhớ trong, CPU và khối phối ghép vào ra 
B. Bộ nhớ trong, CPU và thiết bị ngoại vi 
C. Bộ nhớ trong, CPU, khối phối ghép vào ra và thiết bị ngoại vi 
D. Bộ nhớ trong, CPU, bộ nhớ ngoài, bộ phối ghép vào ra và thiết bị ngoại vi', N'D', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (30, N'21111063239 ', N'CTKM107', N'CTKM107061', N'Số 799(10) tương ứng với giá trị bát phân nào trong các giá trị sau đây: 
A. 1545(8) 
B. 1403(8) 
C. 1437(8) 
D. 1565(8)', N'C', N'D')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (1, N'21111181403 ', N'NNTA103', N'NNTA103017', N'Tìm lỗi sai trong câu sau:
After spending two days arguing about where to go for their holidays, is was decided that they shouldn’t go anywhere.
A. arguing     
B. for     
C. is was decided     
D. shouldn’t go', N'C', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (2, N'21111181403 ', N'NNTA103', N'NNTA103040', N'Tìm lỗi sai trong câu sau:
It is the recommendation of many psychologists that a learner ought to use mental images to associate word and remember them.
A. recommendation     
B. ought to use
C. to associate word     
D. remember them', N'B', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (3, N'21111181403 ', N'NNTA103', N'NNTA103031', N'Tìm lỗi sai trong câu sau:
For thousands of years, man has created sweet-smelling substances from wood, herbs and flowers and using them for perfumes or medicine.
A. man     
B. sweet-smelling     
C. using them     
D. or', N'C', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (4, N'21111181403 ', N'NNTA103', N'NNTA103037', N'Tìm lỗi sai trong câu sau:
I can’t find the letter I received from my boss some days ago. I might throw it into the waste paper bin yesterday.
A. received     
B. can’t find
C. into the     
D. might throw', N'D', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (5, N'21111181403 ', N'NNTA103', N'NNTA103032', N'Tìm lỗi sai trong câu sau:
There are many different ways of comparing the culture of one nation with those of another.
A. There are     
B. of comparing     
C. those     
D. another', N'C', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (7, N'21111181403 ', N'NNTA103', N'NNTA103012', N'Tìm lỗi sai trong câu sau:
The grass needs cutting, so let us have one of the men to take lawn-mower and do it.
A. needs     
B. cutting     
C. let     
D. to take', N'D', N'D')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (9, N'21111181403 ', N'NNTA103', N'NNTA103025', N'Tìm lỗi sai trong câu sau:
It is vitally important that she takes this medication night and morning.
A. vitally     
B. that     
C. takes     
D. medication', N'C', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (12, N'21111181403 ', N'NNTA103', N'NNTA103045', N'Tìm lỗi sai trong câu sau:
Paris is much more exciting as I expected.
A. much      
B. exciting      
C. as      
D. expected', N'A', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (15, N'21111181403 ', N'NNTA103', N'NNTA103026', N'Tìm lỗi sai trong câu sau:
Society uses such human emotions as proud, shame, guilt, and fear to maintain itself.
A. such human     
B. proud     
C. guilt     
D. itself', N'B', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (6, N'21111181403 ', N'NNTA103', N'NNTA103029', N'Tìm lỗi sai trong câu sau:
After the police had tried unsuccessfully to determine to who the car belonged, they towed it to the station.
A. the police     
B. unsuccessfully     
C. who     
D. it to', N'C', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (8, N'21111181403 ', N'NNTA103', N'NNTA103056', N'Tìm lỗi sai trong câu sau:
In most countries music songs are deeply personal and deal with themes of love, lonely, and separation.
A. most countries      
B. deeply     
C. deal with      
D. lonely', N'D', N'D')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (10, N'21111181403 ', N'NNTA103', N'NNTA103011', N'Tìm lỗi sai trong câu sau:
People in every part of the world readily and easily communicates by means of electronic mail.
A. every part     
B. readlily     
C. communicates     
D. by means', N'C', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (11, N'21111181403 ', N'NNTA103', N'NNTA103001', N'"I have never been to Russia. I think I shall go there next year.” said Bill.
A. Bill said that he had never been to Russia and he thought he would go there the next year.

B. Bill said that he would have never been to Russia and he thinks he would go there the next year.

C. Bill said that he had never been to Russia and he thinks he will go there the next year.

D. Bill said that he has never been to Russia and he thinks he would go there the next year.', N'A', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (13, N'21111181403 ', N'NNTA103', N'NNTA103041', N'Tìm lỗi sai trong câu sau:
You shouldn’t criticize him in front of his friends. It was insensitive of you.
A. shouldn’t criticize     
B. him in front of
C. it      
D. insensitive', N'A', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (14, N'21111181403 ', N'NNTA103', N'NNTA103013', N'Tìm lỗi sai trong câu sau:
What we know about certain diseases are still not sufficient to prevent them from spreading easily among the population.
A. What we know     
B. are     
C. from spreading     
D. among', N'B', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (16, N'21111181403 ', N'NNTA103', N'NNTA103002', N'The substance is very toxic. Protective clothing must be worn at all times.

A. Since the substance is very toxic, so protective clothing must be worn at all times.

B. So toxic is the substance that protective clothing must be worn at all times.

C. The substance is such toxic that protective clothing must be worn at all times.

D. The substance is too toxic to wear protective clothing at all times.', N'B', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (17, N'21111181403 ', N'NNTA103', N'NNTA103006', N'Tìm lỗi sai trong câu sau:
The leader demanded from his members a serious attitude towards work, good team spirit, and that they work hard.
A. leader      
B. his members  
C. attitude     
D. that they work hard', N'D', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (18, N'21111181403 ', N'NNTA103', N'NNTA103058', N'Tìm lỗi sai trong câu sau:
Had I been interested in that subject, I would try to learn more about it.
A. in      
B. try to learn      
C. Had      
D. about', N'B', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (19, N'21111181403 ', N'NNTA103', N'NNTA103027', N'Tìm lỗi sai trong câu sau:
The number of women earning Master''s Degrees have risen sharply in recent years.
A. number     
B. earning     
C. have risen     
D. recent years', N'C', N'D')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (20, N'21111181403 ', N'NNTA103', N'NNTA103004', N'Tìm lỗi sai trong câu sau:
The assumption that smoking has bad effects on our health have been proved.
A. that      
B. effects      
C. on      
D. have been proved', N'D', N'D')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (21, N'21111181403 ', N'NNTA103', N'NNTA103053', N'Tìm lỗi sai trong câu sau:
The telephone rang several times and then stop before I could answer it.
A. times      
B. then      
C. stop      
D. could', N'C', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (22, N'21111181403 ', N'NNTA103', N'NNTA103018', N'Tìm lỗi sai trong câu sau:
Regarding as one of the leading figures in the development of the short story, O Henry is the author of many well- known American novels.
A. Regarding as     
B. leading figures     
C. the     
D. novels', N'A', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (25, N'21111181403 ', N'NNTA103', N'NNTA103015', N'Tìm lỗi sai trong câu sau:
Each of the beautiful cars in the shop was quickly sold to their owner
A. Each     
B. cars     
C. quickly     
D. their', N'D', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (17, N'21111063171 ', N'CTKM107', N'CTKM107027', N'Chữ số L trong hệ đếm La mã tương ứng với giá trị nào trong các giá trị sau đây: 
A. 50
B. 100 
C. 500 
D. 1000', N'A', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (18, N'21111063171 ', N'CTKM107', N'CTKM107097', N'Chương trình BIOS trong các máy tính hiện đại thường được lưu trữ trong bộ nhớ loại nào?
A.PROM 
B.EPROM 
C.EEPROM
D.Flash ROM', N'C', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (19, N'21111063171 ', N'CTKM107', N'CTKM107093', N'Bus nào trong máy tính có nhiệm vụ kết nối bộ vi xử lý với bộ nhớ chính và bộ nhớ Cache?
A.Bus trong bộ vi xử lý
B.Bus bộ vi xử lý
C.Bus ngoại vi
D.Bus hệ thống', N'D', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (14, N'21111063239 ', N'CTKU102', N'CTKU102030', N'Cho thuật toán sau:
int LinearSearch (int M[], int N, int X)
{ int k = 0;
while (M[k] != X k < N )
k++;
if (k < N )
return (k);
return (-1);
}
Chọn câu đúng nhất trong trường hợp xấu nhất khi không tìm thấy phần tử nào có giá trị bằng X:
A. Số phép gán: Gmax = 1 Số phép so sánh: Smax = 2N+1

B. Số phép gán: Gmax = 2 Số phép so sánh: Smax = 2N+1

C. Số phép gán: Gmax = 1 Số phép so sánh: Smax = 2N+2

D. Số phép gán: Gmax = 1 Số phép so sánh: Smax = N+2', N'A', N'D')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (15, N'21111063239 ', N'CTKU102', N'CTKU102046', N'Kết quả nào đúng khi thực hiện giải thuật sau:
long lt(int n)
{if (n==0) return 1;
else return (2*lt(n-1);
}
A. lt(12) = 2010

B. lt(12) = 1024

C. lt(7) = 720

D. lt(6) = 64', N'D', N' ')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (16, N'21111063239 ', N'CTKU102', N'CTKU102095', N'Cho cây nhị phân: A, B, C, D, E, F, G, H, I, J, K, L, M, N. Cây con phải của cây B bao gồm những phần tử nào trong các lựa chọn sau?
A. E,K

B. C, D

C. E, J, K

D. D, E, H', N'C', N' ')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (17, N'21111063239 ', N'CTKU102', N'CTKU102021', N'Xét thủ tục sau:
int TimKiemNP (int M[], int First, int Last, int X)
{
if (First > Last)
return (-1);
int Mid = (First + Last)/2;
if (X == M[Mid])
return (Mid);
if (X < M[Mid])
return(TimKiemNP (M, First, Mid – 1, X));
else
return(TimKiemNP (M, Mid + 1, Last, X));
}
Lựa chọn câu đúng nhất để mô tả thủ tục trên:
A. Thủ tục hỗ trợ tìm kiếm phần tử có giá trị là X trên mảng các phần tử từ chỉ số từ First đến chỉ số Last
B. Thủ tục hỗ trợ tìm kiếm đệ quy phần tử có giá trị là X trên mảng các phần tử từ chỉ số từ First đến chỉ số Last
C. Thủ tục hỗ trợ tìm kiếm đệ quy phần tử có giá trị là X trên mảng các phần tử từ chỉ số từ Last đến chỉ số First
D. Thủ tục hỗ trợ tìm kiếm không đệ quy phần tử có giá trị là X trên mảng các phần tử từ chỉ số từ Last đến chỉ số First', N'B', N' ')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (18, N'21111063239 ', N'CTKU102', N'CTKU102068', N'Trong các phát biểu sau, phát biểu nào đúng?
A. Giá trị hàm EndList(L) và hàm FirstList(L) luôn luôn bằng nhau khi danh sách rỗng

B. Giá trị hàm EndList(L) và hàm FirstList(L) luôn luôn khác nhau

C. Giá trị hàm EndList(L) và hàm FirstList(L) bằng nhau hay không tùythuộc vào phương pháp cài đặt danh sách

D. Tất cả đều sai', N'A', N' ')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (19, N'21111063239 ', N'CTKU102', N'CTKU102059', N'Nhân tố nào là nhân tố chính ảnh hưởng đến thời gian tính của một giải thuật:
A. Máy tính

B. Thuật toán được sử dụng

C. Chương trình dịch

D. Kích thước của dữ liệu đầu vào của thuật toán', N'D', N' ')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (23, N'21111181403 ', N'NNTA103', N'NNTA103009', N'Tìm lỗi sai trong câu sau:
If one type of manufacturing expands, it is like that another type will shrink considerably.
A. expands     
B. like     
C. another     
D. considerably', N'B', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (24, N'21111181403 ', N'NNTA103', N'NNTA103030', N'Tìm lỗi sai trong câu sau:
Those who had already purchased tickets were instructed to go to gate first immediately.
A. Those 
B. had already purchased
C. gate first     
D. immediately', N'C', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (13, N'21111063171 ', N'CTKM107', N'CTKM107015', N'Theo nguyên lý Von Newmann, để thay đổi thứ tự các lệnh được thực hiện, ta chỉ cần: 
A. Thay đổi nội dung thanh ghi con trỏ lệnh bằng địa chỉ lệnh cần thực hiện tiếp
B. Thay đổi nội dung trong vùng nhớ chứa địa chỉ chương trình đang thực hiện
C. Thay đổi nội dung thanh ghi mảng mã lệnh 
D. Thay đổi nội dung thanh ghi mảng dữ liệu', N'A', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (14, N'21111063171 ', N'CTKM107', N'CTKM107095', N'Đặc điểm quan trọng của Bus đồng bộ là gì?
A.Dữ liệu được truyền đồng thời
B.Dữ liệu được truyền không đồng thời
C.Có tín hiệu đồng hồ chung điều khiển hoạt động
D.Không có tín hiệu đồng hồ chung điều khiển hoạt động', N'C', N'D')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (1, N'21111063117 ', N'CTKU102', N'CTKU102038', N'Chọn định nghĩa đúng nhất về cây cân bằng tương đối:
A. Cây cân bằng tương đối là một cây nhị phân thỏa mãn điều kiện là đối với mọi nút của cây thì số nút của cây con trái và số nút của cây con phải của nút đó hơn kém nhau không quá 1. Cây cân bằng tương đối còn được
gọi là cây AVL (AVL tree)

B. Cây cân bằng tương đối là một cây N phân thỏa mãn điều kiện là đối với mọi nút của cây thì chiều cao của cây con trái và chiều cao của cây con phải của nút đó hơn kém nhau không quá 2. Cây cân bằng tương đối còn
được gọi là cây AVL (AVL tree)

C. Cây cân bằng tương đối là một cây nhị phân thỏa mãn điều kiện là đối với mọi nút của cây thì chiều cao của cây con trái và chiều cao của cây con phải của nút đó hơn kém nhau không quá 1. Cây cân bằng tương đối còn
được gọi là cây AVL (AVL tree)

D. Cây cân bằng tương đối cũng là cây cân bằng hoàn toàn', N'C', N'D')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (2, N'21111063117 ', N'CTKU102', N'CTKU102063', N'Cho danh sách đặc có 10 phần tử. Khi thêm phần tử vào vị trí 4 trong danh sách, vòng lặp dịch chuyển tịnh tiến nội dung các phần tử L->Elements[i]=L->Elements[i+1] sẽ thực hiện:

A. 4 lần

B. 5 lần

C. 6 lần

D. Tất cả đều sai', N'A', N'D')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (3, N'21111063117 ', N'CTKU102', N'CTKU102091', N'Trong lưu trữ dữ liệu kiểu Queue (Q), giả sử F là con trỏ trỏ tới lối trước của Q, R là con trỏ trỏ tới lối sau của Q. Khi loại bỏ một phần tử vào Queue, thì R và F thay đổi thế nào trong các phương án sau?
A. F=F+1, R không thay đổi

B. F không thay đổi, R=R+1

C. F không thay đổi, R=R-1

D. F=F-1, R không thay đổi', N'A', N'D')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (4, N'21111063117 ', N'CTKU102', N'CTKU102024', N'Thủ tục mô tả thuật toán sắp xếp chọn trực tiếp (Straight Selection Sort):
void SapXepChonTrucTiep(T M[], int N)
{
int K = 0, PosMin;
int Temp;
while (K < N-1)
{ T Min = M[K];
PosMin = K;
for (int Pos = K+1; Pos < N; Pos++)
if (Min > M[Pos])
{
Min = M[Pos];
PosMin = Pos
}
} ...................................
[1] ...................................
[2] ...................................
[3] K++;
}
return;
}
Chọn câu lệnh thích hợp để đưa vào [1], [2], [3] với mục tiêu hoán vị M[K] và M[PosMin]
A. Temp = M[K] ; Temp = M[PosMin]; M[PosMin] = Temp;
B. M[K] = Temp; M[K] = M[PosMin]; M[PosMin] = Temp ;
C. Temp = M[K] ; M[PosMin] = M[K]; M[PosMin] = Temp ;
D. Temp = M[K] ; M[K] = M[PosMin]; M[PosMin] = Temp ;', N'D', N'D')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (25, N'21111063117 ', N'CTKU102', N'CTKU102100', N'Theo các phương án dưới đây, kích thước lưu trữ kiểu số nguyên (Integer) bao nhiêu byte?
A. 1 byte

B. 2 byte

C. 4 byte

D. 6 byte', N'B', N'D')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (26, N'21111063117 ', N'CTKU102', N'CTKU102083', N'Chỉ ra khái niệm có tính chất đệ quy?
A. khái niệm tính giai thừa của n (n!)

B. khái niệm hình ảnh

C. khái niệm âm thanh', N'A', N'D')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (32, N'21111063117 ', N'CTKU102', N'CTKU102005', N'Phương pháp nào sau đây chính là phương pháp sắp xếp nhanh (Quick sort)?
A. Phương phap trộn
B. Phương pháp vun đống
C. Phương pháp chèn
D. Phương pháp phân đoạn', N'D', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (39, N'21111063117 ', N'CTKU102', N'CTKU102080', N'Phát biểu sau đúng hay sai: Khi nói tới giải thuật phải xem xét nó sẽ tác động trên dữ liệu nào?
A. Đúng

B.Sai', N'A', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (5, N'21111063117 ', N'CTKU102', N'CTKU102064', N'Cho danh sách đặc có 10 phần tử. Khi xóa phần tử ở vị trí 4 trong danh sách, vòng lặp dịch chuyển tịnh tiến nội dung các phần tử L->Elements[i]=L->Elements[i+1] :
A. 4 lần

B. 5 lần

C. 6 lần', N'C', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (8, N'21111063117 ', N'CTKU102', N'CTKU102059', N'Nhân tố nào là nhân tố chính ảnh hưởng đến thời gian tính của một giải thuật:
A. Máy tính

B. Thuật toán được sử dụng

C. Chương trình dịch

D. Kích thước của dữ liệu đầu vào của thuật toán', N'D', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (9, N'21111063117 ', N'CTKU102', N'CTKU102090', N'Trong lưu trữ dữ liệu kiểu Queue (Q), giả sử F là con trỏ trỏ tới lối trước của Q, R là con trỏ trỏ tới lối sau của Q. Khi thêm một phần tử vào Queue, thì R và F thay đổi thế nào trong các phương án sau?
A. F không thay đổi, R=R+1

B. F=F+1, R không thay đổi

C. F không thay đổi, R=R-1

D. F=F-1, R không thay đổi\', N'A', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (10, N'21111063117 ', N'CTKU102', N'CTKU102004', N'Hãy cho biết ý tưởng nào sau đây nói về phương pháp sắp xếp nhanh (Quick sort)?
A. Chọn phần tử bé nhất xếp vào vị trí thứ nhất bằng cách đổi chổ phần tử bé nhất với phần tử thứ nhất; Tương tự đối với phần tử nhỏ thứ hai cho đến phần tử cuối cùng

B. Bắt đầu từ cuối dãy đến đầu dãy, ta lần lượt so sánh hai phần tử kế tiếpnh u, nếu phần tử nào nhỏ hơn được đứng vị trí trên

C. Phân đoạn dãy thành nhiều dãy con và lần lượt trộn hai dãy con thành dãy lớn hơn, cho đến khi thu được dãy ban đầu đã được sắp xếp

D. Lần lượt chia dãy phần tử thành hai dãy con bởi một phần tử khoá (dãy con trước khoá gồm các phần tử nhỏ hơn khoá và dãy còn lại gồm các phần tử lớn hơn khoá)', N'D', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (11, N'21111063117 ', N'CTKU102', N'CTKU102089', N'Trong lưu trữ dữ liệu kiểu Queue (Q) dưới dạng mảng nối vòng, giả sử F là con trỏ trỏ tới lối trước của Q, R là con trỏ trỏ tới lối sau của Q. Điều kiện F=R=0 nghĩa là gì trong các phương án sau?
A. Queue tràn

B. Queue rỗng

C. Kiểm tra chỉ số trước và chỉ số sau của Queue có bằng nhau hay không

D. Đặt phần tử đầu và phần tử cuối của Queue bằng 0', N'B', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (12, N'21111063117 ', N'CTKU102', N'CTKU102018', N'Các tiêu chuẩn đánh giá cấu trúc dữ liệu. Để đánh giá một cấu trúc dữ liệu chúng ta thường dựa vào một số tiêu chí:
A. Cấu trúc dữ liệu phải tiết kiệm tài nguyên (bộ nhớ trong)
B. Cấu trúc dữ liệu phải phản ảnh đúng thực tế của bài toán
C. Cấu trúc dữ liệu phải dễ dàng trong việc thao tác dữ liệu
D. Cả a, b, c đều đúng', N'D', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (13, N'21111063117 ', N'CTKU102', N'CTKU102060', N'Chọn phát biểu đúng trong các phát biểu dưới đây: bằng cách chạy thử 1 thuật toán với 1 bộ dữ liệu, ta có thể:
A. Khẳng định thuật toán đúng nếu nó cho kết quả đúng

B. Khẳng định thuật toán sai nếu cho kết quả sai

C. Khẳng định thuật toán tốt nếu cho kết quả nhanh

D. Khẳng định thuật toán hiệu quả nếu cho kết quả đúng', N'B', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (14, N'21111063117 ', N'CTKU102', N'CTKU102096', N'Hãy cho biết quy tắc đúng của phép duyệt cây theo thứ tự trước trong các phương án sau?
A. Duyệt cây con trái theo thứ tự trước; Duyệt cây con phải theo thứ tự trước; Duyệt gốc

B. Duyệt gốc; Duyệt cây con trái theo thứ tự trước; Duyệt cây con phải theo thứ tự trước

C. Duyệt gốc, cây trái, cây phải đồng thời theo thứ tự trước

D. Duyệt cây con trái theo thứ tự trước; Duyệt gốc; Duyệt cây con phảitheo thứ tự trước', N'B', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (17, N'21111063117 ', N'CTKU102', N'CTKU102065', N'Cho biểu thức a+b*((c-d)*e+f/h). Danh sách duyệt tiền tự của biểu thức
đã cho là:
A. + * a b + * - c d e / f h

B. + a * b + * - c d e / f h

C. + a b * * e - c d + / f h

D. + * a + b – c d * e / f h', N'B', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (2, N'21111063145 ', N'CTKU102', N'CTKU102013', N'Khi lưu trữ cây nhị phân dưới dạng mảng, nếu vị trí của nút cha trong mảng là i thì vị trí của nút con phải là gì trong các phương án sau?
A. 2*i + 1
B. i+1
C. i-1
D. 2*i', N'A', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (18, N'21111063117 ', N'CTKU102', N'CTKU102043', N'Với cấu trúc dữ liệu như sau:
typedef struct DNode
{
int Key;
DNode * NextNode;
DNode * PreNode;
} DOneNode
typedef DLLOneNode * DPointerType;
typedef struct DPairNode
{ DPointerType DLLFirst;
DPointerType DLLLast;
} DPType;
Hàm thêm phần tử vào cuối danh sách liên kết đôi quản lý bởi 2 phần
tử đầu và cuối
DPointerType DLLAddLast(DPType &DList, int NewData)
{
DPointerType NewNode = gọi hàm tạo nút mới có vùng dữ liệu là
NewData ;
if (NewNode == NULL)
return (NULL);
if (DList.DLLLast == NULL)
DList.DLLFirst = DList.DLLLast = NewNode;
else
{
……………………………………………….
……………………………………………….
………………………………………………
}
return (NewNode);
} Hãy lựa chọn câu đúng nhất để điền vào chỗ trống ở trên
A. DList.DLLLast ->NextNode = NewNode; NewNode ->PreNode = DList.DLLLast; NewNode = DList.DLLLast;

B. DList.DLLLast ->NextNode = NewNode; DList.DLLLast = NewNode ->PreNode; DList.DLLLast = NewNode;

C. NewNode = DList.DLLLast ->NextNode; NewNode ->PreNode = DList.DLLLast; DList.DLLLast = NewNode;

D. DList.DLLLast ->NextNode = NewNode; NewNode ->PreNode = DList.DLLLast; DList.DLLLast = NewNode;', N'D', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (20, N'21111063117 ', N'CTKU102', N'CTKU102028', N'Cho thuật toán tìm nhị phân không đệ quy sau:
int NRecBinarySearch (int M[], int N, int X)
{ int First = 0;
int Last = N – 1;
while (First <= Last)
{
int Mid = (First + Last)/2;
if (X == M[Mid])
return(Mid);
if (X < M[Mid])
Last = Mid – 1;
else
First = Mid + 1;
}
return(-1);
}
Chọn câu đúng nhất trong trường hợp tốt nhất khi phần tử ở giữa của mảng có giá trị bằng X:
A. Số phép gán: Gmin = 3 Số phép so sánh: Smin = 2

B. Số phép gán: Gmin = 2 Số phép so sánh: Smin = 3

C. Số phép gán: Gmin = 2 Số phép so sánh: Smin = 2

D. Số phép gán: Gmin = 0 Số phép so sánh: Smin = 2', N'A', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (21, N'21111063117 ', N'CTKU102', N'CTKU102099', N'Yếu tố nào sau đây để xây dựng nên một chương trình hoàn chỉnh?
A. Dữ liệu tốt, giải thuật đơn giản

B. Giải thuật có thời gian thực hiện nhanh nhất

C. Cấu trúc dữ liệu thích hợp, giải thuật xử lý hiệu quả

D. Cấu trúc dữ liệu tốt', N'C', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (23, N'21111063117 ', N'CTKU102', N'CTKU102092', N'Cho cây nhị phân: A, B, C, D, E, F, G, H, I, J, K, L, M, N. Cây con trái của
cây B bao gồm những phần tử nào trong các phương án sau?
A. E, J, K

B. C, D

C. C, D, E

D. D, H, I', N'D', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (27, N'21111063117 ', N'CTKU102', N'CTKU102003', N'Hãy cho biết ý tưởng nào sau đây nói về phương pháp sắp xếp chèn (insertion sort)?
A. Phân đoạn dãy thành nhiều dãy con và lần lượt trộn hai dãy con thành dãy lớn hơn, cho đến khi thu được dãy ban đầu đã được sắp xếp

B. Lần lượt lấy phần tử của danh sách chèn vị trí thích hợp của nó trong dãy bằng cách đẩy các phần tử lớn hơn xuống

C. Chọn phần tử bé nhất xếp vào vị trí thứ nhất bằng cách đổi chổ phần tử bé nhất với phần tử thứ nhất; Tương tự đối với phần tử nhỏ thứ hai cho đến phần tử cuối cùng

D. Bắt đầu từ cuối dãy đến đầu dãy, ta lần lượt so sánh hai phần tử kế tiếp nhau, nếu phần tử nào nhỏ hơn được đứng vị trí trên', N'B', N'D')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (28, N'21111063117 ', N'CTKU102', N'CTKU102051', N'Thao tác nào dưới đây thực hiện trên hàng đợi (queue):
A. Thêm phần tử vào lối sau

B. Loại bỏ phần tử ở lối sau

C. Thêm phần tử vào lối trước

D. Thêm và loại bỏ phần tử tại vị trí bất kỳ', N'A', N'D')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (29, N'21111063117 ', N'CTKU102', N'CTKU102001', N'"Hãy cho biết ý tưởng nào sau đây nói về phương pháp sắp xếp chọn tăng dần (select sort)?
A. Phân đoạn dãy thành nhiều dãy con và lần lượt trộn hai dãy con thành dãy lớn hơn, cho đến khi thu được dãy ban đầu đã được sắp xếp
B. Lần lượt lấy phần tử của danh sách chèn vị trí thích hợp của nó trong dãy
C. Chọn phần tử bé nhất xếp vào vị trí thứ nhất bằng cách đổi chổ phần tử bé nhất với phần tử thứ nhất; Tương tự đối với phần tử nhỏ thứ hai cho đến phần tử cuối cùng
D. Bắt đầu từ cuối dãy đến đầu dãy, ta lần lượt so sánh hai phần tử kế tiếp nhau, nếu phần tử nào bé hơn được cho lên vị trí trên"
', N'C', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (22, N'21111063117 ', N'CTKU102', N'CTKU102034', N'Biểu diễn và tổ chức ngăn xếp (Stack) bằng danh sách liên kết giả sử bề mặt của ngăn xếp là đầu danh sách liên kết:
typedef struct SElement
{ T Key;
SElement *Next;
} SOneElement;
typedef struct SOneElement *SSTACK;
SSTACK SSP;
Thêm 1 phần tử vào ngăn xếp (dùng cấu trúc dữ liệu mô tả ở trên)
B1: NewElement = Khởi tạo nút mới (dùng toán tử new)
B2: if (NewElement == NULL)
Thực hiện BKT
B3: if (SSP == NULL)
B3.1: SSP = NewElement
B3.2: Thực hiện BKT
B4: …………………………………………
B5: …………………………………………
BKT: Kết thúc
Chọn câu lệnh chính xác cho B4 và B5
A. B4: NewElement ->Next = SSP SSP = NewElement

B. B4: SSP = NewElement ->Next B5: SSP = NewElement

C. B4: SSP = NewElement ->Next B5: NewElement = SSP

D. B4: NewElement ->Next = SSP B5: NewElement = SSP', N'A', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (24, N'21111063117 ', N'CTKU102', N'CTKU102044', N'Với cấu trúc dữ liệu như sau:
typedef struct DNode
{
int Key;
DNode * NextNode;
DNode * PreNode;
} DOneNode;
typedef DOneNode * DPointerType;
typedef struct DLLPairNode
{ DPointerType DLLFirst;
DPointerType DLLLast;
} DLLPType;
Hàm duyệt qua các nút trong danh sách liên kết đôi quản lý bởi hai địa chỉ nút đầu tiên và nút cuối cùng thông qua DList để xem nội dung thành phần dữ liệu của mỗi nút
void DLLTravelling (DLLPType DList)
{
DPointerType CurrNode = DList.DLLFirst;
while (CurrNode != NULL) { cout <<
CurrNode->Key; …………………………………
}
return;
}
Chọn câu chính xác điền vào chỗ trống để mô tả việc di chuyển từ nút này sang nút khác
A. CurrNode = CurrNode ->NextNode ;

B. CurrNode = CurrNode ->Key ;

C. CurrNode ->NextNode = CurrNode;

D. CurrNode ->Key = CurrNode;', N'A', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (30, N'21111063117 ', N'CTKU102', N'CTKU102072', N'Các kiểu dữ liệu cơ bản là:
A. các kiểu dữ liệu mà người lập trình được cung cấp sẵn từ máy tính

B. các kiểu dữ liệu mà người lập trình được cung cấp sẵn từ ngôn ngữ tự nhiên

C. các kiểu dữ liệu mà người lập trình được cung cấp sẵn từ ngôn ngữ lập trình

D. các kiểu dữ liệu mà người lập trình được cung cấp sẵn từ ngôn ngữ máy', N'C', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (31, N'21111063117 ', N'CTKU102', N'CTKU102077', N'Cấu trúc dữ liệu là …
A. cách lưu trữ dữ liệu trong bộ nhớ máy tính (ROM), sao cho nó có thể được sử dụng một cách hiệu quả

B. cách lưu trữ dữ liệu trong bộ nhớ máy tính (HDD), sao cho nó có thể được sử dụng một cách hiệu quả

C. cách lưu trữ dữ liệu trong bộ nhớ máy tính (USB), sao cho nó có thể được sử dụng một cách hiệu quả

D. cách lưu trữ dữ liệu trong bộ nhớ máy tính (RAM), sao cho nó có thể được sử dụng một cách hiệu quả', N'D', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (34, N'21111063117 ', N'CTKU102', N'CTKU102006', N'Hãy cho biết ý tưởng nào sau đây nói về tưởng phương pháp sắp xếp Trộn (Merge sort)?
A. Lần lượt chia dãy phần tử thành hai dãy con bởi một phần tử khoá (dãy con trước khoá gồm các phần tử nhỏ hơn khoá và dãy còn lại gồm các phần tử lớn hơn khoá)
B. Bắt đầu từ cuối dãy đến đầu dãy, ta lần lượt so sánh hai phần tử kế tiếp nhau, nếu phần tử nào nhỏ hơn được đứng vị trí trên
C. Chọn phần tử bé nhất xếp vào vị trí thứ nhất bằng cách đổi chổ phần tử bé nhất với phần tử thứ nhất; Tương tự đối với phần tử nhỏ thứ hai cho đến phần tử cuối cùng
D. Phân đoạn dãy thành nhiều dãy con và lần lượt trộn hai dãy con thành dãy lớn hơn, cho đến khi thu được dãy ban đầu đã được sắp xếp', N'D', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (35, N'21111063117 ', N'CTKU102', N'CTKU102056', N'Cây nhị phân khác rỗng là cây:
A. Mỗi nút (trừ nút lá) đều có hai nút con

B. Tất cả các nút đều có nút con

C. Mỗi nút có không quá 2 nút con

D. Tất cả các nút đều có nút cha', N'C', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (20, N'21111063156 ', N'CTKU102', N'CTKU102026', N'Cấu trúc dữ liệu nào tương ứng với LIFO?
A. Queue

B. Linked List

C. Tree

D. Stack', N'D', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (24, N'21111063156 ', N'CTKU102', N'CTKU102080', N'Phát biểu sau đúng hay sai: Khi nói tới giải thuật phải xem xét nó sẽ tác động trên dữ liệu nào?
A. Đúng

B.Sai', N'A', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (27, N'21111063156 ', N'CTKU102', N'CTKU102087', N'Để thêm một đối tượng x bất kỳ vào Stack, ta dùng hàm nào sau đây?
A. TOP(x)

B. EMPTY(x)

C. PUSH(x)

D. POP(x)', N'C', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (29, N'21111063156 ', N'CTKU102', N'CTKU102062', N'Tìm mệnh đề sai trong các mệnh đề sau: Một cấu trúc dữ liệu bao gồm…
A. Một tập hợp nào đó các dữ liệu thành phần
B. Các dữ liệu thành phần đặt sát nhau trong bộ nhớ', N'B', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (33, N'21111063117 ', N'CTKU102', N'CTKU102022', N'Chọn câu đúng nhất để mô tả thuật toán sắp xếp nổi bọt (Bubble Sort) trên mảng M có N phần tử:
A. Đi từ cuối mảng về đầu mảng, trong quá trình đi nếu phần tử ở dưới (đứng phía sau) nhỏ hơn phần tử đứng ngay trên (trước) nó thì hai phần tử này sẽ được đổi chỗ cho nhau. Sau mỗi lần đi chúng ta đưa được một phần
tử trồi lên đúng chỗ. Sau N–1 lần đi thì tất cả các phần tử trong mảng M sẽ có thứ tự tăng
B. Đi từ đầu mảng về cuối mảng, trong quá trình đi nếu phần tử ở dưới (đứng phía sau) nhỏ hơn phần tử đứng ngay trên (trước) nó thì hai phần tử này sẽ được đổi chỗ cho nhau. Sau mỗi lần đi chúng ta đưa được một phần tử trồi lên đúng chỗ. Sau N lần đi thì tất cả các phần tử trong mảng M sẽ có thứ tự tăng.
C. Đi từ cuối mảng về đầu mảng, trong quá trình đi nếu phần tử ở dưới (đứng phía sau) nhỏ hơn phần tử đứng ngay trên (trước) nó thì hai phần tử này sẽ được đổi chỗ cho nhau. Sau mỗi lần đi chúng ta đưa được một phần tử trồi lên đúng chỗ. Sau N lần đi thì tất cả các phần tử trong mảng M sẽ có thứ tự tăng
D. Cả a, b, c đều sai', N'A', N'B')
GO
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (36, N'21111063117 ', N'CTKU102', N'CTKU102037', N'Chọn định nghĩa đúng nhất đối với cây nhị phân tìm kiếm:
A. Cây nhị phân tìm kiếm là cây nhị phân có thành phần khóa của mọi nút lớn hơn thành phần khóa của tất cả các nút trong cây con trái của nó và nhỏ hơn thành phần khóa của tất cả các nút trong cây con phải của nó

B. Cây nhị phân tìm kiếm là cây nhị phân có thành phần khóa của mọi nút nhỏ hơn thành phần khóa của tất cả các nút trong cây con trái của nó và nhỏ hơn thành phần khóa của tất cả các nút trong cây con phải của nó

C. Cây nhị phân tìm kiếm là cây nhị phân có thành phần khóa của mọi nút lớn hơn thành phần khóa của tất cả các nút trong cây con trái của nó và lớn hơn thành phần khóa của tất cả các nút trong cây con phải của nó.

D. Cây nhị phân tìm kiếm chính là cây nhị phân', N'A', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (37, N'21111063117 ', N'CTKU102', N'CTKU102014', N'Trong biểu diễn dữ liệu dưới dạng cây, Khái niệm nào sau đây là cấp của cây?
A. Là tổng số nút trên cây
B. Là cấp cao nhất của nút gố
C. Là cấp cao nhất của một nút trên cây
D. Là cấp cao nhất của nút lá', N'C', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (38, N'21111063117 ', N'CTKU102', N'CTKU102030', N'Cho thuật toán sau:
int LinearSearch (int M[], int N, int X)
{ int k = 0;
while (M[k] != X k < N )
k++;
if (k < N )
return (k);
return (-1);
}
Chọn câu đúng nhất trong trường hợp xấu nhất khi không tìm thấy phần tử nào có giá trị bằng X:
A. Số phép gán: Gmax = 1 Số phép so sánh: Smax = 2N+1

B. Số phép gán: Gmax = 2 Số phép so sánh: Smax = 2N+1

C. Số phép gán: Gmax = 1 Số phép so sánh: Smax = 2N+2

D. Số phép gán: Gmax = 1 Số phép so sánh: Smax = N+2', N'A', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (7, N'21111063156 ', N'CTKU102', N'CTKU102047', N'Kết quả nào đúng khi thực hiện giải thuật sau với a[]= {1, 3, 5}; n= 5, k= 3:
void ToHopKe(int a[], int n, int k)
{ int i, j, tmp = 0;
for (i=1;i<= k; i++)
if (a[i]!= n-k+i) {tmp= 1;break;}
if (tmp==0) return;
i= k;
while (a[i]>= n-k+i) i--;
a[i]=a[i] + 1;
for (j=i+1;j<=k;j++) a[j]=a[i] + j - i;
for (i= 1; i<= n; i++) printf("%d ", a[i]);
}
A. 2 3 4

B. 1 2 3

C. 2 3 5

D. 1 4 5', N'D', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (8, N'21111063156 ', N'CTKU102', N'CTKU102075', N'Kiểu dữ liệu trừu tượng là …
A. Kiểu dữ liệu mà người lập trình phải tự xây dựng không dựa trên các kiểu dữ liệu cơ bản được cung cấp từ ngôn ngữ lập trình

B. Kiểu dữ liệu mà người lập trình phải tự xây dựng dựa trên các kiểu dữ liệu không cơ bản được cung cấp từ ngôn ngữ lập trình

C. Kiểu dữ liệu mà người lập trình phải tự xây dựng dựa trên các kiểu dữ liệu cơ bản được cung cấp từ ngôn ngữ máy

D. Kiểu dữ liệu mà người lập trình phải tự xây dựng dựa trên các kiểu dữ liệu cơ bản được cung cấp từ ngôn ngữ lập trình', N'D', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (34, N'21111063156 ', N'CTKU102', N'CTKU102100', N'Theo các phương án dưới đây, kích thước lưu trữ kiểu số nguyên (Integer) bao nhiêu byte?
A. 1 byte

B. 2 byte

C. 4 byte

D. 6 byte', N'B', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (36, N'21111063156 ', N'CTKU102', N'CTKU102013', N'Khi lưu trữ cây nhị phân dưới dạng mảng, nếu vị trí của nút cha trong mảng là i thì vị trí của nút con phải là gì trong các phương án sau?
A. 2*i + 1
B. i+1
C. i-1
D. 2*i', N'A', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (9, N'21111063156 ', N'CTKU102', N'CTKU102071', N'Đánh giá độ phức tạp của giải thuật là việc xác định … và … mà giải thuật cần để thực hiện giải một bài toán:
A. Khoảng thời gian, độ khó

B. Khoảng thời gian, độ khó

C. Khoảng thời gian, dung lượng bộ nhớ máy tính

D. Độ khó, dung lượng bộ nhớ máy tính', N'C', N' ')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (10, N'21111063156 ', N'CTKU102', N'CTKU102017', N'Mối quan hệ giữa cấu trúc dữ liệu và giải thuật có thể minh họa bằng đẳng thức:
A. Cấu trúc dữ liệu + Giải thuật = Chương trình
B. Cấu trúc dữ liệu + Chương trình = Giải thuật
C. Chương trình + Giải thuật = Cấu trúc dữ liệu
D. Cấu trúc dữ liệu = Chương trình', N'A', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (11, N'21111063156 ', N'CTKU102', N'CTKU102098', N'Hãy cho biết quy tắc đúng của phép duyệt cây theo thứ tự sau trong các phương án sau?
A. Duyệt cây con trái theo thứ tự sau; Duyệt gốc; Duyệt cây con phải theo thứ tự sau

B. Duyệt gốc, cây trái, cây phải đồng thời theo thứ tự sau

C. Duyệt cây con trái theo thứ tự sau; Duyệt cây con phải theo thứ tự sau; Duyệt gốc

D. Duyệt gốc; Duyệt cây con trái theo thứ tự sau; Duyệt cây con phải theo thứ tự sau', N'C', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (13, N'21111063156 ', N'CTKU102', N'CTKU102037', N'Chọn định nghĩa đúng nhất đối với cây nhị phân tìm kiếm:
A. Cây nhị phân tìm kiếm là cây nhị phân có thành phần khóa của mọi nút lớn hơn thành phần khóa của tất cả các nút trong cây con trái của nó và nhỏ hơn thành phần khóa của tất cả các nút trong cây con phải của nó

B. Cây nhị phân tìm kiếm là cây nhị phân có thành phần khóa của mọi nút nhỏ hơn thành phần khóa của tất cả các nút trong cây con trái của nó và nhỏ hơn thành phần khóa của tất cả các nút trong cây con phải của nó

C. Cây nhị phân tìm kiếm là cây nhị phân có thành phần khóa của mọi nút lớn hơn thành phần khóa của tất cả các nút trong cây con trái của nó và lớn hơn thành phần khóa của tất cả các nút trong cây con phải của nó.

D. Cây nhị phân tìm kiếm chính là cây nhị phân', N'A', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (14, N'21111063156 ', N'CTKU102', N'CTKU102024', N'Thủ tục mô tả thuật toán sắp xếp chọn trực tiếp (Straight Selection Sort):
void SapXepChonTrucTiep(T M[], int N)
{
int K = 0, PosMin;
int Temp;
while (K < N-1)
{ T Min = M[K];
PosMin = K;
for (int Pos = K+1; Pos < N; Pos++)
if (Min > M[Pos])
{
Min = M[Pos];
PosMin = Pos
}
} ...................................
[1] ...................................
[2] ...................................
[3] K++;
}
return;
}
Chọn câu lệnh thích hợp để đưa vào [1], [2], [3] với mục tiêu hoán vị M[K] và M[PosMin]
A. Temp = M[K] ; Temp = M[PosMin]; M[PosMin] = Temp;
B. M[K] = Temp; M[K] = M[PosMin]; M[PosMin] = Temp ;
C. Temp = M[K] ; M[PosMin] = M[K]; M[PosMin] = Temp ;
D. Temp = M[K] ; M[K] = M[PosMin]; M[PosMin] = Temp ;', N'D', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (15, N'21111063156 ', N'CTKU102', N'CTKU102091', N'Trong lưu trữ dữ liệu kiểu Queue (Q), giả sử F là con trỏ trỏ tới lối trước của Q, R là con trỏ trỏ tới lối sau của Q. Khi loại bỏ một phần tử vào Queue, thì R và F thay đổi thế nào trong các phương án sau?
A. F=F+1, R không thay đổi

B. F không thay đổi, R=R+1

C. F không thay đổi, R=R-1

D. F=F-1, R không thay đổi', N'A', N'D')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (17, N'21111063156 ', N'CTKU102', N'CTKU102059', N'Nhân tố nào là nhân tố chính ảnh hưởng đến thời gian tính của một giải thuật:
A. Máy tính

B. Thuật toán được sử dụng

C. Chương trình dịch

D. Kích thước của dữ liệu đầu vào của thuật toán', N'D', N'D')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (18, N'21111063156 ', N'CTKU102', N'CTKU102072', N'Các kiểu dữ liệu cơ bản là:
A. các kiểu dữ liệu mà người lập trình được cung cấp sẵn từ máy tính

B. các kiểu dữ liệu mà người lập trình được cung cấp sẵn từ ngôn ngữ tự nhiên

C. các kiểu dữ liệu mà người lập trình được cung cấp sẵn từ ngôn ngữ lập trình

D. các kiểu dữ liệu mà người lập trình được cung cấp sẵn từ ngôn ngữ máy', N'C', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (38, N'21111063156 ', N'CTKU102', N'CTKU102049', N'Dấu hiệu nào dưới đây cho biết danh sách liên kết đơn L là rỗng:
A. (L->left == NULL)

B. (L->ìnfor == NULL)

C. (L->next == NULL)

D. (L == NULL)', N'D', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (16, N'21111063156 ', N'CTKU102', N'CTKU102021', N'Xét thủ tục sau:
int TimKiemNP (int M[], int First, int Last, int X)
{
if (First > Last)
return (-1);
int Mid = (First + Last)/2;
if (X == M[Mid])
return (Mid);
if (X < M[Mid])
return(TimKiemNP (M, First, Mid – 1, X));
else
return(TimKiemNP (M, Mid + 1, Last, X));
}
Lựa chọn câu đúng nhất để mô tả thủ tục trên:
A. Thủ tục hỗ trợ tìm kiếm phần tử có giá trị là X trên mảng các phần tử từ chỉ số từ First đến chỉ số Last
B. Thủ tục hỗ trợ tìm kiếm đệ quy phần tử có giá trị là X trên mảng các phần tử từ chỉ số từ First đến chỉ số Last
C. Thủ tục hỗ trợ tìm kiếm đệ quy phần tử có giá trị là X trên mảng các phần tử từ chỉ số từ Last đến chỉ số First
D. Thủ tục hỗ trợ tìm kiếm không đệ quy phần tử có giá trị là X trên mảng các phần tử từ chỉ số từ Last đến chỉ số First', N'B', N'D')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (21, N'21111063156 ', N'CTKU102', N'CTKU102033', N'Với thủ tục như sau:
void operation()
{
int x,a[10],n;
int x,m,l,h,flag=0;
cout<<"Enter the element to be searched:";
cin>>x;
l=0; h=n-1;
while(l<=h)
{
m=(l+h)/2;
if(x==a[m]) {
lag=1; break;
}
else if(x>a[m])
l=m+1;
else if(x<a[m])
h=m-1;
}
if(flag==0)
cout<<"ABSENT";
else
cout<<"PRESENT";
}
Lựa chọn câu đúng nhất để mô tả thủ tục trên
A. Thủ tục tìm nhị phân phần tử được nhập từ bàn phím, nếu tìm thấy sẽ thông báo ABSENT

B. Thủ tục tìm nhị phân phần tử được nhập từ bàn phím, nếu không tìm thấy sẽ thông báo ABSENT

C. Thủ tục tìm tuyến tính phần tử được nhập từ bàn phím, nếu tìm thấy sẽ thông báo ABSENT

D. Thủ tục tìm tuyến tính phần tử được nhập từ bàn phím, nếu không tìm thấy sẽ thông báo ABSENT', N'B', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (22, N'21111063156 ', N'CTKU102', N'CTKU102090', N'Trong lưu trữ dữ liệu kiểu Queue (Q), giả sử F là con trỏ trỏ tới lối trước của Q, R là con trỏ trỏ tới lối sau của Q. Khi thêm một phần tử vào Queue, thì R và F thay đổi thế nào trong các phương án sau?
A. F không thay đổi, R=R+1

B. F=F+1, R không thay đổi

C. F không thay đổi, R=R-1

D. F=F-1, R không thay đổi\', N'A', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (23, N'21111063156 ', N'CTKU102', N'CTKU102068', N'Trong các phát biểu sau, phát biểu nào đúng?
A. Giá trị hàm EndList(L) và hàm FirstList(L) luôn luôn bằng nhau khi danh sách rỗng

B. Giá trị hàm EndList(L) và hàm FirstList(L) luôn luôn khác nhau

C. Giá trị hàm EndList(L) và hàm FirstList(L) bằng nhau hay không tùythuộc vào phương pháp cài đặt danh sách

D. Tất cả đều sai', N'A', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (25, N'21111063156 ', N'CTKU102', N'CTKU102067', N'Danh sách duyệt theo mức của biểu thức đã cho trong câu 3 là:
A. + a * b + * / - e f h c d

B. a b + * + / - c d e f h *

C. + * a + b – c d * e / f h

D. + * a b + * - c d e / f h', N'A', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (26, N'21111063156 ', N'CTKU102', N'CTKU102093', N'Cho cây nhị phân: A, B, C, D, E, F, G, H, I, J, K, L, M, N. Cây con trái của cây C bao gồm những phần tử nào trong các phương án sau?
A. E, F, G

B. F, L, M

C. E, F

D. A, B', N'B', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (30, N'21111063156 ', N'CTKU102', N'CTKU102096', N'Hãy cho biết quy tắc đúng của phép duyệt cây theo thứ tự trước trong các phương án sau?
A. Duyệt cây con trái theo thứ tự trước; Duyệt cây con phải theo thứ tự trước; Duyệt gốc

B. Duyệt gốc; Duyệt cây con trái theo thứ tự trước; Duyệt cây con phải theo thứ tự trước

C. Duyệt gốc, cây trái, cây phải đồng thời theo thứ tự trước

D. Duyệt cây con trái theo thứ tự trước; Duyệt gốc; Duyệt cây con phảitheo thứ tự trước', N'B', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (31, N'21111063156 ', N'CTKU102', N'CTKU102025', N'Đối với thuật toán sắp xếp chọn trực tiếp cho dãy các phần tử sau (10 pt) 16 60 2 25 15 45 5 30 33 20
Cần thực hiện ..................... chọn lựa phần tử nhỏ nhất để sắp xếp mảng M có thứ tự tăng dần.
A. 7 lần
B. 8 lần
C. 9 lần
D. 10 lần', N'C', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (28, N'21111063156 ', N'CTKU102', N'CTKU102034', N'Biểu diễn và tổ chức ngăn xếp (Stack) bằng danh sách liên kết giả sử bề mặt của ngăn xếp là đầu danh sách liên kết:
typedef struct SElement
{ T Key;
SElement *Next;
} SOneElement;
typedef struct SOneElement *SSTACK;
SSTACK SSP;
Thêm 1 phần tử vào ngăn xếp (dùng cấu trúc dữ liệu mô tả ở trên)
B1: NewElement = Khởi tạo nút mới (dùng toán tử new)
B2: if (NewElement == NULL)
Thực hiện BKT
B3: if (SSP == NULL)
B3.1: SSP = NewElement
B3.2: Thực hiện BKT
B4: …………………………………………
B5: …………………………………………
BKT: Kết thúc
Chọn câu lệnh chính xác cho B4 và B5
A. B4: NewElement ->Next = SSP SSP = NewElement

B. B4: SSP = NewElement ->Next B5: SSP = NewElement

C. B4: SSP = NewElement ->Next B5: NewElement = SSP

D. B4: NewElement ->Next = SSP B5: NewElement = SSP', N'A', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (32, N'21111063156 ', N'CTKU102', N'CTKU102032', N'Cấu trúc dữ liệu cho kiểu dữ liệu sinh viên như sau:
typedef struct tagSV{
char MSSV[8];
char Ten[30];
char NgaySinh[11];
float DTB;
}SV;
Khai báo
SV sv1, *sv2;
Lựa chọn các câu đúng nhất để gán giá trị cho mã sinh viên của sv1 và sv2:
A. sv1.MSSV = “Nguyen Van A”; sv2.MSSV = “Nguyen Van B”;

B. sv1.MSSV = “Nguyen Van A”; sv2->MSSV = “Nguyen Van B”;

C. sv1->MSSV = “Nguyen Van A”; sv2->MSSV = “Nguyen Van B”;

D. sv1->MSSV = “Nguyen Van A”; sv2.MSSV = “Nguyen Van B”;', N'B', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (33, N'21111063156 ', N'CTKU102', N'CTKU102099', N'Yếu tố nào sau đây để xây dựng nên một chương trình hoàn chỉnh?
A. Dữ liệu tốt, giải thuật đơn giản

B. Giải thuật có thời gian thực hiện nhanh nhất

C. Cấu trúc dữ liệu thích hợp, giải thuật xử lý hiệu quả

D. Cấu trúc dữ liệu tốt', N'C', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (35, N'21111063156 ', N'CTKU102', N'CTKU102041', N'Tìm kiếm xem trong danh sách liên kết đơn có tồn tại nút có thành phần dữ liệu là SearchData hay không. Thao tác này chúng ta vận dụng thuật toán tìm tuyến tính để tìm kiếm:
typedef struct Node
{
int Data;
Node * Link;
} OneNode;''
typedef OneNode * Pointer;
Pointer SSList; // Quản lý danh sách liên kết đơn bởi 1 phần tử đầu
B1: CurNode = SLList
B2: IF (………………………………………………)
Thực hiện BKT
B3: CurNode = CurNode->Link
B4: Lặp lại B2
BKT: Kết thúc
Chọn điều kiện hợp lý cho mã giả ở B2
A. CurNode != NULL OR CurNode->Data = SearchData

B. CurNode = NULL OR CurNode->Data != SearchData

C. CurNode = NULL OR CurNode->Data = SearchData

D. CurNode != NULL OR CurNode->Data != SearchData', N'C', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (37, N'21111063156 ', N'CTKU102', N'CTKU102051', N'Thao tác nào dưới đây thực hiện trên hàng đợi (queue):
A. Thêm phần tử vào lối sau

B. Loại bỏ phần tử ở lối sau

C. Thêm phần tử vào lối trước

D. Thêm và loại bỏ phần tử tại vị trí bất kỳ', N'A', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (39, N'21111063156 ', N'CTKU102', N'CTKU102014', N'Trong biểu diễn dữ liệu dưới dạng cây, Khái niệm nào sau đây là cấp của cây?
A. Là tổng số nút trên cây
B. Là cấp cao nhất của nút gố
C. Là cấp cao nhất của một nút trên cây
D. Là cấp cao nhất của nút lá', N'C', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (40, N'21111063156 ', N'CTKU102', N'CTKU102008', N'Hãy cho biết tư tưởng nào sau đây nói về của giải thuật tìm kiếm nhị phân?
A. Lần lượt chia dãy thành hai dãy con dựa vào phần tử khoá, sau đó thực hiện việc tìm kiếm trên hai đoạn đã chia
B. So sánh X lần lượt với các phần tử thứ nhất, thứ hai,... của dãy cho đến khi gặp phần tử có khoá cần tìm
C. Tìm kiếm dựa vào cây nhị tìm kiếm
D. Tại mỗi bước tiến hành so sánh X với phần tử ở giữa của dãy, dựa vào bước so sánh này quyết định giới hạn dãy tìm kiếm nằm ở nửa trên, hay nửa dưới của dãy hiện hành', N'D', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (2, N'21111063239 ', N'NNTA103', N'NNTA103027', N'Tìm lỗi sai trong câu sau:
The number of women earning Master''s Degrees have risen sharply in recent years.
A. number     
B. earning     
C. have risen     
D. recent years', N'C', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (3, N'21111063239 ', N'NNTA103', N'NNTA103032', N'Tìm lỗi sai trong câu sau:
There are many different ways of comparing the culture of one nation with those of another.
A. There are     
B. of comparing     
C. those     
D. another', N'C', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (4, N'21111063239 ', N'NNTA103', N'NNTA103041', N'Tìm lỗi sai trong câu sau:
You shouldn’t criticize him in front of his friends. It was insensitive of you.
A. shouldn’t criticize     
B. him in front of
C. it      
D. insensitive', N'A', N'D')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (5, N'21111063239 ', N'NNTA103', N'NNTA103052', N'Tìm lỗi sai trong câu sau:
The shopkeeper warned the boys don''t learn their bicycles against his windows.
A. the      
B. don’t      
C. their     
D. against', N'B', N'D')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (6, N'21111063239 ', N'NNTA103', N'NNTA103059', N'Tìm lỗi sai trong câu sau:
The two children tried as hardly as they could to bring about a reconciliation between their parents.
A. children      
B. hardly     
C. between      
D. to bring about', N'B', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (7, N'21111063239 ', N'NNTA103', N'NNTA103008', N'Tìm lỗi sai trong câu sau:
Not until he got home he realized he had forgotten to give her the present.
A. got     
B. he realized     
C. her     
D. the present', N'B', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (8, N'21111063239 ', N'NNTA103', N'NNTA103055', N'Tìm lỗi sai trong câu sau:
A dangerously situation was created by the bad roads.
A. dangerously      
B. was      
C. created      
D. bad roads', N'A', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (9, N'21111063239 ', N'NNTA103', N'NNTA103035', N'Tìm lỗi sai trong câu sau:
Sometimes it takes me about three hours finishing my round.
A. sometimes     
B. me     
C. hours     
D. finishing', N'D', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (10, N'21111063239 ', N'NNTA103', N'NNTA103033', N'Tìm lỗi sai trong câu sau:
She only had a twenty-dollars bill with her when she landed at Healthrow airport.
A. had     
B. twenty-dollars bill     
C. when     
D. at', N'B', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (11, N'21111063239 ', N'NNTA103', N'NNTA103060', N'Tìm lỗi sai trong câu sau:
Education, whether it happens at school or anywhere else, is a important part in our life.
A. Education      
B. whether      
C. or      
D. a important part', N'D', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (12, N'21111063239 ', N'NNTA103', N'NNTA103053', N'Tìm lỗi sai trong câu sau:
The telephone rang several times and then stop before I could answer it.
A. times      
B. then      
C. stop      
D. could', N'C', N'D')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (13, N'21111063239 ', N'NNTA103', N'NNTA103046', N'Tìm lỗi sai trong câu sau:
English is speaking in many countries in the world.
A. English      
B. speaking      
C. many countries     
D. the world', N'B', N'D')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (14, N'21111063239 ', N'NNTA103', N'NNTA103007', N'Tìm lỗi sai trong câu sau:
The earth is the only planet with a large number of oxygen in its atmosphere.
A. the     
B. number     
C. oxygen     
D. its', N'B', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (15, N'21111063239 ', N'NNTA103', N'NNTA103043', N'Tìm lỗi sai trong câu sau:
I’m not used to go to school late. I prefer punctuation.
A. I’m not used to     
B. go
C. late     
D. prefer', N'B', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (16, N'21111063239 ', N'NNTA103', N'NNTA103017', N'Tìm lỗi sai trong câu sau:
After spending two days arguing about where to go for their holidays, is was decided that they shouldn’t go anywhere.
A. arguing     
B. for     
C. is was decided     
D. shouldn’t go', N'C', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (17, N'21111063239 ', N'NNTA103', N'NNTA103034', N'Tìm lỗi sai trong câu sau:
I was very busy lately since the project of designing the new collection started.
A. was     
B. since
C. the project    
D. the new collection', N'A', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (18, N'21111063239 ', N'NNTA103', N'NNTA103001', N'"I have never been to Russia. I think I shall go there next year.” said Bill.
A. Bill said that he had never been to Russia and he thought he would go there the next year.

B. Bill said that he would have never been to Russia and he thinks he would go there the next year.

C. Bill said that he had never been to Russia and he thinks he will go there the next year.

D. Bill said that he has never been to Russia and he thinks he would go there the next year.', N'A', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (19, N'21111063239 ', N'NNTA103', N'NNTA103058', N'Tìm lỗi sai trong câu sau:
Had I been interested in that subject, I would try to learn more about it.
A. in      
B. try to learn      
C. Had      
D. about', N'B', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (6, N'21111063156 ', N'CTKU102', N'CTKU102083', N'Chỉ ra khái niệm có tính chất đệ quy?
A. khái niệm tính giai thừa của n (n!)

B. khái niệm hình ảnh

C. khái niệm âm thanh', N'A', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (11, N'21111063117 ', N'NNTA103', N'NNTA103006', N'Tìm lỗi sai trong câu sau:
The leader demanded from his members a serious attitude towards work, good team spirit, and that they work hard.
A. leader      
B. his members  
C. attitude     
D. that they work hard', N'D', N'D')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (13, N'21111063117 ', N'NNTA103', N'NNTA103042', N'Tìm lỗi sai trong câu sau:
Higher education in the United States specifically refers to post -secondary institutions, that offer associate degrees, master degrees or Ph.d. degrees or equivalents.
A. specifically refers      
B. institutions      
C. that      
D. or equivalents', N'C', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (14, N'21111063117 ', N'NNTA103', N'NNTA103021', N'Tìm lỗi sai trong câu sau:
Most bothersome flies belong to the family Sarcophagidae and are popular known as flesh flies because the larvae feed on flesh.
A. belong to     
B. popular known     
C. because     
D. feed on', N'B', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (15, N'21111063117 ', N'NNTA103', N'NNTA103017', N'Tìm lỗi sai trong câu sau:
After spending two days arguing about where to go for their holidays, is was decided that they shouldn’t go anywhere.
A. arguing     
B. for     
C. is was decided     
D. shouldn’t go', N'C', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (17, N'21111063117 ', N'NNTA103', N'NNTA103057', N'Tìm lỗi sai trong câu sau:
One of the best ways to encourage your children to read are to provide interesting titles for them to enjoy.
A. the best      
B. to read     
C. are      
D. for', N'C', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (18, N'21111063117 ', N'NNTA103', N'NNTA103056', N'Tìm lỗi sai trong câu sau:
In most countries music songs are deeply personal and deal with themes of love, lonely, and separation.
A. most countries      
B. deeply     
C. deal with      
D. lonely', N'D', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (2, N'21111063145 ', N'CTKM107', N'CTKM107001', N'Máy tính điện tử là gì?
A. Thiết bị lưu trữ thông tin 
B. Thiết bị số hóa và biến đổi thông tin 
C. Thiết bị lưu trữ và xử lý thông tin
D. Thiết bị tạo và biến đổi thông tin', N'C', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (8, N'21111063145 ', N'CTKM107', N'CTKM107008', N'Phần mềm của máy tính là: 
A. Các bộ điều phối thiết bị giúp cho việc ghép nối và ra được thực hiện một cách linh hoạt.
B. Cơ cấu trao đổi dữ liệu giữa các thiết bị phần cứng trong máy tính 
C. Chương trình được cài đặt trong bộ nhớ ROM 
D. Bộ vi xử lý và các vi mạch hỗ trợ cho nó', N'C', N' ')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (1, N'21111063156 ', N'CTKU102', N'CTKU102023', N'Hàm mô tả sắp xếp nổi bọt (Bubble Sort) trên mảng M có N phần tử
void BubbleSort(int M[], int N)
{
[2] int Temp;
[3] for (int I = 0; I < N-1; I++)
[4] …………………………………..
[5] if (M[J] < M[J-1])
[6] {
[7] Temp = M[J];
[8] M[J] = M[J-1];
[9] M[J-1] = Temp;
[10] }
[11] return;
[12] }
[13]
Lệnh nào sau đây sẽ được đưa vào dòng lệnh thứ [5] của thủ tục:
A. for (int J = N-1; J > I; J++)
B. for (int J = N; J < I; J--)
C. for (int J = N-1; J > I; J--)
D. Không có dòng lệnh nào phù hợp, không cần thêm vào thuật toán vẫn chạy đúng', N'C', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (3, N'21111063239 ', N'CTKM107', N'CTKM107039', N'Trong hệ La mã số MMCMLXXVI nhận giá trị thập phân nào trong các giá trị sau đây: 
A. 1846 
B. 2756 
C. 2866 
D. 2976 *', N'D', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (4, N'21111063239 ', N'CTKM107', N'CTKM107092', N'Bus nào trong máy tính có nhiệm vụ là đường truyền dẫn giữa các khối của bộ vi xử lý?
A.Bus trong bộ vi xử lý
B.Bus bộ vi xử lý
C.Bus ngoại vi
D.Bus hệ thống', N'A', N' ')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (12, N'21111063156 ', N'CTKU102', N'CTKU102069', N'Giải thuật là … câu lệnh chặt chẽ, rõ ràng và xác định một trình tự các thao tác trên các đối tượng dữ liệu
A. một

B. hai

C. dãy', N'C', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (19, N'21111063117 ', N'NNTA103', N'NNTA103011', N'Tìm lỗi sai trong câu sau:
People in every part of the world readily and easily communicates by means of electronic mail.
A. every part     
B. readlily     
C. communicates     
D. by means', N'C', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (20, N'21111063171 ', N'CTKM107', N'CTKM107046', N'Trong hệ nhị phân số 11001.11(2) tương ứng với giá trị thập phân nào trong các giá trị sau đây: 
A. 27.75 
B. 29.75 
C. 25.75
D. 29.25', N'C', N'D')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (21, N'21111063171 ', N'CTKM107', N'CTKM107017', N'Thông tin được lưu trữ và truyền bên trong máy tính dưới dạng:
A. Nhị phân
B. Mã ASSCII
C. Thập phân
D. Kết hợp chữ cái và chữ số', N'A', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (22, N'21111063171 ', N'CTKM107', N'CTKM107019', N'Hãy chỉ ra khẳng định sai trong các khẳng định sau: 
A. Hệ đếm là tập hợp các ký hiệu và qui tắc sử dụng tập ký hiệu đó để biểu diễn và xác định giá trị các số 
B. Tổng số ký số của mỗi hệ đếm được gọi là cơ số 
C. Mỗi hệ đếm được xây dựng trên một tập ký số vô hạn
D. Hệ đếm La mã là hệ đếm không có trọng số', N'C', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (23, N'21111063171 ', N'CTKM107', N'CTKM107050', N'Trong hệ đếm bát phân số 237.04(8) tương ứng với giá trị thập phân nào trong các giá trị sau đây: 
A. 157.0625 
B. 157.8125 
C. 159.0625
D. 159.8125', N'C', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (24, N'21111063171 ', N'CTKM107', N'CTKM107034', N'Trong hệ La mã số CM nhận giá trị thập phân nào trong các giá trị sau đây: 
A. 1600 
B. 1500 
C. 1100 
D. 900', N'D', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (25, N'21111063171 ', N'CTKM107', N'CTKM107083', N'Bộ mã ASSCII mở rộng gồm bao nhiêu kí tự? 
A. 128 
B. 256
C. 512 
D. 1024', N'B', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (26, N'21111063171 ', N'CTKM107', N'CTKM107069', N'Kết quả cộng hai số nhị phân 1010111(2) và 1101011(2) bằng số nhị phân nào trong các số sau: 
A. 10011000(2) 
B. 11000010(2)
C. 10010000(2) 
D. 10001000(2)', N'B', N'D')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (27, N'21111063171 ', N'CTKM107', N'CTKM107085', N'Bộ mã ASSCII cơ sở gồm các kí tự được mã hóa bằng bao nhiêu bit? 
A. 6 bit 
B. 7 bit
C. 8 bit
D. 9 bit', N'B', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (28, N'21111063171 ', N'CTKM107', N'CTKM107005', N'Phần dẻo (Firmware) trong máy tính là gì? 
A. Phần mềm được đặt vào bên trong các mạch điện tử trong quá trình sản xuất 
B. Hệ điều hành 
C. Các Driver cho các thiết bị phần cứng và các mạch hỗ trợ phối ghépvào ra cho máy tính 
D. Phần mềm hệ thống', N'A', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (29, N'21111063171 ', N'CTKM107', N'CTKM107044', N'Trong hệ nhị phân số 10111.1(2) tương ứng với giá trị thập phân nào trong các giá trị sau đây: 
A. 23.5
B. 23.25 
C. 25.5 
D. 25.25', N'A', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (30, N'21111063171 ', N'CTKM107', N'CTKM107012', N'Trong các phát biểu sau, phát biểu nào không thuộc nội dung của nguyên lý Von Newmann? 
A. Máy tính có thể hoạt động theo một chương trình đã được lưu trữ
B. Máy tính sử dụng một bộ đếm chương trình để chỉ ra vị trí câu lệnh kế tiếp C. Bộ nhớ của máy tính được địa chỉ hóa 
D. Mỗi câu lệnh phải có một vùng nhớ chứa địa chỉ lệnh tiếp theo', N'D', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (1, N'21111063171 ', N'NNTA103', N'NNTA103058', N'Tìm lỗi sai trong câu sau:
Had I been interested in that subject, I would try to learn more about it.
A. in      
B. try to learn      
C. Had      
D. about', N'B', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (2, N'21111063171 ', N'NNTA103', N'NNTA103034', N'Tìm lỗi sai trong câu sau:
I was very busy lately since the project of designing the new collection started.
A. was     
B. since
C. the project    
D. the new collection', N'A', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (3, N'21111063171 ', N'NNTA103', N'NNTA103049', N'Tìm lỗi sai trong câu sau:
For the first time in the history of the country, the person who recommended by the president to replace a retired justice on the Supreme Court is a woman.
A. is      
B. a retired justice
C. to replace      
D. who recommended', N'D', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (4, N'21111063171 ', N'NNTA103', N'NNTA103010', N'Tìm lỗi sai trong câu sau:
For thousands of years, man has created sweet-smelling substances from wood, herbs and flowers and using them for perfumes or medicine.
A. man     
B. sweet-smelling     
C. using them     
D. or', N'C', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (5, N'21111063171 ', N'NNTA103', N'NNTA103025', N'Tìm lỗi sai trong câu sau:
It is vitally important that she takes this medication night and morning.
A. vitally     
B. that     
C. takes     
D. medication', N'C', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (9, N'21111063171 ', N'NNTA103', N'NNTA103024', N'Tìm lỗi sai trong câu sau:
I enjoyed talking to the people with that I met at the party last night.
A. talking    
B. the     
C. with that     
D. at the party', N'C', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (11, N'21111063171 ', N'NNTA103', N'NNTA103003', N'Tìm lỗi sai trong câu sau:
Developing new technologies are time-consuming and expensive.
A. developing      
B. technologies      
C. are      
D. time-consuming', N'C', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (15, N'21111063171 ', N'NNTA103', N'NNTA103045', N'Tìm lỗi sai trong câu sau:
Paris is much more exciting as I expected.
A. much      
B. exciting      
C. as      
D. expected', N'A', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (6, N'21111063171 ', N'NNTA103', N'NNTA103005', N'Tìm lỗi sai trong câu sau:
A novel is a story long enough to fill a complete book, in that the characters and events are usually imaginary.
A. long enough      
B. complete     
C. that     
D. imaginary', N'C', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (7, N'21111063171 ', N'NNTA103', N'NNTA103040', N'Tìm lỗi sai trong câu sau:
It is the recommendation of many psychologists that a learner ought to use mental images to associate word and remember them.
A. recommendation     
B. ought to use
C. to associate word     
D. remember them', N'B', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (8, N'21111063171 ', N'NNTA103', N'NNTA103037', N'Tìm lỗi sai trong câu sau:
I can’t find the letter I received from my boss some days ago. I might throw it into the waste paper bin yesterday.
A. received     
B. can’t find
C. into the     
D. might throw', N'D', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (10, N'21111063171 ', N'NNTA103', N'NNTA103016', N'Tìm lỗi sai trong câu sau:
United States is aimed at develop friendly relations among nations based on respect for the principle of equal rights and self-determination of people.
A. develop 
B. based 
C. principle 
D. people', N'A', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (12, N'21111063171 ', N'NNTA103', N'NNTA103018', N'Tìm lỗi sai trong câu sau:
Regarding as one of the leading figures in the development of the short story, O Henry is the author of many well- known American novels.
A. Regarding as     
B. leading figures     
C. the     
D. novels', N'A', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (13, N'21111063171 ', N'NNTA103', N'NNTA103027', N'Tìm lỗi sai trong câu sau:
The number of women earning Master''s Degrees have risen sharply in recent years.
A. number     
B. earning     
C. have risen     
D. recent years', N'C', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (14, N'21111063171 ', N'NNTA103', N'NNTA103001', N'"I have never been to Russia. I think I shall go there next year.” said Bill.
A. Bill said that he had never been to Russia and he thought he would go there the next year.

B. Bill said that he would have never been to Russia and he thinks he would go there the next year.

C. Bill said that he had never been to Russia and he thinks he will go there the next year.

D. Bill said that he has never been to Russia and he thinks he would go there the next year.', N'A', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (16, N'21111063171 ', N'NNTA103', N'NNTA103059', N'Tìm lỗi sai trong câu sau:
The two children tried as hardly as they could to bring about a reconciliation between their parents.
A. children      
B. hardly     
C. between      
D. to bring about', N'B', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (17, N'21111063171 ', N'NNTA103', N'NNTA103056', N'Tìm lỗi sai trong câu sau:
In most countries music songs are deeply personal and deal with themes of love, lonely, and separation.
A. most countries      
B. deeply     
C. deal with      
D. lonely', N'D', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (18, N'21111063171 ', N'NNTA103', N'NNTA103031', N'Tìm lỗi sai trong câu sau:
For thousands of years, man has created sweet-smelling substances from wood, herbs and flowers and using them for perfumes or medicine.
A. man     
B. sweet-smelling     
C. using them     
D. or', N'C', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (19, N'21111063171 ', N'NNTA103', N'NNTA103050', N'Tìm lỗi sai trong câu sau:
The most sensitive way to resolve a family problem is by open discussion.
A. the      
B. sensitive      
C. by      
D. open', N'D', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (20, N'21111063171 ', N'NNTA103', N'NNTA103009', N'Tìm lỗi sai trong câu sau:
If one type of manufacturing expands, it is like that another type will shrink considerably.
A. expands     
B. like     
C. another     
D. considerably', N'B', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (21, N'21111063171 ', N'NNTA103', N'NNTA103038', N'Tìm lỗi sai trong câu sau:
Unlike the old one, this new copier can perform their functions in half the time.
A. unlike     
B. can perform
C. their functions     
D. in half the time', N'C', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (6, N'21111063117 ', N'CTKU102', N'CTKU102086', N'Trong bốn kiểu ký hiệu sau đây, ký hiệu nào biểu thị cho danh sách kiểu hàng đợi?
A. FIFO

B. LIFO

C. FILO

D. LOLO', N'A', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (7, N'21111063117 ', N'CTKU102', N'CTKU102055', N'Nút có khóa nhỏ nhất trong cây nhị phân tìm kiếm khác rỗng là:
A. Nút gốc

B. Tất cả các nút

C. Nút con bên phải nhất

D. Nút con bên trái nhất', N'D', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (15, N'21111063117 ', N'CTKU102', N'CTKU102081', N'Phát biểu sau đúng hay sai: Giải thuật thể hiện hành động của các bước để giải bài toán?
A. Đúng

B. Sai', N'A', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (16, N'21111063117 ', N'CTKU102', N'CTKU102076', N'Chỉ ra kiểu dữ liệu trừu tượng:
A. float

B. int

C. char

D. mảng 1 chiều', N'D', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (19, N'21111063117 ', N'CTKU102', N'CTKU102084', N'Cho bài toán: cho trước n là một số tự nhiên, tính n!. Chỉ ra trường hợp suy biến
A. với n = 0

B. với n = 1

C. với n =0 hoặc n = 1', N'C', N'B')
GO
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (22, N'21111063171 ', N'NNTA103', N'NNTA103014', N'Tìm lỗi sai trong câu sau:
By the time Robert will finish writing the first draft of his paper, most of the other students will have completed their final draft
A. will finish     
B. writing     
C. most     
D. their', N'A', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (23, N'21111063171 ', N'NNTA103', N'NNTA103011', N'Tìm lỗi sai trong câu sau:
People in every part of the world readily and easily communicates by means of electronic mail.
A. every part     
B. readlily     
C. communicates     
D. by means', N'C', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (24, N'21111063171 ', N'NNTA103', N'NNTA103017', N'Tìm lỗi sai trong câu sau:
After spending two days arguing about where to go for their holidays, is was decided that they shouldn’t go anywhere.
A. arguing     
B. for     
C. is was decided     
D. shouldn’t go', N'C', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (25, N'21111063171 ', N'NNTA103', N'NNTA103055', N'Tìm lỗi sai trong câu sau:
A dangerously situation was created by the bad roads.
A. dangerously      
B. was      
C. created      
D. bad roads', N'A', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (20, N'21111063117 ', N'NNTA103', N'NNTA103044', N'Tìm lỗi sai trong câu sau:
Despite the long history of the rights of property ownership, there have been a great deal of disagreement over what such rights entail.
A. what such rights entail     
B. have been
C. Despite      
D. a great deal of', N'B', N'D')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (2, N'21111063156 ', N'CTKU102', N'CTKU102003', N'Hãy cho biết ý tưởng nào sau đây nói về phương pháp sắp xếp chèn (insertion sort)?
A. Phân đoạn dãy thành nhiều dãy con và lần lượt trộn hai dãy con thành dãy lớn hơn, cho đến khi thu được dãy ban đầu đã được sắp xếp

B. Lần lượt lấy phần tử của danh sách chèn vị trí thích hợp của nó trong dãy bằng cách đẩy các phần tử lớn hơn xuống

C. Chọn phần tử bé nhất xếp vào vị trí thứ nhất bằng cách đổi chổ phần tử bé nhất với phần tử thứ nhất; Tương tự đối với phần tử nhỏ thứ hai cho đến phần tử cuối cùng

D. Bắt đầu từ cuối dãy đến đầu dãy, ta lần lượt so sánh hai phần tử kế tiếp nhau, nếu phần tử nào nhỏ hơn được đứng vị trí trên', N'B', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (3, N'21111063156 ', N'CTKU102', N'CTKU102061', N'Trong các mệnh đề sau đây, mệnh đề nào sai:
A. Kiểu dữ liệu là một tập hợp nào đó các phần tử dữ liệu cùng chung một thuộc tính

B. kiểu của một ngôn ngữ bao gồm các kiểu dữ liệu đơn và các phương pháp cho phép ta từ các kiểu dữ liệu đã có xây dựng nên các kiểu dữ liệu mới

C. Cấu trúc dữ liệu là các dữ liệu phức tạp, được xây dựng nên từ các kiểu dữ liệu đã có, đơn giản hơn bằng các phương pháp liên kết nào đó

D. Một trong ba mệnh đề trên là sai', N'D', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (4, N'21111063156 ', N'CTKU102', N'CTKU102058', N'Đồ thị vô hướng G có chu trình Euler khi và chỉ khi:
A. G liên thông và mọi đỉnh G có bậc chẵn

B. mọi đỉnh G có bậc chẵn

C. G có chu trình Hamilton

D. G có đường đi Euler', N'C', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (5, N'21111063156 ', N'CTKU102', N'CTKU102040', N'Khi cần thêm một phần tử có giá trị thành phần dữ liệu là NewData (là một số nguyên) vào đầu của danh sách liên kết đơn dùng thuật toán có mã giả mô tả như dưới đây?
typedef struct Node
{
int Data; Node * NextNode;
} OneNode; typedef OneNode * SLLPointer;
SLLPointer SSList;
B1: NewNode = new OneNode
B2: IF (NewNode = NULL) Thực hiện BKT
B3: NewNode ->NextNode = NULL
B4: NewNode ->Data = NewData B5: NewNode->NextNode = SLList
B6: SLList = NewNode BKT: Kết thúc
Tìm mô tả chính xác cho B5
A. Chuyển vai trò đứng đầu của NewNode cho SLList

B. Nối NewNode vào sau SLList

C. Chuyển vai trò đứng đầu của SLList cho NewNode

D. Nối SLList vào sau NewNode', N'D', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (19, N'21111063156 ', N'CTKU102', N'CTKU102082', N'Phát biểu sau đúng hay sai: Dữ liệu là đối tượng được xử lý , nó biểu diễn các thông tin cần thiết cho bài toán: dữ liệu vào, dữ liệu ra?
A. Đúng

B.Sai', N'A', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (4, N'123         ', N'NNTA103', N'NNTA103053', N'Tìm lỗi sai trong câu sau:
The telephone rang several times and then stop before I could answer it.
A. times      
B. then      
C. stop      
D. could', N'C', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (5, N'123         ', N'NNTA103', N'NNTA103019', N'Tìm lỗi sai trong câu sau:
If you work hard, you would be successful in anything you do.
A. you work     
B. would be     
C. in     
D. anything', N'B', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (6, N'123         ', N'NNTA103', N'NNTA103012', N'Tìm lỗi sai trong câu sau:
The grass needs cutting, so let us have one of the men to take lawn-mower and do it.
A. needs     
B. cutting     
C. let     
D. to take', N'D', N' ')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (40, N'21111063117 ', N'CTKU102', N'CTKU102052', N'Dấu hiệu nào dưới đây cho biết hàng đợi đã có thao tác thêm và loại bỏ phần tử là rỗng:
A. Lối trước có giá trị > giá trị của lối sau

B. Lối sau nhận giá trị = 0

C. Lối trước có giá trị < giá trị của lối sau

D. Lối trước nhận giá trị = 0', N'A', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (41, N'21111063117 ', N'CTKU102', N'CTKU102026', N'Cấu trúc dữ liệu nào tương ứng với LIFO?
A. Queue

B. Linked List

C. Tree

D. Stack', N'D', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (42, N'21111063117 ', N'CTKU102', N'CTKU102047', N'Kết quả nào đúng khi thực hiện giải thuật sau với a[]= {1, 3, 5}; n= 5, k= 3:
void ToHopKe(int a[], int n, int k)
{ int i, j, tmp = 0;
for (i=1;i<= k; i++)
if (a[i]!= n-k+i) {tmp= 1;break;}
if (tmp==0) return;
i= k;
while (a[i]>= n-k+i) i--;
a[i]=a[i] + 1;
for (j=i+1;j<=k;j++) a[j]=a[i] + j - i;
for (i= 1; i<= n; i++) printf("%d ", a[i]);
}
A. 2 3 4

B. 1 2 3

C. 2 3 5

D. 1 4 5', N'D', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (43, N'21111063117 ', N'CTKU102', N'CTKU102032', N'Cấu trúc dữ liệu cho kiểu dữ liệu sinh viên như sau:
typedef struct tagSV{
char MSSV[8];
char Ten[30];
char NgaySinh[11];
float DTB;
}SV;
Khai báo
SV sv1, *sv2;
Lựa chọn các câu đúng nhất để gán giá trị cho mã sinh viên của sv1 và sv2:
A. sv1.MSSV = “Nguyen Van A”; sv2.MSSV = “Nguyen Van B”;

B. sv1.MSSV = “Nguyen Van A”; sv2->MSSV = “Nguyen Van B”;

C. sv1->MSSV = “Nguyen Van A”; sv2->MSSV = “Nguyen Van B”;

D. sv1->MSSV = “Nguyen Van A”; sv2.MSSV = “Nguyen Van B”;', N'B', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (44, N'21111063117 ', N'CTKU102', N'CTKU102075', N'Kiểu dữ liệu trừu tượng là …
A. Kiểu dữ liệu mà người lập trình phải tự xây dựng không dựa trên các kiểu dữ liệu cơ bản được cung cấp từ ngôn ngữ lập trình

B. Kiểu dữ liệu mà người lập trình phải tự xây dựng dựa trên các kiểu dữ liệu không cơ bản được cung cấp từ ngôn ngữ lập trình

C. Kiểu dữ liệu mà người lập trình phải tự xây dựng dựa trên các kiểu dữ liệu cơ bản được cung cấp từ ngôn ngữ máy

D. Kiểu dữ liệu mà người lập trình phải tự xây dựng dựa trên các kiểu dữ liệu cơ bản được cung cấp từ ngôn ngữ lập trình', N'D', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (45, N'21111063117 ', N'CTKU102', N'CTKU102058', N'Đồ thị vô hướng G có chu trình Euler khi và chỉ khi:
A. G liên thông và mọi đỉnh G có bậc chẵn

B. mọi đỉnh G có bậc chẵn

C. G có chu trình Hamilton

D. G có đường đi Euler', N'C', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (21, N'21111063117 ', N'NNTA103', N'NNTA103049', N'Tìm lỗi sai trong câu sau:
For the first time in the history of the country, the person who recommended by the president to replace a retired justice on the Supreme Court is a woman.
A. is      
B. a retired justice
C. to replace      
D. who recommended', N'D', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (1, N'21111063145 ', N'CTKU102', N'CTKU102052', N'Dấu hiệu nào dưới đây cho biết hàng đợi đã có thao tác thêm và loại bỏ phần tử là rỗng:
A. Lối trước có giá trị > giá trị của lối sau

B. Lối sau nhận giá trị = 0

C. Lối trước có giá trị < giá trị của lối sau

D. Lối trước nhận giá trị = 0', N'A', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (3, N'21111063145 ', N'CTKU102', N'CTKU102053', N'Thao tác nào dưới đây thực hiện trên ngăn xếp (stack):
A. Thêm phần tử vào vị trí bất kỳ

B. Loại bỏ phần tử tại vị trí bất kỳ

C. Thêm và loại bỏ phần tử luôn thực hiện tại vị trí đỉnh (top)

D. Thêm và loại bỏ phần tử có thể thực hiện tại vị trí bất kỳ', N'C', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (17, N'21111063145 ', N'CTKU102', N'CTKU102041', N'Tìm kiếm xem trong danh sách liên kết đơn có tồn tại nút có thành phần dữ liệu là SearchData hay không. Thao tác này chúng ta vận dụng thuật toán tìm tuyến tính để tìm kiếm:
typedef struct Node
{
int Data;
Node * Link;
} OneNode;''
typedef OneNode * Pointer;
Pointer SSList; // Quản lý danh sách liên kết đơn bởi 1 phần tử đầu
B1: CurNode = SLList
B2: IF (………………………………………………)
Thực hiện BKT
B3: CurNode = CurNode->Link
B4: Lặp lại B2
BKT: Kết thúc
Chọn điều kiện hợp lý cho mã giả ở B2
A. CurNode != NULL OR CurNode->Data = SearchData

B. CurNode = NULL OR CurNode->Data != SearchData

C. CurNode = NULL OR CurNode->Data = SearchData

D. CurNode != NULL OR CurNode->Data != SearchData', N'C', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (1, N'21111063145 ', N'CTKM107', N'CTKM107089', N'Mã ASSCII của chữ số 9 bằng bao nhiêu? 
A. 25H 
B. 36H
C. 39H
D. 40H', N'C', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (3, N'21111063145 ', N'CTKM107', N'CTKM107040', N'Trong hệ nhị phân số 11101.11(2) tương ứng với giá trị thập phân nào trong các giá trị sau đây: 
A. 26,75 
B. 29,75 
C. 29,65 
D. 26,65', N'B', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (18, N'21111063145 ', N'CTKM107', N'CTKM107027', N'Chữ số L trong hệ đếm La mã tương ứng với giá trị nào trong các giá trị sau đây: 
A. 50
B. 100 
C. 500 
D. 1000', N'A', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (19, N'21111063145 ', N'CTKM107', N'CTKM107015', N'Theo nguyên lý Von Newmann, để thay đổi thứ tự các lệnh được thực hiện, ta chỉ cần: 
A. Thay đổi nội dung thanh ghi con trỏ lệnh bằng địa chỉ lệnh cần thực hiện tiếp
B. Thay đổi nội dung trong vùng nhớ chứa địa chỉ chương trình đang thực hiện
C. Thay đổi nội dung thanh ghi mảng mã lệnh 
D. Thay đổi nội dung thanh ghi mảng dữ liệu', N'A', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (20, N'21111063145 ', N'CTKM107', N'CTKM107041', N'Trong hệ nhị phân số 10101.11(2) tương ứng với giá trị thập phân nào trong các giá trị sau đây: 
A. 21.75 * 
B. 23.75 
C. 21.65 
D. 23.65', N'A', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (21, N'21111063145 ', N'CTKM107', N'CTKM107060', N'Số 859(10) tương ứng với giá trị bát phân nào trong các giá trị sau đây: 
A. 1533(8) 
B. 1633(8) 
C. 1637(8) 
D. 1733(8)', N'A', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (22, N'21111063145 ', N'CTKM107', N'CTKM107010', N'Trong các bộ phận sau, bộ phận nào không thuộc bộ xử lý trung tâm: 
A. Bộ nhớ trong
B. Khối số học và logic 
C. Tập các thanh ghi đa năng 
D. Khối điều khiển để thi hành lệnh một cách tuần tự và tác động lêncác mạch chức năng nhằm thi hành lệnh.', N'A', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (23, N'21111063145 ', N'CTKM107', N'CTKM107004', N'Các thành phần cơ bản của một máy tính gồm:
A. Bộ nhớ trong, CPU và khối phối ghép vào ra 
B. Bộ nhớ trong, CPU và thiết bị ngoại vi 
C. Bộ nhớ trong, CPU, khối phối ghép vào ra và thiết bị ngoại vi 
D. Bộ nhớ trong, CPU, bộ nhớ ngoài, bộ phối ghép vào ra và thiết bị ngoại vi', N'D', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (24, N'21111063145 ', N'CTKM107', N'CTKM107019', N'Hãy chỉ ra khẳng định sai trong các khẳng định sau: 
A. Hệ đếm là tập hợp các ký hiệu và qui tắc sử dụng tập ký hiệu đó để biểu diễn và xác định giá trị các số 
B. Tổng số ký số của mỗi hệ đếm được gọi là cơ số 
C. Mỗi hệ đếm được xây dựng trên một tập ký số vô hạn
D. Hệ đếm La mã là hệ đếm không có trọng số', N'C', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (25, N'21111063145 ', N'CTKM107', N'CTKM107064', N'Số 841(10) tương ứng với giá trị bát phân nào trong các giá trị sau đây: 
A. 1505(8) 
B. 1511(8)
C. 1531(8) 
D. 1551(8)', N'B', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (26, N'21111063145 ', N'CTKM107', N'CTKM107002', N'Máy tính đầu tiên ENIAC sử dụng linh kiện nào trong số các linh kiện sau?
A. Transistor lưỡng cực 
B. Transistor trường 
C. Đèn điện tử 
D. IC bán dẫn', N'C', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (27, N'21111063145 ', N'CTKM107', N'CTKM107018', N'Theo nguyên lý Von Newmann, việc cài đặt dữ liệu vào máy tính được thực hiện bằng: 
A. Đục lỗ trên băng giấy 
B. Đục lỗ trên bìa và đưa vào bằng tay 
C. Xung điện
D. Xung điện từ', N'C', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (28, N'21111063145 ', N'CTKM107', N'CTKM107036', N'Trong hệ La mã số MLD nhận giá trị thập phân nào trong các giá trị sau đây: A. 1150 
B. 1050 
C. 1450 
D. 1650', N'C', N' ')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (29, N'21111063145 ', N'CTKM107', N'CTKM107045', N'Trong hệ nhị phân số 11001.01(2) tương ứng với giá trị thập phân nào trong các giá trị sau đây: 
A. 27.75 
B. 25.25 
C. 27.25 
D. 25.75', N'B', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (30, N'21111063145 ', N'CTKM107', N'CTKM107037', N'Trong hệ La mã số DLL nhận giá trị thập phân nào trong các giá trị sau đây: 
A. 400 
B. 600
C. 800 
D. 1200', N'B', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (43, N'21111063145 ', N'CTKU102', N'CTKU102023', N'Hàm mô tả sắp xếp nổi bọt (Bubble Sort) trên mảng M có N phần tử
void BubbleSort(int M[], int N)
{
[2] int Temp;
[3] for (int I = 0; I < N-1; I++)
[4] …………………………………..
[5] if (M[J] < M[J-1])
[6] {
[7] Temp = M[J];
[8] M[J] = M[J-1];
[9] M[J-1] = Temp;
[10] }
[11] return;
[12] }
[13]
Lệnh nào sau đây sẽ được đưa vào dòng lệnh thứ [5] của thủ tục:
A. for (int J = N-1; J > I; J++)
B. for (int J = N; J < I; J--)
C. for (int J = N-1; J > I; J--)
D. Không có dòng lệnh nào phù hợp, không cần thêm vào thuật toán vẫn chạy đúng', N'C', N' ')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (12, N'123         ', N'NNTA103', N'NNTA103008', N'Tìm lỗi sai trong câu sau:
Not until he got home he realized he had forgotten to give her the present.
A. got     
B. he realized     
C. her     
D. the present', N'B', N' ')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (14, N'123         ', N'NNTA103', N'NNTA103054', N'Tìm lỗi sai trong câu sau:
The teacher asked him why hadn’t he done his homework, but he said nothing.
A. why      
B. hadn’t he done
C. but     
 D. said nothing', N'B', N' ')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (15, N'123         ', N'NNTA103', N'NNTA103004', N'Tìm lỗi sai trong câu sau:
The assumption that smoking has bad effects on our health have been proved.
A. that      
B. effects      
C. on      
D. have been proved', N'D', N' ')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (41, N'21111063156 ', N'CTKU102', N'CTKU102043', N'Với cấu trúc dữ liệu như sau:
typedef struct DNode
{
int Key;
DNode * NextNode;
DNode * PreNode;
} DOneNode
typedef DLLOneNode * DPointerType;
typedef struct DPairNode
{ DPointerType DLLFirst;
DPointerType DLLLast;
} DPType;
Hàm thêm phần tử vào cuối danh sách liên kết đôi quản lý bởi 2 phần
tử đầu và cuối
DPointerType DLLAddLast(DPType &DList, int NewData)
{
DPointerType NewNode = gọi hàm tạo nút mới có vùng dữ liệu là
NewData ;
if (NewNode == NULL)
return (NULL);
if (DList.DLLLast == NULL)
DList.DLLFirst = DList.DLLLast = NewNode;
else
{
……………………………………………….
……………………………………………….
………………………………………………
}
return (NewNode);
} Hãy lựa chọn câu đúng nhất để điền vào chỗ trống ở trên
A. DList.DLLLast ->NextNode = NewNode; NewNode ->PreNode = DList.DLLLast; NewNode = DList.DLLLast;

B. DList.DLLLast ->NextNode = NewNode; DList.DLLLast = NewNode ->PreNode; DList.DLLLast = NewNode;

C. NewNode = DList.DLLLast ->NextNode; NewNode ->PreNode = DList.DLLLast; DList.DLLLast = NewNode;

D. DList.DLLLast ->NextNode = NewNode; NewNode ->PreNode = DList.DLLLast; DList.DLLLast = NewNode;', N'D', N' ')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (42, N'21111063156 ', N'CTKU102', N'CTKU102084', N'Cho bài toán: cho trước n là một số tự nhiên, tính n!. Chỉ ra trường hợp suy biến
A. với n = 0

B. với n = 1

C. với n =0 hoặc n = 1', N'C', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (43, N'21111063156 ', N'CTKU102', N'CTKU102010', N'Hãy cho biết tư tưởng nào sau đây nói về của giải thuật tìm kiếm trên cây nhị phân tìm kiếm?
A. Lần lượt chia dãy thành hai dãy con dựa vào phần tử khoá, sau đó thực hiện việc tìm kiếm trên hai đoạn đã chi
B. So sánh X lần lượt với các phần tử thứ nhất, thứ hai,... của dãy cho đến khi gặp phần tử có khoá cần tìm
C. Tìm kiếm dựa vào cây nhị tìm kiếm: Nếu giá trị cần tìm nhỏ hơn gốc thì thực hiện tìm kiếm trên cây con trái, ngược lại ta việc tìm kiếm được thực hiện trên cây con phải
D. Tại mỗi bước tiến hành so sánh X với phần tử ở giữa của dãy, dựa vào bước so sánh này quyết định giới hạn dãy tìm kiếm nằm ở nửa trên, hay nửa dưới của dãy hiện hành', N'B', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (44, N'21111063156 ', N'CTKU102', N'CTKU102048', N'Kết quả nào đúng khi thực hiện giải thuật sau với a[]= {-3, -3, 15, -3}; n= 4; x= -3:
int FindX(int a[], int n, int x)
{int i;
for (i= n; i>= 1; i--) if (a[i]==x) return (i);
return (-1);
}
A. 1

B. 2

C. 3

D. 4', N'D', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (45, N'21111063156 ', N'CTKU102', N'CTKU102019', N'Đoạn mã giả dưới đây mô tả thuật toán gì?
Thuật toán:
B1: k = 1
B2: IF M[k] == X AND k != N
B2.1: k++
B2.2: Lặp lại B2
B3: IF k < N Thông báo tìm thấy tại vị trí k
B4: ELSE Không tìm thấy.
B5: Kết thúc
A. Tìm nhị phân phần tử có giá trị X
B. Tìm phần tử nhỏ nhất của mảng M bao gồm N phần tử
C. Tìm tuyến tính phần tử có giá trị X
D. Cả a, b, c đều sai', N'C', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (44, N'21111063145 ', N'CTKU102', N'CTKU102020', N'Cho hàm tìm kiếm tuyến tính như sau:
int TimKiem (int M[], int N, int X)
{ int k = 0;
M[N] = X;
while (M[k] != X)
k++;
if (k < N)
return (k);
return (-1);
}
Chọn câu đúng nhất:

A. Hàm sẽ trả về 0 nếu không tìm thấy phần tử có giá trị là X
B. Hàm sẽ trả về 1 nếu tìm thấy phần tử có giá trị là X
C. Hàm sẽ trả về -1 nếu không tìm thấy phần tử có giá trị là X
D. Hàm sẽ trả về 1 nếu không tìm thấy phần tử có giá trị là X', N'C', N' ')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (45, N'21111063145 ', N'CTKU102', N'CTKU102037', N'Chọn định nghĩa đúng nhất đối với cây nhị phân tìm kiếm:
A. Cây nhị phân tìm kiếm là cây nhị phân có thành phần khóa của mọi nút lớn hơn thành phần khóa của tất cả các nút trong cây con trái của nó và nhỏ hơn thành phần khóa của tất cả các nút trong cây con phải của nó

B. Cây nhị phân tìm kiếm là cây nhị phân có thành phần khóa của mọi nút nhỏ hơn thành phần khóa của tất cả các nút trong cây con trái của nó và nhỏ hơn thành phần khóa của tất cả các nút trong cây con phải của nó

C. Cây nhị phân tìm kiếm là cây nhị phân có thành phần khóa của mọi nút lớn hơn thành phần khóa của tất cả các nút trong cây con trái của nó và lớn hơn thành phần khóa của tất cả các nút trong cây con phải của nó.

D. Cây nhị phân tìm kiếm chính là cây nhị phân', N'A', N' ')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (4, N'21111063145 ', N'CTKU102', N'CTKU102038', N'Chọn định nghĩa đúng nhất về cây cân bằng tương đối:
A. Cây cân bằng tương đối là một cây nhị phân thỏa mãn điều kiện là đối với mọi nút của cây thì số nút của cây con trái và số nút của cây con phải của nút đó hơn kém nhau không quá 1. Cây cân bằng tương đối còn được
gọi là cây AVL (AVL tree)

B. Cây cân bằng tương đối là một cây N phân thỏa mãn điều kiện là đối với mọi nút của cây thì chiều cao của cây con trái và chiều cao của cây con phải của nút đó hơn kém nhau không quá 2. Cây cân bằng tương đối còn
được gọi là cây AVL (AVL tree)

C. Cây cân bằng tương đối là một cây nhị phân thỏa mãn điều kiện là đối với mọi nút của cây thì chiều cao của cây con trái và chiều cao của cây con phải của nút đó hơn kém nhau không quá 1. Cây cân bằng tương đối còn
được gọi là cây AVL (AVL tree)

D. Cây cân bằng tương đối cũng là cây cân bằng hoàn toàn', N'C', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (5, N'21111063145 ', N'CTKU102', N'CTKU102004', N'Hãy cho biết ý tưởng nào sau đây nói về phương pháp sắp xếp nhanh (Quick sort)?
A. Chọn phần tử bé nhất xếp vào vị trí thứ nhất bằng cách đổi chổ phần tử bé nhất với phần tử thứ nhất; Tương tự đối với phần tử nhỏ thứ hai cho đến phần tử cuối cùng

B. Bắt đầu từ cuối dãy đến đầu dãy, ta lần lượt so sánh hai phần tử kế tiếpnh u, nếu phần tử nào nhỏ hơn được đứng vị trí trên

C. Phân đoạn dãy thành nhiều dãy con và lần lượt trộn hai dãy con thành dãy lớn hơn, cho đến khi thu được dãy ban đầu đã được sắp xếp

D. Lần lượt chia dãy phần tử thành hai dãy con bởi một phần tử khoá (dãy con trước khoá gồm các phần tử nhỏ hơn khoá và dãy còn lại gồm các phần tử lớn hơn khoá)', N'D', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (6, N'21111063145 ', N'CTKU102', N'CTKU102083', N'Chỉ ra khái niệm có tính chất đệ quy?
A. khái niệm tính giai thừa của n (n!)

B. khái niệm hình ảnh

C. khái niệm âm thanh', N'A', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (7, N'21111063145 ', N'CTKU102', N'CTKU102077', N'Cấu trúc dữ liệu là …
A. cách lưu trữ dữ liệu trong bộ nhớ máy tính (ROM), sao cho nó có thể được sử dụng một cách hiệu quả

B. cách lưu trữ dữ liệu trong bộ nhớ máy tính (HDD), sao cho nó có thể được sử dụng một cách hiệu quả

C. cách lưu trữ dữ liệu trong bộ nhớ máy tính (USB), sao cho nó có thể được sử dụng một cách hiệu quả

D. cách lưu trữ dữ liệu trong bộ nhớ máy tính (RAM), sao cho nó có thể được sử dụng một cách hiệu quả', N'D', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (9, N'21111063145 ', N'CTKU102', N'CTKU102027', N'Lựa chọn câu đúng nhất về danh sách liên kết đôi (Doubly Linked List):
A. Vùng liên kết của một phần tử trong danh sách liên đôi có 02 mối liên kết với 01 phần tử khác trong danh sách

B. Vùng liên kết của một phần tử trong danh sách liên đôi có 01 mối liên kết với 02 phần tử khác trong danh sách

C. Vùng liên kết của một phần tử trong danh sách liên đôi có 02 mối liên kết với 02 trước và sau nó trong danh sách

D. Vùng liên kết của một phần tử trong danh sách liên đôi có 02 mối liên kết với phần tử đầu và cuối của danh sách', N'C', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (11, N'21111063145 ', N'CTKU102', N'CTKU102014', N'Trong biểu diễn dữ liệu dưới dạng cây, Khái niệm nào sau đây là cấp của cây?
A. Là tổng số nút trên cây
B. Là cấp cao nhất của nút gố
C. Là cấp cao nhất của một nút trên cây
D. Là cấp cao nhất của nút lá', N'C', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (12, N'21111063145 ', N'CTKU102', N'CTKU102029', N'Cho thuật toán sắp xếp Bubble Sort như sau:
void BubbleSort(int M[], int N)
{
for (int I = 0; I < N-1; I++)
for (int J = N-1; J > I; J--)
if (M[J] < M[J-1])
Swap(M[J], M[J-1]);
return;
}
Chọn câu đúng nhất cho hàm Swap
A. void Swap(int &X, int &Y) { int Temp = X; X = Y; Y = Temp; return; }

B. void Swap(float X, floatY) { int Temp = X; X = Y; Y = Temp; return; }

C. void Swap(int *X, int *Y) { int Temp = X; X = Y; Y = Temp; return; }

D. void Swap(int X, intY) { int Temp = X; X = Y; Y = Temp; return; }', N'A', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (15, N'21111063145 ', N'CTKU102', N'CTKU102073', N'Chỉ ra kiểu dữ liệu cơ bản:
A. Sinh viên

B. Float

C. Họtên

D. Ngày sinh', N'B', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (19, N'21111063145 ', N'CTKU102', N'CTKU102079', N'Phát biểu sau đúng hay sai: khi nói tới dữ liệu thì cũng phải xem xét dữ liệu đó cần được thực hiện bằng giải thuật gì để đạt được kết quả mong muốn?
A. Đúng

B. Sai', N'A', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (8, N'21111063145 ', N'CTKU102', N'CTKU102033', N'Với thủ tục như sau:
void operation()
{
int x,a[10],n;
int x,m,l,h,flag=0;
cout<<"Enter the element to be searched:";
cin>>x;
l=0; h=n-1;
while(l<=h)
{
m=(l+h)/2;
if(x==a[m]) {
lag=1; break;
}
else if(x>a[m])
l=m+1;
else if(x<a[m])
h=m-1;
}
if(flag==0)
cout<<"ABSENT";
else
cout<<"PRESENT";
}
Lựa chọn câu đúng nhất để mô tả thủ tục trên
A. Thủ tục tìm nhị phân phần tử được nhập từ bàn phím, nếu tìm thấy sẽ thông báo ABSENT

B. Thủ tục tìm nhị phân phần tử được nhập từ bàn phím, nếu không tìm thấy sẽ thông báo ABSENT

C. Thủ tục tìm tuyến tính phần tử được nhập từ bàn phím, nếu tìm thấy sẽ thông báo ABSENT

D. Thủ tục tìm tuyến tính phần tử được nhập từ bàn phím, nếu không tìm thấy sẽ thông báo ABSENT', N'B', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (10, N'21111063145 ', N'CTKU102', N'CTKU102043', N'Với cấu trúc dữ liệu như sau:
typedef struct DNode
{
int Key;
DNode * NextNode;
DNode * PreNode;
} DOneNode
typedef DLLOneNode * DPointerType;
typedef struct DPairNode
{ DPointerType DLLFirst;
DPointerType DLLLast;
} DPType;
Hàm thêm phần tử vào cuối danh sách liên kết đôi quản lý bởi 2 phần
tử đầu và cuối
DPointerType DLLAddLast(DPType &DList, int NewData)
{
DPointerType NewNode = gọi hàm tạo nút mới có vùng dữ liệu là
NewData ;
if (NewNode == NULL)
return (NULL);
if (DList.DLLLast == NULL)
DList.DLLFirst = DList.DLLLast = NewNode;
else
{
……………………………………………….
……………………………………………….
………………………………………………
}
return (NewNode);
} Hãy lựa chọn câu đúng nhất để điền vào chỗ trống ở trên
A. DList.DLLLast ->NextNode = NewNode; NewNode ->PreNode = DList.DLLLast; NewNode = DList.DLLLast;

B. DList.DLLLast ->NextNode = NewNode; DList.DLLLast = NewNode ->PreNode; DList.DLLLast = NewNode;

C. NewNode = DList.DLLLast ->NextNode; NewNode ->PreNode = DList.DLLLast; DList.DLLLast = NewNode;

D. DList.DLLLast ->NextNode = NewNode; NewNode ->PreNode = DList.DLLLast; DList.DLLLast = NewNode;', N'D', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (13, N'21111063145 ', N'CTKU102', N'CTKU102050', N'Kết quả nào đúng khi thực hiện giải thuật sau với a[]= {1, 3, 5, 4, 2}; n= 5:
void HoanViKe(int a[],int n)
{int i, k, r, s, tmp = 0;
for(i=1;i<=n;i++) if(a[i]!=n-i+1)
{tmp=1;break;}
if(tmp==0) return;
i= n-1;
while(a[i]>a[i+1]) i= i - 1;
k= n;
while(a[k]< a[i]) k= k - 1;
tmp= a[i]; a[i]= a[k]; a[k]=t mp;
r=i+1; s= n;
while(r<s)
{tmp = a[r]; a[r]= a[s]; a[s]= tmp; r++; s--; } for(i= 1; i<= n; i++) printf("%d ", a[i]);
}
A. 1 4 2 3 5

B. 5 4 3 2 1

C. 1 4 5 3 2

D. 1 3 4 2 5', N'A', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (14, N'21111063145 ', N'CTKU102', N'CTKU102011', N'Hãy cho biết tính chất nào sau đây là của cây nhị phân tìm kiếm?
A. Cây nhị phân mà mỗi nút trong cây đều thoả tính chất: giá trị của nút cha lớn hơn giá trị của hai nút con
B. Là cây nhị phân đầy đủ
C. Cây nhị phân thoả tính chất heap
D. Cây nhị phân mà mỗi nút trong cây đều thoả tính chất: giá trị của nút cha nhỏ hơn mọi nút trên cây con trái và lớn hơn mọi nút trên cây con phải của nó', N'D', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (16, N'21111063145 ', N'CTKU102', N'CTKU102031', N'Cho thuật toán sau:
int LinearSearch (float M[], int N, float X)
{
int k = 0;
M[N] = X;
while (M[k] != X) //n+1 lan
(M[k] != X) //n+1 lan k++;
if (k < N)
return (k);
return (-1);
}
Chọn câu đúng nhất trong trường hợp xấu nhất khi không tìm thấy phần tử nào có giá trị bằng X:
A. Số phép gán: Gmax = 1 Số phép so sánh: Smax = N + 2

B. Số phép gán: Gmax = 2 Số phép so sánh: Smax = N + 2

C. Số phép gán: Gmax = 2 Số phép so sánh: Smax = N + 1

D. Số phép gán: Gmax = 2 Số phép so sánh: Smax =2 N + 2', N'B', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (17, N'123         ', N'NNTA103', N'NNTA103015', N'Tìm lỗi sai trong câu sau:
Each of the beautiful cars in the shop was quickly sold to their owner
A. Each     
B. cars     
C. quickly     
D. their', N'D', N' ')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (18, N'123         ', N'NNTA103', N'NNTA103048', N'Tìm lỗi sai trong câu sau:
He is the second person be killed in that way.
A. is      
B. the      
C. be killed      
D. way', N'C', N' ')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (19, N'123         ', N'NNTA103', N'NNTA103025', N'Tìm lỗi sai trong câu sau:
It is vitally important that she takes this medication night and morning.
A. vitally     
B. that     
C. takes     
D. medication', N'C', N' ')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (18, N'21111063145 ', N'CTKU102', N'CTKU102017', N'Mối quan hệ giữa cấu trúc dữ liệu và giải thuật có thể minh họa bằng đẳng thức:
A. Cấu trúc dữ liệu + Giải thuật = Chương trình
B. Cấu trúc dữ liệu + Chương trình = Giải thuật
C. Chương trình + Giải thuật = Cấu trúc dữ liệu
D. Cấu trúc dữ liệu = Chương trình', N'A', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (20, N'21111063145 ', N'CTKU102', N'CTKU102032', N'Cấu trúc dữ liệu cho kiểu dữ liệu sinh viên như sau:
typedef struct tagSV{
char MSSV[8];
char Ten[30];
char NgaySinh[11];
float DTB;
}SV;
Khai báo
SV sv1, *sv2;
Lựa chọn các câu đúng nhất để gán giá trị cho mã sinh viên của sv1 và sv2:
A. sv1.MSSV = “Nguyen Van A”; sv2.MSSV = “Nguyen Van B”;

B. sv1.MSSV = “Nguyen Van A”; sv2->MSSV = “Nguyen Van B”;

C. sv1->MSSV = “Nguyen Van A”; sv2->MSSV = “Nguyen Van B”;

D. sv1->MSSV = “Nguyen Van A”; sv2.MSSV = “Nguyen Van B”;', N'B', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (21, N'21111063145 ', N'CTKU102', N'CTKU102022', N'Chọn câu đúng nhất để mô tả thuật toán sắp xếp nổi bọt (Bubble Sort) trên mảng M có N phần tử:
A. Đi từ cuối mảng về đầu mảng, trong quá trình đi nếu phần tử ở dưới (đứng phía sau) nhỏ hơn phần tử đứng ngay trên (trước) nó thì hai phần tử này sẽ được đổi chỗ cho nhau. Sau mỗi lần đi chúng ta đưa được một phần
tử trồi lên đúng chỗ. Sau N–1 lần đi thì tất cả các phần tử trong mảng M sẽ có thứ tự tăng
B. Đi từ đầu mảng về cuối mảng, trong quá trình đi nếu phần tử ở dưới (đứng phía sau) nhỏ hơn phần tử đứng ngay trên (trước) nó thì hai phần tử này sẽ được đổi chỗ cho nhau. Sau mỗi lần đi chúng ta đưa được một phần tử trồi lên đúng chỗ. Sau N lần đi thì tất cả các phần tử trong mảng M sẽ có thứ tự tăng.
C. Đi từ cuối mảng về đầu mảng, trong quá trình đi nếu phần tử ở dưới (đứng phía sau) nhỏ hơn phần tử đứng ngay trên (trước) nó thì hai phần tử này sẽ được đổi chỗ cho nhau. Sau mỗi lần đi chúng ta đưa được một phần tử trồi lên đúng chỗ. Sau N lần đi thì tất cả các phần tử trong mảng M sẽ có thứ tự tăng
D. Cả a, b, c đều sai', N'A', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (22, N'21111063145 ', N'CTKU102', N'CTKU102047', N'Kết quả nào đúng khi thực hiện giải thuật sau với a[]= {1, 3, 5}; n= 5, k= 3:
void ToHopKe(int a[], int n, int k)
{ int i, j, tmp = 0;
for (i=1;i<= k; i++)
if (a[i]!= n-k+i) {tmp= 1;break;}
if (tmp==0) return;
i= k;
while (a[i]>= n-k+i) i--;
a[i]=a[i] + 1;
for (j=i+1;j<=k;j++) a[j]=a[i] + j - i;
for (i= 1; i<= n; i++) printf("%d ", a[i]);
}
A. 2 3 4

B. 1 2 3

C. 2 3 5

D. 1 4 5', N'D', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (23, N'21111063145 ', N'CTKU102', N'CTKU102091', N'Trong lưu trữ dữ liệu kiểu Queue (Q), giả sử F là con trỏ trỏ tới lối trước của Q, R là con trỏ trỏ tới lối sau của Q. Khi loại bỏ một phần tử vào Queue, thì R và F thay đổi thế nào trong các phương án sau?
A. F=F+1, R không thay đổi

B. F không thay đổi, R=R+1

C. F không thay đổi, R=R-1

D. F=F-1, R không thay đổi', N'A', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (24, N'21111063145 ', N'CTKU102', N'CTKU102010', N'Hãy cho biết tư tưởng nào sau đây nói về của giải thuật tìm kiếm trên cây nhị phân tìm kiếm?
A. Lần lượt chia dãy thành hai dãy con dựa vào phần tử khoá, sau đó thực hiện việc tìm kiếm trên hai đoạn đã chi
B. So sánh X lần lượt với các phần tử thứ nhất, thứ hai,... của dãy cho đến khi gặp phần tử có khoá cần tìm
C. Tìm kiếm dựa vào cây nhị tìm kiếm: Nếu giá trị cần tìm nhỏ hơn gốc thì thực hiện tìm kiếm trên cây con trái, ngược lại ta việc tìm kiếm được thực hiện trên cây con phải
D. Tại mỗi bước tiến hành so sánh X với phần tử ở giữa của dãy, dựa vào bước so sánh này quyết định giới hạn dãy tìm kiếm nằm ở nửa trên, hay nửa dưới của dãy hiện hành', N'B', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (21, N'123         ', N'NNTA103', N'NNTA103028', N'Tìm lỗi sai trong câu sau:
Some species of bats are dormant each days and active every night.
A. species of     
B. each days
C. every night     
D. are dormant', N'B', N' ')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (25, N'21111063145 ', N'CTKU102', N'CTKU102060', N'Chọn phát biểu đúng trong các phát biểu dưới đây: bằng cách chạy thử 1 thuật toán với 1 bộ dữ liệu, ta có thể:
A. Khẳng định thuật toán đúng nếu nó cho kết quả đúng

B. Khẳng định thuật toán sai nếu cho kết quả sai

C. Khẳng định thuật toán tốt nếu cho kết quả nhanh

D. Khẳng định thuật toán hiệu quả nếu cho kết quả đúng', N'B', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (26, N'21111063145 ', N'CTKU102', N'CTKU102039', N'Định nghĩa cấu trúc dữ liệu của danh sách liên kết đơn được mô tả như sau:
struct Node
{
int Key; Node *
NextNode;
} OneNode;
Trong đó, khai báo Node * NextNode; dùng để mô tả
A. Con trỏ trỏ tới phần dữ liệu

B. Vùng liên kết quản lý địa chỉ phần tử kế tiếp

C. Con trỏ trỏ tới phần dữ liệu cuối của danh sách

D. Vùng liên kết quản lý địa chỉ phần tử kế tiếp của phần tử cuối', N'B', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (27, N'21111063145 ', N'CTKU102', N'CTKU102040', N'Khi cần thêm một phần tử có giá trị thành phần dữ liệu là NewData (là một số nguyên) vào đầu của danh sách liên kết đơn dùng thuật toán có mã giả mô tả như dưới đây?
typedef struct Node
{
int Data; Node * NextNode;
} OneNode; typedef OneNode * SLLPointer;
SLLPointer SSList;
B1: NewNode = new OneNode
B2: IF (NewNode = NULL) Thực hiện BKT
B3: NewNode ->NextNode = NULL
B4: NewNode ->Data = NewData B5: NewNode->NextNode = SLList
B6: SLList = NewNode BKT: Kết thúc
Tìm mô tả chính xác cho B5
A. Chuyển vai trò đứng đầu của NewNode cho SLList

B. Nối NewNode vào sau SLList

C. Chuyển vai trò đứng đầu của SLList cho NewNode

D. Nối SLList vào sau NewNode', N'D', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (28, N'21111063145 ', N'CTKU102', N'CTKU102046', N'Kết quả nào đúng khi thực hiện giải thuật sau:
long lt(int n)
{if (n==0) return 1;
else return (2*lt(n-1);
}
A. lt(12) = 2010

B. lt(12) = 1024

C. lt(7) = 720

D. lt(6) = 64', N'D', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (29, N'21111063145 ', N'CTKU102', N'CTKU102072', N'Các kiểu dữ liệu cơ bản là:
A. các kiểu dữ liệu mà người lập trình được cung cấp sẵn từ máy tính

B. các kiểu dữ liệu mà người lập trình được cung cấp sẵn từ ngôn ngữ tự nhiên

C. các kiểu dữ liệu mà người lập trình được cung cấp sẵn từ ngôn ngữ lập trình

D. các kiểu dữ liệu mà người lập trình được cung cấp sẵn từ ngôn ngữ máy', N'C', N' ')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (30, N'21111063145 ', N'CTKU102', N'CTKU102092', N'Cho cây nhị phân: A, B, C, D, E, F, G, H, I, J, K, L, M, N. Cây con trái của
cây B bao gồm những phần tử nào trong các phương án sau?
A. E, J, K

B. C, D

C. C, D, E

D. D, H, I', N'D', N' ')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (32, N'21111063145 ', N'CTKU102', N'CTKU102081', N'Phát biểu sau đúng hay sai: Giải thuật thể hiện hành động của các bước để giải bài toán?
A. Đúng

B. Sai', N'A', N' ')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (33, N'21111063145 ', N'CTKU102', N'CTKU102089', N'Trong lưu trữ dữ liệu kiểu Queue (Q) dưới dạng mảng nối vòng, giả sử F là con trỏ trỏ tới lối trước của Q, R là con trỏ trỏ tới lối sau của Q. Điều kiện F=R=0 nghĩa là gì trong các phương án sau?
A. Queue tràn

B. Queue rỗng

C. Kiểm tra chỉ số trước và chỉ số sau của Queue có bằng nhau hay không

D. Đặt phần tử đầu và phần tử cuối của Queue bằng 0', N'B', N' ')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (34, N'21111063145 ', N'CTKU102', N'CTKU102006', N'Hãy cho biết ý tưởng nào sau đây nói về tưởng phương pháp sắp xếp Trộn (Merge sort)?
A. Lần lượt chia dãy phần tử thành hai dãy con bởi một phần tử khoá (dãy con trước khoá gồm các phần tử nhỏ hơn khoá và dãy còn lại gồm các phần tử lớn hơn khoá)
B. Bắt đầu từ cuối dãy đến đầu dãy, ta lần lượt so sánh hai phần tử kế tiếp nhau, nếu phần tử nào nhỏ hơn được đứng vị trí trên
C. Chọn phần tử bé nhất xếp vào vị trí thứ nhất bằng cách đổi chổ phần tử bé nhất với phần tử thứ nhất; Tương tự đối với phần tử nhỏ thứ hai cho đến phần tử cuối cùng
D. Phân đoạn dãy thành nhiều dãy con và lần lượt trộn hai dãy con thành dãy lớn hơn, cho đến khi thu được dãy ban đầu đã được sắp xếp', N'D', N' ')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (36, N'21111063145 ', N'CTKU102', N'CTKU102087', N'Để thêm một đối tượng x bất kỳ vào Stack, ta dùng hàm nào sau đây?
A. TOP(x)

B. EMPTY(x)

C. PUSH(x)

D. POP(x)', N'C', N' ')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (38, N'21111063145 ', N'CTKU102', N'CTKU102049', N'Dấu hiệu nào dưới đây cho biết danh sách liên kết đơn L là rỗng:
A. (L->left == NULL)

B. (L->ìnfor == NULL)

C. (L->next == NULL)

D. (L == NULL)', N'D', N' ')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (31, N'21111063145 ', N'CTKU102', N'CTKU102044', N'Với cấu trúc dữ liệu như sau:
typedef struct DNode
{
int Key;
DNode * NextNode;
DNode * PreNode;
} DOneNode;
typedef DOneNode * DPointerType;
typedef struct DLLPairNode
{ DPointerType DLLFirst;
DPointerType DLLLast;
} DLLPType;
Hàm duyệt qua các nút trong danh sách liên kết đôi quản lý bởi hai địa chỉ nút đầu tiên và nút cuối cùng thông qua DList để xem nội dung thành phần dữ liệu của mỗi nút
void DLLTravelling (DLLPType DList)
{
DPointerType CurrNode = DList.DLLFirst;
while (CurrNode != NULL) { cout <<
CurrNode->Key; …………………………………
}
return;
}
Chọn câu chính xác điền vào chỗ trống để mô tả việc di chuyển từ nút này sang nút khác
A. CurrNode = CurrNode ->NextNode ;

B. CurrNode = CurrNode ->Key ;

C. CurrNode ->NextNode = CurrNode;

D. CurrNode ->Key = CurrNode;', N'A', N' ')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (35, N'21111063145 ', N'CTKU102', N'CTKU102085', N'Hãy chọn định nghĩa đúng nhất về danh sách kiểu hàng đợi (Queue)?
A. Hàng đợi là kiểu danh sách tuyến tính trong đó, phép bổ sung một phần tử được thực hiện ở một đầu, gọi là lối sau (rear) hay lối trước (front). Phép loại bỏ không thực hiện được

B. Hàng đợi là kiểu danh sách tuyến tính trong đó, phép bổ sung một phần tử hay loại bỏ được thực hiện ở một đầu danh sách gọi là đỉnh (Top)

C. Hàng đợi là một danh sách tuyến tính trong đó phép bổ sung một phần tử và phép loại bỏ một phần tử được thực hiện ở tại một vị trí bất kì trong danh sách

D. Hàng đợi là kiểu danh sách tuyến tính trong đó, phép bổ sung phần tử ở một đầu, gọi là lối sau (rear) và phép loại bỏ phần tử được thực hiện ở đầu kia, gọi là lối trước (front)', N'D', N' ')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (37, N'21111063145 ', N'CTKU102', N'CTKU102018', N'Các tiêu chuẩn đánh giá cấu trúc dữ liệu. Để đánh giá một cấu trúc dữ liệu chúng ta thường dựa vào một số tiêu chí:
A. Cấu trúc dữ liệu phải tiết kiệm tài nguyên (bộ nhớ trong)
B. Cấu trúc dữ liệu phải phản ảnh đúng thực tế của bài toán
C. Cấu trúc dữ liệu phải dễ dàng trong việc thao tác dữ liệu
D. Cả a, b, c đều đúng', N'D', N' ')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (39, N'21111063145 ', N'CTKU102', N'CTKU102098', N'Hãy cho biết quy tắc đúng của phép duyệt cây theo thứ tự sau trong các phương án sau?
A. Duyệt cây con trái theo thứ tự sau; Duyệt gốc; Duyệt cây con phải theo thứ tự sau

B. Duyệt gốc, cây trái, cây phải đồng thời theo thứ tự sau

C. Duyệt cây con trái theo thứ tự sau; Duyệt cây con phải theo thứ tự sau; Duyệt gốc

D. Duyệt gốc; Duyệt cây con trái theo thứ tự sau; Duyệt cây con phải theo thứ tự sau', N'C', N' ')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (40, N'21111063145 ', N'CTKU102', N'CTKU102019', N'Đoạn mã giả dưới đây mô tả thuật toán gì?
Thuật toán:
B1: k = 1
B2: IF M[k] == X AND k != N
B2.1: k++
B2.2: Lặp lại B2
B3: IF k < N Thông báo tìm thấy tại vị trí k
B4: ELSE Không tìm thấy.
B5: Kết thúc
A. Tìm nhị phân phần tử có giá trị X
B. Tìm phần tử nhỏ nhất của mảng M bao gồm N phần tử
C. Tìm tuyến tính phần tử có giá trị X
D. Cả a, b, c đều sai', N'C', N' ')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (41, N'21111063145 ', N'CTKU102', N'CTKU102071', N'Đánh giá độ phức tạp của giải thuật là việc xác định … và … mà giải thuật cần để thực hiện giải một bài toán:
A. Khoảng thời gian, độ khó

B. Khoảng thời gian, độ khó

C. Khoảng thời gian, dung lượng bộ nhớ máy tính

D. Độ khó, dung lượng bộ nhớ máy tính', N'C', N' ')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (42, N'21111063145 ', N'CTKU102', N'CTKU102097', N'Hãy cho biết quy tắc đúng của phép duyệt cây theo thứ tự giữa trong các phương án sau?
A. Duyệt gốc, cây trái, cây phải đồng thời theo thứ tự giữa

B. Duyệt gốc; Duyệt cây con trái theo thứ tự giữa; Duyệt cây con phải theo thứ tự giữa

C. Duyệt cây con trái theo thứ tự giữa; Duyệt cây con phải theo thứ tự giữa; Duyệt gốc

D. Duyệt cây con trái theo thứ tự giữa; Duyệt gốc; Duyệt cây con phải theo thứ tự giữa', N'D', N' ')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (1, N'123         ', N'NNTA103', N'NNTA103009', N'Tìm lỗi sai trong câu sau:
If one type of manufacturing expands, it is like that another type will shrink considerably.
A. expands     
B. like     
C. another     
D. considerably', N'B', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (2, N'123         ', N'NNTA103', N'NNTA103002', N'The substance is very toxic. Protective clothing must be worn at all times.

A. Since the substance is very toxic, so protective clothing must be worn at all times.

B. So toxic is the substance that protective clothing must be worn at all times.

C. The substance is such toxic that protective clothing must be worn at all times.

D. The substance is too toxic to wear protective clothing at all times.', N'B', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (3, N'123         ', N'NNTA103', N'NNTA103001', N'"I have never been to Russia. I think I shall go there next year.” said Bill.
A. Bill said that he had never been to Russia and he thought he would go there the next year.

B. Bill said that he would have never been to Russia and he thinks he would go there the next year.

C. Bill said that he had never been to Russia and he thinks he will go there the next year.

D. Bill said that he has never been to Russia and he thinks he would go there the next year.', N'A', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (7, N'123         ', N'NNTA103', N'NNTA103021', N'Tìm lỗi sai trong câu sau:
Most bothersome flies belong to the family Sarcophagidae and are popular known as flesh flies because the larvae feed on flesh.
A. belong to     
B. popular known     
C. because     
D. feed on', N'B', N' ')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (8, N'123         ', N'NNTA103', N'NNTA103040', N'Tìm lỗi sai trong câu sau:
It is the recommendation of many psychologists that a learner ought to use mental images to associate word and remember them.
A. recommendation     
B. ought to use
C. to associate word     
D. remember them', N'B', N' ')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (9, N'123         ', N'NNTA103', N'NNTA103020', N'Tìm lỗi sai trong câu sau:
Mrs. Loan, along with her talented students, are going to be on the summer camp to USA.
A. along with     
B. talented     
C. are going     
D. summer', N'C', N' ')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (10, N'123         ', N'NNTA103', N'NNTA103006', N'Tìm lỗi sai trong câu sau:
The leader demanded from his members a serious attitude towards work, good team spirit, and that they work hard.
A. leader      
B. his members  
C. attitude     
D. that they work hard', N'D', N' ')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (11, N'123         ', N'NNTA103', N'NNTA103013', N'Tìm lỗi sai trong câu sau:
What we know about certain diseases are still not sufficient to prevent them from spreading easily among the population.
A. What we know     
B. are     
C. from spreading     
D. among', N'B', N' ')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (13, N'123         ', N'NNTA103', N'NNTA103022', N'Tìm lỗi sai trong câu sau:
It is important that cancer is diagnosed and treated as early as possible in order to assure a successful cure.
A. is diagnosed     
B. treated
C. as early as possible     
D. to assure', N'A', N' ')
GO
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (16, N'123         ', N'NNTA103', N'NNTA103056', N'Tìm lỗi sai trong câu sau:
In most countries music songs are deeply personal and deal with themes of love, lonely, and separation.
A. most countries      
B. deeply     
C. deal with      
D. lonely', N'D', N' ')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (20, N'123         ', N'NNTA103', N'NNTA103017', N'Tìm lỗi sai trong câu sau:
After spending two days arguing about where to go for their holidays, is was decided that they shouldn’t go anywhere.
A. arguing     
B. for     
C. is was decided     
D. shouldn’t go', N'C', N' ')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (22, N'123         ', N'NNTA103', N'NNTA103018', N'Tìm lỗi sai trong câu sau:
Regarding as one of the leading figures in the development of the short story, O Henry is the author of many well- known American novels.
A. Regarding as     
B. leading figures     
C. the     
D. novels', N'A', N' ')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (1, N'21111063239 ', N'CTKU102', N'CTKU102075', N'Kiểu dữ liệu trừu tượng là …
A. Kiểu dữ liệu mà người lập trình phải tự xây dựng không dựa trên các kiểu dữ liệu cơ bản được cung cấp từ ngôn ngữ lập trình

B. Kiểu dữ liệu mà người lập trình phải tự xây dựng dựa trên các kiểu dữ liệu không cơ bản được cung cấp từ ngôn ngữ lập trình

C. Kiểu dữ liệu mà người lập trình phải tự xây dựng dựa trên các kiểu dữ liệu cơ bản được cung cấp từ ngôn ngữ máy

D. Kiểu dữ liệu mà người lập trình phải tự xây dựng dựa trên các kiểu dữ liệu cơ bản được cung cấp từ ngôn ngữ lập trình', N'D', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (2, N'21111063239 ', N'CTKU102', N'CTKU102063', N'Cho danh sách đặc có 10 phần tử. Khi thêm phần tử vào vị trí 4 trong danh sách, vòng lặp dịch chuyển tịnh tiến nội dung các phần tử L->Elements[i]=L->Elements[i+1] sẽ thực hiện:

A. 4 lần

B. 5 lần

C. 6 lần

D. Tất cả đều sai', N'A', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (3, N'21111063239 ', N'CTKU102', N'CTKU102054', N'Trong phép duyệt cây nhị phân có 24 nút theo thứ tự sau, nút gốc có thứ tự:
A. Thứ 1

B. Thứ 2

C. Thứ 23

D. Thứ 24', N'D', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (4, N'21111063239 ', N'CTKU102', N'CTKU102027', N'Lựa chọn câu đúng nhất về danh sách liên kết đôi (Doubly Linked List):
A. Vùng liên kết của một phần tử trong danh sách liên đôi có 02 mối liên kết với 01 phần tử khác trong danh sách

B. Vùng liên kết của một phần tử trong danh sách liên đôi có 01 mối liên kết với 02 phần tử khác trong danh sách

C. Vùng liên kết của một phần tử trong danh sách liên đôi có 02 mối liên kết với 02 trước và sau nó trong danh sách

D. Vùng liên kết của một phần tử trong danh sách liên đôi có 02 mối liên kết với phần tử đầu và cuối của danh sách', N'C', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (5, N'21111063239 ', N'CTKU102', N'CTKU102008', N'Hãy cho biết tư tưởng nào sau đây nói về của giải thuật tìm kiếm nhị phân?
A. Lần lượt chia dãy thành hai dãy con dựa vào phần tử khoá, sau đó thực hiện việc tìm kiếm trên hai đoạn đã chia
B. So sánh X lần lượt với các phần tử thứ nhất, thứ hai,... của dãy cho đến khi gặp phần tử có khoá cần tìm
C. Tìm kiếm dựa vào cây nhị tìm kiếm
D. Tại mỗi bước tiến hành so sánh X với phần tử ở giữa của dãy, dựa vào bước so sánh này quyết định giới hạn dãy tìm kiếm nằm ở nửa trên, hay nửa dưới của dãy hiện hành', N'D', N'A')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (6, N'21111063239 ', N'CTKU102', N'CTKU102098', N'Hãy cho biết quy tắc đúng của phép duyệt cây theo thứ tự sau trong các phương án sau?
A. Duyệt cây con trái theo thứ tự sau; Duyệt gốc; Duyệt cây con phải theo thứ tự sau

B. Duyệt gốc, cây trái, cây phải đồng thời theo thứ tự sau

C. Duyệt cây con trái theo thứ tự sau; Duyệt cây con phải theo thứ tự sau; Duyệt gốc

D. Duyệt gốc; Duyệt cây con trái theo thứ tự sau; Duyệt cây con phải theo thứ tự sau', N'C', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (7, N'21111063239 ', N'CTKU102', N'CTKU102086', N'Trong bốn kiểu ký hiệu sau đây, ký hiệu nào biểu thị cho danh sách kiểu hàng đợi?
A. FIFO

B. LIFO

C. FILO

D. LOLO', N'A', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (8, N'21111063239 ', N'CTKU102', N'CTKU102007', N'Trong giải thuật sắp xếp vun đống, ta có 4 thủ tục con (Insert - thêm 1 phần tử vào cây; Downheap - vun đống lại sau khi loại một phần tử khỏi Heap, Upheap- vun đống sau khi thêm một phần tử vào cây; Remove - loại 1 phần tử khỏi cây nhị phân). Để sắp xếp các phần tử trong dãy theo phương pháp vun đống, ta thực hiện 4 thủ tục trên theo thứ tự như thế nào sau đây?
A. Remove – Downheap – Insert – Upheap
B. Insert – Upheap – Downheap – Remove
C. Upheap – Downheap – Remove – Insert
D. Insert – Upheap – Remove – Downheap', N'D', N'B')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (10, N'21111063239 ', N'CTKU102', N'CTKU102076', N'Chỉ ra kiểu dữ liệu trừu tượng:
A. float

B. int

C. char

D. mảng 1 chiều', N'D', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (20, N'21111063239 ', N'CTKU102', N'CTKU102070', N'Sau một số … bước thực hiện giải thuật cho chúng ta đạt được kết quả mong muốn:
A. vô hạn

B. giới hạn

C. hữu hạn

D. thao tác', N'C', N' ')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (23, N'123         ', N'NNTA103', N'NNTA103027', N'Tìm lỗi sai trong câu sau:
The number of women earning Master''s Degrees have risen sharply in recent years.
A. number     
B. earning     
C. have risen     
D. recent years', N'C', N' ')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (24, N'123         ', N'NNTA103', N'NNTA103030', N'Tìm lỗi sai trong câu sau:
Those who had already purchased tickets were instructed to go to gate first immediately.
A. Those 
B. had already purchased
C. gate first     
D. immediately', N'C', N' ')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (25, N'123         ', N'NNTA103', N'NNTA103044', N'Tìm lỗi sai trong câu sau:
Despite the long history of the rights of property ownership, there have been a great deal of disagreement over what such rights entail.
A. what such rights entail     
B. have been
C. Despite      
D. a great deal of', N'B', N' ')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (9, N'21111063239 ', N'CTKU102', N'CTKU102043', N'Với cấu trúc dữ liệu như sau:
typedef struct DNode
{
int Key;
DNode * NextNode;
DNode * PreNode;
} DOneNode
typedef DLLOneNode * DPointerType;
typedef struct DPairNode
{ DPointerType DLLFirst;
DPointerType DLLLast;
} DPType;
Hàm thêm phần tử vào cuối danh sách liên kết đôi quản lý bởi 2 phần
tử đầu và cuối
DPointerType DLLAddLast(DPType &DList, int NewData)
{
DPointerType NewNode = gọi hàm tạo nút mới có vùng dữ liệu là
NewData ;
if (NewNode == NULL)
return (NULL);
if (DList.DLLLast == NULL)
DList.DLLFirst = DList.DLLLast = NewNode;
else
{
……………………………………………….
……………………………………………….
………………………………………………
}
return (NewNode);
} Hãy lựa chọn câu đúng nhất để điền vào chỗ trống ở trên
A. DList.DLLLast ->NextNode = NewNode; NewNode ->PreNode = DList.DLLLast; NewNode = DList.DLLLast;

B. DList.DLLLast ->NextNode = NewNode; DList.DLLLast = NewNode ->PreNode; DList.DLLLast = NewNode;

C. NewNode = DList.DLLLast ->NextNode; NewNode ->PreNode = DList.DLLLast; DList.DLLLast = NewNode;

D. DList.DLLLast ->NextNode = NewNode; NewNode ->PreNode = DList.DLLLast; DList.DLLLast = NewNode;', N'D', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (11, N'21111063239 ', N'CTKU102', N'CTKU102044', N'Với cấu trúc dữ liệu như sau:
typedef struct DNode
{
int Key;
DNode * NextNode;
DNode * PreNode;
} DOneNode;
typedef DOneNode * DPointerType;
typedef struct DLLPairNode
{ DPointerType DLLFirst;
DPointerType DLLLast;
} DLLPType;
Hàm duyệt qua các nút trong danh sách liên kết đôi quản lý bởi hai địa chỉ nút đầu tiên và nút cuối cùng thông qua DList để xem nội dung thành phần dữ liệu của mỗi nút
void DLLTravelling (DLLPType DList)
{
DPointerType CurrNode = DList.DLLFirst;
while (CurrNode != NULL) { cout <<
CurrNode->Key; …………………………………
}
return;
}
Chọn câu chính xác điền vào chỗ trống để mô tả việc di chuyển từ nút này sang nút khác
A. CurrNode = CurrNode ->NextNode ;

B. CurrNode = CurrNode ->Key ;

C. CurrNode ->NextNode = CurrNode;

D. CurrNode ->Key = CurrNode;', N'A', N'C')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (12, N'21111063239 ', N'CTKU102', N'CTKU102047', N'Kết quả nào đúng khi thực hiện giải thuật sau với a[]= {1, 3, 5}; n= 5, k= 3:
void ToHopKe(int a[], int n, int k)
{ int i, j, tmp = 0;
for (i=1;i<= k; i++)
if (a[i]!= n-k+i) {tmp= 1;break;}
if (tmp==0) return;
i= k;
while (a[i]>= n-k+i) i--;
a[i]=a[i] + 1;
for (j=i+1;j<=k;j++) a[j]=a[i] + j - i;
for (i= 1; i<= n; i++) printf("%d ", a[i]);
}
A. 2 3 4

B. 1 2 3

C. 2 3 5

D. 1 4 5', N'D', N'D')
INSERT [dbo].[BAILAM] ([CauSo], [MaSV], [MaHP], [MaCH], [NoiDung], [DapAn], [TraLoi]) VALUES (13, N'21111063239 ', N'CTKU102', N'CTKU102091', N'Trong lưu trữ dữ liệu kiểu Queue (Q), giả sử F là con trỏ trỏ tới lối trước của Q, R là con trỏ trỏ tới lối sau của Q. Khi loại bỏ một phần tử vào Queue, thì R và F thay đổi thế nào trong các phương án sau?
A. F=F+1, R không thay đổi

B. F không thay đổi, R=R+1

C. F không thay đổi, R=R-1

D. F=F-1, R không thay đổi', N'A', N'D')
GO
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107001', N'CTKM107', N'Máy tính điện tử là gì?
A. Thiết bị lưu trữ thông tin 
B. Thiết bị số hóa và biến đổi thông tin 
C. Thiết bị lưu trữ và xử lý thông tin
D. Thiết bị tạo và biến đổi thông tin', N'C')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107002', N'CTKM107', N'Máy tính đầu tiên ENIAC sử dụng linh kiện nào trong số các linh kiện sau?
A. Transistor lưỡng cực 
B. Transistor trường 
C. Đèn điện tử 
D. IC bán dẫn', N'C')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107003', N'CTKM107', N'Trong các phát biểu sau, phát biểu nào đúng?
A. Phần cứng của máy tính bao gồm các đối tượng vật lý như: bản mạch chính, bộ nhớ RAM, ROM, đĩa cứng, màn hình 
B. Phần cứng của máy tính bao gồm các đối tượng như: bản mạch chính, bộ nhớ RAM, bộ nhớ ROM, đĩa cứng, màn hình và chương trình được cài đặt trong ROM 
C. Phần cứng của máy tính là chương trình được cài đặt trong bộ nhớ ROM 
D. Phần cứng của máy tính chính là bộ xử lý trung tâm', N'A')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107004', N'CTKM107', N'Các thành phần cơ bản của một máy tính gồm:
A. Bộ nhớ trong, CPU và khối phối ghép vào ra 
B. Bộ nhớ trong, CPU và thiết bị ngoại vi 
C. Bộ nhớ trong, CPU, khối phối ghép vào ra và thiết bị ngoại vi 
D. Bộ nhớ trong, CPU, bộ nhớ ngoài, bộ phối ghép vào ra và thiết bị ngoại vi', N'D')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107005', N'CTKM107', N'Phần dẻo (Firmware) trong máy tính là gì? 
A. Phần mềm được đặt vào bên trong các mạch điện tử trong quá trình sản xuất 
B. Hệ điều hành 
C. Các Driver cho các thiết bị phần cứng và các mạch hỗ trợ phối ghépvào ra cho máy tính 
D. Phần mềm hệ thống', N'A')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107006', N'CTKM107', N'Một ví dụ về phần dẻo (Firmware) trong máy tính là: 
A. Hệ điều hành MS DOS 
B. Chương trình điều khiển trong ROM BIOS
C. Chương trình Driver cho Card màn hình của máy tính 
D. Phần mềm ứng dụng của người dùng', N'B')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107007', N'CTKM107', N'Việc trao đổi dữ liệu giữa thiết bị ngoại vi và máy tính được thực hiện qua: 
A. Một thanh ghi điều khiển 
B. Một cổng 
C. Thanh ghi AX 
D. Thanh ghi cờ', N'B')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107008', N'CTKM107', N'Phần mềm của máy tính là: 
A. Các bộ điều phối thiết bị giúp cho việc ghép nối và ra được thực hiện một cách linh hoạt.
B. Cơ cấu trao đổi dữ liệu giữa các thiết bị phần cứng trong máy tính 
C. Chương trình được cài đặt trong bộ nhớ ROM 
D. Bộ vi xử lý và các vi mạch hỗ trợ cho nó', N'C')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107009', N'CTKM107', N'Trong các bộ phận sau, bộ phận nào không thuộc bộ xử lý trung tâm: 
A. Đơn vị phối ghép vào ra 
B. Khối số học và logic 
C. Tập các thanh ghi đa năng 
D. Khối điều khiển', N'A')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107010', N'CTKM107', N'Trong các bộ phận sau, bộ phận nào không thuộc bộ xử lý trung tâm: 
A. Bộ nhớ trong
B. Khối số học và logic 
C. Tập các thanh ghi đa năng 
D. Khối điều khiển để thi hành lệnh một cách tuần tự và tác động lêncác mạch chức năng nhằm thi hành lệnh.', N'A')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107011', N'CTKM107', N'Một trong các nội dung của nguyên lý Von Newmann là: 
A. Máy tính có thể hoạt động theo một chương trình đã được lưu trữ
B. Máy tính có thể điều khiển mọi hoạt động bằng một chương trình duy nhất C. Bộ nhớ máy tính không thể địa chỉ hóa được 
D. Mỗi câu lệnh phải có một vùng nhớ chứa địa chỉ lệnh tiếp theo', N'A')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107012', N'CTKM107', N'Trong các phát biểu sau, phát biểu nào không thuộc nội dung của nguyên lý Von Newmann? 
A. Máy tính có thể hoạt động theo một chương trình đã được lưu trữ
B. Máy tính sử dụng một bộ đếm chương trình để chỉ ra vị trí câu lệnh kế tiếp C. Bộ nhớ của máy tính được địa chỉ hóa 
D. Mỗi câu lệnh phải có một vùng nhớ chứa địa chỉ lệnh tiếp theo', N'D')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107013', N'CTKM107', N'Trong các phát biểu sau, phát biểu nào thuộc nội dung của nguyên lý Von Newmann? 
A. Máy tính sử dụng một bộ đếm chương trình để chỉ ra vị trí câu lệnh kế tiếp
B. Máy tính có thể điều khiển mọi hoạt động bằng một chương trình duy nhất C. Bộ nhớ máy tính không thể địa chỉ hóa được 
D. Mỗi câu lệnh phải có một vùng nhớ chứa địa chỉ lệnh tiếp theo', N'A')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107014', N'CTKM107', N'Phát biểu sau đây thuộc nội dung của nguyên lý Von Newmann? 
A. Các chương trình chỉ được nạp khi thực hiện 
B. Máy tính có thể điều khiển mọi hoạt động bằng một chương trình duy nhất C. Bộ nhớ máy tính không thể địa chỉ hóa được 
D. Bộ nhớ của máy tính được địa chỉ hóa', N'D')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107015', N'CTKM107', N'Theo nguyên lý Von Newmann, để thay đổi thứ tự các lệnh được thực hiện, ta chỉ cần: 
A. Thay đổi nội dung thanh ghi con trỏ lệnh bằng địa chỉ lệnh cần thực hiện tiếp
B. Thay đổi nội dung trong vùng nhớ chứa địa chỉ chương trình đang thực hiện
C. Thay đổi nội dung thanh ghi mảng mã lệnh 
D. Thay đổi nội dung thanh ghi mảng dữ liệu', N'A')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107016', N'CTKM107', N'Theo nguyên lý Von Newmann, để truy cập một khối dữ liệu, ta cần: 
A. Xác định địa chỉ và trạng thái của khối dữ liệu
B. Xác định địa chỉ của khối dữ liệu 
C. Xác định trạng thái của khối dữ liệu 
D. Xác định nội dung của khối dữ liệu', N'B')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107017', N'CTKM107', N'Thông tin được lưu trữ và truyền bên trong máy tính dưới dạng:
A. Nhị phân
B. Mã ASSCII
C. Thập phân
D. Kết hợp chữ cái và chữ số', N'A')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107018', N'CTKM107', N'Theo nguyên lý Von Newmann, việc cài đặt dữ liệu vào máy tính được thực hiện bằng: 
A. Đục lỗ trên băng giấy 
B. Đục lỗ trên bìa và đưa vào bằng tay 
C. Xung điện
D. Xung điện từ', N'C')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107019', N'CTKM107', N'Hãy chỉ ra khẳng định sai trong các khẳng định sau: 
A. Hệ đếm là tập hợp các ký hiệu và qui tắc sử dụng tập ký hiệu đó để biểu diễn và xác định giá trị các số 
B. Tổng số ký số của mỗi hệ đếm được gọi là cơ số 
C. Mỗi hệ đếm được xây dựng trên một tập ký số vô hạn
D. Hệ đếm La mã là hệ đếm không có trọng số', N'C')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107020', N'CTKM107', N'Hệ đếm là gì? 
A. Hệ thống các kí hiệu để biểu diễn các số
B. Hệ thống các qui tắc và phép tính để biểu biểu diễn các số 
C. Tập hợp các ký hiệu và qui tắc sử dụng nó để biểu diễn và xác định giá trị các số
D. Tập hợp các ký hiệu để biểu diễn các qui tắc đếm', N'C')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107021', N'CTKM107', N'Trong hệ đếm thập phân, giá trị của mỗi con số phụ thuộc vào: 
A. Bản thân chữ số đó 
B. Vị trí của nó 
C. Bản thân chữ số đó và vị trí của nó
D. Mối quan hệ với các chữ số trước và sau nó', N'C')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107022', N'CTKM107', N'Trong hệ đếm La Mã, giá trị của mỗi chữ số phụ thuộc vào: 
A. Bản thân chữ số đó 
B. Vị trí của nó 
C. Bản thân chữ số đó và vị trí của nó
D. Mối quan hệ với các chữ số trước và sau nó', N'A')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107023', N'CTKM107', N'Trong hệ đếm nhị phân, giá trị của mỗi con số phụ thuộc vào: 
A. Mối quan hệ với các chữ số trước và sau nó 
B. Bản thân chữ số đó 
C. Vị trí của nó 
D. Bản thân chữ số đó và vị trí của nó', N'D')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107024', N'CTKM107', N'Trong số dấu chấm động biểu diễn dạng 32 bit trong máy tính, thành phần định trị có độ dài bao nhiêu bit?
A.16 bit
B.18 bit
C.20 bit
D.24 bit', N'D')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107025', N'CTKM107', N'Đặc điểm của trọng tài Bus tập trung nhiều mức:
A.Các thiết bị nối với đơn vị trọng tài Bus bằng một dây duy nhất
B.Các thiết bị ngoại vi được nối tới các đường dây yêu cầu Bus khác nhau
C.Các thiết bị ngoại vi được nối tới tất cả các đường dây yêu cầu Bus
D.Mỗi thiết bị ngoại vi có một đường dây yêu cầu Bus riêng', N'B')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107026', N'CTKM107', N'Trong số dấu chấm động biểu diễn dạng 32 bit trong máy tính, thành phần số mũ có độ dài bao nhiêu bit?
A.6 bit
B.7 bit
C.8 bit
D.9 bit', N'B')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107027', N'CTKM107', N'Chữ số L trong hệ đếm La mã tương ứng với giá trị nào trong các giá trị sau đây: 
A. 50
B. 100 
C. 500 
D. 1000', N'A')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107028', N'CTKM107', N'Chữ số C trong hệ đếm La mã tương ứng với giá trị thập phân nào trong các giá trị sau đây: 
A. 20 
B. 100 
C. 200 
D. 500', N'B')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107029', N'CTKM107', N'Chữ số D trong hệ đếm La mã tương ứng với giá trị thập phân nào trong các giá trị sau đây: 
A. 100 
B. 200 
C. 500
D. 1000', N'C')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107030', N'CTKM107', N'Trong hệ La mã số CD nhận giá trị thập phân nào trong các giá trị sau đây: 
A. 600
B. 400
C. 200 
D. 500', N'B')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107031', N'CTKM107', N'Trong hệ La mã số DC nhận giá trị thập phân nào trong các giá trị sauđây: 
A. 600
B. 400 
C. 500 
D. 200', N'A')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107032', N'CTKM107', N'Trong hệ La mã số LD nhận giá trị thập phân nào trong các giá trị sau đây: 
A. 350 
B. 450
C. 550 
D. 650', N'B')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107033', N'CTKM107', N'Trong hệ La mã số MD nhận giá trị thập phân nào trong các giá trị sau đây: 
A. 1400 
B. 1500
C. 1600 
D. 1700', N'B')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107034', N'CTKM107', N'Trong hệ La mã số CM nhận giá trị thập phân nào trong các giá trị sau đây: 
A. 1600 
B. 1500 
C. 1100 
D. 900', N'D')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107035', N'CTKM107', N'Trong hệ La mã số MCC nhận giá trị thập phân nào trong các giá trị sau đây: A. 600 
B. 700 
C. 1100 
D. 1200 *', N'D')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107036', N'CTKM107', N'Trong hệ La mã số MLD nhận giá trị thập phân nào trong các giá trị sau đây: A. 1150 
B. 1050 
C. 1450 
D. 1650', N'C')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107037', N'CTKM107', N'Trong hệ La mã số DLL nhận giá trị thập phân nào trong các giá trị sau đây: 
A. 400 
B. 600
C. 800 
D. 1200', N'B')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107038', N'CTKM107', N'Trong hệ La mã số MCD nhận giá trị thập phân nào trong các giá trị sau đây: A. 1400
B. 1450 
C. 1600 
D. 1650', N'A')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107039', N'CTKM107', N'Trong hệ La mã số MMCMLXXVI nhận giá trị thập phân nào trong các giá trị sau đây: 
A. 1846 
B. 2756 
C. 2866 
D. 2976 *', N'D')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107040', N'CTKM107', N'Trong hệ nhị phân số 11101.11(2) tương ứng với giá trị thập phân nào trong các giá trị sau đây: 
A. 26,75 
B. 29,75 
C. 29,65 
D. 26,65', N'B')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107041', N'CTKM107', N'Trong hệ nhị phân số 10101.11(2) tương ứng với giá trị thập phân nào trong các giá trị sau đây: 
A. 21.75 * 
B. 23.75 
C. 21.65 
D. 23.65', N'A')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107042', N'CTKM107', N'Trong hệ nhị phân số 10101.01(2) tương ứng với giá trị thập phân nào trong các giá trị sau đây: 
A. 23.75 
B. 21.75 
C. 21,25
D. 23.25', N'C')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107043', N'CTKM107', N'Trong hệ nhị phân số 11101.01(2) tương ứng với giá trị thập phân nào trong các giá trị sau đây: 
A. 27.75 
B. 29.75 
C. 27.25 
D. 29.25', N'D')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107044', N'CTKM107', N'Trong hệ nhị phân số 10111.1(2) tương ứng với giá trị thập phân nào trong các giá trị sau đây: 
A. 23.5
B. 23.25 
C. 25.5 
D. 25.25', N'A')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107045', N'CTKM107', N'Trong hệ nhị phân số 11001.01(2) tương ứng với giá trị thập phân nào trong các giá trị sau đây: 
A. 27.75 
B. 25.25 
C. 27.25 
D. 25.75', N'B')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107046', N'CTKM107', N'Trong hệ nhị phân số 11001.11(2) tương ứng với giá trị thập phân nào trong các giá trị sau đây: 
A. 27.75 
B. 29.75 
C. 25.75
D. 29.25', N'C')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107047', N'CTKM107', N'Trong hệ đếm bát phân số 237.64(8) tương ứng với giá trị thập phân nào trong các giá trị sau đây: 
A. 157.8125 
B. 159.8125
C. 157.825 
D. 159.825', N'B')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107048', N'CTKM107', N'Trong hệ đếm bát phân số 237.04(8) tương ứng với giá trị thập phân nào trong các giá trị sau đây: 
A. 157.0625 
B. 157.8125 
C. 159.0625
D. 159.8125', N'C')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107049', N'CTKM107', N'Trong hệ đếm bát phân số 235.04(8) tương ứng với giá trị thập phân nào trong các giá trị sau đây: 
A. 157.0125 
B. 159.0125 
C. 159.0625 
D. 157.0625', N'D')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107050', N'CTKM107', N'Trong hệ đếm bát phân số 237.04(8) tương ứng với giá trị thập phân nào trong các giá trị sau đây: 
A. 157.0625 
B. 157.8125 
C. 159.0625
D. 159.8125', N'C')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107051', N'CTKM107', N'Trong hệ đếm thập lục phân số 34F5(16) tương ứng với giá trị thập phân nào trong các giá trị sau đây: 
A. 13557 
B. 15775 
C. 15459 
D. 13267', N'A')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107052', N'CTKM107', N'Trong hệ đếm thập lục phân số 44C5(16) tương ứng với giá trị thập phân nào trong các giá trị sau đây: 
A. 15577 
B. 15875 
C. 18459 
D. 17505', N'D')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107053', N'CTKM107', N'Trong hệ đếm thập lục phân số 345F(16) tương ứng với giá trị thập phân nào trong các giá trị sau đây: 
A. 13557 
B. 13407
C. 15459 
D. 13267', N'B')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107054', N'CTKM107', N'Trong hệ đếm thập lục phân (Hexa) số 3CF5(16) tương ứng với giá trị thập phân nào trong các giá trị sau đây: 
A. 13537 
B. 15725 
C. 15605
D. 13287', N'C')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107055', N'CTKM107', N'Số 267(10) tương ứng với giá trị nhị phân nào trong các giá trị sau đây: 
A. 100001011(2)
B. 101001011(2) 
C. 100101011(2) 
D. 100101011(2)', N'A')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107056', N'CTKM107', N'Số 247(10) tương ứng với giá trị nhị phân nào trong các giá trị sau đây: 
A. 10001011(2) 
B. 11100111(2) 
C. 11110111(2)
D. 11010111(2)', N'C')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107057', N'CTKM107', N'Số 285(10) tương ứng với giá trị nhị phân nào trong các giá trị sau đây: 
A. 100001011(2) 
B. 100011101(2)
C. 100101011(2) 
D. 100101001(2)', N'B')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107058', N'CTKM107', N'Số 277(10) tương ứng với giá trị nhị phân nào trong các giá trị sau đây: 
A. 100001001(2) 
B. 100011011(2) 
C. 100101011(2) 
D. 100010101(2)', N'D')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107059', N'CTKM107', N'Số 899(10) tương ứng với giá trị bát phân nào trong các giá trị sau đây: 
A. 1505(8) 
B. 1603(8)
C. 1607(8) 
D. 1705(8)', N'B')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107060', N'CTKM107', N'Số 859(10) tương ứng với giá trị bát phân nào trong các giá trị sau đây: 
A. 1533(8) 
B. 1633(8) 
C. 1637(8) 
D. 1733(8)', N'A')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107061', N'CTKM107', N'Số 799(10) tương ứng với giá trị bát phân nào trong các giá trị sau đây: 
A. 1545(8) 
B. 1403(8) 
C. 1437(8) 
D. 1565(8)', N'C')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107062', N'CTKM107', N'Số 785(10) tương ứng với giá trị bát phân nào trong các giá trị sau đây: 
A. 1471(8) 
B. 1461(8) 
C. 1451(8) 
D. 1421(8)', N'D')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107063', N'CTKM107', N'Số 865(10) tương ứng với giá trị bát phân nào trong các giá trị sau đây: 
A. 1541(8)
B. 1551(8) 
C. 1561(8) 
D. 1571(8)', N'A')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107064', N'CTKM107', N'Số 841(10) tương ứng với giá trị bát phân nào trong các giá trị sau đây: 
A. 1505(8) 
B. 1511(8)
C. 1531(8) 
D. 1551(8)', N'B')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107065', N'CTKM107', N'Tổng hai số nhị phân 1010101(2) và 1101011(2) bằng số nhị phân nào trong các số sau: 
A. 11000000(2)
B. 10100000(2) 
C. 10010000(2) 
D. 10001000(2)', N'A')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107066', N'CTKM107', N'Tổng hai số nhị phân 1010101(2) và 1100011(2) bằng số nhị phân nào trong các số sau: 
A. 11000000(2) 
B. 10111000(2)
C. 10011000(2) 
D. 10001000(2)', N'B')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107067', N'CTKM107', N'Tổng hai số nhị phân 1010101(2) và 1101001(2) bằng số nhị phân nào trong các số sau: 
A. 10011000(2) 
B. 10101000(2) 
C. 10111110(2)
D. 10111010(2)', N'C')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107068', N'CTKM107', N'Tổng hai số nhị phân 1011101(2) và 1101011(2) bằng số nhị phân nào trong các số sau: 
A. 10011000(2) 
B. 11100000(2) 
C. 11010000(2) 
D. 11001000(2)', N'D')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107069', N'CTKM107', N'Kết quả cộng hai số nhị phân 1010111(2) và 1101011(2) bằng số nhị phân nào trong các số sau: 
A. 10011000(2) 
B. 11000010(2)
C. 10010000(2) 
D. 10001000(2)', N'B')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107070', N'CTKM107', N'Tổng hai số nhị phân 1001101(2) và 1101001(2) bằng số nhị phân nào trong các số sau: 
A. 10010010(2) 
B. 10100000(2) 
C. 10110110(2)
D. 10001000(2)', N'C')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107071', N'CTKM107', N'Tích hai số nhị phân 110(2) và 1011(2) bằng số nhị phân nào trong các số sau: A. 1000010(2)
B. 1010000(2) 
C. 1010110(2) 
D. 1001000(2)', N'A')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107072', N'CTKM107', N'Tích hai số nhị phân 1110(2) và 1011(2) bằng số nhị phân nào trong các số sau: 
A. 10000110(2) 
B. 10011010(2)
C. 10101010(2) 
D. 10010010(2)', N'B')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107073', N'CTKM107', N'Tích hai số nhị phân 1101(2) và 1011(2) bằng số nhị phân nào trong các số sau: 
A. 10000111(2) 
B. 10100111(2) 
C. 10001111(2)
D. 10010111(2)', N'C')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107074', N'CTKM107', N'Tích hai số nhị phân 1110(2) và 1010(2) bằng số nhị phân nào trong các số sau: 
A. 10000100(2) 
B. 10100100(2) 
C. 10101100(2) 
D. 10001100(2)', N'D')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107075', N'CTKM107', N'Tích hai số nhị phân 1101(2) và 1010(2) bằng số nhị phân nào trong các số sau: 
A. 10000110(2) 
B. 10000010(2)
C. 10100110(2) 
D. 10010010(2)', N'B')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107076', N'CTKM107', N'Số dấu chấm động A được lưu trữ trong máy tính dưới dạng 32 bit sau: 11001001110100011110100000000000, hỏi số A nhận giá trị nào sau đây: 
A. – 0.1101000111101 x 29
B. 0.1101000111101 x 29 
C. – 0.1101000111101 x 27 
D. 0.1101000111101 x 27', N'A')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107077', N'CTKM107', N'Số dấu chấm động A được lưu trữ trong máy tính dưới dạng 32 bit sau: 11001000110100011110100000000000, hỏi số A nhận giá trị nào sau đây:
A. – 0.1101000111101 x 29 
B. – 0.1101000111101 x 28
C. – 0.1101000111101 x 27 
D. – 0.1101000111101 x 26', N'B')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107078', N'CTKM107', N'Số dấu chấm động A được lưu trữ trong máy tính dưới dạng 32 bit sau: 01001000110100011110100000000000, hỏi số A nhận giá trị nào sau đây:
A. – 0.1101000111101 x 26 
B. – 0.1101000111101 x 28 
C. 0.1101000111101 x 28 * 
D. 0.1101000111101 x 27', N'C')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107079', N'CTKM107', N'Số dấu chấm động A được lưu trữ trong máy tính dưới dạng 32 bit sau: 01001000110100010110100000000000, hỏi số A nhận giá trị nào sau đây:
A. – 0.1101000111101 x 27 
B. 0.1101000101101 x 28 
C. – 0.1101000111101 x 27 
D. 0.1101000101101 x 28 *', N'D')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107080', N'CTKM107', N'Số dấu chấm động A được lưu trữ trong máy tính dưới dạng 32 bit sau: 11001011110100011110100000000000, hỏi số A nhận giá trị nào sau đây:
A. – 0.1101000111101 x 211 * 
B. – 0.1101000110101 x 210 
C. 0.1101000111101 x 29 
D. 0.1101000111101 x 28', N'A')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107081', N'CTKM107', N'Số dấu chấm động A được lưu trữ trong máy tính dưới dạng 32 bit sau: 11001010110100011010100000000000, hỏi số A nhận giá trị nào sau đây:
A. – 0.1101000111101 x 211 
B. – 0.1101000110101 x 210
C. 0.1101000111101 x 29 
D. 0.1101000111101 x 2', N'B')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107082', N'CTKM107', N'Số dấu chấm động A được lưu trữ trong máy tính dưới dạng 32 bit sau: 01001110110100011110100000000000, hỏi số A nhận giá trị nào sau đây: 
A. – 0.1101000111101 x 212 
B. – 0.1101000110101 x 213 
C. 0.1101000111101 x 214
D. 0.1101000110101 x 215 ', N'C')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107083', N'CTKM107', N'Bộ mã ASSCII mở rộng gồm bao nhiêu kí tự? 
A. 128 
B. 256
C. 512 
D. 1024', N'B')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107084', N'CTKM107', N'Bộ mã ASSCII cơ sở gồm bao nhiêu kí tự? 
A. 128
B. 256
C. 512 
D. 1024', N'A')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107085', N'CTKM107', N'Bộ mã ASSCII cơ sở gồm các kí tự được mã hóa bằng bao nhiêu bit? 
A. 6 bit 
B. 7 bit
C. 8 bit
D. 9 bit', N'B')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107086', N'CTKM107', N'Các kí tự được bổ sung trong bộ mã ASSCII mở rộng là các kí tự gì? 
A. Kí tự điều khiển 
B. Kí tự đồ họa
C. Kí tự chữ cái 
D. Kí tự chữ số', N'B')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107087', N'CTKM107', N'Mã NBCD biểu diễn mỗi chữ số thập phân bằng bao nhiêu bit? 
A. 3 bit 
B. 4 bit 
C. 6 bit 
D. 8 bit', N'B')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107088', N'CTKM107', N'Mã ASSCII của chữ số 0 bằng bao nhiêu? 
A. 25H 
B. 30H
C. 36H 
D. 40H', N'B')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107089', N'CTKM107', N'Mã ASSCII của chữ số 9 bằng bao nhiêu? 
A. 25H 
B. 36H
C. 39H
D. 40H', N'C')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107090', N'CTKM107', N'Mã ASSCII của chữ cái A bằng bao nhiêu? 
A. 35H 
B. 37H
C. 39H 
D. 41H', N'D')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107091', N'CTKM107', N'Bus nào trong máy tính có nhiệm vụ là đường truyền dẫn giữa CPU và các chip hỗ trợ trung gian?
A.Bus trong bộ vi xử lý
B.Bus bộ vi xử lý
C.Bus ngoại vi
D.Bus hệ thống', N'B')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107092', N'CTKM107', N'Bus nào trong máy tính có nhiệm vụ là đường truyền dẫn giữa các khối của bộ vi xử lý?
A.Bus trong bộ vi xử lý
B.Bus bộ vi xử lý
C.Bus ngoại vi
D.Bus hệ thống', N'A')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107093', N'CTKM107', N'Bus nào trong máy tính có nhiệm vụ kết nối bộ vi xử lý với bộ nhớ chính và bộ nhớ Cache?
A.Bus trong bộ vi xử lý
B.Bus bộ vi xử lý
C.Bus ngoại vi
D.Bus hệ thống', N'D')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107094', N'CTKM107', N'Chức năng của Bus hệ thống trong máy tính là gì?
A.Là đường truyền dẫn giữa các khối của bộ vi xử lý
B.Kết nối bộ vi xử lý với bộ nhớ chính, bộ nhớ Cache và các bộ điều khiển ghép nối vào ra
C.Kết nối hệ thống vào ra với bộ vi xử lý
D.Đường truyền dẫn giữa CPU và các chip hỗ trợ trung gian', N'B')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107095', N'CTKM107', N'Đặc điểm quan trọng của Bus đồng bộ là gì?
A.Dữ liệu được truyền đồng thời
B.Dữ liệu được truyền không đồng thời
C.Có tín hiệu đồng hồ chung điều khiển hoạt động
D.Không có tín hiệu đồng hồ chung điều khiển hoạt động', N'C')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107096', N'CTKM107', N'Một trong các đặc điểm của Bus đồng bộ là:
A.Chu kỳ Bus thay đổi với từng cặp thiết bị trao đổi dữ liệu
B.Dữ liệu được truyền liên tục trong mọi chu kỳ Bus
C.Mọi thao tác được thực hiện trong những khoảng thời gian là bội số của chu kỳ Bus
D.Tần số tín hiệu đồng hồ chung thay đổi tùy theo điều kiện của hệ thống', N'C')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107097', N'CTKM107', N'Chương trình BIOS trong các máy tính hiện đại thường được lưu trữ trong bộ nhớ loại nào?
A.PROM 
B.EPROM 
C.EEPROM
D.Flash ROM', N'C')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107098', N'CTKM107', N'Cấu tạo của một ô nhớ SRAM như thế nào?
A.Gồm hai tụ điện và ba Transistor 
B.Gồm ba tụ điện và hai Transistor 
C.Gồm bốn tụ điện và hai Transistor 
D.Gồm sáu Transistor', N'D')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107099', N'CTKM107', N'Tốc độ truy nhập của bộ nhớ SRAM so với bộ nhớ DRAM như thế nào?
A.Chậm hơn
B.Nhanh hơn
C.Bằng nhau
D.Không xác định được', N'B')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKM107100', N'CTKM107', N'Đối với bộ nhớ truy nhập ngẫu nhiên, điều nào sau đây đúng?
A.Dữ liệu của bộ nhớ được đọc hay ghi tại các thời điểm ngẫu nhiên
B.Thời gian truy nhập vào bất kỳ ngăn nhớ nào trong bộ nhớ đều bằng nhau
C.Dữ liệu trong bộ nhớ có giá trị ngẫu nhiên
D.Dữ liệu trong bộ nhớ không được đọc hay ghi một cách tuần tự', N'B')
GO
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102001', N'CTKU102', N'"Hãy cho biết ý tưởng nào sau đây nói về phương pháp sắp xếp chọn tăng dần (select sort)?
A. Phân đoạn dãy thành nhiều dãy con và lần lượt trộn hai dãy con thành dãy lớn hơn, cho đến khi thu được dãy ban đầu đã được sắp xếp
B. Lần lượt lấy phần tử của danh sách chèn vị trí thích hợp của nó trong dãy
C. Chọn phần tử bé nhất xếp vào vị trí thứ nhất bằng cách đổi chổ phần tử bé nhất với phần tử thứ nhất; Tương tự đối với phần tử nhỏ thứ hai cho đến phần tử cuối cùng
D. Bắt đầu từ cuối dãy đến đầu dãy, ta lần lượt so sánh hai phần tử kế tiếp nhau, nếu phần tử nào bé hơn được cho lên vị trí trên"
', N'C')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102002', N'CTKU102', N'Hãy cho biết ý tưởng nào sau đây nói về phương pháp sắp xếp nổi bọt (bubble sort)?
A. Phân đoạn dãy thành nhiều dãy con và lần lượt trộn hai dãy con thành dãy lớn hơn, cho đến khi thu được dãy ban đầu đã được sắp xếp

B. Bắt đầu từ cuối dãy đến đầu dãy, ta lần lượt so sánh hai phần tử kế tiếp nhau, nếu phần tử nào nhỏ hơn được đứng vị trí trên

C. Lần lượt lấy phần tử của danh sách chèn vị trí thích hợp của nó trong dãy bằng cách đẩy các phần tử lớn hơn xuống

D. Chọn phần tử bé nhất xếp vào vị trí thứ nhất bằng cách đổi chổ phần tử bé nhất với phần tử thứ nhất; Tương tự đối với phần tử nhỏ thứ hai cho đến phần tử cuối cùng', N'B')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102003', N'CTKU102', N'Hãy cho biết ý tưởng nào sau đây nói về phương pháp sắp xếp chèn (insertion sort)?
A. Phân đoạn dãy thành nhiều dãy con và lần lượt trộn hai dãy con thành dãy lớn hơn, cho đến khi thu được dãy ban đầu đã được sắp xếp

B. Lần lượt lấy phần tử của danh sách chèn vị trí thích hợp của nó trong dãy bằng cách đẩy các phần tử lớn hơn xuống

C. Chọn phần tử bé nhất xếp vào vị trí thứ nhất bằng cách đổi chổ phần tử bé nhất với phần tử thứ nhất; Tương tự đối với phần tử nhỏ thứ hai cho đến phần tử cuối cùng

D. Bắt đầu từ cuối dãy đến đầu dãy, ta lần lượt so sánh hai phần tử kế tiếp nhau, nếu phần tử nào nhỏ hơn được đứng vị trí trên', N'B')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102004', N'CTKU102', N'Hãy cho biết ý tưởng nào sau đây nói về phương pháp sắp xếp nhanh (Quick sort)?
A. Chọn phần tử bé nhất xếp vào vị trí thứ nhất bằng cách đổi chổ phần tử bé nhất với phần tử thứ nhất; Tương tự đối với phần tử nhỏ thứ hai cho đến phần tử cuối cùng

B. Bắt đầu từ cuối dãy đến đầu dãy, ta lần lượt so sánh hai phần tử kế tiếpnh u, nếu phần tử nào nhỏ hơn được đứng vị trí trên

C. Phân đoạn dãy thành nhiều dãy con và lần lượt trộn hai dãy con thành dãy lớn hơn, cho đến khi thu được dãy ban đầu đã được sắp xếp

D. Lần lượt chia dãy phần tử thành hai dãy con bởi một phần tử khoá (dãy con trước khoá gồm các phần tử nhỏ hơn khoá và dãy còn lại gồm các phần tử lớn hơn khoá)', N'D')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102005', N'CTKU102', N'Phương pháp nào sau đây chính là phương pháp sắp xếp nhanh (Quick sort)?
A. Phương phap trộn
B. Phương pháp vun đống
C. Phương pháp chèn
D. Phương pháp phân đoạn', N'D')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102006', N'CTKU102', N'Hãy cho biết ý tưởng nào sau đây nói về tưởng phương pháp sắp xếp Trộn (Merge sort)?
A. Lần lượt chia dãy phần tử thành hai dãy con bởi một phần tử khoá (dãy con trước khoá gồm các phần tử nhỏ hơn khoá và dãy còn lại gồm các phần tử lớn hơn khoá)
B. Bắt đầu từ cuối dãy đến đầu dãy, ta lần lượt so sánh hai phần tử kế tiếp nhau, nếu phần tử nào nhỏ hơn được đứng vị trí trên
C. Chọn phần tử bé nhất xếp vào vị trí thứ nhất bằng cách đổi chổ phần tử bé nhất với phần tử thứ nhất; Tương tự đối với phần tử nhỏ thứ hai cho đến phần tử cuối cùng
D. Phân đoạn dãy thành nhiều dãy con và lần lượt trộn hai dãy con thành dãy lớn hơn, cho đến khi thu được dãy ban đầu đã được sắp xếp', N'D')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102007', N'CTKU102', N'Trong giải thuật sắp xếp vun đống, ta có 4 thủ tục con (Insert - thêm 1 phần tử vào cây; Downheap - vun đống lại sau khi loại một phần tử khỏi Heap, Upheap- vun đống sau khi thêm một phần tử vào cây; Remove - loại 1 phần tử khỏi cây nhị phân). Để sắp xếp các phần tử trong dãy theo phương pháp vun đống, ta thực hiện 4 thủ tục trên theo thứ tự như thế nào sau đây?
A. Remove – Downheap – Insert – Upheap
B. Insert – Upheap – Downheap – Remove
C. Upheap – Downheap – Remove – Insert
D. Insert – Upheap – Remove – Downheap', N'D')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102008', N'CTKU102', N'Hãy cho biết tư tưởng nào sau đây nói về của giải thuật tìm kiếm nhị phân?
A. Lần lượt chia dãy thành hai dãy con dựa vào phần tử khoá, sau đó thực hiện việc tìm kiếm trên hai đoạn đã chia
B. So sánh X lần lượt với các phần tử thứ nhất, thứ hai,... của dãy cho đến khi gặp phần tử có khoá cần tìm
C. Tìm kiếm dựa vào cây nhị tìm kiếm
D. Tại mỗi bước tiến hành so sánh X với phần tử ở giữa của dãy, dựa vào bước so sánh này quyết định giới hạn dãy tìm kiếm nằm ở nửa trên, hay nửa dưới của dãy hiện hành', N'D')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102009', N'CTKU102', N'Hãy cho biết tư tưởng nào sau đây nói về của giải thuật tìm kiếm tuần tự?
A. So sánh X lần lượt với các phần tử thứ nhất, thứ hai,... của dãy cho đến khi gặp phần tử có khoá cần tìm
B. Tìm kiếm dựa vào cây nhị tìm kiếm: Nếu giá trị cần tìm nhỏ hơn gốc thì thực hiện tìm kiếm trên cây con trái, ngược lại ta việc tìm kiếm được thực hiện trên cây con phải
C. Lần lượt chia dãy thành hai dãy con dựa vào phần tử khoá, sau đó thực hiện việc tìm kiếm trên hai đoạn đã chia
D. Tại mỗi bước tiến hành so sánh X với phần tử ở giữa của dãy, dựa vào bước so sánh này quyết định giới hạn dãy tìm kiếm nằm ở nửa trên, hay nửa dưới của dãy hiện hành', N'A')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102010', N'CTKU102', N'Hãy cho biết tư tưởng nào sau đây nói về của giải thuật tìm kiếm trên cây nhị phân tìm kiếm?
A. Lần lượt chia dãy thành hai dãy con dựa vào phần tử khoá, sau đó thực hiện việc tìm kiếm trên hai đoạn đã chi
B. So sánh X lần lượt với các phần tử thứ nhất, thứ hai,... của dãy cho đến khi gặp phần tử có khoá cần tìm
C. Tìm kiếm dựa vào cây nhị tìm kiếm: Nếu giá trị cần tìm nhỏ hơn gốc thì thực hiện tìm kiếm trên cây con trái, ngược lại ta việc tìm kiếm được thực hiện trên cây con phải
D. Tại mỗi bước tiến hành so sánh X với phần tử ở giữa của dãy, dựa vào bước so sánh này quyết định giới hạn dãy tìm kiếm nằm ở nửa trên, hay nửa dưới của dãy hiện hành', N'B')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102011', N'CTKU102', N'Hãy cho biết tính chất nào sau đây là của cây nhị phân tìm kiếm?
A. Cây nhị phân mà mỗi nút trong cây đều thoả tính chất: giá trị của nút cha lớn hơn giá trị của hai nút con
B. Là cây nhị phân đầy đủ
C. Cây nhị phân thoả tính chất heap
D. Cây nhị phân mà mỗi nút trong cây đều thoả tính chất: giá trị của nút cha nhỏ hơn mọi nút trên cây con trái và lớn hơn mọi nút trên cây con phải của nó', N'D')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102012', N'CTKU102', N'Khi lưu trữ cây nhị phân dưới dạng mảng, nếu vị trí của nút cha là i thì vị trí của nút con trái là gì trong các phương án sau?
A. 2*i + 1
B. i-1
C. 2*i
D. i+1', N'C')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102013', N'CTKU102', N'Khi lưu trữ cây nhị phân dưới dạng mảng, nếu vị trí của nút cha trong mảng là i thì vị trí của nút con phải là gì trong các phương án sau?
A. 2*i + 1
B. i+1
C. i-1
D. 2*i', N'A')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102014', N'CTKU102', N'Trong biểu diễn dữ liệu dưới dạng cây, Khái niệm nào sau đây là cấp của cây?
A. Là tổng số nút trên cây
B. Là cấp cao nhất của nút gố
C. Là cấp cao nhất của một nút trên cây
D. Là cấp cao nhất của nút lá', N'C')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102015', N'CTKU102', N'Trong biểu diễn dữ liệu dưới dạng cây, nút có cấp bằng 0 gọi là nút gì trong các phương án sau?
A. Là nút lá
B. Là phần tử cuối cùng trong cây
C. Là nút gố
D. Là phần tử đầu cùng trong cây', N'A')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102016', N'CTKU102', N'Tìm mô tả đúng nhất cho hàm TinhTong sau:
int TinhTong(int N)
{ int so = 2; int tong = 0; int dem = 0; while (dem <N)
{
if (KiemTra(so) == 1)
{
tong = tong + so;
dem ++;
}
so = so + 1;
}
return tong;
} Trong đó
int KiemTra(int so)
{
for (int i = 2; i<so; i++)
if (so%i == 0)
return 0;
return 1;
}
A. Hàm tính tổng N số nguyên đầu tiên
B. Hàm tính tổng N số nguyên tố nhỏ hơn N
C. Cả a, b đều sai
D. Cả a, b đều đúng', N'C')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102017', N'CTKU102', N'Mối quan hệ giữa cấu trúc dữ liệu và giải thuật có thể minh họa bằng đẳng thức:
A. Cấu trúc dữ liệu + Giải thuật = Chương trình
B. Cấu trúc dữ liệu + Chương trình = Giải thuật
C. Chương trình + Giải thuật = Cấu trúc dữ liệu
D. Cấu trúc dữ liệu = Chương trình', N'A')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102018', N'CTKU102', N'Các tiêu chuẩn đánh giá cấu trúc dữ liệu. Để đánh giá một cấu trúc dữ liệu chúng ta thường dựa vào một số tiêu chí:
A. Cấu trúc dữ liệu phải tiết kiệm tài nguyên (bộ nhớ trong)
B. Cấu trúc dữ liệu phải phản ảnh đúng thực tế của bài toán
C. Cấu trúc dữ liệu phải dễ dàng trong việc thao tác dữ liệu
D. Cả a, b, c đều đúng', N'D')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102019', N'CTKU102', N'Đoạn mã giả dưới đây mô tả thuật toán gì?
Thuật toán:
B1: k = 1
B2: IF M[k] == X AND k != N
B2.1: k++
B2.2: Lặp lại B2
B3: IF k < N Thông báo tìm thấy tại vị trí k
B4: ELSE Không tìm thấy.
B5: Kết thúc
A. Tìm nhị phân phần tử có giá trị X
B. Tìm phần tử nhỏ nhất của mảng M bao gồm N phần tử
C. Tìm tuyến tính phần tử có giá trị X
D. Cả a, b, c đều sai', N'C')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102020', N'CTKU102', N'Cho hàm tìm kiếm tuyến tính như sau:
int TimKiem (int M[], int N, int X)
{ int k = 0;
M[N] = X;
while (M[k] != X)
k++;
if (k < N)
return (k);
return (-1);
}
Chọn câu đúng nhất:

A. Hàm sẽ trả về 0 nếu không tìm thấy phần tử có giá trị là X
B. Hàm sẽ trả về 1 nếu tìm thấy phần tử có giá trị là X
C. Hàm sẽ trả về -1 nếu không tìm thấy phần tử có giá trị là X
D. Hàm sẽ trả về 1 nếu không tìm thấy phần tử có giá trị là X', N'C')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102021', N'CTKU102', N'Xét thủ tục sau:
int TimKiemNP (int M[], int First, int Last, int X)
{
if (First > Last)
return (-1);
int Mid = (First + Last)/2;
if (X == M[Mid])
return (Mid);
if (X < M[Mid])
return(TimKiemNP (M, First, Mid – 1, X));
else
return(TimKiemNP (M, Mid + 1, Last, X));
}
Lựa chọn câu đúng nhất để mô tả thủ tục trên:
A. Thủ tục hỗ trợ tìm kiếm phần tử có giá trị là X trên mảng các phần tử từ chỉ số từ First đến chỉ số Last
B. Thủ tục hỗ trợ tìm kiếm đệ quy phần tử có giá trị là X trên mảng các phần tử từ chỉ số từ First đến chỉ số Last
C. Thủ tục hỗ trợ tìm kiếm đệ quy phần tử có giá trị là X trên mảng các phần tử từ chỉ số từ Last đến chỉ số First
D. Thủ tục hỗ trợ tìm kiếm không đệ quy phần tử có giá trị là X trên mảng các phần tử từ chỉ số từ Last đến chỉ số First', N'B')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102022', N'CTKU102', N'Chọn câu đúng nhất để mô tả thuật toán sắp xếp nổi bọt (Bubble Sort) trên mảng M có N phần tử:
A. Đi từ cuối mảng về đầu mảng, trong quá trình đi nếu phần tử ở dưới (đứng phía sau) nhỏ hơn phần tử đứng ngay trên (trước) nó thì hai phần tử này sẽ được đổi chỗ cho nhau. Sau mỗi lần đi chúng ta đưa được một phần
tử trồi lên đúng chỗ. Sau N–1 lần đi thì tất cả các phần tử trong mảng M sẽ có thứ tự tăng
B. Đi từ đầu mảng về cuối mảng, trong quá trình đi nếu phần tử ở dưới (đứng phía sau) nhỏ hơn phần tử đứng ngay trên (trước) nó thì hai phần tử này sẽ được đổi chỗ cho nhau. Sau mỗi lần đi chúng ta đưa được một phần tử trồi lên đúng chỗ. Sau N lần đi thì tất cả các phần tử trong mảng M sẽ có thứ tự tăng.
C. Đi từ cuối mảng về đầu mảng, trong quá trình đi nếu phần tử ở dưới (đứng phía sau) nhỏ hơn phần tử đứng ngay trên (trước) nó thì hai phần tử này sẽ được đổi chỗ cho nhau. Sau mỗi lần đi chúng ta đưa được một phần tử trồi lên đúng chỗ. Sau N lần đi thì tất cả các phần tử trong mảng M sẽ có thứ tự tăng
D. Cả a, b, c đều sai', N'A')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102023', N'CTKU102', N'Hàm mô tả sắp xếp nổi bọt (Bubble Sort) trên mảng M có N phần tử
void BubbleSort(int M[], int N)
{
[2] int Temp;
[3] for (int I = 0; I < N-1; I++)
[4] …………………………………..
[5] if (M[J] < M[J-1])
[6] {
[7] Temp = M[J];
[8] M[J] = M[J-1];
[9] M[J-1] = Temp;
[10] }
[11] return;
[12] }
[13]
Lệnh nào sau đây sẽ được đưa vào dòng lệnh thứ [5] của thủ tục:
A. for (int J = N-1; J > I; J++)
B. for (int J = N; J < I; J--)
C. for (int J = N-1; J > I; J--)
D. Không có dòng lệnh nào phù hợp, không cần thêm vào thuật toán vẫn chạy đúng', N'C')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102024', N'CTKU102', N'Thủ tục mô tả thuật toán sắp xếp chọn trực tiếp (Straight Selection Sort):
void SapXepChonTrucTiep(T M[], int N)
{
int K = 0, PosMin;
int Temp;
while (K < N-1)
{ T Min = M[K];
PosMin = K;
for (int Pos = K+1; Pos < N; Pos++)
if (Min > M[Pos])
{
Min = M[Pos];
PosMin = Pos
}
} ...................................
[1] ...................................
[2] ...................................
[3] K++;
}
return;
}
Chọn câu lệnh thích hợp để đưa vào [1], [2], [3] với mục tiêu hoán vị M[K] và M[PosMin]
A. Temp = M[K] ; Temp = M[PosMin]; M[PosMin] = Temp;
B. M[K] = Temp; M[K] = M[PosMin]; M[PosMin] = Temp ;
C. Temp = M[K] ; M[PosMin] = M[K]; M[PosMin] = Temp ;
D. Temp = M[K] ; M[K] = M[PosMin]; M[PosMin] = Temp ;', N'D')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102025', N'CTKU102', N'Đối với thuật toán sắp xếp chọn trực tiếp cho dãy các phần tử sau (10 pt) 16 60 2 25 15 45 5 30 33 20
Cần thực hiện ..................... chọn lựa phần tử nhỏ nhất để sắp xếp mảng M có thứ tự tăng dần.
A. 7 lần
B. 8 lần
C. 9 lần
D. 10 lần', N'C')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102026', N'CTKU102', N'Cấu trúc dữ liệu nào tương ứng với LIFO?
A. Queue

B. Linked List

C. Tree

D. Stack', N'D')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102027', N'CTKU102', N'Lựa chọn câu đúng nhất về danh sách liên kết đôi (Doubly Linked List):
A. Vùng liên kết của một phần tử trong danh sách liên đôi có 02 mối liên kết với 01 phần tử khác trong danh sách

B. Vùng liên kết của một phần tử trong danh sách liên đôi có 01 mối liên kết với 02 phần tử khác trong danh sách

C. Vùng liên kết của một phần tử trong danh sách liên đôi có 02 mối liên kết với 02 trước và sau nó trong danh sách

D. Vùng liên kết của một phần tử trong danh sách liên đôi có 02 mối liên kết với phần tử đầu và cuối của danh sách', N'C')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102028', N'CTKU102', N'Cho thuật toán tìm nhị phân không đệ quy sau:
int NRecBinarySearch (int M[], int N, int X)
{ int First = 0;
int Last = N – 1;
while (First <= Last)
{
int Mid = (First + Last)/2;
if (X == M[Mid])
return(Mid);
if (X < M[Mid])
Last = Mid – 1;
else
First = Mid + 1;
}
return(-1);
}
Chọn câu đúng nhất trong trường hợp tốt nhất khi phần tử ở giữa của mảng có giá trị bằng X:
A. Số phép gán: Gmin = 3 Số phép so sánh: Smin = 2

B. Số phép gán: Gmin = 2 Số phép so sánh: Smin = 3

C. Số phép gán: Gmin = 2 Số phép so sánh: Smin = 2

D. Số phép gán: Gmin = 0 Số phép so sánh: Smin = 2', N'A')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102029', N'CTKU102', N'Cho thuật toán sắp xếp Bubble Sort như sau:
void BubbleSort(int M[], int N)
{
for (int I = 0; I < N-1; I++)
for (int J = N-1; J > I; J--)
if (M[J] < M[J-1])
Swap(M[J], M[J-1]);
return;
}
Chọn câu đúng nhất cho hàm Swap
A. void Swap(int &X, int &Y) { int Temp = X; X = Y; Y = Temp; return; }

B. void Swap(float X, floatY) { int Temp = X; X = Y; Y = Temp; return; }

C. void Swap(int *X, int *Y) { int Temp = X; X = Y; Y = Temp; return; }

D. void Swap(int X, intY) { int Temp = X; X = Y; Y = Temp; return; }', N'A')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102030', N'CTKU102', N'Cho thuật toán sau:
int LinearSearch (int M[], int N, int X)
{ int k = 0;
while (M[k] != X k < N )
k++;
if (k < N )
return (k);
return (-1);
}
Chọn câu đúng nhất trong trường hợp xấu nhất khi không tìm thấy phần tử nào có giá trị bằng X:
A. Số phép gán: Gmax = 1 Số phép so sánh: Smax = 2N+1

B. Số phép gán: Gmax = 2 Số phép so sánh: Smax = 2N+1

C. Số phép gán: Gmax = 1 Số phép so sánh: Smax = 2N+2

D. Số phép gán: Gmax = 1 Số phép so sánh: Smax = N+2', N'A')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102031', N'CTKU102', N'Cho thuật toán sau:
int LinearSearch (float M[], int N, float X)
{
int k = 0;
M[N] = X;
while (M[k] != X) //n+1 lan
(M[k] != X) //n+1 lan k++;
if (k < N)
return (k);
return (-1);
}
Chọn câu đúng nhất trong trường hợp xấu nhất khi không tìm thấy phần tử nào có giá trị bằng X:
A. Số phép gán: Gmax = 1 Số phép so sánh: Smax = N + 2

B. Số phép gán: Gmax = 2 Số phép so sánh: Smax = N + 2

C. Số phép gán: Gmax = 2 Số phép so sánh: Smax = N + 1

D. Số phép gán: Gmax = 2 Số phép so sánh: Smax =2 N + 2', N'B')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102032', N'CTKU102', N'Cấu trúc dữ liệu cho kiểu dữ liệu sinh viên như sau:
typedef struct tagSV{
char MSSV[8];
char Ten[30];
char NgaySinh[11];
float DTB;
}SV;
Khai báo
SV sv1, *sv2;
Lựa chọn các câu đúng nhất để gán giá trị cho mã sinh viên của sv1 và sv2:
A. sv1.MSSV = “Nguyen Van A”; sv2.MSSV = “Nguyen Van B”;

B. sv1.MSSV = “Nguyen Van A”; sv2->MSSV = “Nguyen Van B”;

C. sv1->MSSV = “Nguyen Van A”; sv2->MSSV = “Nguyen Van B”;

D. sv1->MSSV = “Nguyen Van A”; sv2.MSSV = “Nguyen Van B”;', N'B')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102033', N'CTKU102', N'Với thủ tục như sau:
void operation()
{
int x,a[10],n;
int x,m,l,h,flag=0;
cout<<"Enter the element to be searched:";
cin>>x;
l=0; h=n-1;
while(l<=h)
{
m=(l+h)/2;
if(x==a[m]) {
lag=1; break;
}
else if(x>a[m])
l=m+1;
else if(x<a[m])
h=m-1;
}
if(flag==0)
cout<<"ABSENT";
else
cout<<"PRESENT";
}
Lựa chọn câu đúng nhất để mô tả thủ tục trên
A. Thủ tục tìm nhị phân phần tử được nhập từ bàn phím, nếu tìm thấy sẽ thông báo ABSENT

B. Thủ tục tìm nhị phân phần tử được nhập từ bàn phím, nếu không tìm thấy sẽ thông báo ABSENT

C. Thủ tục tìm tuyến tính phần tử được nhập từ bàn phím, nếu tìm thấy sẽ thông báo ABSENT

D. Thủ tục tìm tuyến tính phần tử được nhập từ bàn phím, nếu không tìm thấy sẽ thông báo ABSENT', N'B')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102034', N'CTKU102', N'Biểu diễn và tổ chức ngăn xếp (Stack) bằng danh sách liên kết giả sử bề mặt của ngăn xếp là đầu danh sách liên kết:
typedef struct SElement
{ T Key;
SElement *Next;
} SOneElement;
typedef struct SOneElement *SSTACK;
SSTACK SSP;
Thêm 1 phần tử vào ngăn xếp (dùng cấu trúc dữ liệu mô tả ở trên)
B1: NewElement = Khởi tạo nút mới (dùng toán tử new)
B2: if (NewElement == NULL)
Thực hiện BKT
B3: if (SSP == NULL)
B3.1: SSP = NewElement
B3.2: Thực hiện BKT
B4: …………………………………………
B5: …………………………………………
BKT: Kết thúc
Chọn câu lệnh chính xác cho B4 và B5
A. B4: NewElement ->Next = SSP SSP = NewElement

B. B4: SSP = NewElement ->Next B5: SSP = NewElement

C. B4: SSP = NewElement ->Next B5: NewElement = SSP

D. B4: NewElement ->Next = SSP B5: NewElement = SSP', N'A')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102035', N'CTKU102', N'Cấu trúc dữ liệu biểu diễn hàng đợi bằng danh sách liên kết:
typedef struct QElement
{ T Key;
QElement *Next;
} QOneElement;
typedef QElement *QType;
Cấu trúc dữ liệu quản lý hàng đợi bằng hai phần tử đầu (Front) và cuối
(Rear):
typedef struct QPElement
{ QType Font;
QType Rear;
} SQUEUE;
SQUEUE SQList;
Thêm phần tử vào sau phần tử Rear. Giả sử dữ liệu đưa vào hàng đợi là NewData, mã giả được mô tả như sau:
B1: NewElement = Khởi tạo nút mới có thành phần NewData
B2: IF (NewElement == NULL)
Thực hiện BKT
B3: IF (SQList.Front == NULL) // hàng đợi dang rỗng
B3.1: SQList.Front = SQList.Rear = NewElement
B3.2: Thực hiện BKT
B4: …………………………………………..
B5: …………………………………………..
BKT: Kết thúc
Chọn câu đúng nhất cho bước B4, B5
A. B4: SQList.Front->Next = NewElement B5: SQList.Front = NewElement

B. B4: SQList.Rear->Next = NewElement B5: SQList.Rear = NewElement

C. B4: NewElement = SQList.Rear->Next B5: SQList.Rear = NewElement

D. B4: NewElement = SQList.Front->Next B5: SQList.Font = NewElement', N'B')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102036', N'CTKU102', N'Chọn định nghĩa đúng nhất về hàng đợi (Queue):
A. Hàng đợi còn được gọi là danh sách FILO và cấu trúc dữ liệu này còn được gọi cấu trúc FILO (First In Last Out)


B. Hàng đợi là một danh sách mà trong đó thao tác thêm 1 phần tử vào trong danh sách được thực hiện 1 đầu này và lấy 1 phần tử trong danh sách lại thực hiện bởi đầu kia

C. Hàng đợi là một danh sách mà trong đó thao tác thêm 1 phần tử hay hủy một phần tử trong danh sách được thực hiện 1 đầu

D. Hàng đợi phải là một danh sách liên kết đơn', N'B')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102037', N'CTKU102', N'Chọn định nghĩa đúng nhất đối với cây nhị phân tìm kiếm:
A. Cây nhị phân tìm kiếm là cây nhị phân có thành phần khóa của mọi nút lớn hơn thành phần khóa của tất cả các nút trong cây con trái của nó và nhỏ hơn thành phần khóa của tất cả các nút trong cây con phải của nó

B. Cây nhị phân tìm kiếm là cây nhị phân có thành phần khóa của mọi nút nhỏ hơn thành phần khóa của tất cả các nút trong cây con trái của nó và nhỏ hơn thành phần khóa của tất cả các nút trong cây con phải của nó

C. Cây nhị phân tìm kiếm là cây nhị phân có thành phần khóa của mọi nút lớn hơn thành phần khóa của tất cả các nút trong cây con trái của nó và lớn hơn thành phần khóa của tất cả các nút trong cây con phải của nó.

D. Cây nhị phân tìm kiếm chính là cây nhị phân', N'A')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102038', N'CTKU102', N'Chọn định nghĩa đúng nhất về cây cân bằng tương đối:
A. Cây cân bằng tương đối là một cây nhị phân thỏa mãn điều kiện là đối với mọi nút của cây thì số nút của cây con trái và số nút của cây con phải của nút đó hơn kém nhau không quá 1. Cây cân bằng tương đối còn được
gọi là cây AVL (AVL tree)

B. Cây cân bằng tương đối là một cây N phân thỏa mãn điều kiện là đối với mọi nút của cây thì chiều cao của cây con trái và chiều cao của cây con phải của nút đó hơn kém nhau không quá 2. Cây cân bằng tương đối còn
được gọi là cây AVL (AVL tree)

C. Cây cân bằng tương đối là một cây nhị phân thỏa mãn điều kiện là đối với mọi nút của cây thì chiều cao của cây con trái và chiều cao của cây con phải của nút đó hơn kém nhau không quá 1. Cây cân bằng tương đối còn
được gọi là cây AVL (AVL tree)

D. Cây cân bằng tương đối cũng là cây cân bằng hoàn toàn', N'C')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102039', N'CTKU102', N'Định nghĩa cấu trúc dữ liệu của danh sách liên kết đơn được mô tả như sau:
struct Node
{
int Key; Node *
NextNode;
} OneNode;
Trong đó, khai báo Node * NextNode; dùng để mô tả
A. Con trỏ trỏ tới phần dữ liệu

B. Vùng liên kết quản lý địa chỉ phần tử kế tiếp

C. Con trỏ trỏ tới phần dữ liệu cuối của danh sách

D. Vùng liên kết quản lý địa chỉ phần tử kế tiếp của phần tử cuối', N'B')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102040', N'CTKU102', N'Khi cần thêm một phần tử có giá trị thành phần dữ liệu là NewData (là một số nguyên) vào đầu của danh sách liên kết đơn dùng thuật toán có mã giả mô tả như dưới đây?
typedef struct Node
{
int Data; Node * NextNode;
} OneNode; typedef OneNode * SLLPointer;
SLLPointer SSList;
B1: NewNode = new OneNode
B2: IF (NewNode = NULL) Thực hiện BKT
B3: NewNode ->NextNode = NULL
B4: NewNode ->Data = NewData B5: NewNode->NextNode = SLList
B6: SLList = NewNode BKT: Kết thúc
Tìm mô tả chính xác cho B5
A. Chuyển vai trò đứng đầu của NewNode cho SLList

B. Nối NewNode vào sau SLList

C. Chuyển vai trò đứng đầu của SLList cho NewNode

D. Nối SLList vào sau NewNode', N'D')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102041', N'CTKU102', N'Tìm kiếm xem trong danh sách liên kết đơn có tồn tại nút có thành phần dữ liệu là SearchData hay không. Thao tác này chúng ta vận dụng thuật toán tìm tuyến tính để tìm kiếm:
typedef struct Node
{
int Data;
Node * Link;
} OneNode;''
typedef OneNode * Pointer;
Pointer SSList; // Quản lý danh sách liên kết đơn bởi 1 phần tử đầu
B1: CurNode = SLList
B2: IF (………………………………………………)
Thực hiện BKT
B3: CurNode = CurNode->Link
B4: Lặp lại B2
BKT: Kết thúc
Chọn điều kiện hợp lý cho mã giả ở B2
A. CurNode != NULL OR CurNode->Data = SearchData

B. CurNode = NULL OR CurNode->Data != SearchData

C. CurNode = NULL OR CurNode->Data = SearchData

D. CurNode != NULL OR CurNode->Data != SearchData', N'C')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102042', N'CTKU102', N'Cho cấu trúc dữ liệu như sau:
typedef struct Node
{
int Key;
Node *NextNode;
} OneNode;
typedef SLLOneNode * Type;
Thuật toán chọn trực tiếp viết trên ngôn ngữ C++ áp dụng cho danh sách liên kết đơn quản lý bởi một phần tử đầu tiên được mô tả:
void StraightSelection(Type &SList)
{
Type MinNode;
int Temp;
Type CurrNode,TempNode;
CurrNode = SList;
while (CurrNode!=NULL)
{
TempNode = CurrNode->NextNode;
MinNode = CurrNode;
while (TempNode!=NULL)
{
TempNode = CurrNode->NextNode;
MinNode = CurrNode;
while (TempNode!=NULL)
{
if (………………………………………………)
MinNode = TempNode;
TempNode = TempNode->NextNode;
}
[1] Temp = MinNode->Key;
[2] MinNode->Key = CurrNode->Key;
[3] CurrNode->Key = Temp CurrNode=CurrNode->NextNode;
}
}
Tìm mô tả chính xác cho [1], [2], [3]
A. Hoán vị 2 mối liên kết

B. Hoán vị 2 vùng giá trị

C. Hoán vị nút đầu và nút cuối

D. Hoán vị 2 nút kế tiếp nhau', N'B')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102043', N'CTKU102', N'Với cấu trúc dữ liệu như sau:
typedef struct DNode
{
int Key;
DNode * NextNode;
DNode * PreNode;
} DOneNode
typedef DLLOneNode * DPointerType;
typedef struct DPairNode
{ DPointerType DLLFirst;
DPointerType DLLLast;
} DPType;
Hàm thêm phần tử vào cuối danh sách liên kết đôi quản lý bởi 2 phần
tử đầu và cuối
DPointerType DLLAddLast(DPType &DList, int NewData)
{
DPointerType NewNode = gọi hàm tạo nút mới có vùng dữ liệu là
NewData ;
if (NewNode == NULL)
return (NULL);
if (DList.DLLLast == NULL)
DList.DLLFirst = DList.DLLLast = NewNode;
else
{
……………………………………………….
……………………………………………….
………………………………………………
}
return (NewNode);
} Hãy lựa chọn câu đúng nhất để điền vào chỗ trống ở trên
A. DList.DLLLast ->NextNode = NewNode; NewNode ->PreNode = DList.DLLLast; NewNode = DList.DLLLast;

B. DList.DLLLast ->NextNode = NewNode; DList.DLLLast = NewNode ->PreNode; DList.DLLLast = NewNode;

C. NewNode = DList.DLLLast ->NextNode; NewNode ->PreNode = DList.DLLLast; DList.DLLLast = NewNode;

D. DList.DLLLast ->NextNode = NewNode; NewNode ->PreNode = DList.DLLLast; DList.DLLLast = NewNode;', N'D')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102044', N'CTKU102', N'Với cấu trúc dữ liệu như sau:
typedef struct DNode
{
int Key;
DNode * NextNode;
DNode * PreNode;
} DOneNode;
typedef DOneNode * DPointerType;
typedef struct DLLPairNode
{ DPointerType DLLFirst;
DPointerType DLLLast;
} DLLPType;
Hàm duyệt qua các nút trong danh sách liên kết đôi quản lý bởi hai địa chỉ nút đầu tiên và nút cuối cùng thông qua DList để xem nội dung thành phần dữ liệu của mỗi nút
void DLLTravelling (DLLPType DList)
{
DPointerType CurrNode = DList.DLLFirst;
while (CurrNode != NULL) { cout <<
CurrNode->Key; …………………………………
}
return;
}
Chọn câu chính xác điền vào chỗ trống để mô tả việc di chuyển từ nút này sang nút khác
A. CurrNode = CurrNode ->NextNode ;

B. CurrNode = CurrNode ->Key ;

C. CurrNode ->NextNode = CurrNode;

D. CurrNode ->Key = CurrNode;', N'A')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102045', N'CTKU102', N'Với cấu trúc dữ liệu mô tả cho Stack:
typedef struct SElement
{
int Key;
SElement *Next;
} SOneElement;
typedef SOneElement *SSTACK;
Tìm mô tả chính xác cho hàm sau:
void SSDelete (SSTACK &SList)
{
while (SList != NULL)
{ SSTACK TempElement = SList;
SList = SList ->Next;
TempElement ->Next = NULL;
delete TempElement;
}
}
A. Hủy phần tử đầu của Stack

B. Hủy phần tử cuối của Stack

C. Hủy phần tử cuối của Stack và lấy giá trị đó in ra màn hình

D. Hủy toàn bộ Stack', N'D')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102046', N'CTKU102', N'Kết quả nào đúng khi thực hiện giải thuật sau:
long lt(int n)
{if (n==0) return 1;
else return (2*lt(n-1);
}
A. lt(12) = 2010

B. lt(12) = 1024

C. lt(7) = 720

D. lt(6) = 64', N'D')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102047', N'CTKU102', N'Kết quả nào đúng khi thực hiện giải thuật sau với a[]= {1, 3, 5}; n= 5, k= 3:
void ToHopKe(int a[], int n, int k)
{ int i, j, tmp = 0;
for (i=1;i<= k; i++)
if (a[i]!= n-k+i) {tmp= 1;break;}
if (tmp==0) return;
i= k;
while (a[i]>= n-k+i) i--;
a[i]=a[i] + 1;
for (j=i+1;j<=k;j++) a[j]=a[i] + j - i;
for (i= 1; i<= n; i++) printf("%d ", a[i]);
}
A. 2 3 4

B. 1 2 3

C. 2 3 5

D. 1 4 5', N'D')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102048', N'CTKU102', N'Kết quả nào đúng khi thực hiện giải thuật sau với a[]= {-3, -3, 15, -3}; n= 4; x= -3:
int FindX(int a[], int n, int x)
{int i;
for (i= n; i>= 1; i--) if (a[i]==x) return (i);
return (-1);
}
A. 1

B. 2

C. 3

D. 4', N'D')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102049', N'CTKU102', N'Dấu hiệu nào dưới đây cho biết danh sách liên kết đơn L là rỗng:
A. (L->left == NULL)

B. (L->ìnfor == NULL)

C. (L->next == NULL)

D. (L == NULL)', N'D')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102050', N'CTKU102', N'Kết quả nào đúng khi thực hiện giải thuật sau với a[]= {1, 3, 5, 4, 2}; n= 5:
void HoanViKe(int a[],int n)
{int i, k, r, s, tmp = 0;
for(i=1;i<=n;i++) if(a[i]!=n-i+1)
{tmp=1;break;}
if(tmp==0) return;
i= n-1;
while(a[i]>a[i+1]) i= i - 1;
k= n;
while(a[k]< a[i]) k= k - 1;
tmp= a[i]; a[i]= a[k]; a[k]=t mp;
r=i+1; s= n;
while(r<s)
{tmp = a[r]; a[r]= a[s]; a[s]= tmp; r++; s--; } for(i= 1; i<= n; i++) printf("%d ", a[i]);
}
A. 1 4 2 3 5

B. 5 4 3 2 1

C. 1 4 5 3 2

D. 1 3 4 2 5', N'A')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102051', N'CTKU102', N'Thao tác nào dưới đây thực hiện trên hàng đợi (queue):
A. Thêm phần tử vào lối sau

B. Loại bỏ phần tử ở lối sau

C. Thêm phần tử vào lối trước

D. Thêm và loại bỏ phần tử tại vị trí bất kỳ', N'A')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102052', N'CTKU102', N'Dấu hiệu nào dưới đây cho biết hàng đợi đã có thao tác thêm và loại bỏ phần tử là rỗng:
A. Lối trước có giá trị > giá trị của lối sau

B. Lối sau nhận giá trị = 0

C. Lối trước có giá trị < giá trị của lối sau

D. Lối trước nhận giá trị = 0', N'A')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102053', N'CTKU102', N'Thao tác nào dưới đây thực hiện trên ngăn xếp (stack):
A. Thêm phần tử vào vị trí bất kỳ

B. Loại bỏ phần tử tại vị trí bất kỳ

C. Thêm và loại bỏ phần tử luôn thực hiện tại vị trí đỉnh (top)

D. Thêm và loại bỏ phần tử có thể thực hiện tại vị trí bất kỳ', N'C')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102054', N'CTKU102', N'Trong phép duyệt cây nhị phân có 24 nút theo thứ tự sau, nút gốc có thứ tự:
A. Thứ 1

B. Thứ 2

C. Thứ 23

D. Thứ 24', N'D')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102055', N'CTKU102', N'Nút có khóa nhỏ nhất trong cây nhị phân tìm kiếm khác rỗng là:
A. Nút gốc

B. Tất cả các nút

C. Nút con bên phải nhất

D. Nút con bên trái nhất', N'D')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102056', N'CTKU102', N'Cây nhị phân khác rỗng là cây:
A. Mỗi nút (trừ nút lá) đều có hai nút con

B. Tất cả các nút đều có nút con

C. Mỗi nút có không quá 2 nút con

D. Tất cả các nút đều có nút cha', N'C')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102057', N'CTKU102', N'Đồ thị G có n đỉnh và m cạnh với m, n thì ma trận kề của G luôn có dạng:
A. là ma trận vuông cấp n

B. là ma trận cấp nxm

C. là ma trận vuông cấp m

D. là ma trận cấp mxn', N'A')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102058', N'CTKU102', N'Đồ thị vô hướng G có chu trình Euler khi và chỉ khi:
A. G liên thông và mọi đỉnh G có bậc chẵn

B. mọi đỉnh G có bậc chẵn

C. G có chu trình Hamilton

D. G có đường đi Euler', N'C')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102059', N'CTKU102', N'Nhân tố nào là nhân tố chính ảnh hưởng đến thời gian tính của một giải thuật:
A. Máy tính

B. Thuật toán được sử dụng

C. Chương trình dịch

D. Kích thước của dữ liệu đầu vào của thuật toán', N'D')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102060', N'CTKU102', N'Chọn phát biểu đúng trong các phát biểu dưới đây: bằng cách chạy thử 1 thuật toán với 1 bộ dữ liệu, ta có thể:
A. Khẳng định thuật toán đúng nếu nó cho kết quả đúng

B. Khẳng định thuật toán sai nếu cho kết quả sai

C. Khẳng định thuật toán tốt nếu cho kết quả nhanh

D. Khẳng định thuật toán hiệu quả nếu cho kết quả đúng', N'B')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102061', N'CTKU102', N'Trong các mệnh đề sau đây, mệnh đề nào sai:
A. Kiểu dữ liệu là một tập hợp nào đó các phần tử dữ liệu cùng chung một thuộc tính

B. kiểu của một ngôn ngữ bao gồm các kiểu dữ liệu đơn và các phương pháp cho phép ta từ các kiểu dữ liệu đã có xây dựng nên các kiểu dữ liệu mới

C. Cấu trúc dữ liệu là các dữ liệu phức tạp, được xây dựng nên từ các kiểu dữ liệu đã có, đơn giản hơn bằng các phương pháp liên kết nào đó

D. Một trong ba mệnh đề trên là sai', N'D')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102062', N'CTKU102', N'Tìm mệnh đề sai trong các mệnh đề sau: Một cấu trúc dữ liệu bao gồm…
A. Một tập hợp nào đó các dữ liệu thành phần
B. Các dữ liệu thành phần đặt sát nhau trong bộ nhớ', N'B')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102063', N'CTKU102', N'Cho danh sách đặc có 10 phần tử. Khi thêm phần tử vào vị trí 4 trong danh sách, vòng lặp dịch chuyển tịnh tiến nội dung các phần tử L->Elements[i]=L->Elements[i+1] sẽ thực hiện:

A. 4 lần

B. 5 lần

C. 6 lần

D. Tất cả đều sai', N'A')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102064', N'CTKU102', N'Cho danh sách đặc có 10 phần tử. Khi xóa phần tử ở vị trí 4 trong danh sách, vòng lặp dịch chuyển tịnh tiến nội dung các phần tử L->Elements[i]=L->Elements[i+1] :
A. 4 lần

B. 5 lần

C. 6 lần', N'C')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102065', N'CTKU102', N'Cho biểu thức a+b*((c-d)*e+f/h). Danh sách duyệt tiền tự của biểu thức
đã cho là:
A. + * a b + * - c d e / f h

B. + a * b + * - c d e / f h

C. + a b * * e - c d + / f h

D. + * a + b – c d * e / f h', N'B')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102066', N'CTKU102', N'Danh sách duyệt hậu tự của biểu thức trong câu 3 là:
A. a c d - * e b * + f h / +

B. a b c d - e * + f h / * +

C. a b c d - e * f h / + * +

D. a b e c d * - f h / + * +', N'C')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102067', N'CTKU102', N'Danh sách duyệt theo mức của biểu thức đã cho trong câu 3 là:
A. + a * b + * / - e f h c d

B. a b + * + / - c d e f h *

C. + * a + b – c d * e / f h

D. + * a b + * - c d e / f h', N'A')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102068', N'CTKU102', N'Trong các phát biểu sau, phát biểu nào đúng?
A. Giá trị hàm EndList(L) và hàm FirstList(L) luôn luôn bằng nhau khi danh sách rỗng

B. Giá trị hàm EndList(L) và hàm FirstList(L) luôn luôn khác nhau

C. Giá trị hàm EndList(L) và hàm FirstList(L) bằng nhau hay không tùythuộc vào phương pháp cài đặt danh sách

D. Tất cả đều sai', N'A')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102069', N'CTKU102', N'Giải thuật là … câu lệnh chặt chẽ, rõ ràng và xác định một trình tự các thao tác trên các đối tượng dữ liệu
A. một

B. hai

C. dãy', N'C')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102070', N'CTKU102', N'Sau một số … bước thực hiện giải thuật cho chúng ta đạt được kết quả mong muốn:
A. vô hạn

B. giới hạn

C. hữu hạn

D. thao tác', N'C')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102071', N'CTKU102', N'Đánh giá độ phức tạp của giải thuật là việc xác định … và … mà giải thuật cần để thực hiện giải một bài toán:
A. Khoảng thời gian, độ khó

B. Khoảng thời gian, độ khó

C. Khoảng thời gian, dung lượng bộ nhớ máy tính

D. Độ khó, dung lượng bộ nhớ máy tính', N'C')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102072', N'CTKU102', N'Các kiểu dữ liệu cơ bản là:
A. các kiểu dữ liệu mà người lập trình được cung cấp sẵn từ máy tính

B. các kiểu dữ liệu mà người lập trình được cung cấp sẵn từ ngôn ngữ tự nhiên

C. các kiểu dữ liệu mà người lập trình được cung cấp sẵn từ ngôn ngữ lập trình

D. các kiểu dữ liệu mà người lập trình được cung cấp sẵn từ ngôn ngữ máy', N'C')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102073', N'CTKU102', N'Chỉ ra kiểu dữ liệu cơ bản:
A. Sinh viên

B. Float

C. Họtên

D. Ngày sinh', N'B')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102074', N'CTKU102', N'Chỉ ra kiểu dữ liệu không cơ bản:
A. Char

B. int

C. long

D. struct', N'D')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102075', N'CTKU102', N'Kiểu dữ liệu trừu tượng là …
A. Kiểu dữ liệu mà người lập trình phải tự xây dựng không dựa trên các kiểu dữ liệu cơ bản được cung cấp từ ngôn ngữ lập trình

B. Kiểu dữ liệu mà người lập trình phải tự xây dựng dựa trên các kiểu dữ liệu không cơ bản được cung cấp từ ngôn ngữ lập trình

C. Kiểu dữ liệu mà người lập trình phải tự xây dựng dựa trên các kiểu dữ liệu cơ bản được cung cấp từ ngôn ngữ máy

D. Kiểu dữ liệu mà người lập trình phải tự xây dựng dựa trên các kiểu dữ liệu cơ bản được cung cấp từ ngôn ngữ lập trình', N'D')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102076', N'CTKU102', N'Chỉ ra kiểu dữ liệu trừu tượng:
A. float

B. int

C. char

D. mảng 1 chiều', N'D')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102077', N'CTKU102', N'Cấu trúc dữ liệu là …
A. cách lưu trữ dữ liệu trong bộ nhớ máy tính (ROM), sao cho nó có thể được sử dụng một cách hiệu quả

B. cách lưu trữ dữ liệu trong bộ nhớ máy tính (HDD), sao cho nó có thể được sử dụng một cách hiệu quả

C. cách lưu trữ dữ liệu trong bộ nhớ máy tính (USB), sao cho nó có thể được sử dụng một cách hiệu quả

D. cách lưu trữ dữ liệu trong bộ nhớ máy tính (RAM), sao cho nó có thể được sử dụng một cách hiệu quả', N'D')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102078', N'CTKU102', N'Mối quan hệ giữa cấu trúc dữ liệu và giải thuật có thể minh hoạ bằng đẳng thức:
A. Chương trình = Cấu trúc dữ liệu

B. Giải thuật + Chương trình = Cấu trúc dữ liệu

C. Cấu trúc dữ liệu + Chương trình = Giải thuật

D. Cấu trúc dữ liệu + Giải thuật = Chương trình', N'D')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102079', N'CTKU102', N'Phát biểu sau đúng hay sai: khi nói tới dữ liệu thì cũng phải xem xét dữ liệu đó cần được thực hiện bằng giải thuật gì để đạt được kết quả mong muốn?
A. Đúng

B. Sai', N'A')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102080', N'CTKU102', N'Phát biểu sau đúng hay sai: Khi nói tới giải thuật phải xem xét nó sẽ tác động trên dữ liệu nào?
A. Đúng

B.Sai', N'A')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102081', N'CTKU102', N'Phát biểu sau đúng hay sai: Giải thuật thể hiện hành động của các bước để giải bài toán?
A. Đúng

B. Sai', N'A')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102082', N'CTKU102', N'Phát biểu sau đúng hay sai: Dữ liệu là đối tượng được xử lý , nó biểu diễn các thông tin cần thiết cho bài toán: dữ liệu vào, dữ liệu ra?
A. Đúng

B.Sai', N'A')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102083', N'CTKU102', N'Chỉ ra khái niệm có tính chất đệ quy?
A. khái niệm tính giai thừa của n (n!)

B. khái niệm hình ảnh

C. khái niệm âm thanh', N'A')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102084', N'CTKU102', N'Cho bài toán: cho trước n là một số tự nhiên, tính n!. Chỉ ra trường hợp suy biến
A. với n = 0

B. với n = 1

C. với n =0 hoặc n = 1', N'C')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102085', N'CTKU102', N'Hãy chọn định nghĩa đúng nhất về danh sách kiểu hàng đợi (Queue)?
A. Hàng đợi là kiểu danh sách tuyến tính trong đó, phép bổ sung một phần tử được thực hiện ở một đầu, gọi là lối sau (rear) hay lối trước (front). Phép loại bỏ không thực hiện được

B. Hàng đợi là kiểu danh sách tuyến tính trong đó, phép bổ sung một phần tử hay loại bỏ được thực hiện ở một đầu danh sách gọi là đỉnh (Top)

C. Hàng đợi là một danh sách tuyến tính trong đó phép bổ sung một phần tử và phép loại bỏ một phần tử được thực hiện ở tại một vị trí bất kì trong danh sách

D. Hàng đợi là kiểu danh sách tuyến tính trong đó, phép bổ sung phần tử ở một đầu, gọi là lối sau (rear) và phép loại bỏ phần tử được thực hiện ở đầu kia, gọi là lối trước (front)', N'D')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102086', N'CTKU102', N'Trong bốn kiểu ký hiệu sau đây, ký hiệu nào biểu thị cho danh sách kiểu hàng đợi?
A. FIFO

B. LIFO

C. FILO

D. LOLO', N'A')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102087', N'CTKU102', N'Để thêm một đối tượng x bất kỳ vào Stack, ta dùng hàm nào sau đây?
A. TOP(x)

B. EMPTY(x)

C. PUSH(x)

D. POP(x)', N'C')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102088', N'CTKU102', N'Để loại bỏ một đối tượng ra khỏi Stack, ta dùng hàm nào sau đây?
A. FULL(x)

B. POP(x)

C. EMPTY(x)

D. PUSH(x)', N'B')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102089', N'CTKU102', N'Trong lưu trữ dữ liệu kiểu Queue (Q) dưới dạng mảng nối vòng, giả sử F là con trỏ trỏ tới lối trước của Q, R là con trỏ trỏ tới lối sau của Q. Điều kiện F=R=0 nghĩa là gì trong các phương án sau?
A. Queue tràn

B. Queue rỗng

C. Kiểm tra chỉ số trước và chỉ số sau của Queue có bằng nhau hay không

D. Đặt phần tử đầu và phần tử cuối của Queue bằng 0', N'B')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102090', N'CTKU102', N'Trong lưu trữ dữ liệu kiểu Queue (Q), giả sử F là con trỏ trỏ tới lối trước của Q, R là con trỏ trỏ tới lối sau của Q. Khi thêm một phần tử vào Queue, thì R và F thay đổi thế nào trong các phương án sau?
A. F không thay đổi, R=R+1

B. F=F+1, R không thay đổi

C. F không thay đổi, R=R-1

D. F=F-1, R không thay đổi\', N'A')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102091', N'CTKU102', N'Trong lưu trữ dữ liệu kiểu Queue (Q), giả sử F là con trỏ trỏ tới lối trước của Q, R là con trỏ trỏ tới lối sau của Q. Khi loại bỏ một phần tử vào Queue, thì R và F thay đổi thế nào trong các phương án sau?
A. F=F+1, R không thay đổi

B. F không thay đổi, R=R+1

C. F không thay đổi, R=R-1

D. F=F-1, R không thay đổi', N'A')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102092', N'CTKU102', N'Cho cây nhị phân: A, B, C, D, E, F, G, H, I, J, K, L, M, N. Cây con trái của
cây B bao gồm những phần tử nào trong các phương án sau?
A. E, J, K

B. C, D

C. C, D, E

D. D, H, I', N'D')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102093', N'CTKU102', N'Cho cây nhị phân: A, B, C, D, E, F, G, H, I, J, K, L, M, N. Cây con trái của cây C bao gồm những phần tử nào trong các phương án sau?
A. E, F, G

B. F, L, M

C. E, F

D. A, B', N'B')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102094', N'CTKU102', N'Cho cây nhị phân: A, B, C, D, E, F, G, H, I, J, K, L, M, N. Cây con phải của cây C bao gồm những phần tử nào trong các lựa chọn sau?
A. D, E

B. F, G, L

C. D, E, F

D. G, N', N'D')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102095', N'CTKU102', N'Cho cây nhị phân: A, B, C, D, E, F, G, H, I, J, K, L, M, N. Cây con phải của cây B bao gồm những phần tử nào trong các lựa chọn sau?
A. E,K

B. C, D

C. E, J, K

D. D, E, H', N'C')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102096', N'CTKU102', N'Hãy cho biết quy tắc đúng của phép duyệt cây theo thứ tự trước trong các phương án sau?
A. Duyệt cây con trái theo thứ tự trước; Duyệt cây con phải theo thứ tự trước; Duyệt gốc

B. Duyệt gốc; Duyệt cây con trái theo thứ tự trước; Duyệt cây con phải theo thứ tự trước

C. Duyệt gốc, cây trái, cây phải đồng thời theo thứ tự trước

D. Duyệt cây con trái theo thứ tự trước; Duyệt gốc; Duyệt cây con phảitheo thứ tự trước', N'B')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102097', N'CTKU102', N'Hãy cho biết quy tắc đúng của phép duyệt cây theo thứ tự giữa trong các phương án sau?
A. Duyệt gốc, cây trái, cây phải đồng thời theo thứ tự giữa

B. Duyệt gốc; Duyệt cây con trái theo thứ tự giữa; Duyệt cây con phải theo thứ tự giữa

C. Duyệt cây con trái theo thứ tự giữa; Duyệt cây con phải theo thứ tự giữa; Duyệt gốc

D. Duyệt cây con trái theo thứ tự giữa; Duyệt gốc; Duyệt cây con phải theo thứ tự giữa', N'D')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102098', N'CTKU102', N'Hãy cho biết quy tắc đúng của phép duyệt cây theo thứ tự sau trong các phương án sau?
A. Duyệt cây con trái theo thứ tự sau; Duyệt gốc; Duyệt cây con phải theo thứ tự sau

B. Duyệt gốc, cây trái, cây phải đồng thời theo thứ tự sau

C. Duyệt cây con trái theo thứ tự sau; Duyệt cây con phải theo thứ tự sau; Duyệt gốc

D. Duyệt gốc; Duyệt cây con trái theo thứ tự sau; Duyệt cây con phải theo thứ tự sau', N'C')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102099', N'CTKU102', N'Yếu tố nào sau đây để xây dựng nên một chương trình hoàn chỉnh?
A. Dữ liệu tốt, giải thuật đơn giản

B. Giải thuật có thời gian thực hiện nhanh nhất

C. Cấu trúc dữ liệu thích hợp, giải thuật xử lý hiệu quả

D. Cấu trúc dữ liệu tốt', N'C')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'CTKU102100', N'CTKU102', N'Theo các phương án dưới đây, kích thước lưu trữ kiểu số nguyên (Integer) bao nhiêu byte?
A. 1 byte

B. 2 byte

C. 4 byte

D. 6 byte', N'B')
GO
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'NNTA103001', N'NNTA103', N'"I have never been to Russia. I think I shall go there next year.” said Bill.
A. Bill said that he had never been to Russia and he thought he would go there the next year.

B. Bill said that he would have never been to Russia and he thinks he would go there the next year.

C. Bill said that he had never been to Russia and he thinks he will go there the next year.

D. Bill said that he has never been to Russia and he thinks he would go there the next year.', N'A')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'NNTA103002', N'NNTA103', N'The substance is very toxic. Protective clothing must be worn at all times.

A. Since the substance is very toxic, so protective clothing must be worn at all times.

B. So toxic is the substance that protective clothing must be worn at all times.

C. The substance is such toxic that protective clothing must be worn at all times.

D. The substance is too toxic to wear protective clothing at all times.', N'B')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'NNTA103003', N'NNTA103', N'Tìm lỗi sai trong câu sau:
Developing new technologies are time-consuming and expensive.
A. developing      
B. technologies      
C. are      
D. time-consuming', N'C')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'NNTA103004', N'NNTA103', N'Tìm lỗi sai trong câu sau:
The assumption that smoking has bad effects on our health have been proved.
A. that      
B. effects      
C. on      
D. have been proved', N'D')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'NNTA103005', N'NNTA103', N'Tìm lỗi sai trong câu sau:
A novel is a story long enough to fill a complete book, in that the characters and events are usually imaginary.
A. long enough      
B. complete     
C. that     
D. imaginary', N'C')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'NNTA103006', N'NNTA103', N'Tìm lỗi sai trong câu sau:
The leader demanded from his members a serious attitude towards work, good team spirit, and that they work hard.
A. leader      
B. his members  
C. attitude     
D. that they work hard', N'D')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'NNTA103007', N'NNTA103', N'Tìm lỗi sai trong câu sau:
The earth is the only planet with a large number of oxygen in its atmosphere.
A. the     
B. number     
C. oxygen     
D. its', N'B')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'NNTA103008', N'NNTA103', N'Tìm lỗi sai trong câu sau:
Not until he got home he realized he had forgotten to give her the present.
A. got     
B. he realized     
C. her     
D. the present', N'B')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'NNTA103009', N'NNTA103', N'Tìm lỗi sai trong câu sau:
If one type of manufacturing expands, it is like that another type will shrink considerably.
A. expands     
B. like     
C. another     
D. considerably', N'B')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'NNTA103010', N'NNTA103', N'Tìm lỗi sai trong câu sau:
For thousands of years, man has created sweet-smelling substances from wood, herbs and flowers and using them for perfumes or medicine.
A. man     
B. sweet-smelling     
C. using them     
D. or', N'C')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'NNTA103011', N'NNTA103', N'Tìm lỗi sai trong câu sau:
People in every part of the world readily and easily communicates by means of electronic mail.
A. every part     
B. readlily     
C. communicates     
D. by means', N'C')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'NNTA103012', N'NNTA103', N'Tìm lỗi sai trong câu sau:
The grass needs cutting, so let us have one of the men to take lawn-mower and do it.
A. needs     
B. cutting     
C. let     
D. to take', N'D')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'NNTA103013', N'NNTA103', N'Tìm lỗi sai trong câu sau:
What we know about certain diseases are still not sufficient to prevent them from spreading easily among the population.
A. What we know     
B. are     
C. from spreading     
D. among', N'B')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'NNTA103014', N'NNTA103', N'Tìm lỗi sai trong câu sau:
By the time Robert will finish writing the first draft of his paper, most of the other students will have completed their final draft
A. will finish     
B. writing     
C. most     
D. their', N'A')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'NNTA103015', N'NNTA103', N'Tìm lỗi sai trong câu sau:
Each of the beautiful cars in the shop was quickly sold to their owner
A. Each     
B. cars     
C. quickly     
D. their', N'D')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'NNTA103016', N'NNTA103', N'Tìm lỗi sai trong câu sau:
United States is aimed at develop friendly relations among nations based on respect for the principle of equal rights and self-determination of people.
A. develop 
B. based 
C. principle 
D. people', N'A')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'NNTA103017', N'NNTA103', N'Tìm lỗi sai trong câu sau:
After spending two days arguing about where to go for their holidays, is was decided that they shouldn’t go anywhere.
A. arguing     
B. for     
C. is was decided     
D. shouldn’t go', N'C')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'NNTA103018', N'NNTA103', N'Tìm lỗi sai trong câu sau:
Regarding as one of the leading figures in the development of the short story, O Henry is the author of many well- known American novels.
A. Regarding as     
B. leading figures     
C. the     
D. novels', N'A')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'NNTA103019', N'NNTA103', N'Tìm lỗi sai trong câu sau:
If you work hard, you would be successful in anything you do.
A. you work     
B. would be     
C. in     
D. anything', N'B')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'NNTA103020', N'NNTA103', N'Tìm lỗi sai trong câu sau:
Mrs. Loan, along with her talented students, are going to be on the summer camp to USA.
A. along with     
B. talented     
C. are going     
D. summer', N'C')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'NNTA103021', N'NNTA103', N'Tìm lỗi sai trong câu sau:
Most bothersome flies belong to the family Sarcophagidae and are popular known as flesh flies because the larvae feed on flesh.
A. belong to     
B. popular known     
C. because     
D. feed on', N'B')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'NNTA103022', N'NNTA103', N'Tìm lỗi sai trong câu sau:
It is important that cancer is diagnosed and treated as early as possible in order to assure a successful cure.
A. is diagnosed     
B. treated
C. as early as possible     
D. to assure', N'A')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'NNTA103023', N'NNTA103', N'Tìm lỗi sai trong câu sau:
Had it not been for you help me, I wouldn''t have succeeded.
A. not     
B. you help me     
C. wouldn’t     
D. succeeded', N'B')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'NNTA103024', N'NNTA103', N'Tìm lỗi sai trong câu sau:
I enjoyed talking to the people with that I met at the party last night.
A. talking    
B. the     
C. with that     
D. at the party', N'C')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'NNTA103025', N'NNTA103', N'Tìm lỗi sai trong câu sau:
It is vitally important that she takes this medication night and morning.
A. vitally     
B. that     
C. takes     
D. medication', N'C')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'NNTA103026', N'NNTA103', N'Tìm lỗi sai trong câu sau:
Society uses such human emotions as proud, shame, guilt, and fear to maintain itself.
A. such human     
B. proud     
C. guilt     
D. itself', N'B')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'NNTA103027', N'NNTA103', N'Tìm lỗi sai trong câu sau:
The number of women earning Master''s Degrees have risen sharply in recent years.
A. number     
B. earning     
C. have risen     
D. recent years', N'C')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'NNTA103028', N'NNTA103', N'Tìm lỗi sai trong câu sau:
Some species of bats are dormant each days and active every night.
A. species of     
B. each days
C. every night     
D. are dormant', N'B')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'NNTA103029', N'NNTA103', N'Tìm lỗi sai trong câu sau:
After the police had tried unsuccessfully to determine to who the car belonged, they towed it to the station.
A. the police     
B. unsuccessfully     
C. who     
D. it to', N'C')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'NNTA103030', N'NNTA103', N'Tìm lỗi sai trong câu sau:
Those who had already purchased tickets were instructed to go to gate first immediately.
A. Those 
B. had already purchased
C. gate first     
D. immediately', N'C')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'NNTA103031', N'NNTA103', N'Tìm lỗi sai trong câu sau:
For thousands of years, man has created sweet-smelling substances from wood, herbs and flowers and using them for perfumes or medicine.
A. man     
B. sweet-smelling     
C. using them     
D. or', N'C')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'NNTA103032', N'NNTA103', N'Tìm lỗi sai trong câu sau:
There are many different ways of comparing the culture of one nation with those of another.
A. There are     
B. of comparing     
C. those     
D. another', N'C')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'NNTA103033', N'NNTA103', N'Tìm lỗi sai trong câu sau:
She only had a twenty-dollars bill with her when she landed at Healthrow airport.
A. had     
B. twenty-dollars bill     
C. when     
D. at', N'B')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'NNTA103034', N'NNTA103', N'Tìm lỗi sai trong câu sau:
I was very busy lately since the project of designing the new collection started.
A. was     
B. since
C. the project    
D. the new collection', N'A')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'NNTA103035', N'NNTA103', N'Tìm lỗi sai trong câu sau:
Sometimes it takes me about three hours finishing my round.
A. sometimes     
B. me     
C. hours     
D. finishing', N'D')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'NNTA103036', N'NNTA103', N'Tìm lỗi sai trong câu sau:
Little have people done to alleviate the sea pollution caused by the factories in central Vietnam, haven’t they?
A. have people done     
B. caused
C. in central     
D. haven’t they', N'D')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'NNTA103037', N'NNTA103', N'Tìm lỗi sai trong câu sau:
I can’t find the letter I received from my boss some days ago. I might throw it into the waste paper bin yesterday.
A. received     
B. can’t find
C. into the     
D. might throw', N'D')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'NNTA103038', N'NNTA103', N'Tìm lỗi sai trong câu sau:
Unlike the old one, this new copier can perform their functions in half the time.
A. unlike     
B. can perform
C. their functions     
D. in half the time', N'C')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'NNTA103039', N'NNTA103', N'Tìm lỗi sai trong câu sau:
Building thousands of years ago, the ancient palace is popular with modern tourists.
A. building     
B. ago     
C. the ancient     
D. popular with', N'A')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'NNTA103040', N'NNTA103', N'Tìm lỗi sai trong câu sau:
It is the recommendation of many psychologists that a learner ought to use mental images to associate word and remember them.
A. recommendation     
B. ought to use
C. to associate word     
D. remember them', N'B')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'NNTA103041', N'NNTA103', N'Tìm lỗi sai trong câu sau:
You shouldn’t criticize him in front of his friends. It was insensitive of you.
A. shouldn’t criticize     
B. him in front of
C. it      
D. insensitive', N'A')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'NNTA103042', N'NNTA103', N'Tìm lỗi sai trong câu sau:
Higher education in the United States specifically refers to post -secondary institutions, that offer associate degrees, master degrees or Ph.d. degrees or equivalents.
A. specifically refers      
B. institutions      
C. that      
D. or equivalents', N'C')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'NNTA103043', N'NNTA103', N'Tìm lỗi sai trong câu sau:
I’m not used to go to school late. I prefer punctuation.
A. I’m not used to     
B. go
C. late     
D. prefer', N'B')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'NNTA103044', N'NNTA103', N'Tìm lỗi sai trong câu sau:
Despite the long history of the rights of property ownership, there have been a great deal of disagreement over what such rights entail.
A. what such rights entail     
B. have been
C. Despite      
D. a great deal of', N'B')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'NNTA103045', N'NNTA103', N'Tìm lỗi sai trong câu sau:
Paris is much more exciting as I expected.
A. much      
B. exciting      
C. as      
D. expected', N'A')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'NNTA103046', N'NNTA103', N'Tìm lỗi sai trong câu sau:
English is speaking in many countries in the world.
A. English      
B. speaking      
C. many countries     
D. the world', N'B')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'NNTA103047', N'NNTA103', N'Tìm lỗi sai trong câu sau:
Chemical engineering is based in the principles of physics, chemistry, and mathematics.
A. in      
B. principles      
C. chemistry      
D. mathematics', N'A')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'NNTA103048', N'NNTA103', N'Tìm lỗi sai trong câu sau:
He is the second person be killed in that way.
A. is      
B. the      
C. be killed      
D. way', N'C')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'NNTA103049', N'NNTA103', N'Tìm lỗi sai trong câu sau:
For the first time in the history of the country, the person who recommended by the president to replace a retired justice on the Supreme Court is a woman.
A. is      
B. a retired justice
C. to replace      
D. who recommended', N'D')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'NNTA103050', N'NNTA103', N'Tìm lỗi sai trong câu sau:
The most sensitive way to resolve a family problem is by open discussion.
A. the      
B. sensitive      
C. by      
D. open', N'D')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'NNTA103051', N'NNTA103', N'Tìm lỗi sai trong câu sau:
Dogs that are trained to lead the blind must be loyalty, intelligent and calm.
A. dogs that     
B. trained      
C. the      
D. loyalty', N'D')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'NNTA103052', N'NNTA103', N'Tìm lỗi sai trong câu sau:
The shopkeeper warned the boys don''t learn their bicycles against his windows.
A. the      
B. don’t      
C. their     
D. against', N'B')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'NNTA103053', N'NNTA103', N'Tìm lỗi sai trong câu sau:
The telephone rang several times and then stop before I could answer it.
A. times      
B. then      
C. stop      
D. could', N'C')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'NNTA103054', N'NNTA103', N'Tìm lỗi sai trong câu sau:
The teacher asked him why hadn’t he done his homework, but he said nothing.
A. why      
B. hadn’t he done
C. but     
 D. said nothing', N'B')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'NNTA103055', N'NNTA103', N'Tìm lỗi sai trong câu sau:
A dangerously situation was created by the bad roads.
A. dangerously      
B. was      
C. created      
D. bad roads', N'A')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'NNTA103056', N'NNTA103', N'Tìm lỗi sai trong câu sau:
In most countries music songs are deeply personal and deal with themes of love, lonely, and separation.
A. most countries      
B. deeply     
C. deal with      
D. lonely', N'D')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'NNTA103057', N'NNTA103', N'Tìm lỗi sai trong câu sau:
One of the best ways to encourage your children to read are to provide interesting titles for them to enjoy.
A. the best      
B. to read     
C. are      
D. for', N'C')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'NNTA103058', N'NNTA103', N'Tìm lỗi sai trong câu sau:
Had I been interested in that subject, I would try to learn more about it.
A. in      
B. try to learn      
C. Had      
D. about', N'B')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'NNTA103059', N'NNTA103', N'Tìm lỗi sai trong câu sau:
The two children tried as hardly as they could to bring about a reconciliation between their parents.
A. children      
B. hardly     
C. between      
D. to bring about', N'B')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'NNTA103060', N'NNTA103', N'Tìm lỗi sai trong câu sau:
Education, whether it happens at school or anywhere else, is a important part in our life.
A. Education      
B. whether      
C. or      
D. a important part', N'D')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'NNTA103061', N'NNTA103', N'Tìm lỗi sai trong câu sau:
The two children tried as hardly as they could to bring about a reconciliation between their parents.
A. children      
B. hardly     
C. between      
D. to bring about', N'B')
INSERT [dbo].[CAUHOI] ([MaCH], [MaHP], [NoiDung], [DapAn]) VALUES (N'NNTA103062', N'NNTA103', N'Tìm lỗi sai trong câu sau:
Education, whether it happens at school or anywhere else, is a important part in our life.
A. Education      
B. whether      
C. or      
D. a important part', N'D')
GO
INSERT [dbo].[GIANGVIEN] ([MaGV], [HoDem], [Ten], [MatKhau], [Khoa], [VaiTro]) VALUES (N'admin', N'', N'', N'admin', N'', 1)
INSERT [dbo].[GIANGVIEN] ([MaGV], [HoDem], [Ten], [MatKhau], [Khoa], [VaiTro]) VALUES (N'GV01', N'Trần Minh', N'Thắng', N'tmt@hunre', N'Công nghệ thông tin', 1)
INSERT [dbo].[GIANGVIEN] ([MaGV], [HoDem], [Ten], [MatKhau], [Khoa], [VaiTro]) VALUES (N'GV02', N'Vũ Ngọc', N'Phan', N'vnp@hunre', N'Công nghệ thông tin', 1)
GO
INSERT [dbo].[KETQUA] ([MaSV], [MaHP], [TenHP], [SoCau], [TGLamBai], [NgayThi], [GioThi], [Diem], [LanThi], [TGNopBai]) VALUES (N'21111063239 ', N'NNTA103', N'Tiếng anh 3', 25, 45, CAST(N'2024-05-15' AS Date), CAST(N'01:30:00' AS Time), 2.8, 1, CAST(N'2024-05-15T02:28:55.093' AS DateTime))
INSERT [dbo].[KETQUA] ([MaSV], [MaHP], [TenHP], [SoCau], [TGLamBai], [NgayThi], [GioThi], [Diem], [LanThi], [TGNopBai]) VALUES (N'21111063120 ', N'NNTA103', N'Tiếng anh 3', 25, 45, CAST(N'2024-05-17' AS Date), CAST(N'01:30:00' AS Time), 3.6, 1, CAST(N'2024-05-17T15:45:18.020' AS DateTime))
INSERT [dbo].[KETQUA] ([MaSV], [MaHP], [TenHP], [SoCau], [TGLamBai], [NgayThi], [GioThi], [Diem], [LanThi], [TGNopBai]) VALUES (N'21111063239 ', N'CTKM107', N'Kiến trúc máy tính', 30, 45, CAST(N'2024-05-15' AS Date), CAST(N'02:30:00' AS Time), 1.33, 1, CAST(N'2024-05-15T02:31:22.653' AS DateTime))
INSERT [dbo].[KETQUA] ([MaSV], [MaHP], [TenHP], [SoCau], [TGLamBai], [NgayThi], [GioThi], [Diem], [LanThi], [TGNopBai]) VALUES (N'21111063171 ', N'CTKM107', N'Kiến trúc máy tính', 30, 45, CAST(N'2024-05-15' AS Date), CAST(N'02:30:00' AS Time), 1.33, 1, CAST(N'2024-05-15T02:34:33.467' AS DateTime))
INSERT [dbo].[KETQUA] ([MaSV], [MaHP], [TenHP], [SoCau], [TGLamBai], [NgayThi], [GioThi], [Diem], [LanThi], [TGNopBai]) VALUES (N'21111063171 ', N'NNTA103', N'Tiếng anh 3', 25, 45, CAST(N'2024-05-15' AS Date), CAST(N'01:30:00' AS Time), 1.6, 1, CAST(N'2024-05-15T02:35:13.540' AS DateTime))
INSERT [dbo].[KETQUA] ([MaSV], [MaHP], [TenHP], [SoCau], [TGLamBai], [NgayThi], [GioThi], [Diem], [LanThi], [TGNopBai]) VALUES (N'21111063145 ', N'CTKM107', N'Kiến trúc máy tính', 30, 45, CAST(N'2024-05-15' AS Date), CAST(N'02:30:00' AS Time), 3, 1, CAST(N'2024-05-15T02:57:31.820' AS DateTime))
INSERT [dbo].[KETQUA] ([MaSV], [MaHP], [TenHP], [SoCau], [TGLamBai], [NgayThi], [GioThi], [Diem], [LanThi], [TGNopBai]) VALUES (N'21111063117 ', N'NNTA103', N'Tiếng anh 3', 25, 45, CAST(N'2024-05-17' AS Date), CAST(N'01:30:00' AS Time), 0.4, 1, CAST(N'2024-05-17T17:48:19.977' AS DateTime))
INSERT [dbo].[KETQUA] ([MaSV], [MaHP], [TenHP], [SoCau], [TGLamBai], [NgayThi], [GioThi], [Diem], [LanThi], [TGNopBai]) VALUES (N'21111063145 ', N'CTKU102', N'Cấu trúc dữ liệu và giải thuật', 45, 90, CAST(N'2024-05-17' AS Date), CAST(N'01:10:00' AS Time), 1.56, 1, CAST(N'2024-05-17T18:01:48.970' AS DateTime))
INSERT [dbo].[KETQUA] ([MaSV], [MaHP], [TenHP], [SoCau], [TGLamBai], [NgayThi], [GioThi], [Diem], [LanThi], [TGNopBai]) VALUES (N'123         ', N'NNTA103', N'Tiếng anh 3', 25, 45, CAST(N'2024-05-18' AS Date), CAST(N'03:30:00' AS Time), 0.4, 1, CAST(N'2024-05-18T05:54:06.133' AS DateTime))
INSERT [dbo].[KETQUA] ([MaSV], [MaHP], [TenHP], [SoCau], [TGLamBai], [NgayThi], [GioThi], [Diem], [LanThi], [TGNopBai]) VALUES (N'21111063239 ', N'CTKU102', N'Cấu trúc dữ liệu và giải thuật', 20, 10, CAST(N'2024-05-27' AS Date), CAST(N'10:00:00' AS Time), 0.5, 1, CAST(N'2024-05-27T10:42:29.947' AS DateTime))
INSERT [dbo].[KETQUA] ([MaSV], [MaHP], [TenHP], [SoCau], [TGLamBai], [NgayThi], [GioThi], [Diem], [LanThi], [TGNopBai]) VALUES (N'21111181403 ', N'NNTA103', N'Tiếng anh 3', 25, 45, CAST(N'2024-05-15' AS Date), CAST(N'01:30:00' AS Time), 4.8, 1, CAST(N'2024-05-15T02:32:54.490' AS DateTime))
INSERT [dbo].[KETQUA] ([MaSV], [MaHP], [TenHP], [SoCau], [TGLamBai], [NgayThi], [GioThi], [Diem], [LanThi], [TGNopBai]) VALUES (N'21111063117 ', N'CTKU102', N'Cấu trúc dữ liệu và giải thuật', 45, 90, CAST(N'2024-05-15' AS Date), CAST(N'01:10:00' AS Time), 2.89, 1, CAST(N'2024-05-15T02:36:24.533' AS DateTime))
INSERT [dbo].[KETQUA] ([MaSV], [MaHP], [TenHP], [SoCau], [TGLamBai], [NgayThi], [GioThi], [Diem], [LanThi], [TGNopBai]) VALUES (N'21111063156 ', N'CTKU102', N'Cấu trúc dữ liệu và giải thuật', 45, 90, CAST(N'2024-05-15' AS Date), CAST(N'01:10:00' AS Time), 2.22, 1, CAST(N'2024-05-15T02:58:45.567' AS DateTime))
INSERT [dbo].[KETQUA] ([MaSV], [MaHP], [TenHP], [SoCau], [TGLamBai], [NgayThi], [GioThi], [Diem], [LanThi], [TGNopBai]) VALUES (N'21111063145 ', N'NNTA103', N'Tiếng anh 3', 25, 45, CAST(N'2024-05-17' AS Date), CAST(N'01:30:00' AS Time), 4.8, 1, CAST(N'2024-05-17T16:19:49.340' AS DateTime))
GO
INSERT [dbo].[MONTHI] ([MaHP], [TenHP], [SoCau], [TGLamBai], [NgayThi], [GioThi]) VALUES (N'CTKM103', N'Toán rời rạc', 20, 45, CAST(N'2024-10-10' AS Date), CAST(N'09:30:00' AS Time))
INSERT [dbo].[MONTHI] ([MaHP], [TenHP], [SoCau], [TGLamBai], [NgayThi], [GioThi]) VALUES (N'CTKM107', N'Kiến trúc máy tính', 30, 45, CAST(N'2024-10-10' AS Date), CAST(N'14:30:00' AS Time))
INSERT [dbo].[MONTHI] ([MaHP], [TenHP], [SoCau], [TGLamBai], [NgayThi], [GioThi]) VALUES (N'CTKU102', N'Cấu trúc dữ liệu và giải thuật', 20, 10, CAST(N'2024-05-27' AS Date), CAST(N'10:00:00' AS Time))
INSERT [dbo].[MONTHI] ([MaHP], [TenHP], [SoCau], [TGLamBai], [NgayThi], [GioThi]) VALUES (N'CTKU103', N'Nguyên lý hệ điều hành', 30, 60, CAST(N'2024-05-23' AS Date), CAST(N'12:30:00' AS Time))
INSERT [dbo].[MONTHI] ([MaHP], [TenHP], [SoCau], [TGLamBai], [NgayThi], [GioThi]) VALUES (N'NNTA103', N'Tiếng anh 3', 25, 45, CAST(N'2024-10-10' AS Date), CAST(N'10:00:00' AS Time))
GO
INSERT [dbo].[SINHVIEN] ([MaSV], [HoDem], [Ten], [NgaySinh], [MatKhau], [Lop], [Nganh], [VaiTro]) VALUES (N'123         ', N'Lê Quang', N'A', CAST(N'2003-02-15' AS Date), N'123', N'DH11C9', N'Quản lý đất đai', 0)
INSERT [dbo].[SINHVIEN] ([MaSV], [HoDem], [Ten], [NgaySinh], [MatKhau], [Lop], [Nganh], [VaiTro]) VALUES (N'124         ', N'Đỗ Danh', N'B', CAST(N'2003-01-21' AS Date), N'124', N'DH11C9', N'Marketing', 0)
INSERT [dbo].[SINHVIEN] ([MaSV], [HoDem], [Ten], [NgaySinh], [MatKhau], [Lop], [Nganh], [VaiTro]) VALUES (N'125         ', N'Vũ', N'Quang', CAST(N'2003-10-10' AS Date), N'123', N'abc', N'CNTT', 0)
INSERT [dbo].[SINHVIEN] ([MaSV], [HoDem], [Ten], [NgaySinh], [MatKhau], [Lop], [Nganh], [VaiTro]) VALUES (N'21111063117 ', N'Lê Quang', N'Thành', CAST(N'2003-02-10' AS Date), N'10022003', N'DH11C9', N'Công nghệ thông tin', 0)
INSERT [dbo].[SINHVIEN] ([MaSV], [HoDem], [Ten], [NgaySinh], [MatKhau], [Lop], [Nganh], [VaiTro]) VALUES (N'21111063120 ', N'Đỗ Danh', N'Toàn', CAST(N'2003-01-28' AS Date), N'28012003', N'DH11C9', N'Công nghệ thông tin', 0)
INSERT [dbo].[SINHVIEN] ([MaSV], [HoDem], [Ten], [NgaySinh], [MatKhau], [Lop], [Nganh], [VaiTro]) VALUES (N'21111063145 ', N'Nguyễn Đăng', N'Huy', CAST(N'2003-09-08' AS Date), N'08092003', N'DH11C9', N'Công nghệ thông tin', 0)
INSERT [dbo].[SINHVIEN] ([MaSV], [HoDem], [Ten], [NgaySinh], [MatKhau], [Lop], [Nganh], [VaiTro]) VALUES (N'21111063156 ', N'Nguyễn Hữu', N'Đoàn', CAST(N'2003-12-18' AS Date), N'18122003', N'DH11C9', N'Công nghệ thông tin', 0)
INSERT [dbo].[SINHVIEN] ([MaSV], [HoDem], [Ten], [NgaySinh], [MatKhau], [Lop], [Nganh], [VaiTro]) VALUES (N'21111063171 ', N'Đỗ Danh', N'Tân', CAST(N'2003-06-15' AS Date), N'15062003', N'DH11C9', N'Công nghệ thông tin', 0)
INSERT [dbo].[SINHVIEN] ([MaSV], [HoDem], [Ten], [NgaySinh], [MatKhau], [Lop], [Nganh], [VaiTro]) VALUES (N'21111063239 ', N'Trần Việt', N'Quang', CAST(N'2003-02-21' AS Date), N'21022003', N'DH11C9', N'Công nghệ thông tin', 0)
INSERT [dbo].[SINHVIEN] ([MaSV], [HoDem], [Ten], [NgaySinh], [MatKhau], [Lop], [Nganh], [VaiTro]) VALUES (N'21111181403 ', N'Nguyễn Thị Bích', N'Hạnh', CAST(N'2003-07-02' AS Date), N'02072003', N'DH11QTKD4', N'Quản trị kinh doanh', 0)
GO
ALTER TABLE [dbo].[BAILAM]  WITH CHECK ADD  CONSTRAINT [FK_BAILAM_MONTHI] FOREIGN KEY([MaHP])
REFERENCES [dbo].[MONTHI] ([MaHP])
GO
ALTER TABLE [dbo].[BAILAM] CHECK CONSTRAINT [FK_BAILAM_MONTHI]
GO
ALTER TABLE [dbo].[BAILAM]  WITH CHECK ADD  CONSTRAINT [FK_BAILAM_SINHVIEN] FOREIGN KEY([MaSV])
REFERENCES [dbo].[SINHVIEN] ([MaSV])
GO
ALTER TABLE [dbo].[BAILAM] CHECK CONSTRAINT [FK_BAILAM_SINHVIEN]
GO
ALTER TABLE [dbo].[CAUHOI]  WITH CHECK ADD  CONSTRAINT [FK_CAUHOI_MONTHI] FOREIGN KEY([MaHP])
REFERENCES [dbo].[MONTHI] ([MaHP])
GO
ALTER TABLE [dbo].[CAUHOI] CHECK CONSTRAINT [FK_CAUHOI_MONTHI]
GO
ALTER TABLE [dbo].[KETQUA]  WITH CHECK ADD  CONSTRAINT [FK_KETQUA_MONTHI] FOREIGN KEY([MaHP])
REFERENCES [dbo].[MONTHI] ([MaHP])
GO
ALTER TABLE [dbo].[KETQUA] CHECK CONSTRAINT [FK_KETQUA_MONTHI]
GO
ALTER TABLE [dbo].[KETQUA]  WITH CHECK ADD  CONSTRAINT [FK_KETQUA_SINHVIEN] FOREIGN KEY([MaSV])
REFERENCES [dbo].[SINHVIEN] ([MaSV])
GO
ALTER TABLE [dbo].[KETQUA] CHECK CONSTRAINT [FK_KETQUA_SINHVIEN]
GO
USE [master]
GO
ALTER DATABASE [TRACNGHIEM] SET  READ_WRITE 
GO
