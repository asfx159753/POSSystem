
PRAGMA foreign_keys = ON;

-- =========================
-- Employee
-- =========================
CREATE TABLE IF NOT EXISTS Employee (
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    Code TEXT NOT NULL UNIQUE,
    FirstName TEXT NOT NULL,
    LastName TEXT NOT NULL,
    Sex INTEGER NOT NULL,
    BirthDate TEXT NOT NULL,
    Level TEXT NOT NULL,
    JoinDate TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    LastLoginTime TEXT NOT NULL,
    Comment TEXT,
    Position TEXT NOT NULL,
    Department TEXT NOT NULL,
    Phone TEXT,
    Email TEXT,
    Address TEXT,
    EmergencyContactName TEXT,
    EmergencyContactPhone TEXT,
    SalaryGrade TEXT
);

-- =========================
-- Customer
-- =========================
CREATE TABLE IF NOT EXISTS Customer (
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    Code TEXT NOT NULL UNIQUE,
    FirstName TEXT NOT NULL,
    LastName TEXT NOT NULL,
    BirthDate TEXT,
    Sex INTEGER NOT NULL,
    Phone TEXT,
    Email TEXT,
    Address TEXT,
    City TEXT,
    Country TEXT,
    RegistrationDate TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    LastPurchaseDate TEXT,
    CustomerLevel TEXT,
    Comments TEXT,
    Status INTEGER NOT NULL DEFAULT 1
);

-- =========================
-- Supplier
-- =========================
CREATE TABLE IF NOT EXISTS Supplier (
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    Code TEXT NOT NULL UNIQUE,
    Name TEXT NOT NULL,
    ContactPerson TEXT,
    Phone TEXT,
    Email TEXT,
    Address TEXT,
    City TEXT,
    Country TEXT,
    Website TEXT,
    BusinessType TEXT,
    TaxId TEXT,
    PaymentTerms TEXT,
    Status INTEGER NOT NULL DEFAULT 1,
    JoinDate TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    Comments TEXT,
    Barcode TEXT NOT NULL UNIQUE DEFAULT ''
);

-- =========================
-- Product
-- =========================
CREATE TABLE IF NOT EXISTS Product (
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    Code TEXT NOT NULL,
    Name TEXT NOT NULL,
    Description TEXT,
    Category TEXT NOT NULL,
    AddedDate TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    ImageUrl TEXT,
    Status TEXT NOT NULL DEFAULT '1',
    SupplierId INTEGER,
    FOREIGN KEY (SupplierId) REFERENCES Supplier(Id)
);

-- =========================
-- ProductDetail
-- =========================
CREATE TABLE IF NOT EXISTS ProductDetail (
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    DetailName TEXT NOT NULL DEFAULT '',
    ProductId INTEGER NOT NULL,
    Size TEXT,
    Color TEXT,
    SubColor TEXT,
    CostPrice REAL NOT NULL,
    RetailPrice REAL NOT NULL,
    Stock INTEGER NOT NULL DEFAULT 0,
    Barcode TEXT NOT NULL,
    ImageUrl TEXT,
    Status TEXT NOT NULL DEFAULT '1',
    FOREIGN KEY (ProductId) REFERENCES Product(Id)
);

-- =========================
-- Orders
-- =========================
CREATE TABLE IF NOT EXISTS Orders (
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    OrderNumber TEXT NOT NULL UNIQUE,
    CustomerId INTEGER NOT NULL,
    OrderDate TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    TotalAmount REAL NOT NULL DEFAULT 0,
    Points INTEGER NOT NULL DEFAULT 0,
    Status TEXT NOT NULL,
    PaymentMethod TEXT NOT NULL,
    ShippingAddress TEXT,
    BillingAddress TEXT,
    InvoiceNumber TEXT,
    Notes TEXT,
    CreatedDate TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UpdatedDate TEXT,
    FOREIGN KEY (CustomerId) REFERENCES Customer(Id)
);

-- =========================
-- OrderDetails
-- =========================
CREATE TABLE IF NOT EXISTS OrderDetails (
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    OrderId INTEGER NOT NULL,
    ProductDetailId INTEGER NOT NULL,
    Quantity INTEGER NOT NULL CHECK (Quantity > 0),
    UnitPrice REAL NOT NULL,
    AfterDiscountPrice REAL DEFAULT 0,
    FOREIGN KEY (OrderId) REFERENCES Orders(Id),
    FOREIGN KEY (ProductDetailId) REFERENCES ProductDetail(Id)
);

-- =========================
-- Logs
-- =========================
CREATE TABLE IF NOT EXISTS Logs (
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    Timestamp TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    EmployeeId INTEGER NOT NULL,
    Action TEXT NOT NULL,
    TableName TEXT NOT NULL,
    RecordId INTEGER,
    Details TEXT,
    ClientIp TEXT,
    ServerName TEXT,
    ExecutedBy TEXT,
    FOREIGN KEY (EmployeeId) REFERENCES Employee(Id)
);

-- =========================
-- Parameters
-- =========================
CREATE TABLE IF NOT EXISTS Parameters (
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    ParentId INTEGER,
    Code TEXT NOT NULL,
    Name TEXT NOT NULL,
    Value TEXT,
    Type TEXT,
    Description TEXT,
    Category TEXT,
    Status INTEGER NOT NULL DEFAULT 1,
    BarCode TEXT NOT NULL DEFAULT '',
    CreatedDate TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UpdatedDate TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (Category, BarCode),
    FOREIGN KEY (ParentId) REFERENCES Parameters(Id)
);
