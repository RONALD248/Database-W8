-- Final assignment question one speciallized on creating a Library Management System.
-- Create the database
CREATE DATABASE LibraryManagement;
USE LibraryManagement;

-- Create the Books table
CREATE TABLE Books (
    BookID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Author VARCHAR(255) NOT NULL,
    ISBN VARCHAR(13) UNIQUE NOT NULL,
    PublishedYear YEAR,
    CopiesAvailable INT NOT NULL CHECK (CopiesAvailable >= 0)
);

-- Create the Members table
CREATE TABLE Members (
    MemberID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    PhoneNumber VARCHAR(15) NOT NULL,
    MembershipDate DATE NOT NULL
);

-- Create the Loans table
CREATE TABLE Loans (
    LoanID INT AUTO_INCREMENT PRIMARY KEY,
    BookID INT NOT NULL,
    MemberID INT NOT NULL,
    LoanDate DATE NOT NULL,
    ReturnDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID) ON DELETE CASCADE,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID) ON DELETE CASCADE,
    CHECK (ReturnDate >= LoanDate OR ReturnDate IS NULL)
);

-- Example data insertion (optional)
INSERT INTO Books (Title, Author, ISBN, PublishedYear, CopiesAvailable) VALUES
('The Great Gatsby', 'F. Scott Fitzgerald', '9780743273565', 1925, 5),
('1984', 'George Orwell', '9780451524935', 1949, 3),
('To Kill a Mockingbird', 'Harper Lee', '9780061120084', 1960, 4);

INSERT INTO Members (FirstName, LastName, Email, PhoneNumber, MembershipDate) VALUES
('John', 'Doe', 'john.doe@example.com', '1234567890', '2023-01-15'),
('Jane', 'Smith', 'jane.smith@example.com', '0987654321', '2023-02-20');

-- Sample loan record
INSERT INTO Loans (BookID, MemberID, LoanDate, ReturnDate) VALUES
(1, 1, '2023-09-01', NULL),
(2, 2, '2023-09-15', '2023-09-22');