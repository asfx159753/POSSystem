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
('SEASON', N'季節', NULL, NULL, N'季節', 'Parent', NULL, 'SEASON'),
('SEX', N'性別', NULL, NULL, N'性別', 'Parent', NULL, 'SEX'),
('UNIT', N'單位', NULL, NULL, N'商品使用的單位', 'Parent', NULL, 'UNIT');

--新增顏色的子項
INSERT INTO Parameters (ParentId, Code, Name, Value, Type, Description, Category, Status, BarCode, CreatedDate, UpdatedDate)
VALUES
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'COLOR'), 'WHITE', '白色', '#FFFFFF', NULL, '純白色', 'COLOR', 1, 'FF', GETDATE(), GETDATE()),
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'COLOR'), 'RED', '紅色', '#FF0000', NULL, '鮮紅色', 'COLOR', 1, '01', GETDATE(), GETDATE()),
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'COLOR'), 'ORANGE', '橙色', '#FFA500', NULL, '亮橙色', 'COLOR', 1, '02', GETDATE(), GETDATE()),
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'COLOR'), 'YELLOW', '黃色', '#FFFF00', NULL, '鮮黃色', 'COLOR', 1, '03', GETDATE(), GETDATE()),
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'COLOR'), 'GREEN', '綠色', '#008000', NULL, '深綠色', 'COLOR', 1, '04', GETDATE(), GETDATE()),
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'COLOR'), 'BLUE', '藍色', '#0000FF', NULL, '純藍色', 'COLOR', 1, '05', GETDATE(), GETDATE()),
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'COLOR'), 'INDIGO', '靛色', '#4B0082', NULL, '深靛色', 'COLOR', 1, '06', GETDATE(), GETDATE()),
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'COLOR'), 'VIOLET', '紫色', '#800080', NULL, '純紫色', 'COLOR', 1, '07', GETDATE(), GETDATE()),
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'COLOR'), 'BLACK', '黑色', '#000000', NULL, '純黑色', 'COLOR', 1, '08', GETDATE(), GETDATE()),
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'COLOR'), 'GRAY', '灰色', '#808080', NULL, '中性灰色', 'COLOR', 1, '09', GETDATE(), GETDATE());

-- 新增尺寸的子項 (公分尺寸 220 ~ 295)
INSERT INTO Parameters (ParentId, Code, Name, Value, Type, Description, Category, Status, BarCode, CreatedDate, UpdatedDate)
VALUES
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'SIZE'), '220', '22.0公分', '22.0', NULL, '22.0公分', 'SHOES_SIZE_JP', 1, '220', GETDATE(), GETDATE()),
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'SIZE'), '225', '22.5公分', '22.5', NULL, '22.5公分', 'SHOES_SIZE_JP', 1, '225', GETDATE(), GETDATE()),
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'SIZE'), '230', '23.0公分', '23.0', NULL, '23.0公分', 'SHOES_SIZE_JP', 1, '230', GETDATE(), GETDATE()),
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'SIZE'), '235', '23.5公分', '23.5', NULL, '23.5公分', 'SHOES_SIZE_JP', 1, '235', GETDATE(), GETDATE()),
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'SIZE'), '240', '24.0公分', '24.0', NULL, '24.0公分', 'SHOES_SIZE_JP', 1, '240', GETDATE(), GETDATE()),
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'SIZE'), '245', '24.5公分', '24.5', NULL, '24.5公分', 'SHOES_SIZE_JP', 1, '245', GETDATE(), GETDATE()),
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'SIZE'), '250', '25.0公分', '25.0', NULL, '25.0公分', 'SHOES_SIZE_JP', 1, '250', GETDATE(), GETDATE()),
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'SIZE'), '255', '25.5公分', '25.5', NULL, '25.5公分', 'SHOES_SIZE_JP', 1, '255', GETDATE(), GETDATE()),
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'SIZE'), '260', '26.0公分', '26.0', NULL, '26.0公分', 'SHOES_SIZE_JP', 1, '260', GETDATE(), GETDATE()),
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'SIZE'), '265', '26.5公分', '26.5', NULL, '26.5公分', 'SHOES_SIZE_JP', 1, '265', GETDATE(), GETDATE()),
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'SIZE'), '270', '27.0公分', '27.0', NULL, '27.0公分', 'SHOES_SIZE_JP', 1, '270', GETDATE(), GETDATE()),
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'SIZE'), '275', '27.5公分', '27.5', NULL, '27.5公分', 'SHOES_SIZE_JP', 1, '275', GETDATE(), GETDATE()),
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'SIZE'), '280', '28.0公分', '28.0', NULL, '28.0公分', 'SHOES_SIZE_JP', 1, '280', GETDATE(), GETDATE()),
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'SIZE'), '285', '28.5公分', '28.5', NULL, '28.5公分', 'SHOES_SIZE_JP', 1, '285', GETDATE(), GETDATE()),
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'SIZE'), '290', '29.0公分', '29.0', NULL, '29.0公分', 'SHOES_SIZE_JP', 1, '290', GETDATE(), GETDATE()),
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'SIZE'), '295', '29.5公分', '29.5', NULL, '29.5公分', 'SHOES_SIZE_JP', 1, '295', GETDATE(), GETDATE());




