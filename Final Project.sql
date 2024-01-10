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
('Dinh Duy', 'duykhoadd1@gmail.com', '0327903702', 'Thai Binh'),
('Mai Lan', 'mailan66@gmail.com', '0977742358', 'Hai Phong'),
('Ngoc Anh', 'nguyentna2811@gmail.com', '0377601737', 'Hung Yen'),
('Thanh Trang', 'nguyentranghq60@gmail.com', '037707885', 'Bac Giang'),
('Thai Minh', 'viweb25248@gmail.com', '0968940762', 'Ha Noi'),
('Duc Nguyen', 'ducknguyen@gmail.com', '0835117980', 'Thanh Hoa'),
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
('Sach giao duc'),	
('Phu kien Laptop'),	
('Kinh mat'),		
('Do gia dung'),	
('Van hoc gia tuong'),		
('Thoi trang '),		
('My pham & Trang suc'),	
('Dung cu the thao'),		
('Thu cung'),			
('Do choi'),		
('Suc khoe');		

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
('Midori chans', '0879999667', 'Cau Giay, Ha Noi', 3600, 21),		
('Nha sach Thanh An HCM', '0908810704', 'Tan Phu, Ho Chi Minh', 5600, 82),	
('SUNHOUSE JSC', '1800 6680', 'Cau Giay, Ha Noi', 20500, 57),			
('Phu kien Pico', '0366532054', 'Nam Tu Lien, Ha Noi', 48600, 21),		
('Thuoc nhuom toc Tone Do', '0973107355', 'Dong Da, Ha Noi', 542700, 112),	
('Kinh mat Thien An cao cap', '0377761431', 'Dong Da, Ha Noi', 4200, 230),	
('Gulife Official Asia', ' 0966763323', 'Ha Dong, Ha Noi', 1700, 60),		
('FAHASHA', '1900636467', 'Hai Ba Trung, TP.HCM', 375900, 72),			
('viole669', '0865235093', 'Thach That, Ha Noi', 103700, 157),			
('Mars Petcare', ' 0378195546','Dong Da,Ha Noi',23133,45),			
('Co Mem Official Store', '1800.646.890', 'Dich Vong Hau, Cau Giay, Ha Noi', 608200, 215);

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
('Giao trinh triet hoc Mac Lenin', 0001, 02, 63000, 20),
('Keo tan nhiet CPU', 0002, 04, 60500, 568),
('Kinh vien thi Nhat Ban', 0003, 06, 434000, 684),
('Thuoc nhuom toc mau nau', 0007,05, 65000, 1823),
('Chao chong dinh SUNHOUSE', 0004, 03, 95000, 257),
('Dieu hoa khong khi', 0004, 08, 18500000, 46),
('Sach Minecraft Book 4: The end', 0005, 07, 93000,72),
('Chan vay ngan', 0006,01,119000, 1655),
('Ao thun cotton', 0006,09 , 290000, 9),
('Son duong gao co mem', 0008, 11, 900000, 10759)
('Thuc an cho meo',0009,10,111000,4675);


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
    Shipment_Method VARCHAR(10));

/* SHIPMENT DATA */
INSERT INTO Shipment
VALUES
('SPXVN0384433',001,'21-Jun-2023','Hai Duong','Fast'),
('SPXVN0178039',002,'24-Dec-2023','Hai Phong','Standard'),
('SPXVN0343065',003,'20-May-2023','Hai Duong','Fast'),
('SPXVN1255593',004,'31-Aug-2023','Hung Yen','Standard'),
('SPXVN0026377',005,'02-Dec-2023','Thanh Hoa','Fast'),
('SPXVN1637826',006,'17-Oct-2023','Ha Noi','Standard'),
('SPXVN0293462',007,'29-Nov-2023','Thai Binh','Fast'),
('SPXVN7846374',008,'30-Sep-2023','Ha Noi','Fast'),
('SPXVN2867626',009,'15-Oct-2023','Ha Duong','Standard'),
('SPXVN0365290',010,'30-Nov-2023','Bac Giang','Fast'),
('SPXVN1624001',011,'02-Mar-2023','Thai Binh','Standard');

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
('SR23CTTM117',08,'12.5%','1-Dec-2023','19-Dec-2023'),
('O3TMLI8IG',03,'5%','20*Nov-2023','30-Nov-2023'),
('PAHPR902T8Z',06,'15%','01-Oct-2023','10-Oct-2023'),
('SCEEJ635GM',04,'10%','26-Sep-2023','31-Sep-2023'),
('SPPMKPEU23',01,'20%','17-Nov-2023','31-Dec-2023'),
('SPPDECP4ML',09,'30%','20-Feb-2023','25-Feb-2023'),
('SPDM948501',11,'10%','01-May-2023','20-May-2023'),
('VN34SPFHHK',05,'5%','29-Aug-2023','15-Sep-2023'),
('MS33KYUID',10,'50%','01-Oct-2023','10-Oct-2023'),
('SP758FKSG',07,'5%','15-Jun-2023','30-Jun-2023'),
('GIAM150GL',02,'15%','5-Nov-2023','20-Nov-2023');
/* REVIEW TABLE */
CREATE TABLE Review (
    Review_ID SMALLINT IDENTITY (2001, 1)PRIMARY KEY,
    Pro_ID SMALLINT FOREIGN KEY REFERENCES Product(Pro_ID),
    Username VARCHAR(50),
    Rating SMALLINT,
    Date_of_Review DATE,
);

/* REVIEW DATA */
INSERT INTO Review
VALUES
(07,'Thien Long',3,'21-Jun-2023'),
(02,'Dinh Duy',1,),
(),
(),
(),
(),
(),
("Chi Linh',5,"31-Sep-2022'),
(06,'Cao Hung',4,'12-Oct-2022"),
(10,'Pham Khanh',5,'20-May-2023');

