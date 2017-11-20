CREATE TABLE Cinema(
	CinemaID varchar(50) NOT NULL PRIMARY KEY,
	Name varchar(50) NOT NULL,
	Category varchar(50),
	Address varchar(150),
	StartedYear varchar(50),
	Telephone int NOT NULL,
	Email varchar(150) NOT NULL,
	OwnerName varchar(50),
);


CREATE TABLE Show(
	ShowID varchar(50) NOT NULL PRIMARY KEY,
	ScreenCategory varchar(50) NOT NULL,
	Language varchar(50) NOT NULL,
	SubTitleAvailability varchar(50) NOT NULL,
	StartTime time(7) NOT NULL,
	EndTime time(7) NOT NULL,
	CinemaID varchar(50) FOREIGN KEY REFERENCES Cinema(CinemaID),
	FilmID varchar(50) FOREIGN KEY REFERENCES Film(FilmID),
);

CREATE TABLE Film(
	FilmID varchar(50) NOT NULL PRIMARY KEY,
	FilmName varchar(50),
	FilmCategory varchar(50),
	Industry varchar(50),
	Studio varchar(50),
	Duration varchar(50),
	MainActor varchar(50),
	ReleaseDate Date,
);
Create table Customer(
	CustomerID varchar(50) NOT NULL PRIMARY KEY,
	CustomerName varchar(100) NOT NULL,
	Status varchar(50),
	Gender varchar(10),
	Address varchar(200) NOT NULL,
	Age int NOT NULL,
	Email varchar(150) NOT NULL,
)


CREATE TABLE Discount(
	DiscountID varchar(50) NOT NULL PRIMARY KEY,
	DiscountName varchar(50) NOT NULL,
	Percentage varchar(50),
	Price int,
);


CREATE TABLE Payment(
	PaymentID varchar(50) NOT NULL PRIMARY KEY,
	Amount int NOT NULL,
	PaymentType varchar(50) NOT NULL,
	PaidDate date NOT NULL,
	PaidTime time(7),
	DiscountID varchar(50) FOREIGN KEY REFERENCES Discount(DiscountID),
	CustomerID varchar(50) FOREIGN KEY REFERENCES Customer(CustomerID),
);

CREATE TABLE Seat(
	SeatNumber varchar(50) NOT NULL PRIMARY KEY,
	Sector varchar(50) NOT NULL,
	RowNumber int NOT NULL,
	SeatType varchar(50),
	CinemaID varchar(50) FOREIGN KEY REFERENCES Cinema(CinemaID),
);

CREATE TABLE Telephone(
	CustomerID varchar(50) NOT NULL,
	TelephoneNo int NOT NULL,
	CONSTRAINT PK_Telephone PRIMARY KEY (CustomerID,TelephoneNo),
);

CREATE TABLE User(
	UserID varchar(50) NOT NULL PRIMARY KEY,
	Password varchar(50) NOT NULL,
	CustomerID varchar(50) FOREIGN KEY REFERENCES Customer(CustomerID),
);



INSERT INTO Customer(CustomerID,CustomerName,Status,Gender,Address,Age,Email)
VALUES('cus001','Praneeth Kumarasinghe','Adult','Male','Matara, Sri Lanka',23,'ppp@gmail.com'),
('cus002','Ishan Madhushanka','Student','Male','Galle, Sri Lanka',17,'beaman@yahoo.com'),
('cus003','Iresh Piyatissa','Adult','Male','Hambanthota, Sri Lanka',20,'piyatissa@gmail.com'),
('cus004','Valentino Rossi','Child','Male','Ambalangoda, Sri Lanka',06,''),
('cus005','Tharuka Nawarathne','Student','Male','Matara, Sri Lanka',28,'tmNawarathne@gmail.com'),
('cus006','Alexa Bliss','Adult','Female','Kandy, Sri Lanka',25,'noworry@hotmail.com'),
('cus007','Mark Marques','Student','Male','Ampara, Sri Lanka',35,'mark93@gmail.com'),
('cus008','Christiano Ronaldo','Adult','Male','Negambo, Sri Lanka',35,'ronaldo7@gmail.com'),
('cus009','Ranmuthu Kalpani','Adult','Female','Weligama, Sri Lanka',34,'ranmuthukal@gmail.com'),
('cus010','Sasha Banks','child','Female','Tangalle, Sri Lanka',12,'sssshasha@hotmail.com'),
('cus011','Supun Dilini','Child','Female','Colombo, Sri Lanka',10,'col2017@gmail.com'),
('cus012','Mark Anthony','Adult','Male','Nuwara Eliya, Sri Lanka',45,'nuwaraeliyeanthony@gmail.com'),
('cus013','Andrea Lannone','Student','Male','Kegalle, Sri Lanka',16,'andrea@gmail.com'),
('cus014','Enrique Iglesias','Adult','Male','Colombo, Sri Lanka',30,'enrique@gmail.com'),
('cus015','Chamindra Rahman','Adult','Female','Kandy, Sri Lanka',23,'singsong@gmail.com'),
('cus016','Kevin Owens','child','Male','Panadura, Sri Lanka',05,''),
('cus017','Steeve Rodgers','Student','Male','Moratuwa, Sri Lanka',18,'qaaa@gmail.com'),
('cus018','Hiruni Prabodha','Child','Female','Matara, Sri Lanka',03,''),
('cus019','Mitcheal Starc','Adult','Male','Melbourne City, Sri Lanka',30,'starc19@gmail.com'),
('cus020','Issabella Francis','Adult','Female','Colombo,Sri Lanka',45,'isse123@yahoo.com');