-- 新增尺寸的子項 (歐美尺寸)
INSERT INTO Parameters (ParentId, Code, Name, Value, Type, Description, Category, Status, BarCode, CreatedDate, UpdatedDate)
VALUES
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'SIZE'), '035', 'EU35', '35', NULL, 'EU35號', 'SHOES_SIZE_EU', 1, '035', GETDATE(), GETDATE()),
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'SIZE'), '036', 'EU36', '36', NULL, 'EU36號', 'SHOES_SIZE_EU', 1, '036', GETDATE(), GETDATE()),
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'SIZE'), '037', 'EU37', '37', NULL, 'EU37號', 'SHOES_SIZE_EU', 1, '037', GETDATE(), GETDATE()),
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'SIZE'), '038', 'EU38', '38', NULL, 'EU38號', 'SHOES_SIZE_EU', 1, '038', GETDATE(), GETDATE()),
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'SIZE'), '039', 'EU39', '39', NULL, 'EU39號', 'SHOES_SIZE_EU', 1, '039', GETDATE(), GETDATE()),
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'SIZE'), '040', 'EU40', '40', NULL, 'EU40號', 'SHOES_SIZE_EU', 1, '040', GETDATE(), GETDATE()),
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'SIZE'), '041', 'EU41', '41', NULL, 'EU41號', 'SHOES_SIZE_EU', 1, '041', GETDATE(), GETDATE()),
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'SIZE'), '042', 'EU42', '42', NULL, 'EU42號', 'SHOES_SIZE_EU', 1, '042', GETDATE(), GETDATE()),
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'SIZE'), '043', 'EU43', '43', NULL, 'EU43號', 'SHOES_SIZE_EU', 1, '043', GETDATE(), GETDATE()),
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'SIZE'), '044', 'EU44', '44', NULL, 'EU44號', 'SHOES_SIZE_EU', 1, '044', GETDATE(), GETDATE()),
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'SIZE'), '045', 'EU45', '45', NULL, 'EU45號', 'SHOES_SIZE_EU', 1, '045', GETDATE(), GETDATE()),
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'SIZE'), '046', 'EU46', '46', NULL, 'EU46號', 'SHOES_SIZE_EU', 1, '046', GETDATE(), GETDATE()),
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'SIZE'), '047', 'EU47', '47', NULL, 'EU47號', 'SHOES_SIZE_EU', 1, '047', GETDATE(), GETDATE()),
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'SIZE'), '048', 'EU48', '48', NULL, 'EU48號', 'SHOES_SIZE_EU', 1, '048', GETDATE(), GETDATE());



-- 新增公用尺寸的子項
INSERT INTO Parameters (ParentId, Code, Name, Value, Type, Description, Category, Status, BarCode, CreatedDate, UpdatedDate)
VALUES
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'SIZE'), '00S', 'S號', 'S', NULL, 'S號', 'COMMON_SIZE', 1, '00S', GETDATE(), GETDATE()),
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'SIZE'), '00M', 'M號', 'M', NULL, 'M號', 'COMMON_SIZE', 1, '00M', GETDATE(), GETDATE()),
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'SIZE'), '00L', 'L號', 'L', NULL, 'L號', 'COMMON_SIZE', 1, '00L', GETDATE(), GETDATE()),
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'SIZE'), '0LL', 'LL號', 'LL', NULL, 'LL號', 'COMMON_SIZE', 1, '0LL', GETDATE(), GETDATE()),
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'SIZE'), '03L', '3L號', '3L', NULL, '3L號', 'COMMON_SIZE', 1, '03L', GETDATE(), GETDATE()),
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'SIZE'), '0XL', 'XL號', 'XL', NULL, 'XL號', 'COMMON_SIZE', 1, '0XL', GETDATE(), GETDATE()),
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'SIZE'), '2XL', '2XL號', '2XL', NULL, '2XL號', 'COMMON_SIZE', 1, '2XL', GETDATE(), GETDATE()),
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'SIZE'), '3XL', '3XL號', '3XL', NULL, '3XL號', 'COMMON_SIZE', 1, '3XL', GETDATE(), GETDATE());



