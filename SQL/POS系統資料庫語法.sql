﻿--查詢外鍵
SELECT 
    fk.name AS ForeignKeyName, 
    tp.name AS ParentTable, 
    cp.name AS ParentColumn, 
    tr.name AS ReferencedTable, 
    cr.name AS ReferencedColumn
FROM 
    sys.foreign_keys AS fk
INNER JOIN 
    sys.foreign_key_columns AS fkc ON fk.object_id = fkc.constraint_object_id
INNER JOIN 
    sys.tables AS tp ON fk.parent_object_id = tp.object_id
INNER JOIN 
    sys.columns AS cp ON fkc.parent_column_id = cp.column_id AND fkc.parent_object_id = cp.object_id
INNER JOIN 
    sys.tables AS tr ON fk.referenced_object_id = tr.object_id
INNER JOIN 
    sys.columns AS cr ON fkc.referenced_column_id = cr.column_id AND fkc.referenced_object_id = cr.object_id
ORDER BY 
    ParentTable, ForeignKeyName;

---------------------------------------------------------------------------


--建立測試資料庫
CREATE DATABASE CavalierTEST;
GO
--建立員工資料表
CREATE TABLE Employee (
    Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,        -- 自動新增唯一鍵，改為 Id
    Code NVARCHAR(20) NOT NULL UNIQUE,                -- 新增客戶編號欄位（唯一鍵）
    FirstName NVARCHAR(30) NOT NULL,                   -- 名字
    LastName NVARCHAR(30) NOT NULL,                    -- 姓氏
    Sex BIT NOT NULL,                                  -- 性別 (0 或 1)
    BirthDate DATE NOT NULL,                           -- 出生日期，改為 BirthDate
    Level VARCHAR(1) NOT NULL,                         -- 級別
    JoinDate DATETIME NOT NULL DEFAULT GETDATE(),      -- 加入日期，初次寫入時自動填入當下時間
    LastLoginTime DATETIME NOT NULL,                   -- 最後登入時間
    Comment NVARCHAR(120) NULL,                        -- 備註
    Position NVARCHAR(50) NOT NULL,                    -- 職位
    Department NVARCHAR(50) NOT NULL,                  -- 部門
    Phone VARCHAR(15) NULL,                            -- 電話
    Email NVARCHAR(100) NULL,                          -- 電子郵件
    Address NVARCHAR(200) NULL,                        -- 地址
    EmergencyContactName NVARCHAR(50) NULL,            -- 緊急聯絡人姓名
    EmergencyContactPhone VARCHAR(15) NULL,            -- 緊急聯絡人電話
    SalaryGrade VARCHAR(5) NULL                        -- 薪資等級，允許 NULL
);
GO



--移除員工表
--DROP TABLE Employee;
--GO


SELECT * FROM Employee

--建立客戶表
CREATE TABLE Customer (
    Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,       -- 客戶唯一編號，改為 Id
    Code NVARCHAR(20) NOT NULL UNIQUE,                -- 客戶編號（唯一鍵）
    FirstName NVARCHAR(30) NOT NULL,                  -- 名字
    LastName NVARCHAR(30) NOT NULL,                   -- 姓氏
    BirthDate DATE NULL,                              -- 出生日期
    Sex BIT NOT NULL,                                 -- 性別 (0 或 1)
    Phone VARCHAR(15) NULL,                           -- 電話
    Email NVARCHAR(100) NULL,                         -- 電子郵件
    Address NVARCHAR(200) NULL,                       -- 地址
    City NVARCHAR(50) NULL,                           -- 城市
    Country NVARCHAR(50) NULL,                        -- 國家
    RegistrationDate DATETIME NOT NULL DEFAULT GETDATE(), -- 註冊日期
    LastPurchaseDate DATETIME NULL,                   -- 最後購買日期
    CustomerLevel NVARCHAR(20) NULL,                  -- 客戶級別
    Comments NVARCHAR(255) NULL,                      -- 備註
    Status BIT NOT NULL DEFAULT 1                     -- 客戶狀態，預設為 1 (正常)
);
GO

--移除客戶表
--DROP TABLE Customer;
--GO

