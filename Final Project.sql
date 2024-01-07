CREATE DATABASE FinalProject;
USE FinalProject;

/* CUSTOMER TABLE */
CREATE TABLE Customer(
	Customer_Number SMALLINT IDENTITY(01, 1) PRIMARY KEY NOT NULL,
	Name VARCHAR(30),
	Email VARCHAR(30),
	Phone_Number VARCHAR(15),
	Address VARCHAR(30));

/* CUSTOMERS DATA */
INSERT INTO Customer
VALUES
('Thien Long', 'longmac321@gmail.com', '0868605627', 'Hai Duong'),
('Dinh Duy', 'duykhoadd1@gmail.com', '0327903702', 'Ha Noi'),
('Mai Lan', 'mailan66@gmail.com', '0977742358', 'Hai Phong'),
('Ngoc Anh', 'nguyentna2811@gmail.com', '0377601737', 'Ha Noi'),
('Thanh Trang', 'nguyentranghq60@gmail.com', '037707885', 'Ha Noi'),
('Thai Minh', 'viweb25248@gmail.com', '0968940762', 'Ha Noi'),
('Duc Nguyen', 'ducknguyen@gmail.com', '0835117980', 'Ha Noi'),
('Chi Linh', 'linhajc.lmc@gmail.com', '0369739136', 'Hai Duong'),
('Cao Hung', 'hungneu@gmail.com', '0988682452', 'Ha Noi'),
('Pham Khanh', 'phamthikhanh123@gmail.com', '0944433012', 'Hai Duong');


/* CATEGORY TABLE */
CREATE TABLE Category(
	Category_Number SMALLINT IDENTITY (0001, 1) PRIMARY KEY NOT NULL,
	Category_Name VARCHAR(30));

/* CATEGORY DATA */
INSERT INTO Category
VALUES
('Sach giao duc'),
('Phu kien Laptop'),
('Kinh vien thi'),
('Thuoc nhuom toc'),
('Chao chong dinh'),
('Do gia dung'),
('Van hoc gia tuong'),
('Thoi trang nu'),
('Ao phong'),
('Duong moi');


/* SELLERS TABLE */
CREATE TABLE Sellers (
    Seller_Number SMALLINT IDENTITY(01, 1) PRIMARY KEY,
    Name VARCHAR(50),
    Phone_number VARCHAR(15),
    Address VARCHAR(50),
    Followers INT,
	Number_of_Products INT,
);

/* SELLERS DATA */
INSERT INTO Sellers
VALUES
('Nha sach Thanh An HCM', '0908810704', 'Tan Phu, Ho Chi Minh', 5600, 8200),
('Phu kien Pico', '0366532054', 'Nam Tu Lien, Ha Noi', 48600, 2100),
('Kinh mat Thien An cao cap', '0377761431', 'Dong Da, Ha Noi', 4200, 2300),
('Thuoc nhuom toc Tone Do', '0973107355', 'Dong Da, Ha Noi', 542700, 112),
('SUNHOUSE JSC', '1800 6680', 'Cau Giay, Ha Noi', 20500, 57),
('Gulife Official Asia', ' 0966763323', 'Ha Dong, Ha Noi', 1700, 60),
('FAHASHA', '1900636467', 'Hai Ba Trung, TP.HCM', 375900, 77200),
('viole669', '0865235093', 'Thach That, Ha Noi', 103700, 157),
('Midori chans', '0879999667', 'Cau Giay, Ha Noi', 3600, 21),
('Co Mem Official Store', '1800.646.890', 'Dich Vong Hau, Cau Giay, Ha Noi', 608200, 215);

drop table Product

/* PRODUCT TABLE */
CREATE TABLE Product (
	Product_Number SMALLINT IDENTITY(01, 1) PRIMARY KEY NOT NULL,
	Product_Name VARCHAR(50),
	Category_Number SMALLINT FOREIGN KEY REFERENCES Category(Category_Number),
	Seller_Number SMALLINT FOREIGN KEY REFERENCES Sellers(Seller_Number),
	Price REAL,
	Stock_Quantities SMALLINT,
);

/* PRODUCT DATA */
INSERT INTO Product
VALUES
('Giao trinh triet hoc Mac Lenin', 1, 1, 63000, 20),
('Keo tan nhiet CPU', 2, 2, 60500, 568),
('Kinh vien thi Nhat Ban', 3, 3, 14340, 684),
('Thuoc nhuom toc mau nau', 4, 4, 65000, 1823),
('Chao chong dinh SUNHOUSE', 5, 5, 9500, 257),
('Dieu hoa khong khi', 6, 6, 18500, 46),
('Sach Minecraft Book 4: The end', 7, 7, 19300,72),
('Chan vay ngan', 8, 8,10900, 1655),
('Ao thun cotton', 9, 9, 29000, 9),
('Son duong gao co mem', 10, 10, 9000, 10759);


/* ORDERS TABLE */
CREATE TABLE Orders(
	Order_Number SMALLINT IDENTITY (001, 1) PRIMARY KEY not null,
	Customer_Number SMALLINT not null FOREIGN KEY REFERENCES Customer(Customer_Number),
	Product_Number SMALLINT not null FOREIGN KEY REFERENCES Product(Product_Number),
	Quantity INT not null,
	Order_Date date);

