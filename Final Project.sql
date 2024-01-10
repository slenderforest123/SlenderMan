CREATE DATABASE FinalProject;
USE FinalProject;

/* CUSTOMER TABLE */
CREATE TABLE Customer(
	Cus_ID SMALLINT IDENTITY(01, 1) PRIMARY KEY NOT NULL,
	Cus_Name VARCHAR(30),
	Cus_Email VARCHAR(30),
	Cus_Phone_Num VARCHAR(15),
	Cus_Address VARCHAR(30));

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
	Category_ID SMALLINT IDENTITY (0001, 1) PRIMARY KEY NOT NULL,
	Category_Name VARCHAR(30));

/* CATEGORY DATA */
INSERT INTO Category
VALUES
('Sach Giao duc'),
('Phu kien Laptop'),
('Kinh vien thi'),
('Thuoc nhuom toc'),
('Chao chong dinh'),
('Do gia dung'),
('Van hoc gia tuong'),
('Thoi trang nu'),
('Ao phong'),
('My pham'),
('Do Choi'),
('Suc khoe'),
('Sach Tieng Viet'),
('Kinh mat'),
('Phu kien trang suc nu'),
('Sach Tieng Anh');

/* SELLERS TABLE */
CREATE TABLE Sellers (
    Sell_ID SMALLINT IDENTITY(01, 1) PRIMARY KEY,
    Sell_Name VARCHAR(50),
    Sell_Phone_Num VARCHAR(15),
    Sell_Address VARCHAR(50),
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
('Co Mem Official Store', '1800.646.890', 'Dich Vong Hau, Cau Giay, Ha Noi', 608200, 215),
('Mars Petcare', ' 0378195546','Dong Da,Ha Noi',23133,45),			
('Hepi Store','091 498 36 58','Trường Chinh, Hanoi, Vietnam',55984,6873),
('Shop Minecraft Vn','0981 058 326','đường Láng, Đống Đa, Hà Nội',18964,171);


/* PRODUCT TABLE */
CREATE TABLE Product (
	Pro_ID SMALLINT IDENTITY(01, 1) PRIMARY KEY NOT NULL,
	Pro_Name VARCHAR(50),
	Category_ID SMALLINT FOREIGN KEY REFERENCES Category(Category_ID),
	Sell_ID SMALLINT FOREIGN KEY REFERENCES Sellers(Sell_ID),
	Pro_Price REAL,
	Stock_Quantities SMALLINT,
);

/* PRODUCT DATA */
INSERT INTO Product
VALUES
('Giao trinh triet hoc Mac Lenin', 0001, 01, 63000, 20),
('Keo tan nhiet CPU', 0002, 02, 60500, 568),
('Kinh vien thi Nhat Ban', 0003, 03, 14340, 684),
('Thuoc nhuom toc mau nau', 0004, 04, 65000, 1823),
('Chao chong dinh SUNHOUSE', 0005, 05, 9500, 257),
('Dieu hoa khong khi', 0006, 06, 18500, 46),
('Sach Minecraft Book 4: The end', 0007, 07, 19300,72),
('Chan vay ngan', 0008, 08,10900, 1655),
('Ao thun cotton', 0009, 09, 29000, 9),
('Son duong gao co mem', 0010, 10, 9000, 10759),
('Thuc an cho meo',0009,11,111000,4675),
('Driver Kamen Rider', 0011, 11, 900000, 856),
('Minecraft Lego Set', 0011, 07, 185000, 953),
('Creeper Plushie', 0011, 12, 175000, 11247),
('Kinh lao gap gong gon', 0015, 03, 59000, 14),
('Gong kinh Chrome Heart', 0015, 03, 99000, 14),
('Quat tan nhiet dien thoai', 0006, 02, 133000, 14),
('Loi loc nuoc', 0006, 05, 97000, 878);

/* ORDERS TABLE */
CREATE TABLE Orders(
	Order_ID SMALLINT IDENTITY (001, 1) PRIMARY KEY not null,
	Cus_ID SMALLINT not null FOREIGN KEY REFERENCES Customer(Cus_ID),
	Pro_ID SMALLINT not null FOREIGN KEY REFERENCES Product(Pro_ID),
   	Order_Date DATE);

/*ORDERS DATA*/
INSERT INTO Orders
VALUES
(01, 07, '18-Jun-2023'),	
(03, 08, '14-Dec-2023'),		
(10, 11, '15-May-2023'),			
(04, 05, '29-Aug-2023'),
(07, 03, '27-Nov-2023'),		
(09, 06, '07-Oct-2023'),		
(02, 02, '16-Nov-2023'),	
(06, 04, '27-Sep-2024'),
(08, 10, '08-Oct-2023'),			
(05, 01, '24-Nov-2023'),		
(02, 09, '22-Feb-2023');			




/* CART TABLE */
CREATE TABLE Cart (
    Cart_ID SMALLINT IDENTITY(000001, 1) PRIMARY KEY NOT NULL,
    Cus_ID SMALLINT FOREIGN KEY REFERENCES Customer(Cus_ID),
    Order_ID SMALLINT FOREIGN KEY REFERENCES Orders(Order_ID),
    Total_Items SMALLINT,
    Total_Price REAL,
);

/* CART DATA */
INSERT INTO Cart
VALUES
(01,001,1,93000),
(02,007,1,60500),
(02,011,1,290000),
(03,002,2,238000),
(04,004,1,95000),
(05,010,1,63000),
(06,008,1,65000),
(07,005,1,434000),
(08,009,1,900000),
(09,006,1,18500000),
(10,003,3,333000);
/* SHIPMENT TABLE */
CREATE TABLE Shipment(
    Ship_ID VARCHAR(30) PRIMARY KEY NOT NULL,
    Order_ID SMALLINT FOREIGN KEY REFERENCES Orders(Order_ID),
    Delivery_date DATE,
    Ship_Address VARCHAR(50),
    Shipment_Method VARCHAR(10),
    Status VARCHAR(10));

/* SHIPMENT DATA */
INSERT INTO Shipment
VALUES
('SPXVN0384433',001,'21-Jun-2023','Hai Duong','Fast', 'Completed'),
('SPXVN0178039',002,'24-Dec-2023','Hai Phong','Standard', 'Completed'),
('SPXVN0343065',003,'20-May-2023','Hai Duong','Fast', 'Completed'),
('SPXVN1255593',004,'31-Aug-2023','Hung Yen','Standard', 'Completed'),
('SPXVN0026377',005,'02-Dec-2023','Thanh Hoa','Fast', 'Completed'),
('SPXVN1637826',006,'17-Oct-2023','Ha Noi','Standard', 'Completed'),
('SPXVN0293462',007,'29-Nov-2023','Thai Binh','Fast', 'Completed'),
('SPXVN7846374',008,'30-Sep-2023','Ha Noi','Fast', 'Completed'),
('SPXVN2867626',009,'15-Oct-2023','Ha Duong','Standard','Completed'),
('SPXVN0365290',010,'30-Nov-2023','Bac Giang','Fast','Completed'),
('SPXVN1624001',011,'02-Mar-2023','Thai Binh','Standard','Completed');
/* PAYMENT TABLE */
CREATE TABLE  Payment(
    Pay_ID SMALLINT IDENTITY(001,1) PRIMARY KEY not null,  
    Order_ID SMALLINT not null FOREIGN KEY REFERENCES Orders(Order_ID),
    Pay_date DATE,
    Pay_Method VARCHAR(20));
/* PAYMENT DATA */
INSERT INTO Payment
VALUES
(001,'18-Jun-2023','Credit Card'),
(007,'29-Nov-2023','Debit Card'),
(002,'24-Dec-2023','Cash'),
(004,'29-Aug-2023','Mobile Wallet'),
(010,'24-Nov-2023','Debit Card'),
(005,'02-Dec-2023','Credit Card'),
(009,'15-Oct-2023','Cash'),
(006,'07-Oct-2023','Mobile Wallet'),
(011,'22-Feb-2023','Credit Card'),
(003,'15-May-2023','Mobile Wallet');

/* DISCOUNT TABLE */
CREATE TABLE  Discount(
    Dis_Code VARCHAR(30) PRIMARY KEY not null,
    Pro_ID SMALLINT not null FOREIGN KEY REFERENCES Product(Pro_ID),
    Dis_Rate REAL not null,
    Start_Date DATE,
    Expire_Date DATE);
/* DISCOUNT DATA */
INSERT INTO Discount
VALUES
('SR23CTTM117',08,0.125,'2023-12-01','2023-12-19'),
('O3TMLI8IG',03,0.05,'2023-11-20','2023-11-30'),
('PAHPR902T8Z',06,0.15,'2023-10-01','2023-10-10'),
('SCEEJ635GM',04,0.10,'2023-09-26','2023-09-30'),
('SPPMKPEU23',01,0.20,'2023-11-17','2023-12-31'),
('SPPDECP4ML',09,0.30,'2023-02-20','2023-02-25'),
('SPDM948501',11,0.10,'2023-05-01','2023-05-20'),
('VN34SPFHHK',05,0.05,'2023-08-29','2023-09-15'),
('MS33KYUID',10,0.50,'2023-10-01','2023-10-10'),
('SP758FKSG',07,0.05,'2023-06-15','2023-06-30'),
('GIAM150GL',02,0.15,'2023-11-05','2023-11-20');

/* REVIEW TABLE */
CREATE TABLE Review (
    Review_ID SMALLINT IDENTITY (2001, 1)PRIMARY KEY,
    Cust_ID SMALLINT FOREIGN KEY REFERENCES Customer(Cus_ID),
    Pro_ID SMALLINT FOREIGN KEY REFERENCES Product(Pro_ID),
    Rating REAL,
    Date_of_Review DATE
);
/* REVIEW DATA */
INSERT INTO Review
VALUES
(01, 01, 5.0, '2023-09-29'),
(02, 01, 2.3, '2023-10-31'),
(03, 01, 4.0, '2023-02-11'),
(03, 02, 3.2, '2023-07-03'),
(04, 01, 2.9, '2023-11-04'),
(04, 03, 3.7, '2023-12-03'),
(06, 06, 3.8, '2023-06-06'),
(08, 08, 5.0, '2022-09-28'),
(09, 09, 5.0, '2022-10-12'),
(10, 10, 5.0, '2023-05-20');

--1. Which sellers sell products that belong to a specific category? For example, belong to "My pham"
SELECT DISTINCT Sellers.Sell_Name
FROM Sellers
WHERE Sellers.Sell_ID IN (
    SELECT Product.Sell_ID
    FROM Product
    WHERE Product.Category_ID = 9
);
--2. What is the average rating for each product?
SELECT Pro_Name, AVG(Rating) as AverageRating
FROM Review
JOIN Product ON Review.Pro_ID = Product.Pro_ID
GROUP BY Pro_Name;
--3. How many shipments are completed?
SELECT COUNT(Ship_ID) as CompletedShipments
FROM Shipment
WHERE Status = 'Completed';
--4. Which products have received a rating of less than 3 stars?
SELECT Pro_Name
FROM Review
JOIN Product ON Review.Pro_ID = Product.Pro_ID
WHERE Rating < 3;
--5. What is the current stock quantity for each product?
SELECT Pro_Name, Stock_Quantities
FROM Product;
--6. What are the most common payment methods used by customers?
SELECT Pay_Method, COUNT(Pay_ID) as TransactionCount
FROM Payment
GROUP BY Pay_Method
ORDER BY TransactionCount DESC;
--7. Which sellers have the highest number of products listed?
SELECT Sell_Name, COUNT(Product.Pro_Name) as ProductCount
FROM Sellers
JOIN Product ON Sellers.Sell_ID = Product.Sell_ID
GROUP BY Sell_Name
ORDER BY ProductCount DESC;
--8. Create a view to show all products along with their category names and seller information.
CREATE VIEW ProductView 

AS
SELECT Product.Pro_Name, Category.Category_Name, Sellers.Sell_Name
FROM Product
INNER JOIN Category ON Product.Category_ID = Category.Category_ID
INNER JOIN Sellers ON Product.Sell_ID = Sellers.Sell_ID;
GO
--9. Which products have received more than 10 reviews?
SELECT Product.Pro_Name, COUNT(Review.Review_ID) as NumberOfReviews
FROM Product
INNER JOIN Review ON Product.Pro_ID = Review.Pro_ID
GROUP BY Product.Pro_Name
HAVING COUNT(Review.Review_ID) > 2;
--10. Create a trigger to update the total price in an order after a discount is applied.
CREATE TRIGGER record_review_time 
ON Review 
AFTER INSERT 
AS 
UPDATE Review SET Date_of_Review = GETDATE() WHERE Review_ID IN (SELECT Review_ID FROM inserted);
