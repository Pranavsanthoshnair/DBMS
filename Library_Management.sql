CREATE TABLE Language (
    Language_Id INT PRIMARY KEY,
    Name VARCHAR(50)
);

INSERT INTO Language VALUES (1,'English');
INSERT INTO Language VALUES (2,'Malayalam');
INSERT INTO Language VALUES (3,'Hindi');
INSERT INTO Language VALUES (4,'Tamil');
INSERT INTO Language VALUES (5,'French');

SELECT * FROM Language;


CREATE TABLE Publisher (
    Publisher_Id INT PRIMARY KEY,
    P_name VARCHAR(100),
    Address VARCHAR(200)
);

INSERT INTO Publisher VALUES (1,'Pearson','Delhi');
INSERT INTO Publisher VALUES (2,'McGrawHill','Mumbai');
INSERT INTO Publisher VALUES (3,'Oxford','Chennai');
INSERT INTO Publisher VALUES (4,'SChand','Kolkata');
INSERT INTO Publisher VALUES (5,'Cambridge','Bangalore');

SELECT * FROM Publisher;


CREATE TABLE Author (
    Author_Id INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone_Number VARCHAR(15),
    Status VARCHAR(20)
);

INSERT INTO Author VALUES (1,'Ramesh','ramesh@gmail.com','9876543210','Active');
INSERT INTO Author VALUES (2,'Anita','anita@gmail.com','9876543211','Active');
INSERT INTO Author VALUES (3,'John','john@gmail.com','9876543212','Inactive');
INSERT INTO Author VALUES (4,'Priya','priya@gmail.com','9876543213','Active');
INSERT INTO Author VALUES (5,'Rahul','rahul@gmail.com','9876543214','Active');

SELECT * FROM Author;


CREATE TABLE Book (
    Book_Id INT PRIMARY KEY,
    Title VARCHAR(100),
    Language_Id INT,
    MRP INT,
    Publisher_Id INT,
    Publisher_Date DATE,
    Volume INT,
    Status VARCHAR(20),
    CONSTRAINT fk_language FOREIGN KEY (Language_Id)
        REFERENCES Language(Language_Id),
    CONSTRAINT fk_publisher FOREIGN KEY (Publisher_Id)
        REFERENCES Publisher(Publisher_Id)
);

INSERT INTO Book VALUES (1,'Database',1,500,1,'10-JAN-22',1,'Available');
INSERT INTO Book VALUES (2,'OperatingSystem',1,600,2,'12-FEB-21',1,'Available');
INSERT INTO Book VALUES (3,'DataStructure',2,450,3,'05-MAR-20',2,'Issued');
INSERT INTO Book VALUES (4,'Networks',3,550,4,'15-APR-19',1,'Available');
INSERT INTO Book VALUES (5,'SoftwareEngg',1,650,5,'20-MAY-23',3,'Issued');

SELECT * FROM Book;


CREATE TABLE Book_Author (
    Book_Id INT,
    Author_Id INT,
    PRIMARY KEY (Book_Id, Author_Id),
    FOREIGN KEY (Book_Id) REFERENCES Book(Book_Id),
    FOREIGN KEY (Author_Id) REFERENCES Author(Author_Id)
);

INSERT INTO Book_Author VALUES (1,1);
INSERT INTO Book_Author VALUES (2,2);
INSERT INTO Book_Author VALUES (3,3);
INSERT INTO Book_Author VALUES (4,4);
INSERT INTO Book_Author VALUES (5,5);

SELECT * FROM Book_Author;


CREATE TABLE Member (
    Member_Id INT PRIMARY KEY,
    Name VARCHAR(100),
    Branch_Code VARCHAR(10),
    Roll_Number VARCHAR(20),
    Phone_Number VARCHAR(15),
    Email_Id VARCHAR(100),
    Date_of_Join DATE,
    Status VARCHAR(20)
);

INSERT INTO Member VALUES (1,'Arjun','CSE','21CSE01','9000000001','arjun@gmail.com','01-JAN-23','Active');
INSERT INTO Member VALUES (2,'Meera','ECE','21ECE02','9000000002','meera@gmail.com','05-FEB-23','Active');
INSERT INTO Member VALUES (3,'Vivek','ME','21ME03','9000000003','vivek@gmail.com','10-MAR-23','Inactive');
INSERT INTO Member VALUES (4,'Sneha','CSE','21CSE04','9000000004','sneha@gmail.com','15-APR-23','Active');
INSERT INTO Member VALUES (5,'Rahul','EEE','21EEE05','9000000005','rahul@gmail.com','20-MAY-23','Active');

SELECT * FROM Member;


CREATE TABLE Book_Issue (
    Issue_Id INT PRIMARY KEY,
    Date_of_Issue DATE,
    Book_Id INT,
    Member_Id INT,
    Expected_Date_of_Return DATE,
    Status VARCHAR(20),
    FOREIGN KEY (Book_Id) REFERENCES Book(Book_Id),
    FOREIGN KEY (Member_Id) REFERENCES Member(Member_Id)
);

INSERT INTO Book_Issue VALUES (1,'01-JAN-24',1,1,'15-JAN-24','Issued');
INSERT INTO Book_Issue VALUES (2,'05-JAN-24',2,2,'20-JAN-24','Issued');
INSERT INTO Book_Issue VALUES (3,'10-JAN-24',3,3,'25-JAN-24','Returned');
INSERT INTO Book_Issue VALUES (4,'12-JAN-24',4,4,'27-JAN-24','Returned');
INSERT INTO Book_Issue VALUES (5,'15-JAN-24',5,5,'30-JAN-24','Issued');

SELECT * FROM Book_Issue;


CREATE TABLE Book_Return (
    Issue_Id INT PRIMARY KEY,
    Actual_Date_of_Return DATE,
    LateDays INT,
    LateFee INT,
    FOREIGN KEY (Issue_Id) REFERENCES Book_Issue(Issue_Id)
);

INSERT INTO Book_Return VALUES (3,'28-JAN-24',3,10);
INSERT INTO Book_Return VALUES (4,'29-JAN-24',2,10);
INSERT INTO Book_Return VALUES (1,NULL,NULL,NULL);
INSERT INTO Book_Return VALUES (2,NULL,NULL,NULL);
INSERT INTO Book_Return VALUES (5,NULL,NULL,NULL);

SELECT * FROM Book_Return;


CREATE TABLE Late_Fee_Rule (
    FromDays INT,
    ToDays INT,
    Amount INT
);

INSERT INTO Late_Fee_Rule VALUES (0,7,10);
INSERT INTO Late_Fee_Rule VALUES (8,30,100);
INSERT INTO Late_Fee_Rule VALUES (31,60,10);
INSERT INTO Late_Fee_Rule VALUES (61,90,10);
INSERT INTO Late_Fee_Rule VALUES (91,120,10);

SELECT * FROM Late_Fee_Rule;


ALTER TABLE Book ADD ISBN VARCHAR(20);
SELECT * FROM Book;

ALTER TABLE Member MODIFY Phone_Number VARCHAR(20);
SELECT * FROM Member;

TRUNCATE TABLE Publisher;
SELECT * FROM Publisher;

DROP TABLE Author;

DROP TABLE Author CASCADE Constraints;
RENAME Late_Fee_Rule TO Fine;
SELECT * FROM Fine;
