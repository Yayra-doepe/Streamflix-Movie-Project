# Creating database
CREATE DATABASE Movies_db;

# Selecting the created database so queries will be run directly on it
USE Movies_db;

# Creating tables 
CREATE TABLE Movies(
MovieID INT PRIMARY KEY,
Title VARCHAR(100),
Year INT,
Genres CHAR(150),
Language CHAR(100),
Country CHAR(100),
TotalViews INT
);

CREATE TABLE Users(
UserID VARCHAR(50) PRIMARY KEY,
Age INT,
Gender CHAR(50),
Country CHAR(50),
SubscriptionStatus CHAR(50),
TotalWatchTime INT,
Device CHAR(50)
);

CREATE TABLE Ratings(
RatingID INT PRIMARY KEY,
UserID VARCHAR(10),
MovieID INT,
Rating FLOAT,
Timestamp DATETIME
);

# Altering Ratings table to include a foreign key
ALTER TABLE Ratings
ADD CONSTRAINT fk_users
FOREIGN KEY (UserID) REFERENCES Users(UserID);

ALTER TABLE Ratings
ADD CONSTRAINT fk_movies
FOREIGN KEY (MovieID) REFERENCES movies(MovieID);

# Testing relationships between tables
SELECT r.RatingID, u.UserID, u.Country, r.Rating
FROM Ratings r
JOIN Users u ON r.UserID = u.UserID
LIMIT 10;

SELECT r.RatingID, m.Title, r.Rating, r.Timestamp
FROM Ratings r
JOIN Movies m ON r.MovieID = m.MovieID
LIMIT 10;

SELECT u.UserID, u.Country, m.Title AS movie_name, r.rating
FROM Ratings r
JOIN Users u ON r.UserID = u.UserID
JOIN Movies m ON r.MovieID = m.MovieID
LIMIT 10;


