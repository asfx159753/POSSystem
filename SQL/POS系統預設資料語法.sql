SELECT * FROM Supplier


---預設執行語句
INSERT INTO Supplier (Code, Name, ContactPerson, Phone, Email, Address, City, Country, Website, BusinessType, TaxId, PaymentTerms, Status, Comments,Barcode)
VALUES 
('HYOD', N'株式会社ヒョウドウプロダクツ', NULL, '053-465-8281', 'info@hyod-products.com', N'静岡県浜松市中央区市野町2732', N'浜松市', N'日本 / Japan', 'https://www.hyod-products.com/', NULL, NULL, NULL, 1, 'HYOD官方供應商','66');


INSERT INTO Supplier (
    Code, Name, ContactPerson, Phone, Email, Address, City, Country, Website, BusinessType, TaxId, PaymentTerms, Status, Comments,Barcode
)
VALUES (
    'DACHIAO', N'大橋機車生活精品館', NULL, '02-2591-9636', 'shoeitaiwan1022@gmail.com', N'台北市大同區延平北路三段128號', N'台北市', N'台灣 / Taiwan', 'https://www.dachiao.com.tw/', NULL, NULL, NULL, 1, 'SHOEI Taiwan 總代理','02'
);


INSERT INTO Supplier (
    Code, Name, ContactPerson, Phone, Email, Address, City, Country, Website, BusinessType, TaxId, PaymentTerms, Status, Comments,Barcode
)
VALUES (
    'SPCONNECT', 'SP Connect', NULL, NULL, NULL, NULL, NULL, N'奧地利 / Austria', 'https://sp-connect.com/', NULL, NULL, NULL, 1, 'Smartphone mounting solutions','10'
);


INSERT INTO Supplier (Code, Name, ContactPerson, Phone, Email, Address, City, Country, Website, BusinessType, TaxId, PaymentTerms, Status, Comments, Barcode)
VALUES
('NAGANO', N'長野車業', NULL, '02-2502-8877', 'info1.dyno@msa.hinet.net', N'台北市中山區松江路477號', N'台北市', N'台灣 / Taiwan', 'http://www.2wheel.com.tw/', NULL, '80524578', NULL, 1, '長野車業官方供應商', '09');

INSERT INTO Supplier (Code, Name, ContactPerson, Phone, Email, Address, City, Country, Website, BusinessType, TaxId, PaymentTerms, Status, Comments, Barcode)
VALUES
('ERLIN', N'二霖有限公司', NULL, '02-2597-3365', NULL, N'台北市大同區承德路三段200號', N'台北市', N'台灣 / Taiwan', 'https://erlin.tw/', NULL, NULL, NULL, 1, 'Nolan安全帽、X-Lite安全帽、Belray機油台灣總代理', '11');



-- 插入父類別，Category 設為 NULL，表示它們是最高層級
INSERT INTO Parameters (Code, Name, Value, Type, Description, Category, ParentId, BarCode)  
VALUES 
('COLOR', N'顏色', NULL, NULL, N'顏色類別', 'Parent', NULL, 'COLOR'),
('SIZE', N'尺寸', NULL, NULL, N'尺寸類別', 'Parent', NULL, 'SIZE'),
('PRODUCT_TYPE', N'商品種類', NULL, NULL, N'商品分類', 'Parent', NULL, 'PRODUCT_TYPE'),
('UNIT', N'單位', NULL, NULL, N'商品使用的單位', 'Parent', NULL, 'UNIT');