-- 新增產品類別的子項
INSERT INTO Parameters (ParentId, Code, Name, Value, Type, Description, Category, Status, BarCode, CreatedDate, UpdatedDate)
VALUES
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'PRODUCT_TYPE'), '00', '連身皮衣', '00', NULL, '連身皮衣', 'PRODUCT_TYPE', 1, '00', GETDATE(), GETDATE()),
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'PRODUCT_TYPE'), '01', '二件式皮衣', '01', NULL, '二件式皮衣', 'PRODUCT_TYPE', 1, '01', GETDATE(), GETDATE()),
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'PRODUCT_TYPE'), '03', '單件皮上衣-男', '03', NULL, '單件皮上衣-男', 'PRODUCT_TYPE', 1, '03', GETDATE(), GETDATE()),
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'PRODUCT_TYPE'), '04', '單件皮上衣-女', '04', NULL, '單件皮上衣-女', 'PRODUCT_TYPE', 1, '04', GETDATE(), GETDATE()),
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'PRODUCT_TYPE'), '05', '單件皮褲-男', '05', NULL, '單件皮褲-男', 'PRODUCT_TYPE', 1, '05', GETDATE(), GETDATE()),
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'PRODUCT_TYPE'), '06', '單件皮褲-女', '06', NULL, '單件皮褲-女', 'PRODUCT_TYPE', 1, '06', GETDATE(), GETDATE()),
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'PRODUCT_TYPE'), '10', '安全帽', '10', NULL, '安全帽', 'PRODUCT_TYPE', 1, '10', GETDATE(), GETDATE()),
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'PRODUCT_TYPE'), '11', '小帽', '11', NULL, '小帽', 'PRODUCT_TYPE', 1, '11', GETDATE(), GETDATE()),
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'PRODUCT_TYPE'), '12', '頭套', '12', NULL, '頭套', 'PRODUCT_TYPE', 1, '12', GETDATE(), GETDATE()),
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'PRODUCT_TYPE'), '15', '安全帽內襯', '15', NULL, '安全帽內襯', 'PRODUCT_TYPE', 1, '15', GETDATE(), GETDATE()),
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'PRODUCT_TYPE'), '19', '安全帽鏡片', '19', NULL, '安全帽鏡片', 'PRODUCT_TYPE', 1, '19', GETDATE(), GETDATE()),
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'PRODUCT_TYPE'), '20', '車靴', '20', NULL, '車靴', 'PRODUCT_TYPE', 1, '20', GETDATE(), GETDATE()),
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'PRODUCT_TYPE'), '21', '滑胎靴', '21', NULL, '滑胎靴', 'PRODUCT_TYPE', 1, '21', GETDATE(), GETDATE()),
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'PRODUCT_TYPE'), '31', 'POLO衫', '31', NULL, 'POLO衫', 'PRODUCT_TYPE', 1, '31', GETDATE(), GETDATE()),
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'PRODUCT_TYPE'), '32', '襯衫', '32', NULL, '襯衫', 'PRODUCT_TYPE', 1, '32', GETDATE(), GETDATE()),
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'PRODUCT_TYPE'), '33', 'T恤', '33', NULL, 'T恤', 'PRODUCT_TYPE', 1, '33', GETDATE(), GETDATE()),
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'PRODUCT_TYPE'), '40', '手套', '40', NULL, '手套', 'PRODUCT_TYPE', 1, '40', GETDATE(), GETDATE()),
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'PRODUCT_TYPE'), '41', '手套內襯', '41', NULL, '手套內襯', 'PRODUCT_TYPE', 1, '41', GETDATE(), GETDATE()),
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'PRODUCT_TYPE'), '45', '車罩', '45', NULL, '車罩', 'PRODUCT_TYPE', 1, '45', GETDATE(), GETDATE()),
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'PRODUCT_TYPE'), '50', '防摔褲', '50', NULL, '防摔褲', 'PRODUCT_TYPE', 1, '50', GETDATE(), GETDATE()),
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'PRODUCT_TYPE'), '51', '牛仔褲', '51', NULL, '牛仔褲', 'PRODUCT_TYPE', 1, '51', GETDATE(), GETDATE()),
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'PRODUCT_TYPE'), '61', '背包', '61', NULL, '背包', 'PRODUCT_TYPE', 1, '61', GETDATE(), GETDATE()),
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'PRODUCT_TYPE'), '65', '腰包', '65', NULL, '腰包', 'PRODUCT_TYPE', 1, '65', GETDATE(), GETDATE()),
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'PRODUCT_TYPE'), '66', '油箱包', '66', NULL, '油箱包', 'PRODUCT_TYPE', 1, '66', GETDATE(), GETDATE()),
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'PRODUCT_TYPE'), '67', '後車箱包', '67', NULL, '後車箱包', 'PRODUCT_TYPE', 1, '67', GETDATE(), GETDATE()),
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'PRODUCT_TYPE'), '71', '防摔衣', '71', NULL, '防摔衣', 'PRODUCT_TYPE', 1, '71', GETDATE(), GETDATE()),
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'PRODUCT_TYPE'), '74', '通訊系統', '74', NULL, '通訊系統', 'PRODUCT_TYPE', 1, '74', GETDATE(), GETDATE()),
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'PRODUCT_TYPE'), '80', '滑塊', '80', NULL, '滑塊', 'PRODUCT_TYPE', 1, '80', GETDATE(), GETDATE()),
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'PRODUCT_TYPE'), '81', '滑衣', '81', NULL, '滑衣', 'PRODUCT_TYPE', 1, '81', GETDATE(), GETDATE()),
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'PRODUCT_TYPE'), '82', '雨衣', '82', NULL, '雨衣', 'PRODUCT_TYPE', 1, '82', GETDATE(), GETDATE()),
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'PRODUCT_TYPE'), '85', '護具', '85', NULL, '護具', 'PRODUCT_TYPE', 1, '85', GETDATE(), GETDATE()),
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'PRODUCT_TYPE'), '98', '車用品配件', '98', NULL, '車用品配件', 'PRODUCT_TYPE', 1, '98', GETDATE(), GETDATE()),
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'PRODUCT_TYPE'), '99', '綜合項', '99', NULL, '綜合項', 'PRODUCT_TYPE', 1, '99', GETDATE(), GETDATE());


