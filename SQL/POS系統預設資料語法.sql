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