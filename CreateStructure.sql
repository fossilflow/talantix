IF OBJECT_ID ('dbo.SKU', 'U') is not null
DROP TABLE dbo.SKU;

CREATE TABLE dbo.SKU
(ID int  PRIMARY KEY IDENTITY,
 Code as cast('s' as char(1)) + cast(id as varchar(50)) UNIQUE,
 "Name" varchar(50)
 );

IF OBJECT_ID ('dbo.Family', 'U') is not null
DROP TABLE dbo.Family;

CREATE TABLE dbo.Family
(ID int  PRIMARY KEY IDENTITY,
 SurName  varchar(255),
 BudgetValue money);

IF OBJECT_ID ('dbo.Basket', 'U') is not null
DROP TABLE dbo.Basket;

 CREATE TABLE dbo.Basket
(ID  int  PRIMARY KEY IDENTITY ,
 ID_SKU int REFERENCES dbo.SKU(ID),
 ID_Family int REFERENCES dbo.Family(ID),
 Quantity int CHECK(Quantity>= 0),
 "Value" money CHECK( "Value" >= 0), 
 PurchaseDate date DEFAULT CONVERT (date, GETDATE()), 
 DiscountValue decimal(18, 4));



