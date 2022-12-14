DROP DATABASE QuanAoNam
USE QuanAoNam
CREATE TABLE ChucVuAccount(
Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
Ma NVARCHAR(100) NOT NULL,
Ten NVARCHAR(200) NOT NULL
)
CREATE TABLE TrangThaiAccount(
Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
Ma NVARCHAR(100) NOT NULL,
Ten NVARCHAR(200) NOT NULL
)
CREATE TABLE Account(
Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
IdCV INT NOT NULL,
IdTT INT NOT NULL,
HoTen NVARCHAR(300) NOT NULL,
NgaySinh DATE NOT NULL,
GioiTinh BIT NOT NULL,
SDT NVARCHAR(12) NOT NULL,
DiaChi NVARCHAR(MAX) NOT NULL,
Email NVARCHAR(300) NOT NULL,
Username NVARCHAR(200) NOT NULL,
[Password] NVARCHAR(200) NOT NULL,
NgayTao DATE NOT NULL,
NguoiTao UNIQUEIDENTIFIER NOT NULL,
NgayChinhSua DATE,
NguoiChinhSua UNIQUEIDENTIFIER
CONSTRAINT FK_IdCV FOREIGN KEY (IdCV) REFERENCES ChucVuAccount(Id),
CONSTRAINT FK_IdTT FOREIGN KEY (IdTT) REFERENCES TrangThaiAccount(Id)
)
CREATE TABLE KhachHang(
Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
HoTen NVARCHAR(300) NOT NULL,
NgaySinh DATE NOT NULL,
GioiTinh BIT NOT NULL,
SDT NVARCHAR(12) NOT NULL,
DiaChi NVARCHAR(MAX) NOT NULL,
Email NVARCHAR(300) NOT NULL,
NgayTao DATE NOT NULL,
NguoiTao UNIQUEIDENTIFIER NOT NULL,
NgayChinhSua DATE,
NguoiChinhSua UNIQUEIDENTIFIER
)
CREATE TABLE TrangThaiOrder(
Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
Ma NVARCHAR(100) NOT NULL,
Ten NVARCHAR(200) NOT NULL
)
CREATE TABLE HoaDon(
Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
IdAcc UNIQUEIDENTIFIER NOT NULL,
IdKH UNIQUEIDENTIFIER,
IdTT INT NOT NULL,
NgayTao DATE NOT NULL,
NgayThanhToan DATE,
NgayShip DATE,
NgayKhachNhan DATE,
TongTien MONEY NOT NULL,
NgayChinhSua DATE,
NguoiChinhSua UNIQUEIDENTIFIER
CONSTRAINT FK_IdAcc FOREIGN KEY (IdAcc) REFERENCES Account(Id),
CONSTRAINT FK_IdKH FOREIGN KEY (IdKH) REFERENCES KhachHang(Id),
CONSTRAINT FK_IdTTO FOREIGN KEY (IdTT) REFERENCES TrangThaiOrder(Id),
)
CREATE TABLE TrangThaiKM(
Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
Ma NVARCHAR(100) NOT NULL,
Ten NVARCHAR(200) NOT NULL
)
CREATE TABLE LoaiKM(
Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
Ma NVARCHAR(100) NOT NULL,
Ten NVARCHAR(200) NOT NULL
)
CREATE TABLE KhuyenMai(
Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
IdTT INT NOT NULL,
IdLoai INT NOT NULL,
Ma NVARCHAR(20) NOT NULL,
Ten NVARCHAR(400) NOT NULL,
NgayBatDau DATE NOT NULL,
NgayKetThuc DATE NOT NULL,
GiaKM FLOAT NOT NULL,
LoaiSanPham INT
CONSTRAINT FK_IdLoai FOREIGN KEY (IdLoai) REFERENCES LoaiKM(Id),
CONSTRAINT FK_IdTTKM FOREIGN KEY (IdTT) REFERENCES TrangThaiKM(Id),
)
CREATE TABLE SanPham(
Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
Ma NVARCHAR(20) NOT NULL,
TenSP NVARCHAR(300) NOT NULL,
NgayTao DATE NOT NULL,
)
CREATE TABLE MauSac(
Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
Ma NVARCHAR(20) NOT NULL,
Ten NVARCHAR(300) NOT NULL,
)
CREATE TABLE Hang(
Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
Ma NVARCHAR(20) NOT NULL,
Ten NVARCHAR(300) NOT NULL,
)
CREATE TABLE KichCo(
Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
Ma NVARCHAR(20) NOT NULL,
Ten NVARCHAR(300) NOT NULL,
)
CREATE TABLE ChatLieu(
Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
Ma NVARCHAR(20) NOT NULL,
Ten NVARCHAR(300) NOT NULL,
)
CREATE TABLE Loai(
Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
Ma NVARCHAR(20) NOT NULL,
Ten NVARCHAR(300) NOT NULL,
)
CREATE TABLE ChiTietSanPham(
Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
IdSP UNIQUEIDENTIFIER NOT NULL,
IdMauSac INT NOT NULL,
IdHang INT NOT NULL,
IdKichCo INT NOT NULL,
IdChatLieu INT NOT NULL,
IdLoai INT NOT NULL,
IdKM UNIQUEIDENTIFIER,
SoLuongTon INT NOT NULL,
Gia MONEY NOT NULL,
NgayNhap DATE NOT NULL,
NgayChinhSua DATE,
CONSTRAINT FK_IdSP FOREIGN KEY (IdSP) REFERENCES SanPham(Id),
CONSTRAINT FK_IdMS FOREIGN KEY (IdMauSac) REFERENCES MauSac(Id),
CONSTRAINT FK_IdHang FOREIGN KEY (IdHang) REFERENCES Hang(Id),
CONSTRAINT FK_IdKichCo FOREIGN KEY (IdKichCo) REFERENCES KichCo(Id),
CONSTRAINT FK_IdChatLieu FOREIGN KEY (IdChatLieu) REFERENCES ChatLieu(Id),
CONSTRAINT FK_IdLoaiSP FOREIGN KEY (IdLoai) REFERENCES Loai(Id),
CONSTRAINT FK_IdKM FOREIGN KEY (IdKM) REFERENCES KhuyenMai(Id),
)

