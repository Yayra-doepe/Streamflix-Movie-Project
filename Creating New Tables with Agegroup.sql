CREATE OR REPLACE VIEW Users_With_AgeGroup AS
SELECT 
  UserID,
  Age,
  Gender,
  Country,
  SubscriptionStatus,
  TotalWatchTime,
  Device,
  CASE
    WHEN Age IS NULL THEN 'Unknown'
    WHEN Age BETWEEN 0 AND 10 THEN '0-10'
    WHEN Age BETWEEN 11 AND 20 THEN '11-20'
    WHEN Age BETWEEN 21 AND 30 THEN '21-30'
    WHEN Age BETWEEN 31 AND 40 THEN '31-40'
    WHEN Age BETWEEN 41 AND 50 THEN '41-50'
    WHEN Age BETWEEN 51 AND 60 THEN '51-60'
    WHEN Age BETWEEN 61 AND 70 THEN '61-70'
    ELSE '71+'
  END AS AgeGroup
FROM Users;
 
CREATE OR REPLACE VIEW Ratings_With_AgeGroup AS
SELECT
  r.UserID,
  r.MovieID,
  r.Rating,
  r.Timestamp,
  u.AgeGroup
FROM Ratings r
JOIN Users_With_AgeGroup u ON r.UserID = u.UserID;

SELECT * FROM Users_With_AgeGroup;
SELECT * FROM Ratings_With_AgeGroup;