--新增顏色的子項
INSERT INTO Parameters (ParentId, Code, Name, Value, Type, Description, Category, Status, BarCode, CreatedDate, UpdatedDate)
VALUES
    (1, 'WHITE', '白色', '#FFFFFF', NULL, '純白色', 'COLOR', 1, 'FF', GETDATE(), GETDATE()),
    (1, 'RED', '紅色', '#FF0000', NULL, '鮮紅色', 'COLOR', 1, '01', GETDATE(), GETDATE()),
    (1, 'ORANGE', '橙色', '#FFA500', NULL, '亮橙色', 'COLOR', 1, '02', GETDATE(), GETDATE()),
    (1, 'YELLOW', '黃色', '#FFFF00', NULL, '鮮黃色', 'COLOR', 1, '03', GETDATE(), GETDATE()),
    (1, 'GREEN', '綠色', '#008000', NULL, '深綠色', 'COLOR', 1, '04', GETDATE(), GETDATE()),
    (1, 'BLUE', '藍色', '#0000FF', NULL, '純藍色', 'COLOR', 1, '05', GETDATE(), GETDATE()),
    (1, 'INDIGO', '靛色', '#4B0082', NULL, '深靛色', 'COLOR', 1, '06', GETDATE(), GETDATE()),
    (1, 'VIOLET', '紫色', '#800080', NULL, '純紫色', 'COLOR', 1, '07', GETDATE(), GETDATE()),
    (1, 'BLACK', '黑色', '#000000', NULL, '純黑色', 'COLOR', 1, '08', GETDATE(), GETDATE()),
    (1, 'GRAY', '灰色', '#808080', NULL, '中性灰色', 'COLOR', 1, '09', GETDATE(), GETDATE());

-- 新增尺寸的子項 (公分尺寸 220 ~ 295)
INSERT INTO Parameters (ParentId, Code, Name, Value, Type, Description, Category, Status, BarCode, CreatedDate, UpdatedDate)
VALUES
    (2, '220', '22.0公分', '22.0', NULL, '22.0公分', 'SHOES_SIZE_JP', 1, '220', GETDATE(), GETDATE()),
    (2, '225', '22.5公分', '22.5', NULL, '22.5公分', 'SHOES_SIZE_JP', 1, '225', GETDATE(), GETDATE()),
    (2, '230', '23.0公分', '23.0', NULL, '23.0公分', 'SHOES_SIZE_JP', 1, '230', GETDATE(), GETDATE()),
    (2, '235', '23.5公分', '23.5', NULL, '23.5公分', 'SHOES_SIZE_JP', 1, '235', GETDATE(), GETDATE()),
    (2, '240', '24.0公分', '24.0', NULL, '24.0公分', 'SHOES_SIZE_JP', 1, '240', GETDATE(), GETDATE()),
    (2, '245', '24.5公分', '24.5', NULL, '24.5公分', 'SHOES_SIZE_JP', 1, '245', GETDATE(), GETDATE()),
    (2, '250', '25.0公分', '25.0', NULL, '25.0公分', 'SHOES_SIZE_JP', 1, '250', GETDATE(), GETDATE()),
    (2, '255', '25.5公分', '25.5', NULL, '25.5公分', 'SHOES_SIZE_JP', 1, '255', GETDATE(), GETDATE()),
    (2, '260', '26.0公分', '26.0', NULL, '26.0公分', 'SHOES_SIZE_JP', 1, '260', GETDATE(), GETDATE()),
    (2, '265', '26.5公分', '26.5', NULL, '26.5公分', 'SHOES_SIZE_JP', 1, '265', GETDATE(), GETDATE()),
    (2, '270', '27.0公分', '27.0', NULL, '27.0公分', 'SHOES_SIZE_JP', 1, '270', GETDATE(), GETDATE()),
    (2, '275', '27.5公分', '27.5', NULL, '27.5公分', 'SHOES_SIZE_JP', 1, '275', GETDATE(), GETDATE()),
    (2, '280', '28.0公分', '28.0', NULL, '28.0公分', 'SHOES_SIZE_JP', 1, '280', GETDATE(), GETDATE()),
    (2, '285', '28.5公分', '28.5', NULL, '28.5公分', 'SHOES_SIZE_JP', 1, '285', GETDATE(), GETDATE()),
    (2, '290', '29.0公分', '29.0', NULL, '29.0公分', 'SHOES_SIZE_JP', 1, '290', GETDATE(), GETDATE()),
    (2, '295', '29.5公分', '29.5', NULL, '29.5公分', 'SHOES_SIZE_JP', 1, '295', GETDATE(), GETDATE());



