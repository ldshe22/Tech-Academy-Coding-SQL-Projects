Use Library_Management
go

drop proc uspGetbranchName
go

create procedure uspGetbranchName @Library_Branch varchar(50)
as 
Select * 
FROM dbo.Library_Branch
Where branchName Like @Library_Branch + '%'
GO
EXEC dbo.uspGetbranchName 'Sharpstown'
go

create procedure uspGetauthorName @Book_Authors varchar(50)
as
select *
from Book_Authors
where authorName like @Book_Authors + '%'
go
exec dbo.uspGetauthorName 'Stephen King'
go

create procedure usp Gettitle

CREATE procedure uspGettitle @Books nvarchar(100) = null, @Book_Authors nvarchar(50) = null, @Library_Branch nvarchar(50) = null--, 
	--@Book_Copies nvarchar(50) = null, @Book_Loans nvarchar(50) = null, 
	--@Borrower nvarchar(100) = null, @Publisher nvarchar(60) = null
as
select
a2.number_of_copies, a5.title, a1.authorname, a3.branchName
From dbo.Book_Authors a1
	join dbo. Book_Copies a2 on a1.bookid = a2.bookid
	--join dbo.Book_Loans a4 on a4.bookId = a2.bookId and a4.branchid = a2.branchid
	join dbo.Library_Branch a3 on a3.branchId = a2.branchId
	--join dbo.Borrower a6 on a6.cardNo = a4.cardNo
	--join dbo.Publisher a7 (nolock) on a7.publisherName = a5.publisherName
		where a1.authorName = COALESCE(@Book_Authors,'Stephen King')
		and a5.title = COALESCE(@Books,'The Colorado Kid')
		and a3.branchName = coalesce(@Library_Branch, 'Central');
go

exec dbo.uspGettitle 'The Colorado Kid', 'Stephen King', NULL
go
----------
drop proc getSharpstown
go

create proc getSharpstown 
as

select
a1.title, a2.branchName, a3.number_of_Copies
From dbo.Books a1
	join dbo.Book_Copies a3 on a1.bookId = a3.bookID
	join dbo.Library_Branch a2 on a2.branchID = a3.branchID
	
		where a1.title = 'The Lost Tribe'
		and a2.branchName = 'Sharpstown'		
go

exec dbo.getSharpstown 
go
----------
create proc TheLostTribecopies
as
select
a1.title, a2.branchName, a3.number_of_Copies
From dbo.Books a1
	join dbo.Book_Copies a3 on a1.bookId = a3.bookID
	join dbo.Library_Branch a2 on a2.branchID = a3.branchID
	where a1.title = 'The Lost Tribe';
go

exec TheLostTribecopies
go

--------------
create proc getBorrowersCheckout
as
select
a1.name, a1.cardNo
from dbo.Borrower a1 
	LEFT OUTER JOIN dbo.Book_Loans a2
	on (a2.cardNo = a1.cardNo)
	WHERE a2.cardNo is NULL
go

exec getBorrowersCheckout
go

------------

create proc getSharpstownborrowers
as
select 
a1.dateDue, a2.title, a6.name, a6.address, a3.branchName
From dbo.Book_Loans a1
	join dbo.Books a2 on a1.bookid = a2.bookid
	--join dbo.Book_Loans a4 on a4.bookId = a2.bookId and a4.branchid = a2.branchid
	join dbo.Library_Branch a3 on a3.branchId = a1.branchId
	join dbo.Borrower a6 on a6.cardNo = a1.cardNo
	--join dbo.Publisher a7 (nolock) on a7.publisherName = a5.publisherName
		where a1.dateDue = '3/11/2019'
		and a3.branchName = 'Sharpstown';
go

exec getSharpstownborrowers
go

----------
create proc getbranchbooks
as
SELECT COUNT(a1.bookID)as 'total loans',a2.branchName
FROM dbo.Book_Loans a1
join dbo.Library_Branch a2 on a1.branchId = a2.branchId
group by a2.branchName
go

exec getbranchbooks
go

------------------

create proc getborrowers5Books
as
select count(a1.cardNo)as'number of books',a2.name, a2.address 
From dbo.Book_Loans a1
	join dbo.borrower a2 on a1.cardNo = a2.cardNo
	group by a2.name, a2.address
go
	
exec getborrowers5Books
go