-- 新增性別的子項
INSERT INTO Parameters (ParentId, Code, Name, Value, Type, Description, Category, Status, BarCode, CreatedDate, UpdatedDate)
VALUES
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'SEX'), 'M', '男', 'M', NULL, '男性', 'SEX', 1, 'M', GETDATE(), GETDATE()),
	((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'SEX'), 'C', '通用', 'C', NULL, '通用', 'SEX', 1, 'C', GETDATE(), GETDATE()),
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'SEX'), 'F', '女', 'F', NULL, '女性', 'SEX', 1, 'F', GETDATE(), GETDATE());

-- 新增季節的子項
INSERT INTO Parameters (ParentId, Code, Name, Value, Type, Description, Category, Status, BarCode, CreatedDate, UpdatedDate)
VALUES
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'SEASON'), 'S', '春/夏', 'S', NULL, '春/夏', 'SEASON', 1, 'S', GETDATE(), GETDATE()),
	((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'SEASON'), 'C', '通用', 'C', NULL, '通用', 'SEASON', 1, 'C', GETDATE(), GETDATE()),
    ((SELECT Id FROM Parameters WHERE Category = 'Parent' AND Code = 'SEASON'), 'W', '秋/冬', 'W', NULL, '秋/冬', 'SEASON', 1, 'W', GETDATE(), GETDATE());




INSERT INTO Product (Code, Name, Description, Category, AddedDate, ImageUrl, Status, SupplierId)
VALUES ('001', N'訂金收入', N'訂金收入', '99', GETDATE(), NULL, '1', NULL);


INSERT INTO ProductDetail (ProductId, Size, Color, SubColor, CostPrice, RetailPrice, Stock, Barcode, ImageUrl, Status)
VALUES (1, NULL, NULL, NULL, 0, 0, 0, '001', NULL, 'Available');