/*ORDERS DATA*/
INSERT INTO Orders
VALUES
(1, 19, 2, '18-Jun-2023'),
(2, 15, 1, '16-Nov-2023'),
(3, 14, 2, '14-Dec-2023'),
(4, 13, 2, '29-Aug-2023'),
(5, 12, 2, '24-Nov-2023'),
(7, 16, 2, '27-Nov-2023'),
(9, 18, 1, '7-Oct-2023'),
(6, 17, 2, '27-Sep-2022'),
(8, 10, 4, '8-Oct-2023'),
(10, 11, 1, '15-May-2023');


/* I am still working on this table and other tables below */

/* CART TABLE */
CREATE TABLE Cart (
    Cart_Number SMALLINT IDENTITY(000001, 1) PRIMARY KEY NOT NULL,
    Customer_Number SMALLINT FOREIGN KEY REFERENCES Customer(Customer_Number),
	Order_Number SMALLINT FOREIGN KEY REFERENCES Orders(Order_Number),
    Total_Items SMALLINT,
    Total_Price REAL
);

/* CART DATA */
INSERT INTO Cart
VALUES
(2,17200),
(1,65000),
(2,143450),
(2,66500),
(2,89800),
(2,370000),
(1,193000),
(3,456000),
(4,789000),
(5, 456700);

/* SHIPMENT TABLE */
CREATE TABLE Shipment(
    Shipment_ID VARCHAR(30) PRIMARY KEY NOT NULL,
    Order_Number SMALLINT FOREIGN KEY REFERENCES Orders(Order_Number),
    Delivery_date DATE,
	Address VARCHAR(50),
    Shipment_Method VARCHAR(10));

/* SHIPMENT DATA */
INSERT INTO Shipment
VALUES
("SPXVN038443313536","21-June-2023","Hai Duong","Fast"),
("SPXVN038443322071","24-Nov-2023","Hai Duong","Economical"),
("SPXVN03430656076C","14-Dec-2023","Hai Duong","Fast"),
("SPXVN034559315418","31-Aug-2023","Hai Duong","Fast"),
("SPXVN03263749419B","29-Dec-2023","Hai Duong","Fast"),
("231127NUP2CXJX","28-Nov-2023","Ha Noi","Fast"),
("FPM4QZMGTHZ3UF","9-Oct-2023","Bac Kan","Fast"),
("857690674","29-Sep-2022","Hai Duong","Fast"),
("CO493224","10-Oct-2022","Ha Noi","Fast"),
("SPXVN036529","17-May-2023","Ha Noi","Fast");

/* PAYMENT TABLE */
CREATE TABLE  Payment(
    Payment_Number SMALLINT IDENTITY(001,1) PRIMARY KEY not null,  
    Order_Number SMALLINT not null FOREIGN KEY REFERENCES Orders(Order_Number),
    Pay_date DATE,
    Method VARCHAR(20));
/* PAYMENT DATA */
INSERT INTO Payment
VALUES
("18-June-2023","Banks"),
("24-Nov-2023","Debit Card"),
("12-Dec-2023","Banks"),
("31-Aug-2023","Cash"),
("24-Nov-2023","Banks"),
("27-Nov-2023","Banks"),
("7-Oct-2023","Bank"),
("29-Sep-2022","Directly"),
("10-Oct-2022","Directly"),
("15-May-2023","Banks");


/* DISCOUNT TABLE */
CREATE TABLE  Discount(
    DiscountNumber SMALLINT IDENTITY(1001,1) PRIMARY KEY not null,
    ProductNumber SMALLINT not null FOREIGN KEY REFERENCES Product(Product_Number),
    Discount_Code VARCHAR(10) not null,
    Discount_Rate REAL not null,
    Start_Date DATE,
    Expire_Date DATE);
/* DISCOUNT DATA */
INSERT INTO Discount
VALUES
("SR23DECTTM117","12.5%","1-Dec-2023","19-Dec-2023"),
(),
(),
(),
(),
("O3TMLI9INB8IG","25%","20*Nov-2023","30-Nov-2023"),
("PHHPR902T738Z","15%","1-Oct-2023","10-Oct-2023"),
("Freeship Fashion","10%","26-Sep-2022","31-Sep-2022"),
("SPPMKPEU1023","20%","17-Oct-2023","31-Dec-2023"),
("SPPDECP4","30%","29-Dec-2023","4-Jan-2024");
/* REVIEW TABLE */
CREATE TABLE Review (
    Review_Number SMALLINT IDENTITY (2001, 1)PRIMARY KEY,
	Product_Number SMALLINT FOREIGN KEY REFERENCES Product(Product_Number),
    Username VARCHAR(50),
    Rating SMALLINT,
    Date_of_Review DATE,
);

/* REVIEW DATA */
INSERT INTO Review
VALUES
(),
(),
(),
(),
(),
(),
(),
("Chi Linh",5,"31-Sep-2022"),
("Cao Hung",5,"12-Oct-2022"),
("Pham Khanh",5,"20-May-2023");
