--建立廠商表
CREATE TABLE Supplier (
    Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,         -- 廠商唯一編號
    Code NVARCHAR(20) NOT NULL UNIQUE,                 -- 廠商代碼（唯一鍵）
    Name NVARCHAR(100) NOT NULL,                       -- 廠商名稱
    ContactPerson NVARCHAR(50) NULL,                   -- 聯絡人姓名
    Phone VARCHAR(15) NULL,                            -- 聯絡電話
    Email NVARCHAR(100) NULL,                          -- 聯絡電子郵件
    Address NVARCHAR(200) NULL,                        -- 廠商地址
    City NVARCHAR(50) NULL,                            -- 城市
    Country NVARCHAR(50) NULL,                         -- 國家
    Website NVARCHAR(100) NULL,                        -- 廠商網站
    BusinessType NVARCHAR(50) NULL,                    -- 廠商類型
    TaxId NVARCHAR(20) NULL,                           -- 稅務編號
    PaymentTerms NVARCHAR(100) NULL,                   -- 付款條件
    Status BIT NOT NULL DEFAULT 1,                     -- 廠商狀態（1為啟用，0為停用）
    JoinDate DATETIME NOT NULL DEFAULT GETDATE(),      -- 廠商加入日期
    Comments NVARCHAR(255) NULL,                       -- 備註
    Barcode NVARCHAR(2) NOT NULL DEFAULT '' UNIQUE     -- 條碼編號（唯一鍵）
);
GO


--移除廠商表
--DROP TABLE Supplier;
--GO


--建立商品表
CREATE TABLE Product (
    Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,       -- 商品編號
    Code NVARCHAR(20) NOT NULL,                     -- 商品代號
    Name NVARCHAR(100) NOT NULL,                    -- 商品名稱
    Description NVARCHAR(MAX) NULL,                 -- 商品描述
    Category NVARCHAR(50) NOT NULL,                 -- 商品分類
    AddedDate DATETIME NOT NULL DEFAULT GETDATE(),  -- 上架日期
    ImageUrl NVARCHAR(255) NULL,                    -- 主圖片 URL
    Status NVARCHAR(20) NOT NULL DEFAULT 'Available',-- 商品狀態
    SupplierId INT NULL,                            -- 供應商編號 (外鍵)
    CONSTRAINT FK_Product_Id_Supplier_Id FOREIGN KEY (SupplierId) REFERENCES Supplier(Id)
);
GO

--移除商品表
--DROP TABLE Product;
--GO

--建立商品明細表
CREATE TABLE ProductDetail (
    Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,       -- 變體編號
	DetailName NVARCHAR(100) NOT NULL DEFAULT '',
    ProductId INT NOT NULL,                          -- 關聯的主商品 ID
    Size NVARCHAR(10) NULL,                          -- 尺寸
    Color NVARCHAR(30) NULL,                         -- 主顏色
    SubColor NVARCHAR(30) NULL,                      -- 副顏色
    CostPrice DECIMAL(10, 2) NOT NULL,               -- 進貨價格
    RetailPrice DECIMAL(10, 2) NOT NULL,             -- 建議售價
    Stock INT NOT NULL DEFAULT 0,                    -- 庫存量
    Barcode NVARCHAR(50) NOT NULL,                   -- 條碼
    ImageUrl NVARCHAR(255) NULL,                     -- 變體的圖片 URL
    Status NVARCHAR(20) NOT NULL DEFAULT 'Available',-- 變體狀態
    CONSTRAINT FK_ProductDetail_ProductId_Product_Id 
        FOREIGN KEY (ProductId) REFERENCES Product(Id)
);

--移除商品明細表
--DROP TABLE ProductDetail;
--GO

--建立訂單表
CREATE TABLE Orders (
    Id INT IDENTITY(1,1) PRIMARY KEY,                -- 訂單唯一編號
    OrderNumber NVARCHAR(20) NOT NULL UNIQUE,        -- 訂單編號
    CustomerId INT NOT NULL,                         -- 客戶編號，外鑑
    OrderDate DATETIME NOT NULL DEFAULT GETDATE(),   -- 訂單日期
    TotalAmount DECIMAL(10, 2) NOT NULL DEFAULT 0,   -- 訂單總金額
    Points INT NOT NULL DEFAULT 0,                   -- 點數
    Status NVARCHAR(20) NOT NULL,                    -- 訂單狀態（例如：Pending, Completed）
    PaymentMethod NVARCHAR(20) NOT NULL,             -- 支付方式
    ShippingAddress NVARCHAR(255) NULL,              -- 寄送地址，允許 NULL
    BillingAddress NVARCHAR(255) NULL,               -- 帳單地址，允許 NULL
    InvoiceNumber NVARCHAR(50) NULL,                 -- 發票號碼，允許 NULL
    Notes NVARCHAR(255) NULL,                        -- 訂單備註
    CreatedDate DATETIME NOT NULL DEFAULT GETDATE(), -- 訂單建立日期
    UpdatedDate DATETIME NULL,                       -- 訂單最後更新日期
    CONSTRAINT FK_Orders_Id_Customer_Id FOREIGN KEY (CustomerId) REFERENCES Customer(Id) -- 外鑑至 Customers 表
);

