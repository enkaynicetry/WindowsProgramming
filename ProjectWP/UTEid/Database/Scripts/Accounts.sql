USE UTEid;
GO

-- 1. Xóa bảng cũ nếu đã tồn tại để tránh lỗi trùng lặp khi chạy lại
DROP TABLE IF EXISTS Accounts;
GO

-- 2. Tạo cấu trúc bảng với độ dài Password đủ cho mã băm (100 ký tự)
CREATE TABLE Accounts (
    id INT IDENTITY(1,1) PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    role INT NOT NULL -- 0: Admin, 1: Sinh viên
);
GO

-- 3. Thêm các tài khoản ĐẶC BIỆT (Đã băm mật khẩu)
-- admin123 -> 240be518ebb21465334888be00803981ed37f6a73ef5e024190e3869a84a6a57
-- 123456   -> 8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92
INSERT INTO Accounts (username, password, role)
VALUES 
('admin', '240be518ebb21465334888be00803981ed37f6a73ef5e024190e3869a84a6a57', 0),
('24110102', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 1),
('24110142', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 1);
GO

-- 4. Thêm 50 tài khoản SINH VIÊN ẢO (Mật khẩu mặc định: 123456 đã băm)
DECLARE @i INT = 1;
DECLARE @mssv INT;

WHILE @i <= 50
BEGIN
    SET @mssv = 24110000 + @i;

    INSERT INTO Accounts (username, password, role)
    VALUES (
        CAST(@mssv AS VARCHAR(50)), 
        '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 
        1
    );

    SET @i = @i + 1;
END;
GO

-- 5. Kiểm tra kết quả
SELECT * FROM Accounts;
GO