INSERT INTO Payment(PaymentID,Amount,PaymentType,PaidDate,PaidTime,DiscountID,CustomerID)
VALUES('p001',500,'Cash','2017-11-01','15:04:00','dis1002','cus002'),
('p002',300,'Card','2017-11-02','10:24:30','','cus002'),
('p003',250,'Cash','2017-10-30','08:29:00','dis1002','cus001'),
('p004',150,'Cash','2017-11-05','18:02:00','dis1001','cus018'),
('p005',100,'Card','2017-10-21','11:32:20','dis1003','cus004'),
('p006',400,'Cash','2017-10-11','13:43:30','dis1005','cus002'),
('p007',1500,'Card','2017-10-20','15:04:00','dis1001','cus003'),
('p008',550,'Cash','2017-10-06','09:57:22','','cus003'),
('p009',200,'Cash','2017-09-26','07:34:22','dis1008','cus011'),
('p010',725,'Card','2017-09-13','11:24:00','dis1012','cus001'),
('p011',700,'Cash','2017-10-24','16:54:50','dis1011','cus019'),
('p012',200,'Card','2017-10-11','07:04:04','dis1015','cus005'),
('p013',800,'Cash','2017-10-09','09:20:30','dis1003','cus007'),
('p014',400,'Cash','2017-11-12','13:04:00','dis1033','cus020'),
('p015',220,'Cash','2017-11-15','13:23:20','','cus013'),
('p016',800,'Card','2017-11-11','15:09:54','dis1011','cus016'),
('p017',750,'Cash','2017-11-16','17:42:00','dis1021','cus002'),
('p018',220,'Card','2017-11-21','19:41:10','dis1012','cus001'),
('p019',750,'Cash','2017-11-17','15:20:00','dis1012','cus002'),
('p020',600,'Cash','2017-11-13','17:24:00','dis1022','cus002');


INSERT INTO Film(FilmID,FilmName,FilmCategory,Industry,Studio,Duration,MainActor,ReleaseDate)
VALUES('f001','Thor:Ragnarok','Comedy','Hollywood','Marvel','2h 10m','Chris Hemsworth','2017-10-10'),
('f002','Spider-Man:Home Coming','Action','Hollywood','Marvel','2h 13m','Tom Holland','2017-06-28'),
('f003','Bahubali 2:The Conclusion','Drama','Bollywood','Arka Media Works','3h 17m','Prabhas','2017-04-28'),
('f004','Wonder Woman','Action','Hollywood','DC Comics','2h 21m','Gal Gadot','2017-05-15'),
('f005','Golmal Again','Comedy','Bollywood','Rohit Shetty Productions','3h','Ajay Devgan','2017-10-15'),
('f006','The Fate of the Furios','Action/Triller','Hollywood','Universal','2h 18m','Vin Diesel','2017-04-04'),
('f007','Justice League','Action','Hollywood','DC Comics','2h 50m','Ben Affleck','2017-11-16'),
('f008','War of the Planet of the Ape','Action','Hollywood','20th Century fox','2h 22m','Andy Serkis','2017-07-10'),
('f009','It','Horror','Hollywood','WB Pictures','2h 15m','Bill Skarsgard','2017-09-07'),
('f010','Logan','Action','Hollywood','Marvel','2h 21m','Hugh Jackman','2017-03-01'),
('f011','Pirates of the Caribean','Comedy','Hollywood','Disney','2h 33m','Johnny Depp','2017-05-11'),
('f012','Baby Driver','Crime','Hollywood','TriStars','1h 53m','Ansel Elgort','2017-06-21'),
('f013','The Lego Batman Movie','Comedy','Hollywood','DC Comics','2h 19m','Will Arnet','2017-02-01'),
('f014','Star wars: The last jedi','Action','Hollywood','LUCASFILM','2h 30m','Daisy Ridley','2017-12-15'),
('f015','Galdians of the Galaxy vol 2','Comedy','Hollywood','Marvel','2h 18m','Chris Pratt','2017-04-19');





