USE [master]
GO
/****** Object:  Database [Cinema]    Script Date: 29/10/2024 7:53:54 CH ******/
CREATE DATABASE [Cinema]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Cinema', FILENAME = N'D:\Program Files\MSSQL16.MSSQLSERVER\MSSQL\DATA\Cinema.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Cinema_log', FILENAME = N'D:\Program Files\MSSQL16.MSSQLSERVER\MSSQL\DATA\Cinema_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Cinema] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Cinema].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Cinema] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Cinema] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Cinema] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Cinema] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Cinema] SET ARITHABORT OFF 
GO
ALTER DATABASE [Cinema] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Cinema] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Cinema] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Cinema] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Cinema] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Cinema] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Cinema] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Cinema] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Cinema] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Cinema] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Cinema] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Cinema] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Cinema] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Cinema] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Cinema] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Cinema] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Cinema] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Cinema] SET RECOVERY FULL 
GO
ALTER DATABASE [Cinema] SET  MULTI_USER 
GO
ALTER DATABASE [Cinema] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Cinema] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Cinema] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Cinema] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Cinema] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Cinema] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Cinema', N'ON'
GO
ALTER DATABASE [Cinema] SET QUERY_STORE = OFF
GO
USE [Cinema]
GO
/****** Object:  Table [dbo].[BinhLuan]    Script Date: 29/10/2024 7:53:54 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BinhLuan](
	[MaBL] [int] IDENTITY(1,1) NOT NULL,
	[ThoiGian] [datetime] NOT NULL,
	[NoiDung] [nvarchar](max) NULL,
	[MaPhim] [int] NOT NULL,
	[MaKH] [int] NOT NULL,
 CONSTRAINT [PK_BinhLuan] PRIMARY KEY CLUSTERED 
(
	[MaBL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 29/10/2024 7:53:55 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDon](
	[MaChiTietHoaDon] [int] IDENTITY(1,1) NOT NULL,
	[ThoiGianDat] [datetime] NULL,
	[ThoiGianChieu] [datetime] NULL,
	[DoAnKem] [nvarchar](max) NULL,
	[TongTien] [decimal](18, 0) NULL,
	[MaHoaDon] [bigint] NULL,
	[MaLichChieu] [int] NULL,
	[MaGhe] [int] NULL,
 CONSTRAINT [PK__ChiTietH__CFF2C4262C8137AB] PRIMARY KEY CLUSTERED 
(
	[MaChiTietHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Combo]    Script Date: 29/10/2024 7:53:55 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Combo](
	[MaCB] [int] IDENTITY(1,1) NOT NULL,
	[TenCB] [nvarchar](50) NULL,
	[MoTa] [nvarchar](max) NULL,
	[Gia] [decimal](18, 0) NULL,
	[MaDoAn] [int] NULL,
	[MaNuoc] [int] NULL,
	[GhiChu] [nvarchar](max) NULL,
	[SLDoAn] [int] NULL,
	[SLNuoc] [int] NULL,
	[HinhAnh] [varchar](50) NULL,
	[TrangThai] [nvarchar](50) NULL,
 CONSTRAINT [PK_Combo] PRIMARY KEY CLUSTERED 
(
	[MaCB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CTHDComBo]    Script Date: 29/10/2024 7:53:55 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTHDComBo](
	[MaCB] [int] NOT NULL,
	[SoLuong] [int] NULL,
	[GiaTien] [decimal](18, 0) NOT NULL,
	[MaHoaDon] [bigint] NULL,
	[MaCTCB] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaCTCB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DoAn]    Script Date: 29/10/2024 7:53:55 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoAn](
	[MaDoAn] [int] IDENTITY(1,1) NOT NULL,
	[TenDoAn] [nvarchar](255) NULL,
	[Gia] [decimal](10, 2) NULL,
	[Loai] [nvarchar](50) NULL,
	[TrangThai] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDoAn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ghe]    Script Date: 29/10/2024 7:53:55 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ghe](
	[MaGhe] [int] IDENTITY(1,1) NOT NULL,
	[TrangThai] [nvarchar](50) NULL,
	[MaPhong] [int] NULL,
	[TenGhe] [nvarchar](50) NULL,
	[LoaiGhe] [nvarchar](20) NULL,
	[GiaTien] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaGhe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 29/10/2024 7:53:55 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHoaDon] [bigint] NOT NULL,
	[HoTen] [nvarchar](255) NULL,
	[SoDienThoai] [nvarchar](15) NULL,
	[Email] [nvarchar](255) NULL,
	[MaKH] [int] NULL,
	[TrangThai] [nvarchar](50) NULL,
	[TienVe] [decimal](18, 0) NULL,
	[TienCombo] [decimal](18, 0) NULL,
	[TongTien] [decimal](18, 0) NULL,
	[NgayDat] [date] NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LichChieu]    Script Date: 29/10/2024 7:53:55 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LichChieu](
	[MaChieuPhim] [int] IDENTITY(1,1) NOT NULL,
	[NgonNgu] [nvarchar](50) NULL,
	[GioChieu] [time](7) NULL,
	[GioKetThuc] [time](7) NULL,
	[Phong] [int] NULL,
	[MaPhim] [int] NULL,
	[NgayChieu] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaChieuPhim] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiVoucher]    Script Date: 29/10/2024 7:53:55 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiVoucher](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[LoaiGiamGia] [nvarchar](50) NULL,
	[GiamGia] [int] NULL,
	[Diem] [int] NULL,
	[img] [nvarchar](50) NULL,
	[sl] [int] NULL,
 CONSTRAINT [PK_LoaiVoucher] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nuoc]    Script Date: 29/10/2024 7:53:55 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nuoc](
	[MaNuoc] [int] IDENTITY(1,1) NOT NULL,
	[TenNuoc] [nvarchar](50) NULL,
	[Gia] [decimal](18, 0) NULL,
	[Loai] [nvarchar](50) NULL,
	[TrangThai] [nvarchar](50) NULL,
 CONSTRAINT [PK_Nuoc] PRIMARY KEY CLUSTERED 
(
	[MaNuoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Phim]    Script Date: 29/10/2024 7:53:55 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phim](
	[MaPhim] [int] IDENTITY(1,1) NOT NULL,
	[TenPhim] [nvarchar](255) NULL,
	[NgayRaMat] [date] NULL,
	[TrangThai] [nvarchar](50) NULL,
	[TheLoai] [nvarchar](255) NULL,
	[ThoiLuong] [int] NULL,
	[DienVien] [nvarchar](255) NULL,
	[DaoDien] [nvarchar](255) NULL,
	[NgonNgu] [nvarchar](50) NULL,
	[Diem] [float] NULL,
	[AnhBia] [nvarchar](max) NULL,
	[Video] [nvarchar](max) NULL,
	[MaTheLoai] [int] NULL,
	[TrangThaiPhim] [nvarchar](50) NULL,
 CONSTRAINT [PK_Phim] PRIMARY KEY CLUSTERED 
(
	[MaPhim] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Phong]    Script Date: 29/10/2024 7:53:55 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phong](
	[MaPhong] [int] IDENTITY(1,1) NOT NULL,
	[TenPhong] [nvarchar](50) NULL,
	[SoChoNgoi] [int] NULL,
	[TrangThai] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPhong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slider]    Script Date: 29/10/2024 7:53:55 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slider](
	[TenHinh] [nvarchar](50) NULL,
	[HinhAnh] [nvarchar](50) NULL,
	[ma] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Slider] PRIMARY KEY CLUSTERED 
(
	[ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 29/10/2024 7:53:55 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](255) NULL,
	[ChucDanh] [nvarchar](50) NULL,
	[Cap] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TheLoai]    Script Date: 29/10/2024 7:53:55 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TheLoai](
	[MaTheLoai] [int] IDENTITY(1,1) NOT NULL,
	[TenTheLoai] [nvarchar](50) NULL,
 CONSTRAINT [PK_TheLoai] PRIMARY KEY CLUSTERED 
(
	[MaTheLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TheThanhVien]    Script Date: 29/10/2024 7:53:55 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TheThanhVien](
	[SoThe] [nvarchar](50) NOT NULL,
	[CapDoThe] [int] NULL,
	[TenThe] [nvarchar](255) NULL,
	[NgayDangKi] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[SoThe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThongTinCaNhan]    Script Date: 29/10/2024 7:53:55 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThongTinCaNhan](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](255) NULL,
	[SDT] [nvarchar](15) NULL,
	[Email] [nvarchar](255) NULL,
	[ThongTinChiTieu] [decimal](18, 0) NULL,
	[CapDoThe] [int] NULL,
	[MaThe] [nvarchar](50) NULL,
	[Matkhau] [nvarchar](max) NULL,
	[DiemThuong] [int] NULL,
	[Hang] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tintuc]    Script Date: 29/10/2024 7:53:55 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tintuc](
	[Matin] [int] IDENTITY(1,1) NOT NULL,
	[Chudetin] [nvarchar](max) NULL,
	[Ngaybatdau] [date] NULL,
	[Ngayketthuc] [date] NULL,
	[Mota] [nvarchar](max) NULL,
	[Anhbia] [varchar](255) NULL,
	[DieuKien] [nvarchar](max) NULL,
	[ThoiHan] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Matin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Voucher]    Script Date: 29/10/2024 7:53:55 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Voucher](
	[MaVoucher] [int] IDENTITY(1,1) NOT NULL,
	[NgayHetHan] [date] NULL,
	[GiamGiaPhanTram] [float] NULL,
	[LoaiGiamGia] [nvarchar](50) NULL,
	[MaVC] [nvarchar](50) NULL,
	[TrangThai] [nvarchar](50) NULL,
	[MaKH] [int] NULL,
	[img] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaVoucher] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BinhLuan] ON 

INSERT [dbo].[BinhLuan] ([MaBL], [ThoiGian], [NoiDung], [MaPhim], [MaKH]) VALUES (1, CAST(N'2023-11-27T17:11:18.467' AS DateTime), N'phim hay', 1, 2)
INSERT [dbo].[BinhLuan] ([MaBL], [ThoiGian], [NoiDung], [MaPhim], [MaKH]) VALUES (2, CAST(N'2023-11-27T17:27:58.650' AS DateTime), N'phim cực hay', 1, 2)
INSERT [dbo].[BinhLuan] ([MaBL], [ThoiGian], [NoiDung], [MaPhim], [MaKH]) VALUES (3, CAST(N'2024-05-01T20:06:48.323' AS DateTime), N'hay', 1, 4)
SET IDENTITY_INSERT [dbo].[BinhLuan] OFF
GO
SET IDENTITY_INSERT [dbo].[ChiTietHoaDon] ON 

INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [ThoiGianDat], [ThoiGianChieu], [DoAnKem], [TongTien], [MaHoaDon], [MaLichChieu], [MaGhe]) VALUES (7, CAST(N'2023-11-29T00:00:00.000' AS DateTime), CAST(N'2023-11-29T00:00:00.000' AS DateTime), NULL, CAST(120000 AS Decimal(18, 0)), 638368784827031523, 2, 10)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [ThoiGianDat], [ThoiGianChieu], [DoAnKem], [TongTien], [MaHoaDon], [MaLichChieu], [MaGhe]) VALUES (8, CAST(N'2023-11-29T00:00:00.000' AS DateTime), CAST(N'2023-11-29T00:00:00.000' AS DateTime), NULL, CAST(110000 AS Decimal(18, 0)), 638368784827031523, 2, 11)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [ThoiGianDat], [ThoiGianChieu], [DoAnKem], [TongTien], [MaHoaDon], [MaLichChieu], [MaGhe]) VALUES (9, CAST(N'2023-11-29T00:00:00.000' AS DateTime), CAST(N'2023-11-29T00:00:00.000' AS DateTime), NULL, CAST(110000 AS Decimal(18, 0)), 638368794922540931, 3, 11)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [ThoiGianDat], [ThoiGianChieu], [DoAnKem], [TongTien], [MaHoaDon], [MaLichChieu], [MaGhe]) VALUES (10, CAST(N'2023-11-29T00:00:00.000' AS DateTime), CAST(N'2023-11-29T00:00:00.000' AS DateTime), NULL, CAST(110000 AS Decimal(18, 0)), 638368794922540931, 3, 17)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [ThoiGianDat], [ThoiGianChieu], [DoAnKem], [TongTien], [MaHoaDon], [MaLichChieu], [MaGhe]) VALUES (11, CAST(N'2023-11-30T00:00:00.000' AS DateTime), CAST(N'2023-11-30T00:00:00.000' AS DateTime), NULL, CAST(110000 AS Decimal(18, 0)), 638369581651573736, 4, 70)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [ThoiGianDat], [ThoiGianChieu], [DoAnKem], [TongTien], [MaHoaDon], [MaLichChieu], [MaGhe]) VALUES (12, CAST(N'2023-11-30T00:00:00.000' AS DateTime), CAST(N'2023-11-30T00:00:00.000' AS DateTime), NULL, CAST(110000 AS Decimal(18, 0)), 638369581651573736, 4, 71)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [ThoiGianDat], [ThoiGianChieu], [DoAnKem], [TongTien], [MaHoaDon], [MaLichChieu], [MaGhe]) VALUES (13, CAST(N'2023-11-30T00:00:00.000' AS DateTime), CAST(N'2023-11-30T00:00:00.000' AS DateTime), NULL, CAST(110000 AS Decimal(18, 0)), 638369583272611746, 4, 72)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [ThoiGianDat], [ThoiGianChieu], [DoAnKem], [TongTien], [MaHoaDon], [MaLichChieu], [MaGhe]) VALUES (14, CAST(N'2023-11-30T00:00:00.000' AS DateTime), CAST(N'2023-11-30T00:00:00.000' AS DateTime), NULL, CAST(110000 AS Decimal(18, 0)), 638369583272611746, 4, 73)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [ThoiGianDat], [ThoiGianChieu], [DoAnKem], [TongTien], [MaHoaDon], [MaLichChieu], [MaGhe]) VALUES (15, CAST(N'2023-11-30T00:00:00.000' AS DateTime), CAST(N'2023-11-30T00:00:00.000' AS DateTime), NULL, CAST(110000 AS Decimal(18, 0)), 638369604472031834, 4, 74)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [ThoiGianDat], [ThoiGianChieu], [DoAnKem], [TongTien], [MaHoaDon], [MaLichChieu], [MaGhe]) VALUES (16, CAST(N'2023-11-30T00:00:00.000' AS DateTime), CAST(N'2023-11-30T00:00:00.000' AS DateTime), NULL, CAST(110000 AS Decimal(18, 0)), 638369604472031834, 4, 75)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [ThoiGianDat], [ThoiGianChieu], [DoAnKem], [TongTien], [MaHoaDon], [MaLichChieu], [MaGhe]) VALUES (17, CAST(N'2023-11-30T00:00:00.000' AS DateTime), CAST(N'2023-11-30T00:00:00.000' AS DateTime), NULL, CAST(110000 AS Decimal(18, 0)), 638369604472031834, 4, 74)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [ThoiGianDat], [ThoiGianChieu], [DoAnKem], [TongTien], [MaHoaDon], [MaLichChieu], [MaGhe]) VALUES (18, CAST(N'2023-11-30T00:00:00.000' AS DateTime), CAST(N'2023-11-30T00:00:00.000' AS DateTime), NULL, CAST(110000 AS Decimal(18, 0)), 638369604472031834, 4, 75)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [ThoiGianDat], [ThoiGianChieu], [DoAnKem], [TongTien], [MaHoaDon], [MaLichChieu], [MaGhe]) VALUES (19, CAST(N'2023-11-30T00:00:00.000' AS DateTime), CAST(N'2023-11-30T00:00:00.000' AS DateTime), NULL, CAST(110000 AS Decimal(18, 0)), 638369606272925617, 4, 76)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [ThoiGianDat], [ThoiGianChieu], [DoAnKem], [TongTien], [MaHoaDon], [MaLichChieu], [MaGhe]) VALUES (20, CAST(N'2023-11-30T00:00:00.000' AS DateTime), CAST(N'2023-11-30T00:00:00.000' AS DateTime), NULL, CAST(110000 AS Decimal(18, 0)), 638369606272925617, 4, 77)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [ThoiGianDat], [ThoiGianChieu], [DoAnKem], [TongTien], [MaHoaDon], [MaLichChieu], [MaGhe]) VALUES (21, CAST(N'2023-11-30T00:00:00.000' AS DateTime), CAST(N'2023-11-30T00:00:00.000' AS DateTime), NULL, CAST(110000 AS Decimal(18, 0)), 638369716316556343, 4, 78)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [ThoiGianDat], [ThoiGianChieu], [DoAnKem], [TongTien], [MaHoaDon], [MaLichChieu], [MaGhe]) VALUES (22, CAST(N'2023-11-30T00:00:00.000' AS DateTime), CAST(N'2023-11-30T00:00:00.000' AS DateTime), NULL, CAST(110000 AS Decimal(18, 0)), 638369716316556343, 4, 79)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [ThoiGianDat], [ThoiGianChieu], [DoAnKem], [TongTien], [MaHoaDon], [MaLichChieu], [MaGhe]) VALUES (23, CAST(N'2023-12-01T00:00:00.000' AS DateTime), CAST(N'2023-12-01T00:00:00.000' AS DateTime), NULL, CAST(110000 AS Decimal(18, 0)), 638370408167189314, 6, 9)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [ThoiGianDat], [ThoiGianChieu], [DoAnKem], [TongTien], [MaHoaDon], [MaLichChieu], [MaGhe]) VALUES (24, CAST(N'2023-12-01T00:00:00.000' AS DateTime), CAST(N'2023-12-01T00:00:00.000' AS DateTime), NULL, CAST(120000 AS Decimal(18, 0)), 638370408167189314, 6, 10)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [ThoiGianDat], [ThoiGianChieu], [DoAnKem], [TongTien], [MaHoaDon], [MaLichChieu], [MaGhe]) VALUES (25, CAST(N'2024-02-29T00:00:00.000' AS DateTime), CAST(N'2024-02-29T00:00:00.000' AS DateTime), NULL, CAST(110000 AS Decimal(18, 0)), 638448368680062464, 1, 9)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [ThoiGianDat], [ThoiGianChieu], [DoAnKem], [TongTien], [MaHoaDon], [MaLichChieu], [MaGhe]) VALUES (26, CAST(N'2024-02-29T00:00:00.000' AS DateTime), CAST(N'2024-02-29T00:00:00.000' AS DateTime), NULL, CAST(120000 AS Decimal(18, 0)), 638448368680062464, 1, 10)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [ThoiGianDat], [ThoiGianChieu], [DoAnKem], [TongTien], [MaHoaDon], [MaLichChieu], [MaGhe]) VALUES (27, CAST(N'2024-02-29T00:00:00.000' AS DateTime), CAST(N'2024-02-29T00:00:00.000' AS DateTime), NULL, CAST(110000 AS Decimal(18, 0)), 638448382358711758, 1, 11)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [ThoiGianDat], [ThoiGianChieu], [DoAnKem], [TongTien], [MaHoaDon], [MaLichChieu], [MaGhe]) VALUES (28, CAST(N'2024-02-29T00:00:00.000' AS DateTime), CAST(N'2024-02-29T00:00:00.000' AS DateTime), NULL, CAST(110000 AS Decimal(18, 0)), 638448382358711758, 1, 12)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [ThoiGianDat], [ThoiGianChieu], [DoAnKem], [TongTien], [MaHoaDon], [MaLichChieu], [MaGhe]) VALUES (29, CAST(N'2024-02-29T00:00:00.000' AS DateTime), CAST(N'2024-02-29T00:00:00.000' AS DateTime), NULL, CAST(110000 AS Decimal(18, 0)), 638448384428913205, 1, 13)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [ThoiGianDat], [ThoiGianChieu], [DoAnKem], [TongTien], [MaHoaDon], [MaLichChieu], [MaGhe]) VALUES (30, CAST(N'2024-02-29T00:00:00.000' AS DateTime), CAST(N'2024-02-29T00:00:00.000' AS DateTime), NULL, CAST(110000 AS Decimal(18, 0)), 638448385497009584, 1, 17)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [ThoiGianDat], [ThoiGianChieu], [DoAnKem], [TongTien], [MaHoaDon], [MaLichChieu], [MaGhe]) VALUES (31, CAST(N'2024-02-29T00:00:00.000' AS DateTime), CAST(N'2024-02-29T00:00:00.000' AS DateTime), NULL, CAST(110000 AS Decimal(18, 0)), 638448387021328450, 1, 18)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [ThoiGianDat], [ThoiGianChieu], [DoAnKem], [TongTien], [MaHoaDon], [MaLichChieu], [MaGhe]) VALUES (32, CAST(N'2024-02-29T00:00:00.000' AS DateTime), CAST(N'2024-02-29T00:00:00.000' AS DateTime), NULL, CAST(110000 AS Decimal(18, 0)), 638448390059866863, 1, 14)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [ThoiGianDat], [ThoiGianChieu], [DoAnKem], [TongTien], [MaHoaDon], [MaLichChieu], [MaGhe]) VALUES (33, CAST(N'2024-02-29T00:00:00.000' AS DateTime), CAST(N'2024-02-29T00:00:00.000' AS DateTime), NULL, CAST(110000 AS Decimal(18, 0)), 638448391709921601, 1, 15)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [ThoiGianDat], [ThoiGianChieu], [DoAnKem], [TongTien], [MaHoaDon], [MaLichChieu], [MaGhe]) VALUES (34, CAST(N'2024-02-29T00:00:00.000' AS DateTime), CAST(N'2024-02-29T00:00:00.000' AS DateTime), NULL, CAST(110000 AS Decimal(18, 0)), 638448392802980846, 1, 16)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [ThoiGianDat], [ThoiGianChieu], [DoAnKem], [TongTien], [MaHoaDon], [MaLichChieu], [MaGhe]) VALUES (35, CAST(N'2024-02-29T00:00:00.000' AS DateTime), CAST(N'2024-02-29T00:00:00.000' AS DateTime), NULL, CAST(110000 AS Decimal(18, 0)), 638448394122238682, 1, 19)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [ThoiGianDat], [ThoiGianChieu], [DoAnKem], [TongTien], [MaHoaDon], [MaLichChieu], [MaGhe]) VALUES (36, CAST(N'2024-02-29T00:00:00.000' AS DateTime), CAST(N'2024-02-29T00:00:00.000' AS DateTime), NULL, CAST(110000 AS Decimal(18, 0)), 638448396022521286, 1, 20)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [ThoiGianDat], [ThoiGianChieu], [DoAnKem], [TongTien], [MaHoaDon], [MaLichChieu], [MaGhe]) VALUES (37, CAST(N'2024-02-29T00:00:00.000' AS DateTime), CAST(N'2024-02-29T00:00:00.000' AS DateTime), NULL, CAST(110000 AS Decimal(18, 0)), 638448397279820508, 1, 21)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [ThoiGianDat], [ThoiGianChieu], [DoAnKem], [TongTien], [MaHoaDon], [MaLichChieu], [MaGhe]) VALUES (38, CAST(N'2024-02-29T00:00:00.000' AS DateTime), CAST(N'2024-02-29T00:00:00.000' AS DateTime), NULL, CAST(110000 AS Decimal(18, 0)), 638448403743998466, 1, 22)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [ThoiGianDat], [ThoiGianChieu], [DoAnKem], [TongTien], [MaHoaDon], [MaLichChieu], [MaGhe]) VALUES (39, CAST(N'2024-02-29T00:00:00.000' AS DateTime), CAST(N'2024-02-29T00:00:00.000' AS DateTime), NULL, CAST(110000 AS Decimal(18, 0)), 638448406336124863, 1, 23)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [ThoiGianDat], [ThoiGianChieu], [DoAnKem], [TongTien], [MaHoaDon], [MaLichChieu], [MaGhe]) VALUES (40, CAST(N'2024-02-29T00:00:00.000' AS DateTime), CAST(N'2024-02-29T00:00:00.000' AS DateTime), NULL, CAST(110000 AS Decimal(18, 0)), 638448411452155712, 1, 24)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [ThoiGianDat], [ThoiGianChieu], [DoAnKem], [TongTien], [MaHoaDon], [MaLichChieu], [MaGhe]) VALUES (41, CAST(N'2024-02-29T00:00:00.000' AS DateTime), CAST(N'2024-02-29T00:00:00.000' AS DateTime), NULL, CAST(110000 AS Decimal(18, 0)), 638448414736152196, 1, 25)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [ThoiGianDat], [ThoiGianChieu], [DoAnKem], [TongTien], [MaHoaDon], [MaLichChieu], [MaGhe]) VALUES (42, CAST(N'2024-02-29T00:00:00.000' AS DateTime), CAST(N'2024-02-29T00:00:00.000' AS DateTime), NULL, CAST(110000 AS Decimal(18, 0)), 638448416306651258, 1, 26)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [ThoiGianDat], [ThoiGianChieu], [DoAnKem], [TongTien], [MaHoaDon], [MaLichChieu], [MaGhe]) VALUES (43, CAST(N'2024-02-29T00:00:00.000' AS DateTime), CAST(N'2024-02-29T00:00:00.000' AS DateTime), NULL, CAST(110000 AS Decimal(18, 0)), 638448423358748604, 1, 27)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [ThoiGianDat], [ThoiGianChieu], [DoAnKem], [TongTien], [MaHoaDon], [MaLichChieu], [MaGhe]) VALUES (44, CAST(N'2024-02-29T00:00:00.000' AS DateTime), CAST(N'2024-02-29T00:00:00.000' AS DateTime), NULL, CAST(110000 AS Decimal(18, 0)), 638448425501539736, 1, 28)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [ThoiGianDat], [ThoiGianChieu], [DoAnKem], [TongTien], [MaHoaDon], [MaLichChieu], [MaGhe]) VALUES (45, CAST(N'2024-02-29T00:00:00.000' AS DateTime), CAST(N'2024-02-29T00:00:00.000' AS DateTime), NULL, CAST(110000 AS Decimal(18, 0)), 638448428115365352, 1, 29)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [ThoiGianDat], [ThoiGianChieu], [DoAnKem], [TongTien], [MaHoaDon], [MaLichChieu], [MaGhe]) VALUES (46, CAST(N'2024-02-29T00:00:00.000' AS DateTime), CAST(N'2024-02-29T00:00:00.000' AS DateTime), NULL, CAST(110000 AS Decimal(18, 0)), 638448430780396795, 1, 30)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [ThoiGianDat], [ThoiGianChieu], [DoAnKem], [TongTien], [MaHoaDon], [MaLichChieu], [MaGhe]) VALUES (47, CAST(N'2024-02-29T00:00:00.000' AS DateTime), CAST(N'2024-02-29T00:00:00.000' AS DateTime), NULL, CAST(110000 AS Decimal(18, 0)), 638448434860905523, 1, 31)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [ThoiGianDat], [ThoiGianChieu], [DoAnKem], [TongTien], [MaHoaDon], [MaLichChieu], [MaGhe]) VALUES (48, CAST(N'2024-02-29T00:00:00.000' AS DateTime), CAST(N'2024-02-29T00:00:00.000' AS DateTime), NULL, CAST(110000 AS Decimal(18, 0)), 638448436643318695, 1, 32)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [ThoiGianDat], [ThoiGianChieu], [DoAnKem], [TongTien], [MaHoaDon], [MaLichChieu], [MaGhe]) VALUES (49, CAST(N'2024-03-01T00:00:00.000' AS DateTime), CAST(N'2024-03-01T00:00:00.000' AS DateTime), NULL, CAST(110000 AS Decimal(18, 0)), 638449302706237363, 1, 9)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [ThoiGianDat], [ThoiGianChieu], [DoAnKem], [TongTien], [MaHoaDon], [MaLichChieu], [MaGhe]) VALUES (50, CAST(N'2024-03-02T00:00:00.000' AS DateTime), CAST(N'2024-03-02T00:00:00.000' AS DateTime), NULL, CAST(110000 AS Decimal(18, 0)), 638449919553499357, 1, 9)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [ThoiGianDat], [ThoiGianChieu], [DoAnKem], [TongTien], [MaHoaDon], [MaLichChieu], [MaGhe]) VALUES (51, CAST(N'2024-03-02T00:00:00.000' AS DateTime), CAST(N'2024-03-02T00:00:00.000' AS DateTime), NULL, CAST(120000 AS Decimal(18, 0)), 638450046144733982, 1, 10)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [ThoiGianDat], [ThoiGianChieu], [DoAnKem], [TongTien], [MaHoaDon], [MaLichChieu], [MaGhe]) VALUES (52, CAST(N'2024-03-02T00:00:00.000' AS DateTime), CAST(N'2024-03-02T00:00:00.000' AS DateTime), NULL, CAST(110000 AS Decimal(18, 0)), 638450049579714226, 1, 11)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [ThoiGianDat], [ThoiGianChieu], [DoAnKem], [TongTien], [MaHoaDon], [MaLichChieu], [MaGhe]) VALUES (53, CAST(N'2024-03-02T00:00:00.000' AS DateTime), CAST(N'2024-03-02T00:00:00.000' AS DateTime), NULL, CAST(110000 AS Decimal(18, 0)), 638450056254848945, 1, 12)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [ThoiGianDat], [ThoiGianChieu], [DoAnKem], [TongTien], [MaHoaDon], [MaLichChieu], [MaGhe]) VALUES (54, CAST(N'2024-03-29T00:00:00.000' AS DateTime), CAST(N'2024-03-29T00:00:00.000' AS DateTime), NULL, CAST(110000 AS Decimal(18, 0)), 638473383518716726, 1, 9)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [ThoiGianDat], [ThoiGianChieu], [DoAnKem], [TongTien], [MaHoaDon], [MaLichChieu], [MaGhe]) VALUES (55, CAST(N'2024-03-31T00:00:00.000' AS DateTime), CAST(N'2024-03-31T00:00:00.000' AS DateTime), NULL, CAST(110000 AS Decimal(18, 0)), 638475247498115938, 1, 9)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [ThoiGianDat], [ThoiGianChieu], [DoAnKem], [TongTien], [MaHoaDon], [MaLichChieu], [MaGhe]) VALUES (56, CAST(N'2024-05-01T00:00:00.000' AS DateTime), CAST(N'2024-05-01T00:00:00.000' AS DateTime), NULL, CAST(110000 AS Decimal(18, 0)), 638501913045199432, 1, 9)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [ThoiGianDat], [ThoiGianChieu], [DoAnKem], [TongTien], [MaHoaDon], [MaLichChieu], [MaGhe]) VALUES (57, CAST(N'2024-09-12T00:00:00.000' AS DateTime), CAST(N'2024-09-12T00:00:00.000' AS DateTime), NULL, CAST(110000 AS Decimal(18, 0)), 638617566033421986, 1, 9)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [ThoiGianDat], [ThoiGianChieu], [DoAnKem], [TongTien], [MaHoaDon], [MaLichChieu], [MaGhe]) VALUES (58, CAST(N'2024-09-12T00:00:00.000' AS DateTime), CAST(N'2024-09-12T00:00:00.000' AS DateTime), NULL, CAST(120000 AS Decimal(18, 0)), 638617566033421986, 1, 10)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [ThoiGianDat], [ThoiGianChieu], [DoAnKem], [TongTien], [MaHoaDon], [MaLichChieu], [MaGhe]) VALUES (59, CAST(N'2024-09-12T00:00:00.000' AS DateTime), CAST(N'2024-09-12T00:00:00.000' AS DateTime), NULL, CAST(110000 AS Decimal(18, 0)), 638617567078489093, 1, 11)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHoaDon], [ThoiGianDat], [ThoiGianChieu], [DoAnKem], [TongTien], [MaHoaDon], [MaLichChieu], [MaGhe]) VALUES (60, CAST(N'2024-09-12T00:00:00.000' AS DateTime), CAST(N'2024-09-12T00:00:00.000' AS DateTime), NULL, CAST(110000 AS Decimal(18, 0)), 638617579477086809, 1, 12)
SET IDENTITY_INSERT [dbo].[ChiTietHoaDon] OFF
GO
SET IDENTITY_INSERT [dbo].[Combo] ON 

INSERT [dbo].[Combo] ([MaCB], [TenCB], [MoTa], [Gia], [MaDoAn], [MaNuoc], [GhiChu], [SLDoAn], [SLNuoc], [HinhAnh], [TrangThai]) VALUES (1, N'PEANUTS SINGLE ', N'PEANUTS SINGLE COMBO 202301 ly nhân vật Peanuts (kèm nước)
* Nhận ngay trong ngày xong phim
** Thêm 39,000đ nhận ngay 1 bắp ngọt lớn
*** Mẫu ly phụ thuộc vào số lượng của rạp', CAST(199000 AS Decimal(18, 0)), 4, 1, NULL, 1, 1, N'cb1.png', N'Đang bán')
INSERT [dbo].[Combo] ([MaCB], [TenCB], [MoTa], [Gia], [MaDoAn], [MaNuoc], [GhiChu], [SLDoAn], [SLNuoc], [HinhAnh], [TrangThai]) VALUES (2, N'TRANSFORMERS 7 LED', N'1 hộp bắp Transformers (kèm bắp) + 1 nước siêu lớn
* Miễn phí đổi vị bắp Phô mai, Caramel *
** Mix từ 2 vị trờ lên chỉ với 19K **
*** Nhận trong ngày xem phim ***', CAST(333000 AS Decimal(18, 0)), 5, 2, NULL, 2, 1, N'cb2.png', N'Đang bán')
INSERT [dbo].[Combo] ([MaCB], [TenCB], [MoTa], [Gia], [MaDoAn], [MaNuoc], [GhiChu], [SLDoAn], [SLNuoc], [HinhAnh], [TrangThai]) VALUES (3, N'PEANUTS COUPLE', N'02 ly nhân vật Peanuts (kèm nước)
* Nhận ngay trong ngày xem phim
** Thêm 39,000đ nhận ngay 1 bắp ngọt
*** Mẫu ly phụ thuộc vào số lượng của rạp', CAST(379000 AS Decimal(18, 0)), NULL, NULL, NULL, NULL, NULL, N'cb3.png', N'Đang bán')
INSERT [dbo].[Combo] ([MaCB], [TenCB], [MoTa], [Gia], [MaDoAn], [MaNuoc], [GhiChu], [SLDoAn], [SLNuoc], [HinhAnh], [TrangThai]) VALUES (4, N'PEANUTS TRIPPLE', N'03 ly nhân vật Peanuts (kèm nước) + 01 bắp hai vị
* Nhận ngay trong ngày xem phim
** Mẫu ly phụ thuộc vào số lượng của rạp', CAST(539000 AS Decimal(18, 0)), NULL, NULL, NULL, NULL, NULL, N'cb4.png', N'Đang bán')
INSERT [dbo].[Combo] ([MaCB], [TenCB], [MoTa], [Gia], [MaDoAn], [MaNuoc], [GhiChu], [SLDoAn], [SLNuoc], [HinhAnh], [TrangThai]) VALUES (5, N'GARFIELD SINGLE', N'01 ly nhân vật Garfield (kèm nước)
* Nhận ngay trong ngày xong phim
** Thêm 39,000đ nhận ngay 1 bắp ngọt lớn
*** Mẫu ly phụ thuộc vào số lượng của rạp', CAST(199000 AS Decimal(18, 0)), NULL, NULL, NULL, NULL, NULL, N'cb5.png', N'Đang bán')
INSERT [dbo].[Combo] ([MaCB], [TenCB], [MoTa], [Gia], [MaDoAn], [MaNuoc], [GhiChu], [SLDoAn], [SLNuoc], [HinhAnh], [TrangThai]) VALUES (6, N'GARFIELD DOUBLE', N'02 ly nhân vật Garfield (kèm nước)
* Nhận ngay trong ngày xem phim
** Thêm 39,000đ nhận ngay 1 bắp ngọt
*** Mẫu ly phụ thuộc vào số lượng của rạp', CAST(379000 AS Decimal(18, 0)), NULL, NULL, NULL, NULL, NULL, N'cb6.png', N'Đang bán')
SET IDENTITY_INSERT [dbo].[Combo] OFF
GO
SET IDENTITY_INSERT [dbo].[CTHDComBo] ON 

INSERT [dbo].[CTHDComBo] ([MaCB], [SoLuong], [GiaTien], [MaHoaDon], [MaCTCB]) VALUES (1, 1, CAST(199000 AS Decimal(18, 0)), 638368784827031523, 1)
INSERT [dbo].[CTHDComBo] ([MaCB], [SoLuong], [GiaTien], [MaHoaDon], [MaCTCB]) VALUES (2, 1, CAST(333000 AS Decimal(18, 0)), 638368784827031523, 2)
INSERT [dbo].[CTHDComBo] ([MaCB], [SoLuong], [GiaTien], [MaHoaDon], [MaCTCB]) VALUES (1, 1, CAST(199000 AS Decimal(18, 0)), 638368794922540931, 3)
INSERT [dbo].[CTHDComBo] ([MaCB], [SoLuong], [GiaTien], [MaHoaDon], [MaCTCB]) VALUES (1, 1, CAST(199000 AS Decimal(18, 0)), 638369581651573736, 4)
INSERT [dbo].[CTHDComBo] ([MaCB], [SoLuong], [GiaTien], [MaHoaDon], [MaCTCB]) VALUES (2, 1, CAST(333000 AS Decimal(18, 0)), 638369581651573736, 5)
INSERT [dbo].[CTHDComBo] ([MaCB], [SoLuong], [GiaTien], [MaHoaDon], [MaCTCB]) VALUES (1, 1, CAST(199000 AS Decimal(18, 0)), 638369583272611746, 6)
INSERT [dbo].[CTHDComBo] ([MaCB], [SoLuong], [GiaTien], [MaHoaDon], [MaCTCB]) VALUES (3, 1, CAST(379000 AS Decimal(18, 0)), 638369583272611746, 7)
INSERT [dbo].[CTHDComBo] ([MaCB], [SoLuong], [GiaTien], [MaHoaDon], [MaCTCB]) VALUES (1, 1, CAST(199000 AS Decimal(18, 0)), 638369606272925617, 8)
INSERT [dbo].[CTHDComBo] ([MaCB], [SoLuong], [GiaTien], [MaHoaDon], [MaCTCB]) VALUES (2, 1, CAST(333000 AS Decimal(18, 0)), 638369606272925617, 9)
INSERT [dbo].[CTHDComBo] ([MaCB], [SoLuong], [GiaTien], [MaHoaDon], [MaCTCB]) VALUES (1, 1, CAST(199000 AS Decimal(18, 0)), 638369716316556343, 10)
INSERT [dbo].[CTHDComBo] ([MaCB], [SoLuong], [GiaTien], [MaHoaDon], [MaCTCB]) VALUES (2, 1, CAST(333000 AS Decimal(18, 0)), 638369716316556343, 11)
INSERT [dbo].[CTHDComBo] ([MaCB], [SoLuong], [GiaTien], [MaHoaDon], [MaCTCB]) VALUES (1, 1, CAST(199000 AS Decimal(18, 0)), 638370408167189314, 12)
INSERT [dbo].[CTHDComBo] ([MaCB], [SoLuong], [GiaTien], [MaHoaDon], [MaCTCB]) VALUES (1, 1, CAST(199000 AS Decimal(18, 0)), 638448368680062464, 13)
INSERT [dbo].[CTHDComBo] ([MaCB], [SoLuong], [GiaTien], [MaHoaDon], [MaCTCB]) VALUES (2, 1, CAST(333000 AS Decimal(18, 0)), 638448368680062464, 14)
INSERT [dbo].[CTHDComBo] ([MaCB], [SoLuong], [GiaTien], [MaHoaDon], [MaCTCB]) VALUES (1, 1, CAST(199000 AS Decimal(18, 0)), 638448382358711758, 15)
INSERT [dbo].[CTHDComBo] ([MaCB], [SoLuong], [GiaTien], [MaHoaDon], [MaCTCB]) VALUES (2, 1, CAST(333000 AS Decimal(18, 0)), 638448382358711758, 16)
INSERT [dbo].[CTHDComBo] ([MaCB], [SoLuong], [GiaTien], [MaHoaDon], [MaCTCB]) VALUES (1, 1, CAST(199000 AS Decimal(18, 0)), 638448384428913205, 17)
INSERT [dbo].[CTHDComBo] ([MaCB], [SoLuong], [GiaTien], [MaHoaDon], [MaCTCB]) VALUES (3, 1, CAST(379000 AS Decimal(18, 0)), 638448384428913205, 18)
INSERT [dbo].[CTHDComBo] ([MaCB], [SoLuong], [GiaTien], [MaHoaDon], [MaCTCB]) VALUES (1, 1, CAST(199000 AS Decimal(18, 0)), 638448385497009584, 19)
INSERT [dbo].[CTHDComBo] ([MaCB], [SoLuong], [GiaTien], [MaHoaDon], [MaCTCB]) VALUES (1, 1, CAST(199000 AS Decimal(18, 0)), 638448387021328450, 20)
INSERT [dbo].[CTHDComBo] ([MaCB], [SoLuong], [GiaTien], [MaHoaDon], [MaCTCB]) VALUES (1, 1, CAST(199000 AS Decimal(18, 0)), 638448390059866863, 21)
INSERT [dbo].[CTHDComBo] ([MaCB], [SoLuong], [GiaTien], [MaHoaDon], [MaCTCB]) VALUES (3, 1, CAST(379000 AS Decimal(18, 0)), 638448390059866863, 22)
INSERT [dbo].[CTHDComBo] ([MaCB], [SoLuong], [GiaTien], [MaHoaDon], [MaCTCB]) VALUES (1, 1, CAST(199000 AS Decimal(18, 0)), 638448391709921601, 23)
INSERT [dbo].[CTHDComBo] ([MaCB], [SoLuong], [GiaTien], [MaHoaDon], [MaCTCB]) VALUES (2, 1, CAST(333000 AS Decimal(18, 0)), 638448391709921601, 24)
INSERT [dbo].[CTHDComBo] ([MaCB], [SoLuong], [GiaTien], [MaHoaDon], [MaCTCB]) VALUES (1, 1, CAST(199000 AS Decimal(18, 0)), 638448392802980846, 25)
INSERT [dbo].[CTHDComBo] ([MaCB], [SoLuong], [GiaTien], [MaHoaDon], [MaCTCB]) VALUES (2, 1, CAST(333000 AS Decimal(18, 0)), 638448392802980846, 26)
INSERT [dbo].[CTHDComBo] ([MaCB], [SoLuong], [GiaTien], [MaHoaDon], [MaCTCB]) VALUES (2, 1, CAST(333000 AS Decimal(18, 0)), 638448394122238682, 27)
INSERT [dbo].[CTHDComBo] ([MaCB], [SoLuong], [GiaTien], [MaHoaDon], [MaCTCB]) VALUES (4, 1, CAST(539000 AS Decimal(18, 0)), 638448394122238682, 28)
INSERT [dbo].[CTHDComBo] ([MaCB], [SoLuong], [GiaTien], [MaHoaDon], [MaCTCB]) VALUES (2, 1, CAST(333000 AS Decimal(18, 0)), 638448396022521286, 29)
INSERT [dbo].[CTHDComBo] ([MaCB], [SoLuong], [GiaTien], [MaHoaDon], [MaCTCB]) VALUES (2, 1, CAST(333000 AS Decimal(18, 0)), 638448397279820508, 30)
INSERT [dbo].[CTHDComBo] ([MaCB], [SoLuong], [GiaTien], [MaHoaDon], [MaCTCB]) VALUES (2, 1, CAST(333000 AS Decimal(18, 0)), 638448403743998466, 31)
INSERT [dbo].[CTHDComBo] ([MaCB], [SoLuong], [GiaTien], [MaHoaDon], [MaCTCB]) VALUES (3, 1, CAST(379000 AS Decimal(18, 0)), 638448406336124863, 32)
INSERT [dbo].[CTHDComBo] ([MaCB], [SoLuong], [GiaTien], [MaHoaDon], [MaCTCB]) VALUES (2, 1, CAST(333000 AS Decimal(18, 0)), 638448411452155712, 33)
INSERT [dbo].[CTHDComBo] ([MaCB], [SoLuong], [GiaTien], [MaHoaDon], [MaCTCB]) VALUES (2, 1, CAST(333000 AS Decimal(18, 0)), 638448414736152196, 34)
INSERT [dbo].[CTHDComBo] ([MaCB], [SoLuong], [GiaTien], [MaHoaDon], [MaCTCB]) VALUES (3, 1, CAST(379000 AS Decimal(18, 0)), 638448414736152196, 35)
INSERT [dbo].[CTHDComBo] ([MaCB], [SoLuong], [GiaTien], [MaHoaDon], [MaCTCB]) VALUES (1, 1, CAST(199000 AS Decimal(18, 0)), 638448416306651258, 36)
INSERT [dbo].[CTHDComBo] ([MaCB], [SoLuong], [GiaTien], [MaHoaDon], [MaCTCB]) VALUES (1, 1, CAST(199000 AS Decimal(18, 0)), 638448423358748604, 37)
INSERT [dbo].[CTHDComBo] ([MaCB], [SoLuong], [GiaTien], [MaHoaDon], [MaCTCB]) VALUES (1, 1, CAST(199000 AS Decimal(18, 0)), 638448428115365352, 38)
INSERT [dbo].[CTHDComBo] ([MaCB], [SoLuong], [GiaTien], [MaHoaDon], [MaCTCB]) VALUES (1, 1, CAST(199000 AS Decimal(18, 0)), 638449302706237363, 39)
INSERT [dbo].[CTHDComBo] ([MaCB], [SoLuong], [GiaTien], [MaHoaDon], [MaCTCB]) VALUES (5, 1, CAST(199000 AS Decimal(18, 0)), 638449919553499357, 40)
INSERT [dbo].[CTHDComBo] ([MaCB], [SoLuong], [GiaTien], [MaHoaDon], [MaCTCB]) VALUES (5, 1, CAST(199000 AS Decimal(18, 0)), 638450049579714226, 41)
INSERT [dbo].[CTHDComBo] ([MaCB], [SoLuong], [GiaTien], [MaHoaDon], [MaCTCB]) VALUES (5, 1, CAST(199000 AS Decimal(18, 0)), 638450056254848945, 42)
INSERT [dbo].[CTHDComBo] ([MaCB], [SoLuong], [GiaTien], [MaHoaDon], [MaCTCB]) VALUES (1, 1, CAST(199000 AS Decimal(18, 0)), 638473383518716726, 43)
INSERT [dbo].[CTHDComBo] ([MaCB], [SoLuong], [GiaTien], [MaHoaDon], [MaCTCB]) VALUES (1, 1, CAST(199000 AS Decimal(18, 0)), 638475247498115938, 44)
INSERT [dbo].[CTHDComBo] ([MaCB], [SoLuong], [GiaTien], [MaHoaDon], [MaCTCB]) VALUES (1, 1, CAST(199000 AS Decimal(18, 0)), 638501913045199432, 45)
SET IDENTITY_INSERT [dbo].[CTHDComBo] OFF
GO
SET IDENTITY_INSERT [dbo].[DoAn] ON 

INSERT [dbo].[DoAn] ([MaDoAn], [TenDoAn], [Gia], [Loai], [TrangThai]) VALUES (1, N'Pepsii', CAST(50000.00 AS Decimal(10, 2)), NULL, N'Ngưng bán')
INSERT [dbo].[DoAn] ([MaDoAn], [TenDoAn], [Gia], [Loai], [TrangThai]) VALUES (2, N'Kẹo Ngọt', CAST(30000.00 AS Decimal(10, 2)), NULL, N'Đang bán')
INSERT [dbo].[DoAn] ([MaDoAn], [TenDoAn], [Gia], [Loai], [TrangThai]) VALUES (3, N'Nước Ngọt', CAST(20000.00 AS Decimal(10, 2)), N'Lớn', N'Đang bán')
INSERT [dbo].[DoAn] ([MaDoAn], [TenDoAn], [Gia], [Loai], [TrangThai]) VALUES (4, N'Bắp Rang', CAST(60000.00 AS Decimal(10, 2)), N'Lớn', N'Đang bán')
INSERT [dbo].[DoAn] ([MaDoAn], [TenDoAn], [Gia], [Loai], [TrangThai]) VALUES (5, N'Bắp Rang', CAST(30000.00 AS Decimal(10, 2)), N'Nhỏ', N'Đang bán')
INSERT [dbo].[DoAn] ([MaDoAn], [TenDoAn], [Gia], [Loai], [TrangThai]) VALUES (8, N'banh', CAST(100000.00 AS Decimal(10, 2)), N'Lớn', N'Đang bán')
INSERT [dbo].[DoAn] ([MaDoAn], [TenDoAn], [Gia], [Loai], [TrangThai]) VALUES (9, N'banh', CAST(10000.00 AS Decimal(10, 2)), N'Lớn', NULL)
INSERT [dbo].[DoAn] ([MaDoAn], [TenDoAn], [Gia], [Loai], [TrangThai]) VALUES (10, NULL, CAST(0.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[DoAn] ([MaDoAn], [TenDoAn], [Gia], [Loai], [TrangThai]) VALUES (11, NULL, CAST(0.00 AS Decimal(10, 2)), NULL, N'Ngưng bán')
INSERT [dbo].[DoAn] ([MaDoAn], [TenDoAn], [Gia], [Loai], [TrangThai]) VALUES (12, NULL, CAST(0.00 AS Decimal(10, 2)), NULL, NULL)
SET IDENTITY_INSERT [dbo].[DoAn] OFF
GO
SET IDENTITY_INSERT [dbo].[Ghe] ON 

INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (9, N'Đã đặt', 1, N'A1', N'Ghế Thường', CAST(110000 AS Decimal(18, 0)))
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (10, N'Đã đặt', 1, N'A2', N'Ghế VIP', CAST(120000 AS Decimal(18, 0)))
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (11, N'Đã đặt', 1, N'A3', N'Ghế Thường', CAST(110000 AS Decimal(18, 0)))
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (12, N'Trống', 1, N'A4', N'Ghế Thường', CAST(110000 AS Decimal(18, 0)))
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (13, N'Trống', 1, N'A5', N'Ghế Thường', CAST(110000 AS Decimal(18, 0)))
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (14, N'Trống', 1, N'A6', N'Ghế Thường', CAST(110000 AS Decimal(18, 0)))
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (15, N'Trống', 1, N'A7', N'Ghế Thường', CAST(110000 AS Decimal(18, 0)))
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (16, N'Trống', 1, N'A8', N'Ghế Thường', CAST(110000 AS Decimal(18, 0)))
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (17, N'Trống', 1, N'A9', N'Ghế Thường', CAST(110000 AS Decimal(18, 0)))
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (18, N'Trống', 1, N'A10', N'Ghế Thường', CAST(110000 AS Decimal(18, 0)))
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (19, N'Trống', 1, N'A11', N'Ghế Thường', CAST(110000 AS Decimal(18, 0)))
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (20, N'Trống', 1, N'A12', N'Ghế Thường', CAST(110000 AS Decimal(18, 0)))
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (21, N'Trống', 1, N'A13', N'Ghế Thường', CAST(110000 AS Decimal(18, 0)))
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (22, N'Trống', 1, N'A14', N'Ghế Thường', CAST(110000 AS Decimal(18, 0)))
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (23, N'Trống', 1, N'A15', N'Ghế Thường', CAST(110000 AS Decimal(18, 0)))
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (24, N'Trống', 1, N'A16', N'Ghế Thường', CAST(110000 AS Decimal(18, 0)))
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (25, N'Trống', 1, N'A17', N'Ghế Thường', CAST(110000 AS Decimal(18, 0)))
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (26, N'Trống', 1, N'A18', N'Ghế Thường', CAST(110000 AS Decimal(18, 0)))
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (27, N'Trống', 1, N'A19', N'Ghế Thường', CAST(110000 AS Decimal(18, 0)))
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (28, N'Trống', 1, N'A20', N'Ghế Thường', CAST(110000 AS Decimal(18, 0)))
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (29, N'Trống', 1, N'A21', N'Ghế Thường', CAST(110000 AS Decimal(18, 0)))
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (30, N'Trống', 1, N'A22', N'Ghế Thường', CAST(110000 AS Decimal(18, 0)))
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (31, N'Trống', 1, N'A23', N'Ghế Thường', CAST(110000 AS Decimal(18, 0)))
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (32, N'Trống', 1, N'A24', N'Ghế Thường', CAST(110000 AS Decimal(18, 0)))
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (33, N'Trống', 1, N'A25', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (34, N'Trống', 1, N'A26', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (35, N'Trống', 1, N'A27', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (36, N'Trống', 1, N'A28', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (37, N'Trống', 1, N'A29', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (38, N'Trống', 1, N'A30', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (39, N'Trống', 1, N'A31', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (40, N'Trống', 1, N'A32', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (41, N'Trống', 1, N'A33', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (42, N'Trống', 1, N'A34', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (43, N'Trống', 1, N'A35', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (44, N'Trống', 1, N'A36', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (45, N'Trống', 2, N'A37', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (46, N'Trống', 2, N'A38', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (47, N'Trống', 2, N'A39', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (48, N'Trống', 2, N'A40', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (49, N'Trống', 2, N'A1', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (50, N'Trống', 2, N'A2', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (51, N'Trống', 2, N'A3', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (52, N'Trống', 2, N'A4', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (53, N'Trống', 2, N'A5', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (54, N'Trống', 2, N'A6', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (55, N'Trống', 2, N'A7', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (56, N'Trống', 2, N'A8', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (57, N'Trống', 2, N'A9', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (58, N'Trống', 2, N'A10', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (59, N'Trống', 2, N'A11', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (60, N'Trống', 2, N'A12', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (61, N'Trống', 2, N'A13', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (62, N'Trống', 2, N'A14', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (63, N'Trống', 2, N'A15', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (64, N'Trống', 2, N'A16', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (65, N'Trống', 2, N'A17', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (66, N'Trống', 2, N'A18', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (67, N'Trống', 2, N'A19', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (68, N'Trống', 2, N'A20', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (69, NULL, 2, N'A21', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (70, N'Trống', 3, N'A1', N'Ghế Thường', CAST(110000 AS Decimal(18, 0)))
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (71, N'Trống', 3, N'A2', N'Ghế Thường', CAST(110000 AS Decimal(18, 0)))
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (72, N'Trống', 3, N'A3', N'Ghế Thường', CAST(110000 AS Decimal(18, 0)))
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (73, N'Trống', 3, N'A4', N'Ghế Thường', CAST(110000 AS Decimal(18, 0)))
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (74, N'Trống', 3, N'A5', N'Ghế Thường', CAST(110000 AS Decimal(18, 0)))
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (75, N'Trống', 3, N'A6', N'Ghế Thường', CAST(110000 AS Decimal(18, 0)))
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (76, N'Trống', 3, N'A7', N'Ghế Thường', CAST(110000 AS Decimal(18, 0)))
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (77, N'Trống', 3, N'A8', N'Ghế Thường', CAST(110000 AS Decimal(18, 0)))
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (78, N'Trống', 3, N'A9', N'Ghế Thường', CAST(110000 AS Decimal(18, 0)))
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (79, N'Trống', 3, N'A10', N'Ghế Thường', CAST(110000 AS Decimal(18, 0)))
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (80, N'Trống', 3, N'A11', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (81, N'Trống', 3, N'A12', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (82, N'Trống', 3, N'A13', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (83, N'Trống', 3, N'A14', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (84, N'Trống', 3, N'A15', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (85, N'Trống', 3, N'A16', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (86, N'Trống', 3, N'A17', N'Gh? Thu?ng', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (87, N'Trống', 3, N'A18', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (88, N'Trống', 3, N'A19', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (89, N'Trống', 3, N'A20', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (90, N'Trống', 3, N'A21', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (91, N'Trống', 3, N'A22', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (92, N'Trống', 3, N'A23', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (93, N'Trống', 3, N'A24', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (94, N'Trống', 3, N'A25', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (95, N'Trống', 3, N'A26', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (96, N'Trống', 3, N'A27', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (97, N'Trống', 3, N'A28', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (98, N'Trống', 3, N'A29', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (99, N'Trống', 3, N'A30', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (100, N'Trống', 3, N'A31', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (101, N'Trống', 3, N'A32', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (102, N'Trống', 3, N'A33', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (103, N'Trống', 3, N'A34', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (104, N'Trống', 3, N'A35', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (105, N'Trống', 3, N'A36', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (106, N'Trống', 3, N'A37', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (107, N'Trống', 3, N'A38', N'Ghế Thường', NULL)
GO
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (108, N'Trống', 3, N'A39', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (109, N'Trống', 3, N'A40', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (110, N'Trống', 4, N'P004-A11', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (111, N'Trống', 4, N'P004-A12', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (112, N'Trống', 4, N'P004-A13', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (113, N'Trống', 4, N'P004-A14', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (114, N'Trống', 4, N'P004-A15', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (115, N'Trống', 4, N'P004-A16', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (116, N'Trống', 4, N'P004-A17', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (117, N'Trống', 4, N'P004-A18', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (118, N'Trống', 4, N'P004-A19', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (119, N'Trống', 4, N'P004-A20', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (120, N'Trống', 4, N'P004-A21', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (121, N'Trống', 4, N'P004-A22', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (122, N'Trống', 4, N'P004-A23', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (123, N'Trống', 4, N'P004-A24', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (124, N'Trống', 4, N'P004-A25', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (125, N'Trống', 4, N'P004-A26', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (126, N'Trống', 4, N'P004-A27', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (127, N'Trống', 4, N'P004-A28', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (128, N'Trống', 4, N'P004-A29', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (129, N'Trống', 4, N'P004-A30', N'Ghế Thường', NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (135, N'Trống ', 5, N'P005-A31', NULL, NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (136, N'Trống', 5, N'P005-A32', NULL, NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (137, N'Trống', 5, N'P005-A33', NULL, NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (138, N'Trống', 5, N'P005-A34', NULL, NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (139, N'Trống ', 5, N'P005-A35', NULL, NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (140, N'Trống', 5, N'P005-A36', NULL, NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (141, N'Trống', 5, N'P005-A37', NULL, NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (142, N'Trống', 5, N'P005-A38', NULL, NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (143, N'Trống', 5, N'P005-A39', NULL, NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (144, N'Trống', 5, N'P005-A40', NULL, NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (145, N'Trống', 5, N'P005-A41', NULL, NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (146, N'Trống', 5, N'P005-A42', NULL, NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (147, N'Trống', 5, N'P005-A43', NULL, NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (148, N'Trống', 5, N'P005-A44', NULL, NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (149, N'Trống', 5, N'P005-A45', NULL, NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (150, N'Trống', 5, N'P005-A46', NULL, NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (151, N'Trống', 5, N'P005-A47', NULL, NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (152, N'Trống', 5, N'P005-A48', NULL, NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (153, N'Trống', 5, N'P005-A49', NULL, NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (154, N'Trống', 5, N'P005-A50', NULL, NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (155, N'Trống', 5, N'P005-A51', NULL, NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (156, N'Trống', 5, N'P005-A52', NULL, NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (157, N'Trống', 5, N'P005-A53', NULL, NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (158, N'Trống', 5, N'P005-A54', NULL, NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (159, N'Trống', 5, N'P005-A55', NULL, NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (160, N'Trống', 5, N'P005-A56', NULL, NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (161, N'Trống', 5, N'P005-A57', NULL, NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (162, N'Trống', 5, N'P005-A58', NULL, NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (163, N'Trống', 5, N'P005-A59', NULL, NULL)
INSERT [dbo].[Ghe] ([MaGhe], [TrangThai], [MaPhong], [TenGhe], [LoaiGhe], [GiaTien]) VALUES (164, N'Trống', 5, N'P005-A60', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Ghe] OFF
GO
INSERT [dbo].[HoaDon] ([MaHoaDon], [HoTen], [SoDienThoai], [Email], [MaKH], [TrangThai], [TienVe], [TienCombo], [TongTien], [NgayDat]) VALUES (638368784827031523, N'le anh teo', N'0377450983', N'aaa@gmail.com', 2, N'Đã thanh toán', CAST(230000 AS Decimal(18, 0)), CAST(532000 AS Decimal(18, 0)), CAST(762000 AS Decimal(18, 0)), CAST(N'2023-12-28' AS Date))
INSERT [dbo].[HoaDon] ([MaHoaDon], [HoTen], [SoDienThoai], [Email], [MaKH], [TrangThai], [TienVe], [TienCombo], [TongTien], [NgayDat]) VALUES (638368794922540931, N'le anh teo', N'0377450983', N'aaa@gmail.com', 2, N'Đã thanh toán', CAST(220000 AS Decimal(18, 0)), CAST(199000 AS Decimal(18, 0)), CAST(419000 AS Decimal(18, 0)), CAST(N'2023-12-29' AS Date))
INSERT [dbo].[HoaDon] ([MaHoaDon], [HoTen], [SoDienThoai], [Email], [MaKH], [TrangThai], [TienVe], [TienCombo], [TongTien], [NgayDat]) VALUES (638369581651573736, N'lê anh tèo', N'0377450983', N'kienpro0987@gmail.com', 2, N'Đã thanh toán', CAST(220000 AS Decimal(18, 0)), CAST(532000 AS Decimal(18, 0)), CAST(752000 AS Decimal(18, 0)), CAST(N'2023-11-30' AS Date))
INSERT [dbo].[HoaDon] ([MaHoaDon], [HoTen], [SoDienThoai], [Email], [MaKH], [TrangThai], [TienVe], [TienCombo], [TongTien], [NgayDat]) VALUES (638369583272611746, N'lê anh tèo', N'0377450983', N'kienpro0987@gmail.com', 2, N'Đã thanh toán', CAST(220000 AS Decimal(18, 0)), CAST(578000 AS Decimal(18, 0)), CAST(798000 AS Decimal(18, 0)), CAST(N'2023-11-30' AS Date))
INSERT [dbo].[HoaDon] ([MaHoaDon], [HoTen], [SoDienThoai], [Email], [MaKH], [TrangThai], [TienVe], [TienCombo], [TongTien], [NgayDat]) VALUES (638369603649618896, N'lê anh tèo', N'0377450983', N'kienpro0987@gmail.com', 2, N'Chưa thanh toán', CAST(220000 AS Decimal(18, 0)), CAST(532000 AS Decimal(18, 0)), CAST(752000 AS Decimal(18, 0)), CAST(N'2023-11-30' AS Date))
INSERT [dbo].[HoaDon] ([MaHoaDon], [HoTen], [SoDienThoai], [Email], [MaKH], [TrangThai], [TienVe], [TienCombo], [TongTien], [NgayDat]) VALUES (638369604472031834, N'lê anh tèo', N'0377450983', N'kienpro0987@gmail.com', 2, N'Đã thanh toán', CAST(220000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(220000 AS Decimal(18, 0)), CAST(N'2023-11-30' AS Date))
INSERT [dbo].[HoaDon] ([MaHoaDon], [HoTen], [SoDienThoai], [Email], [MaKH], [TrangThai], [TienVe], [TienCombo], [TongTien], [NgayDat]) VALUES (638369606272925617, N'lê anh tèo', N'0377450983', N'kienpro0987@gmail.com', 2, N'Đã thanh toán', CAST(220000 AS Decimal(18, 0)), CAST(532000 AS Decimal(18, 0)), CAST(752000 AS Decimal(18, 0)), CAST(N'2023-11-30' AS Date))
INSERT [dbo].[HoaDon] ([MaHoaDon], [HoTen], [SoDienThoai], [Email], [MaKH], [TrangThai], [TienVe], [TienCombo], [TongTien], [NgayDat]) VALUES (638369716316556343, N'lê anh tèo', N'0377450983', N'kienpro0987@gmail.com', 2, N'', CAST(220000 AS Decimal(18, 0)), CAST(532000 AS Decimal(18, 0)), CAST(752000 AS Decimal(18, 0)), CAST(N'2023-11-30' AS Date))
INSERT [dbo].[HoaDon] ([MaHoaDon], [HoTen], [SoDienThoai], [Email], [MaKH], [TrangThai], [TienVe], [TienCombo], [TongTien], [NgayDat]) VALUES (638370408167189314, N'lê anh tèo', N'0377450983', N'kienpro0987@gmail.com', 2, N'Đã thanh toán', CAST(230000 AS Decimal(18, 0)), CAST(199000 AS Decimal(18, 0)), CAST(429000 AS Decimal(18, 0)), CAST(N'2023-12-01' AS Date))
INSERT [dbo].[HoaDon] ([MaHoaDon], [HoTen], [SoDienThoai], [Email], [MaKH], [TrangThai], [TienVe], [TienCombo], [TongTien], [NgayDat]) VALUES (638370412170964948, N'123', N'0000000000', N'thanhtroll0915@gmail.com', 8, N'Chưa thanh toán', CAST(220000 AS Decimal(18, 0)), CAST(1535000 AS Decimal(18, 0)), CAST(1755000 AS Decimal(18, 0)), CAST(N'2023-12-01' AS Date))
INSERT [dbo].[HoaDon] ([MaHoaDon], [HoTen], [SoDienThoai], [Email], [MaKH], [TrangThai], [TienVe], [TienCombo], [TongTien], [NgayDat]) VALUES (638375727282088512, N'lê anh tèo1', N'0377450983', N'kienpro0987@gmail.com', 2, N'Chưa thanh toán', CAST(110000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(110000 AS Decimal(18, 0)), CAST(N'2023-12-07' AS Date))
INSERT [dbo].[HoaDon] ([MaHoaDon], [HoTen], [SoDienThoai], [Email], [MaKH], [TrangThai], [TienVe], [TienCombo], [TongTien], [NgayDat]) VALUES (638376672510629492, N'lê anh tèo1', N'0377450983', N'kienpro0987@gmail.com', 2, N'Chưa thanh toán', CAST(110000 AS Decimal(18, 0)), CAST(199000 AS Decimal(18, 0)), CAST(309000 AS Decimal(18, 0)), CAST(N'2023-12-08' AS Date))
INSERT [dbo].[HoaDon] ([MaHoaDon], [HoTen], [SoDienThoai], [Email], [MaKH], [TrangThai], [TienVe], [TienCombo], [TongTien], [NgayDat]) VALUES (638448368680062464, N'123', N'0000000000', N'thanhtroll0915@gmail.com', 8, N'Đã thanh toán', CAST(230000 AS Decimal(18, 0)), CAST(532000 AS Decimal(18, 0)), CAST(762000 AS Decimal(18, 0)), CAST(N'2024-02-29' AS Date))
INSERT [dbo].[HoaDon] ([MaHoaDon], [HoTen], [SoDienThoai], [Email], [MaKH], [TrangThai], [TienVe], [TienCombo], [TongTien], [NgayDat]) VALUES (638448382358711758, N'123', N'0000000000', N'thanhtroll0915@gmail.com', 8, N'Đã thanh toán', CAST(220000 AS Decimal(18, 0)), CAST(532000 AS Decimal(18, 0)), CAST(752000 AS Decimal(18, 0)), CAST(N'2024-02-29' AS Date))
INSERT [dbo].[HoaDon] ([MaHoaDon], [HoTen], [SoDienThoai], [Email], [MaKH], [TrangThai], [TienVe], [TienCombo], [TongTien], [NgayDat]) VALUES (638448384428913205, N'123', N'0000000000', N'thanhtroll0915@gmail.com', 8, N'Đã thanh toán', CAST(110000 AS Decimal(18, 0)), CAST(578000 AS Decimal(18, 0)), CAST(688000 AS Decimal(18, 0)), CAST(N'2024-02-29' AS Date))
INSERT [dbo].[HoaDon] ([MaHoaDon], [HoTen], [SoDienThoai], [Email], [MaKH], [TrangThai], [TienVe], [TienCombo], [TongTien], [NgayDat]) VALUES (638448385497009584, N'123', N'0000000000', N'thanhtroll0915@gmail.com', 8, N'Đã thanh toán', CAST(110000 AS Decimal(18, 0)), CAST(199000 AS Decimal(18, 0)), CAST(309000 AS Decimal(18, 0)), CAST(N'2024-02-29' AS Date))
INSERT [dbo].[HoaDon] ([MaHoaDon], [HoTen], [SoDienThoai], [Email], [MaKH], [TrangThai], [TienVe], [TienCombo], [TongTien], [NgayDat]) VALUES (638448387021328450, N'123', N'0000000000', N'thanhtroll0915@gmail.com', 8, N'Đã thanh toán', CAST(110000 AS Decimal(18, 0)), CAST(199000 AS Decimal(18, 0)), CAST(309000 AS Decimal(18, 0)), CAST(N'2024-02-29' AS Date))
INSERT [dbo].[HoaDon] ([MaHoaDon], [HoTen], [SoDienThoai], [Email], [MaKH], [TrangThai], [TienVe], [TienCombo], [TongTien], [NgayDat]) VALUES (638448390059866863, N'123', N'0000000000', N'thanhtroll0915@gmail.com', 8, N'Đã thanh toán', CAST(110000 AS Decimal(18, 0)), CAST(578000 AS Decimal(18, 0)), CAST(688000 AS Decimal(18, 0)), CAST(N'2024-02-29' AS Date))
INSERT [dbo].[HoaDon] ([MaHoaDon], [HoTen], [SoDienThoai], [Email], [MaKH], [TrangThai], [TienVe], [TienCombo], [TongTien], [NgayDat]) VALUES (638448391709921601, N'123', N'0000000000', N'thanhtroll0915@gmail.com', 8, N'Đã thanh toán', CAST(110000 AS Decimal(18, 0)), CAST(532000 AS Decimal(18, 0)), CAST(642000 AS Decimal(18, 0)), CAST(N'2024-02-29' AS Date))
INSERT [dbo].[HoaDon] ([MaHoaDon], [HoTen], [SoDienThoai], [Email], [MaKH], [TrangThai], [TienVe], [TienCombo], [TongTien], [NgayDat]) VALUES (638448392802980846, N'123', N'0000000000', N'thanhtroll0915@gmail.com', 8, N'Đã thanh toán', CAST(110000 AS Decimal(18, 0)), CAST(532000 AS Decimal(18, 0)), CAST(642000 AS Decimal(18, 0)), CAST(N'2024-02-29' AS Date))
INSERT [dbo].[HoaDon] ([MaHoaDon], [HoTen], [SoDienThoai], [Email], [MaKH], [TrangThai], [TienVe], [TienCombo], [TongTien], [NgayDat]) VALUES (638448394122238682, N'123', N'0000000000', N'thanhtroll0915@gmail.com', 8, N'Đã thanh toán', CAST(110000 AS Decimal(18, 0)), CAST(872000 AS Decimal(18, 0)), CAST(982000 AS Decimal(18, 0)), CAST(N'2024-02-29' AS Date))
INSERT [dbo].[HoaDon] ([MaHoaDon], [HoTen], [SoDienThoai], [Email], [MaKH], [TrangThai], [TienVe], [TienCombo], [TongTien], [NgayDat]) VALUES (638448396022521286, N'123', N'0000000000', N'thanhtroll0915@gmail.com', 8, N'Đã thanh toán', CAST(110000 AS Decimal(18, 0)), CAST(333000 AS Decimal(18, 0)), CAST(443000 AS Decimal(18, 0)), CAST(N'2024-02-29' AS Date))
INSERT [dbo].[HoaDon] ([MaHoaDon], [HoTen], [SoDienThoai], [Email], [MaKH], [TrangThai], [TienVe], [TienCombo], [TongTien], [NgayDat]) VALUES (638448397279820508, N'123', N'0000000000', N'thanhtroll0915@gmail.com', 8, N'Đã thanh toán', CAST(110000 AS Decimal(18, 0)), CAST(333000 AS Decimal(18, 0)), CAST(443000 AS Decimal(18, 0)), CAST(N'2024-02-29' AS Date))
INSERT [dbo].[HoaDon] ([MaHoaDon], [HoTen], [SoDienThoai], [Email], [MaKH], [TrangThai], [TienVe], [TienCombo], [TongTien], [NgayDat]) VALUES (638448403743998466, N'123', N'0000000000', N'thanhtroll0915@gmail.com', 8, N'Đã thanh toán', CAST(110000 AS Decimal(18, 0)), CAST(333000 AS Decimal(18, 0)), CAST(443000 AS Decimal(18, 0)), CAST(N'2024-02-29' AS Date))
INSERT [dbo].[HoaDon] ([MaHoaDon], [HoTen], [SoDienThoai], [Email], [MaKH], [TrangThai], [TienVe], [TienCombo], [TongTien], [NgayDat]) VALUES (638448406336124863, N'123', N'0000000000', N'thanhtroll0915@gmail.com', 8, N'Đã thanh toán', CAST(110000 AS Decimal(18, 0)), CAST(379000 AS Decimal(18, 0)), CAST(489000 AS Decimal(18, 0)), CAST(N'2024-02-29' AS Date))
INSERT [dbo].[HoaDon] ([MaHoaDon], [HoTen], [SoDienThoai], [Email], [MaKH], [TrangThai], [TienVe], [TienCombo], [TongTien], [NgayDat]) VALUES (638448411452155712, N'123', N'0000000000', N'thanhtroll0915@gmail.com', 8, N'Đã thanh toán', CAST(110000 AS Decimal(18, 0)), CAST(333000 AS Decimal(18, 0)), CAST(443000 AS Decimal(18, 0)), CAST(N'2024-02-29' AS Date))
INSERT [dbo].[HoaDon] ([MaHoaDon], [HoTen], [SoDienThoai], [Email], [MaKH], [TrangThai], [TienVe], [TienCombo], [TongTien], [NgayDat]) VALUES (638448414736152196, N'123', N'0000000000', N'thanhtroll0915@gmail.com', 8, N'Đã thanh toán', CAST(110000 AS Decimal(18, 0)), CAST(712000 AS Decimal(18, 0)), CAST(822000 AS Decimal(18, 0)), CAST(N'2024-02-29' AS Date))
INSERT [dbo].[HoaDon] ([MaHoaDon], [HoTen], [SoDienThoai], [Email], [MaKH], [TrangThai], [TienVe], [TienCombo], [TongTien], [NgayDat]) VALUES (638448416306651258, N'123', N'0000000000', N'thanhtroll0915@gmail.com', 8, N'Đã thanh toán', CAST(110000 AS Decimal(18, 0)), CAST(199000 AS Decimal(18, 0)), CAST(309000 AS Decimal(18, 0)), CAST(N'2024-02-29' AS Date))
INSERT [dbo].[HoaDon] ([MaHoaDon], [HoTen], [SoDienThoai], [Email], [MaKH], [TrangThai], [TienVe], [TienCombo], [TongTien], [NgayDat]) VALUES (638448423358748604, N'123', N'0000000000', N'thanhtroll0915@gmail.com', 8, N'Đã thanh toán', CAST(110000 AS Decimal(18, 0)), CAST(199000 AS Decimal(18, 0)), CAST(309000 AS Decimal(18, 0)), CAST(N'2024-02-29' AS Date))
INSERT [dbo].[HoaDon] ([MaHoaDon], [HoTen], [SoDienThoai], [Email], [MaKH], [TrangThai], [TienVe], [TienCombo], [TongTien], [NgayDat]) VALUES (638448425501539736, N'123', N'0000000000', N'thanhtroll0915@gmail.com', 8, N'Đã thanh toán', CAST(110000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(110000 AS Decimal(18, 0)), CAST(N'2024-02-29' AS Date))
INSERT [dbo].[HoaDon] ([MaHoaDon], [HoTen], [SoDienThoai], [Email], [MaKH], [TrangThai], [TienVe], [TienCombo], [TongTien], [NgayDat]) VALUES (638448428115365352, N'123', N'0000000000', N'thanhtroll0915@gmail.com', 8, N'Đã thanh toán', CAST(110000 AS Decimal(18, 0)), CAST(199000 AS Decimal(18, 0)), CAST(309000 AS Decimal(18, 0)), CAST(N'2024-02-29' AS Date))
INSERT [dbo].[HoaDon] ([MaHoaDon], [HoTen], [SoDienThoai], [Email], [MaKH], [TrangThai], [TienVe], [TienCombo], [TongTien], [NgayDat]) VALUES (638448430780396795, N'123', N'0000000000', N'thanhtroll0915@gmail.com', 8, N'Đã thanh toán', CAST(110000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(110000 AS Decimal(18, 0)), CAST(N'2024-02-29' AS Date))
INSERT [dbo].[HoaDon] ([MaHoaDon], [HoTen], [SoDienThoai], [Email], [MaKH], [TrangThai], [TienVe], [TienCombo], [TongTien], [NgayDat]) VALUES (638448434860905523, N'123', N'0000000000', N'thanhtroll0915@gmail.com', 8, N'Đã thanh toán', CAST(110000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(110000 AS Decimal(18, 0)), CAST(N'2024-02-29' AS Date))
INSERT [dbo].[HoaDon] ([MaHoaDon], [HoTen], [SoDienThoai], [Email], [MaKH], [TrangThai], [TienVe], [TienCombo], [TongTien], [NgayDat]) VALUES (638448436643318695, N'123', N'0000000000', N'thanhtroll0915@gmail.com', 8, N'Đã thanh toán', CAST(110000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(110000 AS Decimal(18, 0)), CAST(N'2024-02-29' AS Date))
INSERT [dbo].[HoaDon] ([MaHoaDon], [HoTen], [SoDienThoai], [Email], [MaKH], [TrangThai], [TienVe], [TienCombo], [TongTien], [NgayDat]) VALUES (638448819753211130, N'123', N'0000000000', N'thanhtroll0915@gmail.com', 8, N'Chưa thanh toán', CAST(110000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(110000 AS Decimal(18, 0)), CAST(N'2024-03-01' AS Date))
INSERT [dbo].[HoaDon] ([MaHoaDon], [HoTen], [SoDienThoai], [Email], [MaKH], [TrangThai], [TienVe], [TienCombo], [TongTien], [NgayDat]) VALUES (638449278119686570, N'123', N'0000000000', N'thanhtroll0915@gmail.com', 8, N'Chưa thanh toán', CAST(110000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(110000 AS Decimal(18, 0)), CAST(N'2024-03-01' AS Date))
INSERT [dbo].[HoaDon] ([MaHoaDon], [HoTen], [SoDienThoai], [Email], [MaKH], [TrangThai], [TienVe], [TienCombo], [TongTien], [NgayDat]) VALUES (638449278652011793, N'123', N'0000000000', N'thanhtroll0915@gmail.com', 8, N'Chưa thanh toán', CAST(110000 AS Decimal(18, 0)), CAST(199000 AS Decimal(18, 0)), CAST(309000 AS Decimal(18, 0)), CAST(N'2024-03-01' AS Date))
INSERT [dbo].[HoaDon] ([MaHoaDon], [HoTen], [SoDienThoai], [Email], [MaKH], [TrangThai], [TienVe], [TienCombo], [TongTien], [NgayDat]) VALUES (638449298965170424, N'123', N'0000000000', N'thanhtroll0915@gmail.com', 8, N'Chưa thanh toán', CAST(110000 AS Decimal(18, 0)), CAST(199000 AS Decimal(18, 0)), CAST(309000 AS Decimal(18, 0)), CAST(N'2024-03-01' AS Date))
INSERT [dbo].[HoaDon] ([MaHoaDon], [HoTen], [SoDienThoai], [Email], [MaKH], [TrangThai], [TienVe], [TienCombo], [TongTien], [NgayDat]) VALUES (638449300169763211, N'123', N'0000000000', N'thanhtroll0915@gmail.com', 8, N'Chưa thanh toán', CAST(110000 AS Decimal(18, 0)), CAST(379000 AS Decimal(18, 0)), CAST(459000 AS Decimal(18, 0)), CAST(N'2024-03-01' AS Date))
INSERT [dbo].[HoaDon] ([MaHoaDon], [HoTen], [SoDienThoai], [Email], [MaKH], [TrangThai], [TienVe], [TienCombo], [TongTien], [NgayDat]) VALUES (638449302574740962, N'123', N'0000000000', N'thanhtroll0915@gmail.com', 8, N'Chưa thanh toán', CAST(110000 AS Decimal(18, 0)), CAST(199000 AS Decimal(18, 0)), CAST(238100 AS Decimal(18, 0)), CAST(N'2024-03-01' AS Date))
INSERT [dbo].[HoaDon] ([MaHoaDon], [HoTen], [SoDienThoai], [Email], [MaKH], [TrangThai], [TienVe], [TienCombo], [TongTien], [NgayDat]) VALUES (638449302706237363, N'123', N'0000000000', N'thanhtroll0915@gmail.com', 8, N'Đã thanh toán', CAST(110000 AS Decimal(18, 0)), CAST(199000 AS Decimal(18, 0)), CAST(248100 AS Decimal(18, 0)), CAST(N'2024-03-01' AS Date))
INSERT [dbo].[HoaDon] ([MaHoaDon], [HoTen], [SoDienThoai], [Email], [MaKH], [TrangThai], [TienVe], [TienCombo], [TongTien], [NgayDat]) VALUES (638449827424151302, N'123', N'0000000000', N'thanhtroll0915@gmail.com', 8, N'Chưa thanh toán', CAST(110000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(69000 AS Decimal(18, 0)), CAST(N'2024-03-02' AS Date))
INSERT [dbo].[HoaDon] ([MaHoaDon], [HoTen], [SoDienThoai], [Email], [MaKH], [TrangThai], [TienVe], [TienCombo], [TongTien], [NgayDat]) VALUES (638449918512955344, N'123', N'0000000000', N'thanhtroll0915@gmail.com', 8, N'Chưa thanh toán', CAST(110000 AS Decimal(18, 0)), CAST(199000 AS Decimal(18, 0)), CAST(228100 AS Decimal(18, 0)), CAST(N'2024-03-02' AS Date))
INSERT [dbo].[HoaDon] ([MaHoaDon], [HoTen], [SoDienThoai], [Email], [MaKH], [TrangThai], [TienVe], [TienCombo], [TongTien], [NgayDat]) VALUES (638449919553499357, N'123', N'0000000000', N'thanhtroll0915@gmail.com', 8, N'Đã thanh toán', CAST(110000 AS Decimal(18, 0)), CAST(199000 AS Decimal(18, 0)), CAST(228100 AS Decimal(18, 0)), CAST(N'2024-03-02' AS Date))
INSERT [dbo].[HoaDon] ([MaHoaDon], [HoTen], [SoDienThoai], [Email], [MaKH], [TrangThai], [TienVe], [TienCombo], [TongTien], [NgayDat]) VALUES (638450038870114452, N'123', N'0000000000', N'thanhtroll0915@gmail.com', 8, N'Chưa thanh toán', CAST(120000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(108000 AS Decimal(18, 0)), CAST(N'2024-03-02' AS Date))
INSERT [dbo].[HoaDon] ([MaHoaDon], [HoTen], [SoDienThoai], [Email], [MaKH], [TrangThai], [TienVe], [TienCombo], [TongTien], [NgayDat]) VALUES (638450043029825141, N'123', N'0000000000', N'thanhtroll0915@gmail.com', 8, N'Chưa thanh toán', CAST(120000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(108000 AS Decimal(18, 0)), CAST(N'2024-03-02' AS Date))
INSERT [dbo].[HoaDon] ([MaHoaDon], [HoTen], [SoDienThoai], [Email], [MaKH], [TrangThai], [TienVe], [TienCombo], [TongTien], [NgayDat]) VALUES (638450043121932110, N'123', N'0000000000', N'thanhtroll0915@gmail.com', 8, N'Chưa thanh toán', CAST(120000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(108000 AS Decimal(18, 0)), CAST(N'2024-03-02' AS Date))
INSERT [dbo].[HoaDon] ([MaHoaDon], [HoTen], [SoDienThoai], [Email], [MaKH], [TrangThai], [TienVe], [TienCombo], [TongTien], [NgayDat]) VALUES (638450046144733982, N'123', N'0000000000', N'thanhtroll0915@gmail.com', 8, N'Đã thanh toán', CAST(120000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(97200 AS Decimal(18, 0)), CAST(N'2024-03-02' AS Date))
INSERT [dbo].[HoaDon] ([MaHoaDon], [HoTen], [SoDienThoai], [Email], [MaKH], [TrangThai], [TienVe], [TienCombo], [TongTien], [NgayDat]) VALUES (638450049579714226, N'123', N'0000000000', N'thanhtroll0915@gmail.com', 8, N'Đã thanh toán', CAST(110000 AS Decimal(18, 0)), CAST(199000 AS Decimal(18, 0)), CAST(222390 AS Decimal(18, 0)), CAST(N'2024-03-02' AS Date))
INSERT [dbo].[HoaDon] ([MaHoaDon], [HoTen], [SoDienThoai], [Email], [MaKH], [TrangThai], [TienVe], [TienCombo], [TongTien], [NgayDat]) VALUES (638450056254848945, N'123', N'0000000000', N'thanhtroll0915@gmail.com', 8, N'Đã thanh toán', CAST(110000 AS Decimal(18, 0)), CAST(199000 AS Decimal(18, 0)), CAST(258633 AS Decimal(18, 0)), CAST(N'2024-03-02' AS Date))
INSERT [dbo].[HoaDon] ([MaHoaDon], [HoTen], [SoDienThoai], [Email], [MaKH], [TrangThai], [TienVe], [TienCombo], [TongTien], [NgayDat]) VALUES (638468722527472992, N'123', N'0000000000', N'thanhtroll0915@gmail.com', 8, N'Chưa thanh toán', CAST(110000 AS Decimal(18, 0)), CAST(199000 AS Decimal(18, 0)), CAST(258633 AS Decimal(18, 0)), CAST(N'2024-03-24' AS Date))
INSERT [dbo].[HoaDon] ([MaHoaDon], [HoTen], [SoDienThoai], [Email], [MaKH], [TrangThai], [TienVe], [TienCombo], [TongTien], [NgayDat]) VALUES (638468727261506968, N'123', N'0000000000', N'thanhtroll0915@gmail.com', 8, N'Chưa thanh toán', CAST(102300 AS Decimal(18, 0)), CAST(199000 AS Decimal(18, 0)), CAST(271170 AS Decimal(18, 0)), CAST(N'2024-03-24' AS Date))
INSERT [dbo].[HoaDon] ([MaHoaDon], [HoTen], [SoDienThoai], [Email], [MaKH], [TrangThai], [TienVe], [TienCombo], [TongTien], [NgayDat]) VALUES (638469684636112636, N'123', N'0000000000', N'thanhtroll0915@gmail.com', 8, N'Chưa thanh toán', CAST(110000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(99000 AS Decimal(18, 0)), CAST(N'2024-03-25' AS Date))
INSERT [dbo].[HoaDon] ([MaHoaDon], [HoTen], [SoDienThoai], [Email], [MaKH], [TrangThai], [TienVe], [TienCombo], [TongTien], [NgayDat]) VALUES (638471344791629159, N'123', N'0000000000', N'thanhtroll0915@gmail.com', 8, N'Chưa thanh toán', CAST(230000 AS Decimal(18, 0)), CAST(199000 AS Decimal(18, 0)), CAST(386100 AS Decimal(18, 0)), CAST(N'2024-03-27' AS Date))
INSERT [dbo].[HoaDon] ([MaHoaDon], [HoTen], [SoDienThoai], [Email], [MaKH], [TrangThai], [TienVe], [TienCombo], [TongTien], [NgayDat]) VALUES (638471345159463376, N'123', N'0000000000', N'thanhtroll0915@gmail.com', 8, N'Chưa thanh toán', CAST(230000 AS Decimal(18, 0)), CAST(199000 AS Decimal(18, 0)), CAST(386100 AS Decimal(18, 0)), CAST(N'2024-03-27' AS Date))
INSERT [dbo].[HoaDon] ([MaHoaDon], [HoTen], [SoDienThoai], [Email], [MaKH], [TrangThai], [TienVe], [TienCombo], [TongTien], [NgayDat]) VALUES (638471365049344904, N'123', N'0000000000', N'thanhtroll0915@gmail.com', 8, N'Chưa thanh toán', CAST(102300 AS Decimal(18, 0)), CAST(199000 AS Decimal(18, 0)), CAST(271170 AS Decimal(18, 0)), CAST(N'2024-03-27' AS Date))
INSERT [dbo].[HoaDon] ([MaHoaDon], [HoTen], [SoDienThoai], [Email], [MaKH], [TrangThai], [TienVe], [TienCombo], [TongTien], [NgayDat]) VALUES (638471453097415753, N'123', N'0000000000', N'thanhtroll0915@gmail.com', 8, N'Chưa thanh toán', CAST(102300 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(92070 AS Decimal(18, 0)), CAST(N'2024-03-27' AS Date))
INSERT [dbo].[HoaDon] ([MaHoaDon], [HoTen], [SoDienThoai], [Email], [MaKH], [TrangThai], [TienVe], [TienCombo], [TongTien], [NgayDat]) VALUES (638471469605154255, N'123', N'0000000000', N'thanhtroll0915@gmail.com', 8, N'Chưa thanh toán', CAST(104500 AS Decimal(18, 0)), CAST(199000 AS Decimal(18, 0)), CAST(273150 AS Decimal(18, 0)), CAST(N'2024-03-27' AS Date))
INSERT [dbo].[HoaDon] ([MaHoaDon], [HoTen], [SoDienThoai], [Email], [MaKH], [TrangThai], [TienVe], [TienCombo], [TongTien], [NgayDat]) VALUES (638473383518716726, N'123', N'0000000000', N'thanhtroll0915@gmail.com', 8, N'Đã thanh toán', CAST(110000 AS Decimal(18, 0)), CAST(199000 AS Decimal(18, 0)), CAST(278100 AS Decimal(18, 0)), CAST(N'2024-03-29' AS Date))
INSERT [dbo].[HoaDon] ([MaHoaDon], [HoTen], [SoDienThoai], [Email], [MaKH], [TrangThai], [TienVe], [TienCombo], [TongTien], [NgayDat]) VALUES (638475247303116669, N'123', N'0000000000', N'thanhtroll0915@gmail.com', 8, N'Chưa thanh toán', CAST(110000 AS Decimal(18, 0)), CAST(199000 AS Decimal(18, 0)), CAST(278100 AS Decimal(18, 0)), CAST(N'2024-03-31' AS Date))
INSERT [dbo].[HoaDon] ([MaHoaDon], [HoTen], [SoDienThoai], [Email], [MaKH], [TrangThai], [TienVe], [TienCombo], [TongTien], [NgayDat]) VALUES (638475247498115938, N'123', N'0000000000', N'thanhtroll0915@gmail.com', 8, N'Đã thanh toán', CAST(110000 AS Decimal(18, 0)), CAST(199000 AS Decimal(18, 0)), CAST(278100 AS Decimal(18, 0)), CAST(N'2024-03-31' AS Date))
INSERT [dbo].[HoaDon] ([MaHoaDon], [HoTen], [SoDienThoai], [Email], [MaKH], [TrangThai], [TienVe], [TienCombo], [TongTien], [NgayDat]) VALUES (638501912299312705, N'2', N'1234567890', N'1@gmail.com', 4, N'Chưa thanh toán', CAST(230000 AS Decimal(18, 0)), CAST(379000 AS Decimal(18, 0)), CAST(609000 AS Decimal(18, 0)), CAST(N'2024-05-01' AS Date))
INSERT [dbo].[HoaDon] ([MaHoaDon], [HoTen], [SoDienThoai], [Email], [MaKH], [TrangThai], [TienVe], [TienCombo], [TongTien], [NgayDat]) VALUES (638501913045199432, N'2', N'1234567890', N'1@gmail.com', 4, N'Đã thanh toán', CAST(110000 AS Decimal(18, 0)), CAST(199000 AS Decimal(18, 0)), CAST(309000 AS Decimal(18, 0)), CAST(N'2024-05-01' AS Date))
INSERT [dbo].[HoaDon] ([MaHoaDon], [HoTen], [SoDienThoai], [Email], [MaKH], [TrangThai], [TienVe], [TienCombo], [TongTien], [NgayDat]) VALUES (638617566033421986, N'lê anh tèo1', N'0377450983', N'kienpro0987@gmail.com', 2, N'Chưa thanh toán', CAST(230000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(230000 AS Decimal(18, 0)), CAST(N'2024-09-12' AS Date))
INSERT [dbo].[HoaDon] ([MaHoaDon], [HoTen], [SoDienThoai], [Email], [MaKH], [TrangThai], [TienVe], [TienCombo], [TongTien], [NgayDat]) VALUES (638617567078489093, N'lê anh tèo1', N'0377450983', N'kienpro0987@gmail.com', 2, N'Đã thanh toán', CAST(110000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(110000 AS Decimal(18, 0)), CAST(N'2024-09-12' AS Date))
INSERT [dbo].[HoaDon] ([MaHoaDon], [HoTen], [SoDienThoai], [Email], [MaKH], [TrangThai], [TienVe], [TienCombo], [TongTien], [NgayDat]) VALUES (638617579477086809, N'lê anh tèo1', N'0377450983', N'kienpro0987@gmail.com', 2, N'Đã thanh toán', CAST(110000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(110000 AS Decimal(18, 0)), CAST(N'2024-09-12' AS Date))
GO
SET IDENTITY_INSERT [dbo].[LichChieu] ON 

INSERT [dbo].[LichChieu] ([MaChieuPhim], [NgonNgu], [GioChieu], [GioKetThuc], [Phong], [MaPhim], [NgayChieu]) VALUES (1, N'Tiếng Anh', CAST(N'01:00:00' AS Time), CAST(N'00:00:00' AS Time), 1, 1, CAST(N'2024-10-29' AS Date))
INSERT [dbo].[LichChieu] ([MaChieuPhim], [NgonNgu], [GioChieu], [GioKetThuc], [Phong], [MaPhim], [NgayChieu]) VALUES (2, N'Tiếng Việt-Anh', CAST(N'19:00:00' AS Time), CAST(N'21:30:00' AS Time), 1, 1, CAST(N'2024-09-12' AS Date))
INSERT [dbo].[LichChieu] ([MaChieuPhim], [NgonNgu], [GioChieu], [GioKetThuc], [Phong], [MaPhim], [NgayChieu]) VALUES (3, N'Anh-Việt Phụ đề', CAST(N'20:00:00' AS Time), CAST(N'22:00:00' AS Time), 1, 1, CAST(N'2024-09-12' AS Date))
INSERT [dbo].[LichChieu] ([MaChieuPhim], [NgonNgu], [GioChieu], [GioKetThuc], [Phong], [MaPhim], [NgayChieu]) VALUES (4, N'Tiếng Pháp', CAST(N'15:30:00' AS Time), CAST(N'17:30:00' AS Time), 3, 1, CAST(N'2024-09-12' AS Date))
INSERT [dbo].[LichChieu] ([MaChieuPhim], [NgonNgu], [GioChieu], [GioKetThuc], [Phong], [MaPhim], [NgayChieu]) VALUES (5, N'Anh-Việt', CAST(N'13:00:00' AS Time), CAST(N'15:00:00' AS Time), 3, 1, CAST(N'2023-11-30' AS Date))
INSERT [dbo].[LichChieu] ([MaChieuPhim], [NgonNgu], [GioChieu], [GioKetThuc], [Phong], [MaPhim], [NgayChieu]) VALUES (6, N'Anh-Việt', CAST(N'10:30:00' AS Time), CAST(N'12:30:00' AS Time), 1, 1, CAST(N'2023-12-01' AS Date))
INSERT [dbo].[LichChieu] ([MaChieuPhim], [NgonNgu], [GioChieu], [GioKetThuc], [Phong], [MaPhim], [NgayChieu]) VALUES (7, N'Anh-Việt', CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, 1, CAST(N'2023-12-01' AS Date))
INSERT [dbo].[LichChieu] ([MaChieuPhim], [NgonNgu], [GioChieu], [GioKetThuc], [Phong], [MaPhim], [NgayChieu]) VALUES (8, N'Anh-Việt', CAST(N'09:00:00' AS Time), CAST(N'11:00:00' AS Time), 3, 1, CAST(N'2023-12-02' AS Date))
INSERT [dbo].[LichChieu] ([MaChieuPhim], [NgonNgu], [GioChieu], [GioKetThuc], [Phong], [MaPhim], [NgayChieu]) VALUES (9, N'Anh-Việt', CAST(N'10:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, 1, CAST(N'2023-12-02' AS Date))
INSERT [dbo].[LichChieu] ([MaChieuPhim], [NgonNgu], [GioChieu], [GioKetThuc], [Phong], [MaPhim], [NgayChieu]) VALUES (10, N'Anh-Việt', CAST(N'12:00:00' AS Time), CAST(N'14:00:00' AS Time), 3, 1, CAST(N'2023-12-03' AS Date))
INSERT [dbo].[LichChieu] ([MaChieuPhim], [NgonNgu], [GioChieu], [GioKetThuc], [Phong], [MaPhim], [NgayChieu]) VALUES (11, N'Tb', CAST(N'00:00:00' AS Time), CAST(N'00:00:00' AS Time), 1, 2, NULL)
INSERT [dbo].[LichChieu] ([MaChieuPhim], [NgonNgu], [GioChieu], [GioKetThuc], [Phong], [MaPhim], [NgayChieu]) VALUES (12, N'viet', CAST(N'12:30:00' AS Time), CAST(N'14:30:00' AS Time), 3, 1, CAST(N'2023-12-07' AS Date))
INSERT [dbo].[LichChieu] ([MaChieuPhim], [NgonNgu], [GioChieu], [GioKetThuc], [Phong], [MaPhim], [NgayChieu]) VALUES (13, N'viet', CAST(N'12:30:00' AS Time), CAST(N'14:30:00' AS Time), 1, 1, CAST(N'2023-12-08' AS Date))
SET IDENTITY_INSERT [dbo].[LichChieu] OFF
GO
SET IDENTITY_INSERT [dbo].[LoaiVoucher] ON 

INSERT [dbo].[LoaiVoucher] ([id], [LoaiGiamGia], [GiamGia], [Diem], [img], [sl]) VALUES (1, N'Phim', 6, 20, N'phim.jpg', 0)
INSERT [dbo].[LoaiVoucher] ([id], [LoaiGiamGia], [GiamGia], [Diem], [img], [sl]) VALUES (2, N'Phim', 7, 30, N'phim.jpg', 98)
INSERT [dbo].[LoaiVoucher] ([id], [LoaiGiamGia], [GiamGia], [Diem], [img], [sl]) VALUES (3, N'Phim', 10, 35, N'phim.jpg', 100)
INSERT [dbo].[LoaiVoucher] ([id], [LoaiGiamGia], [GiamGia], [Diem], [img], [sl]) VALUES (4, N'Combo', 5, 30, N'combo.png', 100)
INSERT [dbo].[LoaiVoucher] ([id], [LoaiGiamGia], [GiamGia], [Diem], [img], [sl]) VALUES (5, N'Combo', 7, 50, N'combo.png', 100)
INSERT [dbo].[LoaiVoucher] ([id], [LoaiGiamGia], [GiamGia], [Diem], [img], [sl]) VALUES (6, N'Combo', 10, 55, N'combo.png', 100)
SET IDENTITY_INSERT [dbo].[LoaiVoucher] OFF
GO
SET IDENTITY_INSERT [dbo].[Nuoc] ON 

INSERT [dbo].[Nuoc] ([MaNuoc], [TenNuoc], [Gia], [Loai], [TrangThai]) VALUES (1, N'Pesi', CAST(19000 AS Decimal(18, 0)), N'Nhỏ', N'Đang bán')
INSERT [dbo].[Nuoc] ([MaNuoc], [TenNuoc], [Gia], [Loai], [TrangThai]) VALUES (2, N'Pepsi', CAST(30000 AS Decimal(18, 0)), N'Lớn', N'Đang bán')
INSERT [dbo].[Nuoc] ([MaNuoc], [TenNuoc], [Gia], [Loai], [TrangThai]) VALUES (3, N'Coca', CAST(100000 AS Decimal(18, 0)), N'Lớn', N'Đang bán')
SET IDENTITY_INSERT [dbo].[Nuoc] OFF
GO
SET IDENTITY_INSERT [dbo].[Phim] ON 

INSERT [dbo].[Phim] ([MaPhim], [TenPhim], [NgayRaMat], [TrangThai], [TheLoai], [ThoiLuong], [DienVien], [DaoDien], [NgonNgu], [Diem], [AnhBia], [Video], [MaTheLoai], [TrangThaiPhim]) VALUES (1, N'THE MARVELS
', CAST(N'2023-10-11' AS Date), N'Sắp chiếu', N'Hành Động, Phiêu Lưu, Thần thoại
', 104, N'Brie Larson, Samuel L. Jackson, Zawe Ashton', N'Nia DaCosta', N'Tiếng Anh - Phụ đề Tiếng Việt', NULL, N'C3.JPG', N'https://www.youtube.com/embed/wS_qbDztgVY', NULL, NULL)
INSERT [dbo].[Phim] ([MaPhim], [TenPhim], [NgayRaMat], [TrangThai], [TheLoai], [ThoiLuong], [DienVien], [DaoDien], [NgonNgu], [Diem], [AnhBia], [Video], [MaTheLoai], [TrangThaiPhim]) VALUES (2, N'KỴ SĨ BÓNG ĐÊM TRỖI DẬY', CAST(N'2023-08-11' AS Date), N'Sắp chiếu', N'Hành Động', 165, N'Christian Bale, Tom Hardy, Anne Hathaway, Joseph Gordon-Levitt,…', N'Christopher Nolan', N'Tiếng Anh - Phụ đề Tiếng Việt', NULL, N'D3.JPG', NULL, NULL, NULL)
INSERT [dbo].[Phim] ([MaPhim], [TenPhim], [NgayRaMat], [TrangThai], [TheLoai], [ThoiLuong], [DienVien], [DaoDien], [NgonNgu], [Diem], [AnhBia], [Video], [MaTheLoai], [TrangThaiPhim]) VALUES (3, N'NĂM ĐÊM KINH HOÀNG
', CAST(N'2023-10-27' AS Date), N'Sắp chiếu', N'Kinh Dị
', 110, N'Matthew Lillard, Josh Hutcherson, Mary Stuart Masterson,…', N'Emma Tammi', N'Tiếng Anh - Phụ đề Tiếng Việt', NULL, N'1.JPG', NULL, NULL, NULL)
INSERT [dbo].[Phim] ([MaPhim], [TenPhim], [NgayRaMat], [TrangThai], [TheLoai], [ThoiLuong], [DienVien], [DaoDien], [NgonNgu], [Diem], [AnhBia], [Video], [MaTheLoai], [TrangThaiPhim]) VALUES (4, N'OÁN HỒN TỬ ĐỊA
', CAST(N'2023-11-10' AS Date), N'Sắp chiếu', N'Kinh Dị
', 88, N'Sornsutha Klunmalee, Phuang Keawprasert', N'Walongkorn Jubjai', N'Tiếng Thái - Phụ đề tiếng Việt', NULL, N'2.JPG', NULL, NULL, NULL)
INSERT [dbo].[Phim] ([MaPhim], [TenPhim], [NgayRaMat], [TrangThai], [TheLoai], [ThoiLuong], [DienVien], [DaoDien], [NgonNgu], [Diem], [AnhBia], [Video], [MaTheLoai], [TrangThaiPhim]) VALUES (5, N'CUỘC TRUY ĐUỔI KỲ QUÁI
', CAST(N'2023-11-10' AS Date), N'Sắp chiếu', N'Hài, Hồi hộp, Kinh Dị', 93, N'Lisa Ambalavarna, Sydney Craven, Andrew Horton,…', N'Matthew Goodhue', N'Tiếng Anh - Phụ đề Tiếng Việt', NULL, N'3.JPG', NULL, NULL, NULL)
INSERT [dbo].[Phim] ([MaPhim], [TenPhim], [NgayRaMat], [TrangThai], [TheLoai], [ThoiLuong], [DienVien], [DaoDien], [NgonNgu], [Diem], [AnhBia], [Video], [MaTheLoai], [TrangThaiPhim]) VALUES (6, N'VẦNG TRĂNG MÁU
', CAST(N'2023-10-20' AS Date), N'Đang chiếu', N'Bí ẩn, Hồi hộp', 80, N'Leonardo DiCaprio, Robert De Niro, Lily Gladstone', N'Martin Scorsese', N'Tiếng Anh - Phụ đề Tiếng Việt', NULL, N'9.JPG', NULL, NULL, NULL)
INSERT [dbo].[Phim] ([MaPhim], [TenPhim], [NgayRaMat], [TrangThai], [TheLoai], [ThoiLuong], [DienVien], [DaoDien], [NgonNgu], [Diem], [AnhBia], [Video], [MaTheLoai], [TrangThaiPhim]) VALUES (7, N'THANH GƯƠM TRỪ TÀ
', CAST(N'2023-10-06' AS Date), N'Đang chiếu', N'Hài, Kinh Dị', 98, N'Gang Dong Won, Esom, Lee Dong Hwi, Kim Jong Soo, Lee Jung Eun, Park Myoung Hyun, Park So Yi, … ', N'Kim Sung-Sik', N'Tiếng Hàn - Phụ đề tiếng Việt', NULL, N'4.JPG', NULL, NULL, NULL)
INSERT [dbo].[Phim] ([MaPhim], [TenPhim], [NgayRaMat], [TrangThai], [TheLoai], [ThoiLuong], [DienVien], [DaoDien], [NgonNgu], [Diem], [AnhBia], [Video], [MaTheLoai], [TrangThaiPhim]) VALUES (8, N'NHỮNG KỶ NGUYÊN CỦA TAYLOR SWIFT
', CAST(N'2023-11-03' AS Date), N'Đang chiếu', N'Hòa nhạc', 168, N'Taylor Swift', N'Sam Wrench', N'Tiếng Anh - Phụ đề Tiếng Việt', NULL, N'5.JPG', NULL, NULL, NULL)
INSERT [dbo].[Phim] ([MaPhim], [TenPhim], [NgayRaMat], [TrangThai], [TheLoai], [ThoiLuong], [DienVien], [DaoDien], [NgonNgu], [Diem], [AnhBia], [Video], [MaTheLoai], [TrangThaiPhim]) VALUES (9, N'KỲ ÁN TRÊN ĐỒI TUYẾT
', CAST(N'2023-11-10' AS Date), N'Đang chiếu', N'Hồi hộp, Tâm Lý, Tội phạm', 150, N'Sandra Hüller, Swann Arlaud, Milo Machado-Graner', N'Justine Triet', N'Tiếng Anh - Phụ đề Tiếng Việt và Tiếng Anh', NULL, N'6.JPG', NULL, NULL, NULL)
INSERT [dbo].[Phim] ([MaPhim], [TenPhim], [NgayRaMat], [TrangThai], [TheLoai], [ThoiLuong], [DienVien], [DaoDien], [NgonNgu], [Diem], [AnhBia], [Video], [MaTheLoai], [TrangThaiPhim]) VALUES (10, N'MỸ NHÂN ĐẠO CHÍCH
', CAST(N'2023-11-03' AS Date), N'Đang chiếu', N'Hài', 121, N'Uhm Jung-Hwa, Song Sae-Byeok, Bang Min-Ah, Park Ho-San, Son Byung-Ho, Kim Jae-Hwa', N'Lee Seung-Joon', N'Tiếng Hàn - Phụ đề tiếng Việt, tiếng Anh', NULL, N'7.JPG', NULL, NULL, NULL)
INSERT [dbo].[Phim] ([MaPhim], [TenPhim], [NgayRaMat], [TrangThai], [TheLoai], [ThoiLuong], [DienVien], [DaoDien], [NgonNgu], [Diem], [AnhBia], [Video], [MaTheLoai], [TrangThaiPhim]) VALUES (11, N'duc1', CAST(N'2023-11-30' AS Date), N'Ngưng chiếu', N'Hành Động,Kinh Dị', 100, N'duc', N'duc', N'viet', NULL, N'1.jpg', N'https://www.youtube.com/embed/NEoFGaixiC8', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Phim] OFF
GO
SET IDENTITY_INSERT [dbo].[Phong] ON 

INSERT [dbo].[Phong] ([MaPhong], [TenPhong], [SoChoNgoi], [TrangThai]) VALUES (1, N'Screen01', 50, N'Hoạt động')
INSERT [dbo].[Phong] ([MaPhong], [TenPhong], [SoChoNgoi], [TrangThai]) VALUES (2, N'Screen02', 50, N'Hoạt động')
INSERT [dbo].[Phong] ([MaPhong], [TenPhong], [SoChoNgoi], [TrangThai]) VALUES (3, N'Screen03', 50, N'Hoạt động')
INSERT [dbo].[Phong] ([MaPhong], [TenPhong], [SoChoNgoi], [TrangThai]) VALUES (4, N'Screen04', 50, N'Hoạt động')
INSERT [dbo].[Phong] ([MaPhong], [TenPhong], [SoChoNgoi], [TrangThai]) VALUES (5, N'Screen05', 50, N'Hoạt động')
INSERT [dbo].[Phong] ([MaPhong], [TenPhong], [SoChoNgoi], [TrangThai]) VALUES (6, N'Screen06', 50, N'Hoạt động')
INSERT [dbo].[Phong] ([MaPhong], [TenPhong], [SoChoNgoi], [TrangThai]) VALUES (7, N'Screen07', 50, N'Hoạt động')
INSERT [dbo].[Phong] ([MaPhong], [TenPhong], [SoChoNgoi], [TrangThai]) VALUES (8, N'Screen08', 50, N'Hoạt động')
INSERT [dbo].[Phong] ([MaPhong], [TenPhong], [SoChoNgoi], [TrangThai]) VALUES (9, N'Screen09', 50, N'Hoạt động')
INSERT [dbo].[Phong] ([MaPhong], [TenPhong], [SoChoNgoi], [TrangThai]) VALUES (10, N'Screen10', 50, N'Hoạt động')
INSERT [dbo].[Phong] ([MaPhong], [TenPhong], [SoChoNgoi], [TrangThai]) VALUES (11, N'phong11', 51, N'Ngưng sử dụng')
SET IDENTITY_INSERT [dbo].[Phong] OFF
GO
SET IDENTITY_INSERT [dbo].[Slider] ON 

INSERT [dbo].[Slider] ([TenHinh], [HinhAnh], [ma]) VALUES (N'Mùng 2/9', N'slider2.jpg', 1)
INSERT [dbo].[Slider] ([TenHinh], [HinhAnh], [ma]) VALUES (N'Bạn là Nobita', N'slider6.jpg', 2)
INSERT [dbo].[Slider] ([TenHinh], [HinhAnh], [ma]) VALUES (N'Lipton', N'slider4.jpeg', 3)
INSERT [dbo].[Slider] ([TenHinh], [HinhAnh], [ma]) VALUES (N'Xem phim nhận quà', N'slider5.jpg', 4)
INSERT [dbo].[Slider] ([TenHinh], [HinhAnh], [ma]) VALUES (NULL, N'T1.jpg', 5)
SET IDENTITY_INSERT [dbo].[Slider] OFF
GO
INSERT [dbo].[TaiKhoan] ([Username], [Password], [ChucDanh], [Cap]) VALUES (N'0898697607', N'676dd2e74d2c1f3c5f37fa0da331fd7ecdffcb04dd0983975e2630380f0a38c8', N'111', NULL)
INSERT [dbo].[TaiKhoan] ([Username], [Password], [ChucDanh], [Cap]) VALUES (N'a', N'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', N'a', NULL)
INSERT [dbo].[TaiKhoan] ([Username], [Password], [ChucDanh], [Cap]) VALUES (N'b', N'3e23e8160039594a33894f6564e1b1348bbd7a0088d42c4acb73eeaed59c009d', N'b', NULL)
INSERT [dbo].[TaiKhoan] ([Username], [Password], [ChucDanh], [Cap]) VALUES (N'duc0', N'b6920ff22d0c1eb8eaba1ce901f6c8c31978a0481c0060e36ede245cc0ba6fc9', N'Nhanvien', NULL)
INSERT [dbo].[TaiKhoan] ([Username], [Password], [ChucDanh], [Cap]) VALUES (N'tai2003', N'123', N'Quanly', NULL)
GO
SET IDENTITY_INSERT [dbo].[TheLoai] ON 

INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (1, N'Hành Động')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (2, N'Kinh Dị
')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (3, N'Hòa nhạc')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (4, N'Hài')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (5, N'Tâm linh')
INSERT [dbo].[TheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (6, N'Vui vẻ')
SET IDENTITY_INSERT [dbo].[TheLoai] OFF
GO
SET IDENTITY_INSERT [dbo].[ThongTinCaNhan] ON 

INSERT [dbo].[ThongTinCaNhan] ([MaKH], [Ten], [SDT], [Email], [ThongTinChiTieu], [CapDoThe], [MaThe], [Matkhau], [DiemThuong], [Hang]) VALUES (2, N'lê anh tèo1', N'0377450983', N'kienpro0987@gmail.com', CAST(220000 AS Decimal(18, 0)), NULL, NULL, N'dda9482bdb43613b3dcad1312fa4f0ee9d69ef01dfce84ad2ae4997098758336', 22, N'member')
INSERT [dbo].[ThongTinCaNhan] ([MaKH], [Ten], [SDT], [Email], [ThongTinChiTieu], [CapDoThe], [MaThe], [Matkhau], [DiemThuong], [Hang]) VALUES (3, N'1', N'0377450981', N'kienpro0987@gmail.com', CAST(0 AS Decimal(18, 0)), NULL, NULL, N'e2ea9f2ee9f5861d632cc646fda593946c36d560cfbe6bd57047a1c4cf2d6b66', 0, N'member')
INSERT [dbo].[ThongTinCaNhan] ([MaKH], [Ten], [SDT], [Email], [ThongTinChiTieu], [CapDoThe], [MaThe], [Matkhau], [DiemThuong], [Hang]) VALUES (4, N'2', N'1234567890', N'1@gmail.com', CAST(309000 AS Decimal(18, 0)), NULL, NULL, N'b6920ff22d0c1eb8eaba1ce901f6c8c31978a0481c0060e36ede245cc0ba6fc9', 0, N'member')
INSERT [dbo].[ThongTinCaNhan] ([MaKH], [Ten], [SDT], [Email], [ThongTinChiTieu], [CapDoThe], [MaThe], [Matkhau], [DiemThuong], [Hang]) VALUES (5, N'anh ba', N'0123456789', N'hoangtungocnghech@gmail.com', CAST(0 AS Decimal(18, 0)), NULL, NULL, N'750eaf7d372992b844c8c1ab04c0ec8620de0b52241ef1e18419977209be01d8', 0, N'member')
INSERT [dbo].[ThongTinCaNhan] ([MaKH], [Ten], [SDT], [Email], [ThongTinChiTieu], [CapDoThe], [MaThe], [Matkhau], [DiemThuong], [Hang]) VALUES (6, N'anh bon', N'1111111111', N'2@gmail.com', CAST(0 AS Decimal(18, 0)), NULL, NULL, N'750eaf7d372992b844c8c1ab04c0ec8620de0b52241ef1e18419977209be01d8', 0, N'member')
INSERT [dbo].[ThongTinCaNhan] ([MaKH], [Ten], [SDT], [Email], [ThongTinChiTieu], [CapDoThe], [MaThe], [Matkhau], [DiemThuong], [Hang]) VALUES (7, N'anh nam 5 ngon tay', N'9999999999', N'3@gmail.com', CAST(0 AS Decimal(18, 0)), NULL, NULL, N'b6920ff22d0c1eb8eaba1ce901f6c8c31978a0481c0060e36ede245cc0ba6fc9', 0, N'member')
INSERT [dbo].[ThongTinCaNhan] ([MaKH], [Ten], [SDT], [Email], [ThongTinChiTieu], [CapDoThe], [MaThe], [Matkhau], [DiemThuong], [Hang]) VALUES (8, N'123', N'0000000000', N'thanhtroll0915@gmail.com', CAST(1610623 AS Decimal(18, 0)), NULL, NULL, N'b6920ff22d0c1eb8eaba1ce901f6c8c31978a0481c0060e36ede245cc0ba6fc9', 54, N'VVIP')
SET IDENTITY_INSERT [dbo].[ThongTinCaNhan] OFF
GO
SET IDENTITY_INSERT [dbo].[Tintuc] ON 

INSERT [dbo].[Tintuc] ([Matin], [Chudetin], [Ngaybatdau], [Ngayketthuc], [Mota], [Anhbia], [DieuKien], [ThoiHan]) VALUES (1, N'EARLY XMAS GIFTED – LY XMAS ĐỔI MÀU DIỆU KỲ.', CAST(N'2023-11-24' AS Date), CAST(N'2023-11-24' AS Date), N'1,500 Khách hàng thành viên đầu tiên tích lũy chi tiêu đủ từ 345,000 vnd các sản phẩm bắp, nước và merchandise trong thời gian trên nhận được 01 ly Xmas đổi màu.

- Mã coupon quà tặng tương ứng sẽ được tự động gửi vào tài khoản member của khách ngay sau khi đạt điều kiện tích lũy.

- Khách hàng mang theo mã coupon quà tặng đến rạp nhận quà dự kiến từ 11/12/2023.', N'new1.png', N'- Áp dụng tại các cụm rạp CGV trên toàn quốc.

- Áp dụng khi mua sản phẩm đồ ăn thức uống bắp nước và merchandise qua app CGV hoặc offline trực tiếp tại rạp và và có tích điểm thành viên.

- Chỉ áp dụng cho khách hàng là thành viên CGV.

- Mỗi khách hàng chỉ được tham gia bằng 01 tài khoản duy nhất.

- Mỗi tài khoản chỉ được tham gia chương trình 01 lần.

- Chỉ tính trên mỗi tài khoản riêng biệt, không gộp các tài khoản thành viên để tham gia chương trình.

- Đối với các giao dịch có áp dụng giảm giá CJ Membership, đổi điểm thành viên CGV và các chương trình giảm giá khác từ đối tác CGV chỉ tính tích lũy chi tiêu cho giá trị khách hàng thanh toán thực tế.

- CGV sẽ thông báo cập nhật thời gian nhận quà trên Fanpage CGV Cinemas Viet Nam nếu có thay đổi.

- Mẫu quà tặng ngẫu nhiên phụ thuộc vào số lượng tại rạp.

- Số lượng quà tặng có hạn Chương trình có thể kết thúc sớm ngay khi hết quà.

- Trong mọi trường hợp CGV là người quyết định cuối cùng.', N'Từ 24/11 đến 30/11 (hoặc kết thúc sớm hơn nếu hết quà tặng và sẽ được CGV cập nhật thông báo trên Fanpage CGV Cinemas VietNam)')
INSERT [dbo].[Tintuc] ([Matin], [Chudetin], [Ngaybatdau], [Ngayketthuc], [Mota], [Anhbia], [DieuKien], [ThoiHan]) VALUES (3, N'THẺ CỨNG “COME BACK”, GIAO DIỆN THẬT OÁCH!', CAST(N'2023-12-01' AS Date), CAST(N'2023-12-07' AS Date), N'Thẻ thành viên vật lý chính thức quay trở lại với giao diện hoàn toàn mới!


Gồm có 02 phiên bản: Tiêu Chuẩn và U22 - Hiện đang có mặt ở tất cả các rạp, phát hành miễn phí cho tất cả khách hàng mới tham gia chương trình khách hàng thân thiết. Nếu chưa phải là thành viên và mong muốn sở hữu thẻ cứng siêu chất, bạn hãy ghé rạp CGV để đăng ký và nhận thẻ ngay nhé!', N'new2.JPG', N'- Chương trình chỉ áp dụng cho thành viên mới đăng ký trực tiếp tại rạp (Quét mã QR đăng ký thành viên), không áp dụng cho những trường hợp đăng ký qua App hoặc website CGV.

- Ưu đãi không áp dụng cho những trường hợp khách hàng phát sinh giao dịch đầu tiên sau ngày đăng ký (VD: Bạn đăng ký thành viên mới ngày 26/10 và phát sinh giao dịch vào ngày 27/10 à sẽ không được áp dụng ưu đãi).

- Giao dịch hợp lệ là giao dịch có ghi nhận tích lũy điểm và tích lũy chi tiêu thành viên (Không áp dụng ưu đãi giảm giá vé từ các chương trình khuyến mại của của CGV và đối tác thứ 03).

- Giao dịch đầu tiên thực hiện trực tiếp tại rạp hoặc qua App/Website CGV, nhưng phải là rạp đã đăng ký tài khoản thành viên (VD: Nếu bạn quét mã QR đăng ký thành viên mới tại rạp Pearl Plaza, sau đó thực hiện giao dịch đầu tiên tại Vincom Đồng Khởi à Sẽ không được áp dụng ưu đãi).

- Giá trị giao dịch đầu tiên tối thiểu phải từ 50.000 VND.

- Mỗi tài khoản chỉ được nhận ưu đãi 01 lần duy nhất trong thời gian diễn ra chương trình.

- Chương trình có thể kết thúc sớm hơn dự kiến khi hết ngân sách mà không cần thông báo trước.

- Nhân viên CGV không được tham gia chương trình ưu đãi này.

- Trong mọi trường hợp, quyết định của CGV là quyết định cuối cùng. ', N'27/11/2023 cho đến khi có thông báo tiếp theo.')
INSERT [dbo].[Tintuc] ([Matin], [Chudetin], [Ngaybatdau], [Ngayketthuc], [Mota], [Anhbia], [DieuKien], [ThoiHan]) VALUES (4, N'T?I MYVIB, NH?N “ÐÚP” QUÀ 650K VÀ COUPON VÉ CGV 35K
', CAST(N'2023-12-08' AS Date), CAST(N'2023-12-14' AS Date), N'Tham gia chuong trình Piggy Bank trên ?ng d?ng MyVIB d? s? h?u t?i da 3 Coupon vé CGV ch? 35.000 VNÐ/vé', N'new3.JPG', NULL, NULL)
INSERT [dbo].[Tintuc] ([Matin], [Chudetin], [Ngaybatdau], [Ngayketthuc], [Mota], [Anhbia], [DieuKien], [ThoiHan]) VALUES (5, N'XEM TÍCH LUY PHIM HAY - NH?N NGAY VOUCHER VÉ !!!
', CAST(N'2023-12-15' AS Date), CAST(N'2023-12-21' AS Date), N'CGV choi l?n t?ng e-voucher vé free cho khách hàng tham gia chuong trình tr?i nghi?m phim Vi?t mùa cu?i nam. V?a xem phim “hot” v?a nh?n quà siêu thì quá là ?n áp không có nhung ha c? nhà. Xem ngay cách th?c tham gia bên du?i nàoooooo!', N'new4.png', NULL, NULL)
INSERT [dbo].[Tintuc] ([Matin], [Chudetin], [Ngaybatdau], [Ngayketthuc], [Mota], [Anhbia], [DieuKien], [ThoiHan]) VALUES (6, N'QUÀ T?NG PHIM QU? LÙN TINH NGH?CH ', CAST(N'2023-12-22' AS Date), CAST(N'2023-12-28' AS Date), N'Áp d?ng t?i các r?p CGV trên toàn qu?c.', N'new5.JPG', NULL, NULL)
INSERT [dbo].[Tintuc] ([Matin], [Chudetin], [Ngaybatdau], [Ngayketthuc], [Mota], [Anhbia], [DieuKien], [ThoiHan]) VALUES (7, N'K-DRAMA KHÁM PHÁ RA HÀN QU?C
', CAST(N'2023-12-29' AS Date), CAST(N'2024-01-04' AS Date), N'Tô?ng cu?c du li?ch Ha`n Quô´c ta?i Viê?t Nam (KTO), cu`ng su? dô`ng ha`nh cu?a CGV hòa vào làn sóng Hallyu t? ch?c event “K-Drama, Khám phá ra Hàn Qu?c”. N?u b?n là “m?t phim” K-Drama chính hi?u thì event l?n này chính là “sân choi” dành riêng cho b?n!! ', N'new6.jpg', NULL, NULL)
INSERT [dbo].[Tintuc] ([Matin], [Chudetin], [Ngaybatdau], [Ngayketthuc], [Mota], [Anhbia], [DieuKien], [ThoiHan]) VALUES (9, N'dang', CAST(N'2023-12-05' AS Date), CAST(N'2023-12-07' AS Date), N'hay', N'1.jpg', N'dep', N'duoc1')
SET IDENTITY_INSERT [dbo].[Tintuc] OFF
GO
SET IDENTITY_INSERT [dbo].[Voucher] ON 

INSERT [dbo].[Voucher] ([MaVoucher], [NgayHetHan], [GiamGiaPhanTram], [LoaiGiamGia], [MaVC], [TrangThai], [MaKH], [img]) VALUES (1, CAST(N'2024-03-03' AS Date), 10, N'Phim', N'20240302153045678ABC12', N'Đã sử dụng', 8, N'phim.jpg')
INSERT [dbo].[Voucher] ([MaVoucher], [NgayHetHan], [GiamGiaPhanTram], [LoaiGiamGia], [MaVC], [TrangThai], [MaKH], [img]) VALUES (2, CAST(N'2024-03-03' AS Date), 10, N'Combo', N'20240302153045678ABC13', N'Đã sử dụng', 8, N'combo.png')
INSERT [dbo].[Voucher] ([MaVoucher], [NgayHetHan], [GiamGiaPhanTram], [LoaiGiamGia], [MaVC], [TrangThai], [MaKH], [img]) VALUES (3, CAST(N'2024-04-01' AS Date), 5, N'Phim', N'202403021905550253FT34', N'Chưa sử dụng', 8, N'phim.jpg')
INSERT [dbo].[Voucher] ([MaVoucher], [NgayHetHan], [GiamGiaPhanTram], [LoaiGiamGia], [MaVC], [TrangThai], [MaKH], [img]) VALUES (4, CAST(N'2024-04-01' AS Date), 5, N'Phim', N'202403021906501202R5BT', N'Chưa sử dụng', 8, N'phim.jpg')
INSERT [dbo].[Voucher] ([MaVoucher], [NgayHetHan], [GiamGiaPhanTram], [LoaiGiamGia], [MaVC], [TrangThai], [MaKH], [img]) VALUES (5, CAST(N'2024-04-01' AS Date), 7, N'Phim', N'20240302191000148LO8AJ', N'Đã sử dụng', 8, N'phim.jpg')
INSERT [dbo].[Voucher] ([MaVoucher], [NgayHetHan], [GiamGiaPhanTram], [LoaiGiamGia], [MaVC], [TrangThai], [MaKH], [img]) VALUES (6, CAST(N'2024-04-01' AS Date), 7, N'Phim', N'20240302193340950RDRKW', N'Chưa sử dụng', 8, N'phim.jpg')
INSERT [dbo].[Voucher] ([MaVoucher], [NgayHetHan], [GiamGiaPhanTram], [LoaiGiamGia], [MaVC], [TrangThai], [MaKH], [img]) VALUES (7, CAST(N'2024-04-01' AS Date), 5, N'Phim', N'20240302194040071F1MN3', N'Chưa sử dụng', 8, N'phim.jpg')
INSERT [dbo].[Voucher] ([MaVoucher], [NgayHetHan], [GiamGiaPhanTram], [LoaiGiamGia], [MaVC], [TrangThai], [MaKH], [img]) VALUES (8, CAST(N'2024-04-01' AS Date), 7, N'Phim', N'2024030219432840620D9K', N'Chưa sử dụng', 8, N'phim.jpg')
INSERT [dbo].[Voucher] ([MaVoucher], [NgayHetHan], [GiamGiaPhanTram], [LoaiGiamGia], [MaVC], [TrangThai], [MaKH], [img]) VALUES (9, CAST(N'2024-04-01' AS Date), 5, N'Phim', N'20240302194536735VU3ZT', N'Chưa sử dụng', 8, N'phim.jpg')
INSERT [dbo].[Voucher] ([MaVoucher], [NgayHetHan], [GiamGiaPhanTram], [LoaiGiamGia], [MaVC], [TrangThai], [MaKH], [img]) VALUES (10, CAST(N'2024-04-28' AS Date), 10, N'Combo', N'20240329093709492SXPMS', N'Chưa sử dụng', 8, N'combo.png')
INSERT [dbo].[Voucher] ([MaVoucher], [NgayHetHan], [GiamGiaPhanTram], [LoaiGiamGia], [MaVC], [TrangThai], [MaKH], [img]) VALUES (11, CAST(N'2024-04-28' AS Date), 5, N'Combo', N'20240329093832664Y4X4R', N'Chưa sử dụng', 8, N'combo.png')
INSERT [dbo].[Voucher] ([MaVoucher], [NgayHetHan], [GiamGiaPhanTram], [LoaiGiamGia], [MaVC], [TrangThai], [MaKH], [img]) VALUES (12, CAST(N'2024-04-28' AS Date), 6, N'Phim', N'202403291014269658ZOK4', N'Chưa sử dụng', 8, N'phim.jpg')
INSERT [dbo].[Voucher] ([MaVoucher], [NgayHetHan], [GiamGiaPhanTram], [LoaiGiamGia], [MaVC], [TrangThai], [MaKH], [img]) VALUES (13, CAST(N'2024-04-28' AS Date), 6, N'Phim', N'20240329101742107BO6T1', N'Chưa sử dụng', 8, N'phim.jpg')
INSERT [dbo].[Voucher] ([MaVoucher], [NgayHetHan], [GiamGiaPhanTram], [LoaiGiamGia], [MaVC], [TrangThai], [MaKH], [img]) VALUES (14, CAST(N'2024-04-28' AS Date), 7, N'Phim', N'202403291032379679PKT2', N'Chưa sử dụng', 8, N'phim.jpg')
INSERT [dbo].[Voucher] ([MaVoucher], [NgayHetHan], [GiamGiaPhanTram], [LoaiGiamGia], [MaVC], [TrangThai], [MaKH], [img]) VALUES (16, CAST(N'2024-05-31' AS Date), 7, N'Phim', N'20240501201624389PYIA0', N'Chưa sử dụng', 4, N'phim.jpg')
SET IDENTITY_INSERT [dbo].[Voucher] OFF
GO
ALTER TABLE [dbo].[BinhLuan]  WITH CHECK ADD  CONSTRAINT [FK_BinhLuan_Phim] FOREIGN KEY([MaPhim])
REFERENCES [dbo].[Phim] ([MaPhim])
GO
ALTER TABLE [dbo].[BinhLuan] CHECK CONSTRAINT [FK_BinhLuan_Phim]
GO
ALTER TABLE [dbo].[BinhLuan]  WITH CHECK ADD  CONSTRAINT [FK_BinhLuan_ThongTinCaNhan] FOREIGN KEY([MaKH])
REFERENCES [dbo].[ThongTinCaNhan] ([MaKH])
GO
ALTER TABLE [dbo].[BinhLuan] CHECK CONSTRAINT [FK_BinhLuan_ThongTinCaNhan]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_Ghe] FOREIGN KEY([MaGhe])
REFERENCES [dbo].[Ghe] ([MaGhe])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_Ghe]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_HoaDon] FOREIGN KEY([MaHoaDon])
REFERENCES [dbo].[HoaDon] ([MaHoaDon])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_HoaDon]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_LichChieu] FOREIGN KEY([MaLichChieu])
REFERENCES [dbo].[LichChieu] ([MaChieuPhim])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_LichChieu]
GO
ALTER TABLE [dbo].[Combo]  WITH CHECK ADD  CONSTRAINT [FK_Combo_DoAn] FOREIGN KEY([MaDoAn])
REFERENCES [dbo].[DoAn] ([MaDoAn])
GO
ALTER TABLE [dbo].[Combo] CHECK CONSTRAINT [FK_Combo_DoAn]
GO
ALTER TABLE [dbo].[Combo]  WITH CHECK ADD  CONSTRAINT [FK_Combo_Nuoc] FOREIGN KEY([MaNuoc])
REFERENCES [dbo].[Nuoc] ([MaNuoc])
GO
ALTER TABLE [dbo].[Combo] CHECK CONSTRAINT [FK_Combo_Nuoc]
GO
ALTER TABLE [dbo].[CTHDComBo]  WITH CHECK ADD  CONSTRAINT [FK_CTHDComBo_Combo] FOREIGN KEY([MaCB])
REFERENCES [dbo].[Combo] ([MaCB])
GO
ALTER TABLE [dbo].[CTHDComBo] CHECK CONSTRAINT [FK_CTHDComBo_Combo]
GO
ALTER TABLE [dbo].[CTHDComBo]  WITH CHECK ADD  CONSTRAINT [FK_CTHDComBo_HoaDon] FOREIGN KEY([MaHoaDon])
REFERENCES [dbo].[HoaDon] ([MaHoaDon])
GO
ALTER TABLE [dbo].[CTHDComBo] CHECK CONSTRAINT [FK_CTHDComBo_HoaDon]
GO
ALTER TABLE [dbo].[Ghe]  WITH CHECK ADD  CONSTRAINT [FK_Ghe_Phong] FOREIGN KEY([MaPhong])
REFERENCES [dbo].[Phong] ([MaPhong])
GO
ALTER TABLE [dbo].[Ghe] CHECK CONSTRAINT [FK_Ghe_Phong]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_ThongTinCaNhan] FOREIGN KEY([MaKH])
REFERENCES [dbo].[ThongTinCaNhan] ([MaKH])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_ThongTinCaNhan]
GO
ALTER TABLE [dbo].[LichChieu]  WITH CHECK ADD  CONSTRAINT [FK_LichChieu_Phim] FOREIGN KEY([MaPhim])
REFERENCES [dbo].[Phim] ([MaPhim])
GO
ALTER TABLE [dbo].[LichChieu] CHECK CONSTRAINT [FK_LichChieu_Phim]
GO
ALTER TABLE [dbo].[LichChieu]  WITH CHECK ADD  CONSTRAINT [FK_LichChieu_Phong] FOREIGN KEY([Phong])
REFERENCES [dbo].[Phong] ([MaPhong])
GO
ALTER TABLE [dbo].[LichChieu] CHECK CONSTRAINT [FK_LichChieu_Phong]
GO
ALTER TABLE [dbo].[Phim]  WITH CHECK ADD  CONSTRAINT [FK_Phim_TheLoai] FOREIGN KEY([MaTheLoai])
REFERENCES [dbo].[TheLoai] ([MaTheLoai])
GO
ALTER TABLE [dbo].[Phim] CHECK CONSTRAINT [FK_Phim_TheLoai]
GO
ALTER TABLE [dbo].[ThongTinCaNhan]  WITH CHECK ADD  CONSTRAINT [FK_ThongTinCaNhan_TheThanhVien] FOREIGN KEY([MaThe])
REFERENCES [dbo].[TheThanhVien] ([SoThe])
GO
ALTER TABLE [dbo].[ThongTinCaNhan] CHECK CONSTRAINT [FK_ThongTinCaNhan_TheThanhVien]
GO
ALTER TABLE [dbo].[Voucher]  WITH CHECK ADD  CONSTRAINT [FK_Voucher_ThongTinCaNhan] FOREIGN KEY([MaKH])
REFERENCES [dbo].[ThongTinCaNhan] ([MaKH])
GO
ALTER TABLE [dbo].[Voucher] CHECK CONSTRAINT [FK_Voucher_ThongTinCaNhan]
GO
USE [master]
GO
ALTER DATABASE [Cinema] SET  READ_WRITE 
GO
