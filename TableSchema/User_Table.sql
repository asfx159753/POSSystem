CREATE TABLE [User] (
    [ID] INT PRIMARY KEY IDENTITY(1,1),
    [Account] NVARCHAR(30) UNIQUE,
    [Name] NVARCHAR(50),
    [Email] NVARCHAR(150),
    [Sex] NVARCHAR(10),
    [Address] NVARCHAR(300),
    [Phone] NVARCHAR(30),
    [license] NVARCHAR(1)
);


--DROP TABLE [User];