CREATE INDEX index1 ON Customer (CustomerID,CustomerName,Email);

CREATE INDEX index2 ON Payment (PaymentID,Amount,CustomerID);


CREATE VIEW CustomerView AS SELECT CustomerName,Age FROM Customer WHERE Age >16;


CREATE VIEW TicketDetails AS SELECT t.BookingDate,t.BookingTime,c.Name as CinemaName,f.FilmName,cus.CustomerName FROM Ticket t 
LEFT JOIN Cinema c ON t.CinemaID =c.CinemaID
LEFT JOIN Film f ON t.FilmID = f.FilmID
LEFT JOIN Customer cus ON t.CustomerID = cus.CustomerID;

CREATE VIEW CustomerWatch AS SELECT c.CustomerName, c.Email FROM Customer c INNER JOIN Ticket t ON c.CustomerID=t.CustomerID
INNER JOIN Show s ON t.ShowID =s.ShowID
WHERE s.Language ='English' AND s.SubTitleAvailability='Yes';


CREATE TRIGGER insertCinema
ON Cinema
AFTER INSERT
AS

BEGIN

SELECT COUNT(Name) AS Cinemas FROM Cinema

END

INSERT INTO Cinema (CinemaID,Name,Category,Address,StartedYear,Telephone,OwnerName,Email) 
VALUES('cin001','PranCinema','3D','Colombo Road, Kandy', '2017',0713378902,'Praneeth', 'pmk@gamil.com');


CREATE TRIGGER PaymentTrigger
ON Payment
AFTER INSERT,UPDATE
AS
IF(SELECT Amount FROM INSERTED)>4000
BEGIN
	ROLLBACK
	PRINT 'Your Amount should be less than Rs.4000'
END
ELSE
BEGIN
	SELECT SUM(Amount) AS Total_Income FROM Payment
	PRINT 'Your Data is Entered Successfuly'
END


INSERT INTO Payment(PaymentID,Amount,PaymentType,PaidDate,PaidTime,DiscountID,CustomerID) 
VALUES('p021','500','Cash','2017-10-30','14:00','dis001','cus008');

SELECT c.Age,c.CustomerName,t.TicketNumber,t.BookingDate FROM Ticket t LEFT JOIN Customer c ON t.CustomerID =c.CustomerID
ORDER BY Age DESC;

SELECT p.PaymentType,c.CustomerName,p.Amount,d.DiscountName,d.Percentage FROM Customer c INNER JOIN Payment p ON c.CustomerID=p.CustomerID
INNER JOIN	Discount d ON p.DiscountID=d.DiscountID
WHERE p.PaymentType='Cash';

SELECT PaymentID, Amount,PaymentType,PaidDate,CustomerID FROM Payment WHERE Amount >(SELECT AVG(Amount) FROM Payment WHERE PaymentType='Card');

SELECT AVG(Amount) as Am FROM Payment WHERE PaymentType='Card';

SELECT * FROM Customer WHERE (c.CustomerName LIKE '%s') AND (c.Status='Adult');