--移除訂單表
--DROP TABLE Orders;
--GO


--建立訂單明細表
CREATE TABLE OrderDetails (
    Id INT IDENTITY(1,1) PRIMARY KEY,                -- 訂單明細唯一編號
    OrderId INT NOT NULL,                            -- 關聯的訂單編號
    ProductDetailId INT NOT NULL,                    -- 商品詳細編號（原 VariantId）
    Quantity INT NOT NULL CHECK (Quantity > 0),      -- 購買數量，需為正數
    UnitPrice DECIMAL(10, 2) NOT NULL,               -- 單價
    AfterDiscountPrice DECIMAL(10, 2) NULL DEFAULT 0, -- 折扣後價格，預設為 0
    CONSTRAINT FK_OrderDetails_OrderId_Order_Id FOREIGN KEY (OrderId) REFERENCES Orders(Id), -- 外鑑至 Orders 表
    CONSTRAINT FK_OrderDetails_ProductDetailId_ProductDetail_Id FOREIGN KEY (ProductDetailId) REFERENCES ProductDetail(Id) -- 外鑑至變體表
);

--移除訂單表
--DROP TABLE Orders;
--GO

---建立系統紀錄表
CREATE TABLE Logs (
    Id INT IDENTITY(1,1) PRIMARY KEY,               -- 唯一標識每條 Log 訊息
    Timestamp DATETIME NOT NULL DEFAULT GETDATE(),  -- 操作發生時間
    EmployeeId INT NOT NULL,                        -- 操作者 ID，不可為 NULL
    Action NVARCHAR(50) NOT NULL,                  -- 操作類型
    TableName NVARCHAR(50) NOT NULL,               -- 操作的目標表
    RecordId INT NULL,                             -- 被操作的記錄 ID
    Details NVARCHAR(MAX) NULL,                    -- 操作的詳細描述
    ClientIp NVARCHAR(45) NULL,                    -- 客戶端 IP 地址
    ServerName NVARCHAR(50) NULL,                  -- 伺服器名稱
    ExecutedBy NVARCHAR(50) NULL,                  -- 操作來源描述
    CONSTRAINT FK_Logs_Employee FOREIGN KEY (EmployeeId) REFERENCES Employee(Id) -- 外鍵關聯至 Employee 表
);


---建立參數表

CREATE TABLE Parameters (
    Id           INT IDENTITY(1,1) PRIMARY KEY,  -- 主鍵，自增
    ParentId     INT NULL,  -- 父級參數 ID（指向自身 Id）
    Code         NVARCHAR(50) NOT NULL,  -- 參數代碼
    Name         NVARCHAR(100) NOT NULL,  -- 參數名稱
    Value        NVARCHAR(255) NULL,  -- 參數值（若為顏色，存 HEX 色碼）
    Type         NVARCHAR(50) NULL,  -- 參數類型
    Description  NVARCHAR(255) NULL,  -- 參數描述
    Category     NVARCHAR(50) NULL,  -- 參數分類（父類別名稱）
    Status       TINYINT DEFAULT 1 NOT NULL,  -- 參數狀態（1=啟用, 0=停用）
    BarCode      NVARCHAR(50) NOT NULL DEFAULT '',  -- 條碼（唯一標識碼）
    CreatedDate  DATETIME DEFAULT GETDATE() NOT NULL,  -- 建立時間
    UpdatedDate  DATETIME DEFAULT GETDATE() NOT NULL,  -- 更新時間
    CONSTRAINT UQ_Parameters_Category_BarCode UNIQUE (Category, BarCode) -- 設置 Category + BarCode 為唯一鍵
);
