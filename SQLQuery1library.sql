create database Library_Management;

drop table Library_Branch;

Create Table Library_Branch (
	branchId INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	branchName VARCHAR(50) NOT NULL,
	address NVARCHAR(100) NOT NULL,
);

INSERT INTO Library_Branch
	(branchName, address)
	values
		('Sharpstown', '555 Intio st. Interapple, Pa 81362'),
		('Central', '724 Variable way Caca, MO 98234'),
		('Orange','711 cheetos head rd. Pot, US 00911'),
		('Barnum', '92 patrol cir. Lansing, MI 28564')
;
Select * from Library_Branch;

drop table Publisher;

Create Table Publisher (
	publisherName VARCHAR(50) Primary Key NOT NULL,
	address Nvarchar (60) Not Null,
	phone Nvarchar(25) Not NUll	
);

Insert into Publisher
	(publisherName, address, phone)
	values
		('Simon & Schuster', '1230 Avenue Of the Americas New York, NY 10020', '212-698-7000'),
		('Harper Collins', 'HarperCollins Publisher 195 Broadway New York, NY 10007', '212-207-7000'),
		('Chilton Company','Chilton company 111 Broadway New York, NY 100007','212-205-7000'),
		('Picador USA', 'Picador Publishing 211 anyway dr. Hollywood, CA 86320', '818-567-8234')
;
Select * from Publisher;

drop table Books;

Create Table Books (
	bookId INT PRIMARY KEY NOT NULL IDENTITY (1000,1),
	title Nvarchar(100) Not Null,
	publisherName VARCHAR(50) FOREIGN KEY REFERENCES publisher(publisherName),
);
Insert into Books
	(title, publisherName)
	values
		('The Hobbit','Harper Collins'),
		('The Lord of the Rings: The Fellowship of the Rings','Harper Collins'),
		('The Lord of the Rings: The Two Towers','Harper Collins'),
		('The Lord of the Rings: The Return Of the King','Harper Collins'),
		('Thinner','Simon & Schuster'),
		('The Colorado Kid','Simon & Schuster'),
		('Needful Things','Simon & Schuster'),
		('Dune','Chilton Company'),
		('Dune Messiah','Chilton Company'),
		('The Chronicles of Narnia: The Lion, the Witch and the Wardrobe','Harper Collins'),
		('The Chronicles of Narnia: Prince Caspian','Harper Collins'),
		('The Chronicles of Narnia: The Voyage of the Dawn Treader','Harper Collins'),
		('Not One of Us Stories of Aliens on Earth','Simon & Schuster'),
		('Words That Hurt, Words That Heal, Revised Edition','Harper Collins'),
		('Secret History of the Watchers','Simon & Schuster'),
		('Journey to the Centre of the Earth','Harper Collins'),
		('Contact','Simon & Schuster'),
		('Searching for the Philosophers’ Stone','Simon & Schuster'),
		('Children of Dune','Chilton Company'),
		('God Emperor of Dune','Chilton Company'),
		('The Lost Tribe', 'Picador USA') 
;
select * from Books;

drop table Borrower;

Create Table Borrower (
	cardNo INT PRIMARY KEY NOT NULL IDENTITY (500,1),
	name varchar(50) not null,
	address nvarchar(60) not null,
	phone nvarchar(25) not null
);
Insert into Borrower
	(name, address, phone)
	Values
	('John Doe', '1965 Clark st. denver co 80209', '555-934-7564'),
	('Mary Jane', '123 home st. denver co 80284', '987-234-7546'),
	('Tiny Tim', '11223 High st. denver co 80204', '303-982-1000'),
	('Bruce Lee', '4123 Minataur st. denver co 80214', '303-567-2000'),
	('Sylar Cuts', '390 come st. denver co 80204', '720-635-2599'),
	('Wonder Woman', '943 windy st. denver co 82204', '212-539-2435'),
	('Aquaman', '111 hole st. denver co 80504', '818-769-5623'),
	('Easter Bunny', '223 homer st. denver co 89204', '808-123-9867')
;
Select * from Borrower;

drop table Book_Authors;