-- 新增尺寸的子項 (歐美尺寸)
INSERT INTO Parameters (ParentId, Code, Name, Value, Type, Description, Category, Status, BarCode, CreatedDate, UpdatedDate)
VALUES
    (2, '035', 'EU35', '35', NULL, 'EU35號', 'SHOES_SIZE_EU', 1, '035', GETDATE(), GETDATE()),
    (2, '036', 'EU36', '36', NULL, 'EU36號', 'SHOES_SIZE_EU', 1, '036', GETDATE(), GETDATE()),
    (2, '037', 'EU37', '37', NULL, 'EU37號', 'SHOES_SIZE_EU', 1, '037', GETDATE(), GETDATE()),
    (2, '038', 'EU38', '38', NULL, 'EU38號', 'SHOES_SIZE_EU', 1, '038', GETDATE(), GETDATE()),
    (2, '039', 'EU39', '39', NULL, 'EU39號', 'SHOES_SIZE_EU', 1, '039', GETDATE(), GETDATE()),
    (2, '040', 'EU40', '40', NULL, 'EU40號', 'SHOES_SIZE_EU', 1, '040', GETDATE(), GETDATE()),
    (2, '041', 'EU41', '41', NULL, 'EU41號', 'SHOES_SIZE_EU', 1, '041', GETDATE(), GETDATE()),
    (2, '042', 'EU42', '42', NULL, 'EU42號', 'SHOES_SIZE_EU', 1, '042', GETDATE(), GETDATE()),
    (2, '043', 'EU43', '43', NULL, 'EU43號', 'SHOES_SIZE_EU', 1, '043', GETDATE(), GETDATE()),
    (2, '044', 'EU44', '44', NULL, 'EU44號', 'SHOES_SIZE_EU', 1, '044', GETDATE(), GETDATE()),
    (2, '045', 'EU45', '45', NULL, 'EU45號', 'SHOES_SIZE_EU', 1, '045', GETDATE(), GETDATE()),
    (2, '046', 'EU46', '46', NULL, 'EU46號', 'SHOES_SIZE_EU', 1, '046', GETDATE(), GETDATE()),
    (2, '047', 'EU47', '47', NULL, 'EU47號', 'SHOES_SIZE_EU', 1, '047', GETDATE(), GETDATE()),
    (2, '048', 'EU48', '48', NULL, 'EU48號', 'SHOES_SIZE_EU', 1, '048', GETDATE(), GETDATE());


-- 新增公用尺寸的子項
INSERT INTO Parameters (ParentId, Code, Name, Value, Type, Description, Category, Status, BarCode, CreatedDate, UpdatedDate)
VALUES
    (2, '00S', 'S號', 'S', NULL, 'S號', 'COMMON_SIZE', 1, '00S', GETDATE(), GETDATE()),
    (2, '00M', 'M號', 'M', NULL, 'M號', 'COMMON_SIZE', 1, '00M', GETDATE(), GETDATE()),
    (2, '00L', 'L號', 'L', NULL, 'L號', 'COMMON_SIZE', 1, '00L', GETDATE(), GETDATE()),
    (2, '0LL', 'LL號', 'LL', NULL, 'LL號', 'COMMON_SIZE', 1, '0LL', GETDATE(), GETDATE()),
    (2, '03L', '3L號', '3L', NULL, '3L號', 'COMMON_SIZE', 1, '03L', GETDATE(), GETDATE()),
    (2, '0XL', 'XL號', 'XL', NULL, 'XL號', 'COMMON_SIZE', 1, '0XL', GETDATE(), GETDATE()),
    (2, '2XL', '2XL號', '2XL', NULL, '2XL號', 'COMMON_SIZE', 1, '2XL', GETDATE(), GETDATE()),
    (2, '3XL', '3XL號', '3XL', NULL, '3XL號', 'COMMON_SIZE', 1, '3XL', GETDATE(), GETDATE());



