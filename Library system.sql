-- @author - Yo Mothowamodimo/HOLIDAY
-- This project is a Library Database System designed to manage books, members, loan and staff records
-- Inlcudes a ER Diagram

CREATE TABLE BRANCHES (
    BranchID INT PRIMARY KEY,
    Branchname VARCHAR(255) NOT NULL,
    BranchAddress VARCHAR(255) NOT NULL,
    phone VARCHAR(20) NOT NULL
);

CREATE TABLE AUTHOR (
    AuthorID INT PRIMARY KEY,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL
);

CREATE TABLE BOOK (
    BookID INT PRIMARY KEY,
    BookTitle VARCHAR(255) NOT NULL,
    ISBN VARCHAR(20) NOT NULL,
    AuthorID INT,
    Genre VARCHAR(255) NOT NULL,
    FOREIGN KEY (AuthorID) REFERENCES AUTHOR(AuthorID)
);

CREATE TABLE STAFF(
    StaffID INT PRIMARY KEY,
    BranchID INT,
    StaffName VARCHAR(100) NOT NULL,
    StaffSurname VARCHAR(100) NOT NULL,
    FOREIGN KEY (BranchID) REFERENCES BRANCHES (BranchID)    
);

CREATE TABLE MEMBERS (
    MembersID INT PRIMARY KEY,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Phone VARCHAR(20) NOT NULL,
    MembersAddress VARCHAR(255) NOT NULL
);

CREATE TABLE LOAN (
    LoanID INT PRIMARY KEY,
    BookID INT NOT NULL,
    MembersID INT NOT NULL,
    LoanDate DATE NOT NULL,
    ReturnDate DATE NOT NULL, 
    FOREIGN KEY (BookID) REFERENCES BOOK(BookID),
    FOREIGN KEY (MembersID) REFERENCES MEMBERS(MembersID)
);

CREATE TABLE BOOKLOCATION(
    BookID INT NOT NULL,
    BranchID INT NOT NULL,
    Quantity INT NOT NULL,
    PRIMARY KEY (BookID, BranchID),
    FOREIGN KEY (BookID) REFERENCES BOOK(BookID),
    FOREIGN KEY (BranchID) REFERENCES BRANCHES(BranchID)
);