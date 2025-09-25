# Library Management Database

## Overview

The Library Management Database is designed to manage a library's operations, including tracking books, members, and loans. This relational database system is built using MySQL and is structured to ensure data integrity and efficient access.

## Features

- **Books Management**: Store and manage information about books, including title, author, ISBN, publication year, and available copies.
- **Member Management**: Keep track of library members with personal information and membership details.
- **Loan Tracking**: Record loans of books to members, including loan and return dates.

## Database Schema

The database consists of three main tables:

1. **Books**
   - `BookID`: INT, Primary Key, Auto-Increment
   - `Title`: VARCHAR(255), NOT NULL
   - `Author`: VARCHAR(255), NOT NULL
   - `ISBN`: VARCHAR(13), UNIQUE, NOT NULL
   - `PublishedYear`: YEAR
   - `CopiesAvailable`: INT, NOT NULL, CHECK (>= 0)

2. **Members**
   - `MemberID`: INT, Primary Key, Auto-Increment
   - `FirstName`: VARCHAR(100), NOT NULL
   - `LastName`: VARCHAR(100), NOT NULL
   - `Email`: VARCHAR(255), UNIQUE, NOT NULL
   - `PhoneNumber`: VARCHAR(15), NOT NULL
   - `MembershipDate`: DATE, NOT NULL

3. **Loans**
   - `LoanID`: INT, Primary Key, Auto-Increment
   - `BookID`: INT, Foreign Key, NOT NULL
   - `MemberID`: INT, Foreign Key, NOT NULL
   - `LoanDate`: DATE, NOT NULL
   - `ReturnDate`: DATE, CHECK (>= LoanDate OR IS NULL)

## Relationships

- **One-to-Many**:
  - A single member can loan multiple books.
  - A single book can be loaned to multiple members over time.

## Setup Instructions

1. **Install MySQL**: Ensure that MySQL is installed on your system.
2. **Create Database**: Use the provided SQL script to create the database and tables.
   ```sql
   -- Run the SQL script
   source /path/to/answers.sql;

For more contact me through:
  -Email: **collincesronald@gmail.com**
  -Phone: **0715920019**