Create Table Book_Authors (
	bookID int FOREIGN KEY REFERENCES books(bookID),
	authorName varchar(50) not null
);
Insert into Book_Authors
	(bookID, authorName)
	values
	('1000', 'J.R.R. Tolkein'),
	('1001', 'J.R.R. Tolkein'),
	('1002', 'J.R.R. Tolkein'),
	('1003', 'J.R.R. Tolkein'),
	('1004', 'Stephen King'),
	('1005', 'Stephen King'),
	('1006', 'Stephen King'),
	('1007', 'Frank Herbert'),
	('1008', 'Frank Herbert'),
	('1009', 'C.S. Lewis'),
	('1010', 'C.S. Lewis'),
	('1011', 'C.S. Lewis'),
	('1012', 'Neil Clarke'),
	('1013', 'Joseph Telushkin'),
	('1014', 'Timothy Wyllie'),
	('1014', 'Jules Verne'),
	('1016', 'Carl Sagan'),
	('1017', 'Ralph Metzner'),
	('1018', 'Frank Herbert'),
	('1019', 'Frank Herbert'),
	('1020', 'Mark Lee')
;
Select * from  Book_Authors;

drop table  Book_Copies;

Create Table Book_Copies (
	bookID int FOREIGN KEY REFERENCES books(bookID),
	branchID int FOREIGN KEY REFERENCES Library_Branch(branchID),
	number_of_Copies int not null
);
Insert into Book_Copies
	(bookID, branchID, number_of_Copies)
	values
	('1000', '2', '2'),
	('1020', '2', '2'),
	('1016', '2', '2'),
	('1005', '2', '2'),
	('1006', '2', '2'),
	('1007', '2', '2'),
	('1001', '2', '2'),
	('1002', '2', '2'),
	('1003', '2', '2'),
	('1009', '2', '2'),
	('1010', '2', '2'),
	('1011', '2', '2'),
	('1015', '2', '2'),
	('1013', '2', '2'),
	('1018', '2', '2'),
	('1000', '1', '2'),
	('1020', '1', '2'),
	('1016', '1', '2'),
	('1005', '1', '2'),
	('1006', '1', '2'),
	('1007', '1', '2'),
	('1001', '1', '2'),
	('1002', '1', '2'),
	('1003', '1', '2'),
	('1009', '1', '2'),
	('1010', '1', '2'),
	('1011', '1', '2'),
	('1015', '1', '2'),
	('1013', '1', '2'),
	('1018', '1', '2'),
	('1000', '3', '2'),
	('1020', '3', '2'),
	('1016', '3', '2'),
	('1005', '3', '2'),
	('1006', '3', '2'),
	('1007', '3', '2'),
	('1001', '3', '2'),
	('1002', '3', '2'),
	('1003', '3', '2'),
	('1009', '3', '2'),
	('1010', '3', '2'),
	('1011', '3', '2'),
	('1015', '3', '2'),
	('1013', '3', '2'),
	('1018', '3', '2'),
	('1000', '4', '2'),
	('1020', '4', '2'),
	('1016', '4', '2'),
	('1005', '4', '2'),
	('1006', '4', '2'),
	('1007', '4', '2'),
	('1001', '4', '2'),
	('1002', '4', '2'),
	('1003', '4', '2'),
	('1009', '4', '2'),
	('1010', '4', '2'),
	('1011', '4', '2'),
	('1015', '4', '2'),
	('1013', '4', '2'),
	('1018', '4', '2'),
	('1004', '2', '2'),
	('1008', '2', '2'),
	('1014', '2', '2'),
	('1012', '2', '2'),
	('1017', '2', '2'),
	('1019', '2', '2')
;

Select * from Book_Copies;

drop table Book_Loans;

Create Table Book_Loans (
	bookID int FOREIGN KEY REFERENCES books(bookID),
	branchID int FOREIGN KEY REFERENCES Library_Branch(branchID),
	cardNo int FOREIGN KEY REFERENCES borrower(cardNo),
	dateOut nvarchar(20) not null,
	dateDue nvarchar(20) not null	
);

