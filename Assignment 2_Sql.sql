-- Drop the database if it already exists
DROP DATABASE IF EXISTS ExerciseDb;

-- Create the database
CREATE DATABASE ExerciseDb;

-- Switch to the newly created database
USE ExerciseDb;

-- Create the Publisher table
CREATE TABLE Publisher (
  PID INT PRIMARY KEY,
  PublisherName VARCHAR(255) NOT NULL
);

-- Create the Category table
CREATE TABLE Category (
  CID INT PRIMARY KEY,
  CategoryName VARCHAR(255) NOT NULL
);

-- Create the Author table
CREATE TABLE Author (
  AID INT PRIMARY KEY,
  AuthorName VARCHAR(255) NOT NULL
);

-- Create the Book table
CREATE TABLE Book (
  BID INT PRIMARY KEY,
  BName VARCHAR(255) NOT NULL,
  BPrice DECIMAL(10, 2) NOT NULL,
  Author INT,
  Publisher INT,
  Category INT,
  FOREIGN KEY (Author) REFERENCES Author (AID),
  FOREIGN KEY (Publisher) REFERENCES Publisher (PID),
  FOREIGN KEY (Category) REFERENCES Category (CID)
);

-- Insert records into Category table
INSERT INTO Category (CID, CategoryName) VALUES
  (1, 'Fiction'),
  (2, 'Non-fiction'),
  (3, 'Science Fiction');

 select * from Category
-- Insert records into Author table
INSERT INTO Author (AID, AuthorName) VALUES
  (1, 'J.K. Rowling'),
  (2, 'Arundati Roy'),
  (3, 'Vikram Seth');

  select * from Author
-- Insert records into Publisher table
INSERT INTO Publisher (PID, PublisherName) VALUES
  (1, 'Simon & Schuster'),
  (2, 'Wiley'),
  (3, 'McGraw Hill Education ');

  select * from Publisher

-- Insert records into Book table
INSERT INTO Book (BID, BName, BPrice, Author, Publisher, Category) VALUES
  (1, 'Harry Potter and the Sorcerer\Stone', 19.99, 1, 1, 1),
  (2, 'The Shining', 14.99, 2, 2, 1),
  (3, '1984', 12.99, 3, 3, 3),
  (4, 'Harry Potter and the Chamber of Secrets', 19.99, 1, 1, 1),
  (5, 'It', 15.99, 2, 2, 2),
  (6, 'Animal Farm', 9.99, 3, 3, 2);

  select * from Book
-- Show the requested details
SELECT
  Book.BID,
  Book.BName,
  Book.BPrice,
  Author.AuthorName AS Author,
  Publisher.PublisherName AS Publisher,
  Category.CategoryName AS Category
FROM
  Book
JOIN
  Author ON Book.Author = Author.AID
JOIN
  Publisher ON Book.Publisher = Publisher.PID
JOIN
  Category ON Book.Category = Category.CID;