SELECT c.CustomerID,c.CustomerName,c.Status,c.Gender,c.Address,c.Age,c.Email,s.Language 
FROM Customer c LEFT JOIN Ticket t ON T.CustomerID =C.CustomerID
LEFT JOIN Show s ON t.ShowID=s.ShowID
 WHERE ((c.CustomerName LIKE '%s') AND (c.Status='Adult'))AND (s.Language='English');

 SELECT COUNT(DiscountID) FROM Payment;

 SELECT c.CustomerName,pmax.Amount AS MaximumPayment FROM Payment pmax
 LEFT JOIN Customer c ON pmax.CustomerID=c.CustomerID
 WHERE (pmax.Amount IN(SELECT MAX(Amount) FROM Payment));
 
 SELECT SUM(Amount) AS Total FROM Payment;
 SELECT AVG(Amount) AS Average FROM Payment;
 SELECT MAX(Amount) AS MaxAmount FROM Payment;
 SELECT MIN(Amount) AS MinAmount FROM Payment;

 SELECT c.CustomerName,pmin.Amount AS MinimumPayment FROM Payment pmin
 LEFT JOIN Customer c ON pmin.CustomerID=c.CustomerID
 WHERE (pmin.Amount IN(SELECT MIN(Amount) FROM Payment));

 SELECT SUM(Price) AS Total,AVG(Price) AS Average FROM Ticket WHERE TicketClass ='Normal';

 SELECT TicketNumber, HallNumber FROM Ticket WHERE HallNumber >=2 
 GROUP BY TicketNumber, HallNumber HAVING COUNT(HallNumber)> 3;

SELECT COUNT(CustomerID) AS NumberOfCustomers, Age
FROM Customer
GROUP BY Age
HAVING COUNT(CustomerID) > 1;

SELECT COUNT(CustomerID) AS NumberOfCustomers, Age
FROM Customer WHERE Gender='Male'
GROUP BY Age
HAVING COUNT(CustomerID) > 1;


SELECT * FROM (SELECT FilmName,FilmCategory,Industry,Studio,MainActor FROM Film WHERE Industry='Hollywood')ID WHERE FilmCategory='Action';


SELECT c.CustomerName,p.PaymentID,p.Amount,p.PaymentType,p.PaidDate,c.Email,t.TelephoneNo FROM Payment p 
LEFT JOIN Customer c ON p.CustomerID =c.CustomerID
LEFT JOIN Telephone t ON c.CustomerID=t.CustomerID
WHERE Amount <(SELECT AVG(Amount) FROM Payment);

SELECT a.FilmName AS FilmName1,b.FilmName AS FilmName2, a.Studio FROM Film a, Film b
WHERE a.FilmID <>b.FilmID
AND a.Duration=b.Duration
ORDER BY a.Studio; 


ticket payment customer telephone film

CREATE VIEW CustomerFIlmIndustry AS
SELECT c.CustomerName,c.Address,tel.TelephoneNo,f.FilmName,f.FilmCategory,
t.BookingDate,t.BookingTime,t.HallNumber,f.Industry
FROM Ticket t LEFT JOIN Customer c ON t.CustomerID=c.CustomerID

LEFT JOIN Film f ON t.FilmID=f.FilmID
LEFT JOIN Telephone tel ON c.CustomerID=tel.CustomerID
WHERE f.Industry='Hollywood';


Select * FROM CustomerFIlmIndustry WHERE FilmCategory='Action';


CREATE TRIGGER TicketTrigger
ON Ticket
AFTER INSERT,UPDATE
AS
IF(SELECT TicketNumber FROM INSERTED)=''
BEGIN
	ROLLBACK
	PRINT 'This is not allowed for null values'
END
ELSE
BEGIN
	SELECT * FROM Ticket;
END


INSERT INTO Ticket(TicketNumber,BookingDate,BookingTime,HallNumber,TicketClass,Type,SeatNumber,Price,FilmID,ShowID,CustomerID,CinemaID)
Values(120,'2017-10-20','10:00',1,'Normal','Half','10',150,'f002','s004','cus003','ci002');

Insert into Cinema(CinemaID,Name,Category,Address,StartedYear,Telephone,OwnerName,Email)
Values('ci013', 'Savoy4', 'Normal','Galle Road Colombo','2015',0712345678,'Iresh Piyatissa','savoy4@yahoo.com');


INSERT INTO Payment(PaymentID,Amount,PaymentType,PaidDate,PaidTime,DiscountID,CustomerID) 
VALUES('p025','550','Cash','2017-10-30','14:00','dis001','cus008');


INSERT INTO Payment(PaymentID,Amount,PaymentType,PaidDate,PaidTime,DiscountID,CustomerID) 
VALUES('p026','4500','Card','2017-10-03','16:00','dis001','cus009');




SELECT p.PaymentType,c.CustomerName,p.Amount,d.DiscountName,d.Percentage FROM Customer c INNER JOIN Payment p ON c.CustomerID=p.CustomerID
INNER JOIN	Discount d ON p.DiscountID=d.DiscountID
WHERE p.PaymentType='Cash';

