-- @author - Yo Mothowamodimo/HOLIDAY
-- This project is a Library Database System designed to manage books, members, loan and staff records
-- Includes a ER Diagram

-- 13 September 2025, added CHECK constraints

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
    ISBN VARCHAR(20) NOT NULL CHECK (LENGTH(ISBN) BETWEEN 10 AND 20),
    AuthorID INT,
    Genre VARCHAR(255) NOT NULL CHECK (Genre <> ''),
    PublisherID INT,
    FOREIGN KEY (AuthorID) REFERENCES AUTHOR(AuthorID),
    FOREIGN KEY (PublisherID) REFERENCES PUBLISHER(PublisherID)
);

CREATE TABLE STAFF(
    StaffID INT PRIMARY KEY,
    BranchID INT,
    StaffName VARCHAR(100) NOT NULL CHECK (StaffName <> ''),
    StaffSurname VARCHAR(100) NOT NULL CHECK (StaffSurname <> ''),
    FOREIGN KEY (BranchID) REFERENCES BRANCHES (BranchID)    
);

CREATE TABLE MEMBERS (
    MembersID INT PRIMARY KEY,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL CHECK (Email LIKE '%@%.%'),
    Phone VARCHAR(20) NOT NULL,
    MembersAddress VARCHAR(255) NOT NULL
);

CREATE TABLE LOAN (
    LoanID INT PRIMARY KEY,
    BookID INT NOT NULL,
    BranchID INT NOT NULL,
    MembersID INT NOT NULL,
    LoanDate DATE NOT NULL,
    ReturnDate DATE NOT NULL CHECK (ReturnDate > LoanDate),
    FOREIGN KEY (BookID, BranchID) REFERENCES BOOKLOCATION(BookID, BranchID),
    FOREIGN KEY (MembersID) REFERENCES MEMBERS(MembersID)
);


CREATE TABLE BOOKLOCATION(
    BookID INT NOT NULL,
    BranchID INT NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity >= 0),
    PRIMARY KEY (BookID, BranchID),
    FOREIGN KEY (BookID) REFERENCES BOOK(BookID),
    FOREIGN KEY (BranchID) REFERENCES BRANCHES(BranchID)
);

-- 26/05/2026 Added a Publisher table 
CREATE TABLE PUBLISHER (
    PublisherID INT PRIMARY KEY,
    PublisherName VARCHAR(255) NOT NULL,
    ContactEmail VARCHAR(100) NOT NULL,
    ContactPhone VARCHAR(20) NOT NULL,
    Address VARCHAR(255),
    Website VARCHAR(100),
    CONSTRAINT UQ_PublisherName UNIQUE (PublisherName),
    CONSTRAINT CHK_PublisherEmail CHECK (ContactEmail LIKE '%@%.%'),
    CONSTRAINT CHK_PublisherPhone CHECK (LEN(ContactPhone) >= 10)
);