Insert into Book_Loans 
	(bookID, branchID, cardNo, dateOut, dateDue)
	values
	('1020', '1', '500', '1/11/2019', '3/11/2019'),
	('1007', '1', '500', '1/11/2019', '3/11/2019'),
	('1008', '1', '500', '1/11/2019', '3/11/2019'),
	('1005', '1', '500', '1/11/2019', '3/11/2019'),
	('1000', '1', '500', '1/11/2019', '3/11/2019'),
	('1013', '1', '500', '1/11/2019', '3/11/2019'),
	('1016', '1', '500', '1/11/2019', '3/11/2019'),
	('1020', '3', '506', '1/11/2019', '3/11/2019'),
	('1007', '3', '506', '1/11/2019', '3/11/2019'),
	('1008', '3', '506', '1/11/2019', '3/11/2019'),
	('1005', '3', '506', '1/11/2019', '3/11/2019'),
	('1000', '3', '506', '1/11/2019', '3/11/2019'),
	('1013', '3', '506', '1/11/2019', '3/11/2019'),
	('1016', '3', '506', '1/11/2019', '3/11/2019'),
	('1001', '3', '506', '1/11/2019', '3/11/2019'),
	('1002', '3', '506', '1/11/2019', '3/11/2019'),
	('1003', '3', '506', '1/11/2019', '3/11/2019'),
	('1004', '3', '506', '1/11/2019', '3/11/2019'),
	('1011', '3', '506', '1/11/2019', '3/11/2019'),
	('1013', '4', '502', '1/11/2019', '3/11/2019'),
	('1016', '4', '502', '1/11/2019', '3/11/2019'),
	('1020', '4', '502', '1/11/2019', '3/11/2019'),
	('1007', '4', '502', '1/11/2019', '3/11/2019'),
	('1008', '4', '502', '1/11/2019', '3/11/2019'),
	('1005', '4', '502', '1/11/2019', '3/11/2019'),
	('1020', '4', '502', '1/11/2019', '3/11/2019'),
	('1007', '2', '504', '1/11/2019', '3/11/2019'),
	('1008', '2', '504', '1/11/2019', '3/11/2019'),
	('1005', '2', '504', '1/11/2019', '3/11/2019'),
	('1000', '2', '504', '1/11/2019', '3/11/2019'),
	('1013', '2', '504', '1/11/2019', '3/11/2019'),
	('1016', '2', '504', '1/11/2019', '3/11/2019'),
	('1020', '2', '504', '1/11/2019', '3/11/2019'),
	('1007', '2', '504', '1/11/2019', '3/11/2019'),
	('1008', '2', '504', '1/11/2019', '3/11/2019'),
	('1005', '2', '504', '1/11/2019', '3/11/2019'),
	('1020', '2', '504', '1/11/2019', '3/11/2019'),
	('1007', '1', '500', '1/11/2019', '3/11/2019'),
	('1008', '1', '500', '1/11/2019', '3/11/2019'),
	('1005', '1', '500', '1/11/2019', '3/11/2019'),
	('1000', '1', '500', '1/11/2019', '3/11/2019'),
	('1013', '1', '500', '1/11/2019', '3/11/2019'),
	('1016', '1', '501', '1/11/2019', '3/11/2019'),
	('1020', '4', '500', '1/11/2019', '3/11/2019'),
	('1007', '1', '500', '1/11/2019', '3/11/2019'),
	('1008', '1', '503', '1/11/2019', '3/11/2019'),
	('1005', '4', '500', '1/11/2019', '3/11/2019'),
	('1020', '1', '500', '1/11/2019', '3/11/2019'),
	('1007', '1', '500', '1/11/2019', '3/11/2019'),
	('1008', '1', '501', '1/11/2019', '3/11/2019'),
	('1005', '1', '500', '1/11/2019', '3/11/2019'),
	('1006', '1', '500', '1/11/2019', '3/11/2019'),
	('1013', '1', '500', '1/11/2019', '3/11/2019'),
	('1016', '1', '500', '1/11/2019', '3/11/2019'),
	('1020', '1', '500', '1/11/2019', '3/11/2019'),
	('1007', '4', '500', '1/11/2019', '3/11/2019'),
	('1008', '1', '500', '1/11/2019', '3/11/2019'),
	('1005', '1', '501', '1/11/2019', '3/11/2019')
;

Select * from Book_Loans;
------------