CREATE TABLE HoaDonChiTiet(
IdCTSP UNIQUEIDENTIFIER NOT NULL,
IdHoaDon UNIQUEIDENTIFIER NOT NULL,
TenSP NVARCHAR(300) NOT NULL,
MauSac NVARCHAR(300) NOT NULL,
Hang NVARCHAR(300) NOT NULL,
Loai NVARCHAR(300) NOT NULL,
KichCo NVARCHAR(300) NOT NULL,
ChatLieu NVARCHAR(300) NOT NULL,
SoLuong INT NOT NULL,
DonGia MONEY NOT NULL
CONSTRAINT PK_IdCTSP_IdHD PRIMARY KEY (IdCTSP,IdHoaDon),
CONSTRAINT FK_IdCTSP FOREIGN KEY (IdCTSP) REFERENCES ChiTietSanPham(Id),
CONSTRAINT FK_IdHD FOREIGN KEY (IdHoaDon) REFERENCES HoaDon(Id)
)
CREATE TABLE GioHang(
Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
IdKH UNIQUEIDENTIFIER,
TongTien MONEY NOT NULL
CONSTRAINT FK_IdGHKH FOREIGN KEY (IdKH) REFERENCES KhachHang(Id),
)
CREATE TABLE GioHangChiTiet(
IdCTSP UNIQUEIDENTIFIER NOT NULL,
IdGioHang UNIQUEIDENTIFIER NOT NULL,
TenSP NVARCHAR(300) NOT NULL,
MauSac NVARCHAR(300) NOT NULL,
Hang NVARCHAR(300) NOT NULL,
Loai NVARCHAR(300) NOT NULL,
KichCo NVARCHAR(300) NOT NULL,
ChatLieu NVARCHAR(300) NOT NULL,
SoLuong INT NOT NULL,
DonGia MONEY NOT NULL
CONSTRAINT PK_IdCTSP_IdGH PRIMARY KEY (IdCTSP,IdGioHang),
CONSTRAINT FK_IdCTSPGH FOREIGN KEY (IdCTSP) REFERENCES ChiTietSanPham(Id),
CONSTRAINT FK_IdGH FOREIGN KEY (IdGioHang) REFERENCES GioHang(Id)
)
CREATE TABLE HoaDonTra(
Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
IdKH UNIQUEIDENTIFIER,
IdAcc UNIQUEIDENTIFIER NOT NULL,
NgayTao DATE NOT NULL,
NgayThanhToan DATE,
TongTien MONEY NOT NULL
CONSTRAINT FK_IdHDTAcc FOREIGN KEY (IdAcc) REFERENCES Account(Id),
CONSTRAINT FK_IdHDTKH FOREIGN KEY (IdKH) REFERENCES KhachHang(Id)
)
CREATE TABLE ChiTietTraHang(
IdCTSP UNIQUEIDENTIFIER NOT NULL,
IdHDT UNIQUEIDENTIFIER NOT NULL,
TenSP NVARCHAR(300) NOT NULL,
MauSac NVARCHAR(300) NOT NULL,
Hang NVARCHAR(300) NOT NULL,
Loai NVARCHAR(300) NOT NULL,
KichCo NVARCHAR(300) NOT NULL,
ChatLieu NVARCHAR(300) NOT NULL,
SoLuong INT NOT NULL,
DonGia MONEY NOT NULL
CONSTRAINT PK_IdCTSP_IdHDT PRIMARY KEY (IdCTSP,IdHDT),
CONSTRAINT FK_IdHDTCTSP FOREIGN KEY (IdCTSP) REFERENCES ChiTietSanPham(Id),
CONSTRAINT FK_IdHDT FOREIGN KEY (IdHDT) REFERENCES HoaDonTra(Id)
)
