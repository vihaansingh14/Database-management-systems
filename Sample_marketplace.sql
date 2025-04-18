-- Create the database
CREATE DATABASE sample_marketplace;

-- Use the created database
USE sample_marketplace;

-- Create Users table
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT,
    username VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    PRIMARY KEY (user_id),
    UNIQUE KEY (email),
    UNIQUE KEY (username)
);

-- Create Samples table
CREATE TABLE Samples (
    sample_id INT AUTO_INCREMENT,
    Title VARCHAR(255) NOT NULL,
    Genre VARCHAR(100),
    Price DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (sample_id)
);

-- Create Uploads table
CREATE TABLE Uploads (
    Upload_id INT AUTO_INCREMENT,
    User_id INT NOT NULL,
    Sample_id INT NOT NULL,
    File_url VARCHAR(255) NOT NULL,
    Upload_date DATETIME NOT NULL,
    PRIMARY KEY (Upload_id),
    FOREIGN KEY (User_id) REFERENCES Users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (Sample_id) REFERENCES Samples(sample_id) ON DELETE CASCADE,
    UNIQUE KEY (File_url)
);

-- Create downloads table
CREATE TABLE downloads (
    Download_id INT AUTO_INCREMENT,
    User_id INT NOT NULL,
    Sample_id INT NOT NULL,
    Download_date DATETIME NOT NULL,
    PRIMARY KEY (Download_id),
    FOREIGN KEY (User_id) REFERENCES Users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (Sample_id) REFERENCES Samples(sample_id) ON DELETE CASCADE
);

-- Create Transactions table
CREATE TABLE Transactions (
    Transaction_id INT AUTO_INCREMENT,
    Buyer_id INT NOT NULL,
    Sample_id INT NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    Transaction_ref VARCHAR(50),
    PRIMARY KEY (Transaction_id),
    FOREIGN KEY (Buyer_id) REFERENCES Users(user_id) ON DELETE RESTRICT,
    FOREIGN KEY (Sample_id) REFERENCES Samples(sample_id) ON DELETE RESTRICT
);

-- Create Top_Artists table
CREATE TABLE Top_Artists (
    Artist_id INT AUTO_INCREMENT,
    User_id INT NOT NULL,
    Total_uploads INT DEFAULT 0,
    Total_sales_amount DECIMAL(15, 2) DEFAULT 0.00,
    Total_downloads INT DEFAULT 0,
    Last_updated DATETIME NOT NULL,
    PRIMARY KEY (Artist_id),
    FOREIGN KEY (User_id) REFERENCES Users(user_id) ON DELETE CASCADE,
    UNIQUE KEY (User_id)
);

-- Insert data into Users table
INSERT INTO Users (username, email, password_hash) VALUES
('beatmaster', 'beatmaster@example.com', 'hash1'),
('melodymaker', 'melody@example.com', 'hash2'),
('bassking', 'bass@example.com', 'hash3'),
('drumqueen', 'drums@example.com', 'hash4'),
('synthwave', 'synth@example.com', 'hash5'),
('vocalpro', 'vocals@example.com', 'hash6'),
('guitargenius', 'guitar@example.com', 'hash7'),
('producerpro', 'producer@example.com', 'hash8'),
('djmixer', 'dj@example.com', 'hash9'),
('soundfx', 'fx@example.com', 'hash10'),
('pianoplayer', 'piano@example.com', 'hash11'),
('orchestral', 'orchestra@example.com', 'hash12');

-- Insert data into Samples table
INSERT INTO Samples (Title, Genre, Price) VALUES
('Deep House Beat', 'House', 19.99),
('Epic Orchestral Theme', 'Orchestral', 29.99),
('Hip Hop Drums', 'Hip Hop', 14.99),
('EDM Drop', 'EDM', 24.99),
('Acoustic Guitar Loop', 'Acoustic', 9.99),
('Trap 808 Bass', 'Trap', 12.99),
('Vocal Chops Pack', 'Vocals', 19.99),
('Synthwave Melody', 'Synthwave', 15.99),
('Lo-Fi Piano', 'Lo-Fi', 11.99),
('Jazz Saxophone Solo', 'Jazz', 17.99),
('Rock Drum Fills', 'Rock', 13.99),
('Ambient Textures', 'Ambient', 22.99),
('Reggae Bass Line', 'Reggae', 10.99),
('Dubstep Wobble Bass', 'Dubstep', 16.99);

-- Insert data into Uploads table (ensure Users and Samples exist first)
INSERT INTO Uploads (User_id, Sample_id, File_url, Upload_date) VALUES
(1, 1, 'https://samples.com/deephouse.wav', '2024-03-15 10:30:00'),
(2, 2, 'https://samples.com/orchestral.wav', '2024-03-16 11:45:00'),
(3, 3, 'https://samples.com/hiphopdrums.wav', '2024-03-17 09:20:00'),
(4, 4, 'https://samples.com/edmdrop.wav', '2024-03-18 14:10:00'),
(5, 5, 'https://samples.com/acoustic.wav', '2024-03-19 16:25:00'),
(6, 6, 'https://samples.com/trap808.wav', '2024-03-20 12:40:00'),
(7, 7, 'https://samples.com/vocalchops.wav', '2024-03-21 08:50:00'),
(8, 8, 'https://samples.com/synthwave.wav', '2024-03-22 17:15:00'),
(9, 9, 'https://samples.com/lofi.wav', '2024-03-23 13:30:00'),
(10, 10, 'https://samples.com/jazz.wav', '2024-03-24 15:45:00'),
(1, 11, 'https://samples.com/rockdrums.wav', '2024-03-25 10:20:00'),
(2, 12, 'https://samples.com/ambient.wav', '2024-03-26 11:35:00'),
(3, 13, 'https://samples.com/reggae.wav', '2024-03-27 09:50:00'),
(4, 14, 'https://samples.com/dubstep.wav', '2024-03-28 14:05:00');

-- Insert data into downloads table
INSERT INTO downloads (User_id, Sample_id, Download_date) VALUES
(5, 1, '2024-04-01 09:15:00'),
(6, 1, '2024-04-02 10:30:00'),
(7, 1, '2024-04-03 11:45:00'),
(8, 2, '2024-04-04 13:00:00'),
(9, 2, '2024-04-05 14:15:00'),
(10, 3, '2024-04-06 15:30:00'),
(11, 4, '2024-04-07 16:45:00'),
(12, 5, '2024-04-08 18:00:00'),
(1, 6, '2024-04-09 09:30:00'),
(2, 7, '2024-04-10 10:45:00'),
(3, 8, '2024-04-11 12:00:00'),
(4, 9, '2024-04-12 13:15:00'),
(5, 10, '2024-04-13 14:30:00'),
(6, 11, '2024-04-14 15:45:00'),
(7, 12, '2024-04-15 17:00:00'),
(8, 13, '2024-04-16 18:15:00');

-- Insert data into Transactions table
INSERT INTO Transactions (Buyer_id, Sample_id, Amount, Transaction_ref) VALUES
(5, 1, 19.99, 'TX001'),
(6, 1, 19.99, 'TX002'),
(7, 1, 19.99, 'TX003'),
(8, 2, 29.99, 'TX004'),
(9, 2, 29.99, 'TX005'),
(10, 3, 14.99, 'TX006'),
(11, 4, 24.99, 'TX007'),
(12, 5, 9.99, 'TX008'),
(1, 6, 12.99, 'TX009'),
(2, 7, 19.99, 'TX010'),
(3, 8, 15.99, 'TX011'),
(4, 9, 11.99, 'TX012');

-- Insert data into Top_Artists table (normally this would be computed, but for demo purposes we'll insert directly)
INSERT INTO Top_Artists (User_id, Total_uploads, Total_sales_amount, Total_downloads, Last_updated) VALUES
(1, 2, 59.97, 3, '2024-04-20 00:00:00'),
(2, 2, 59.98, 2, '2024-04-20 00:00:00'),
(3, 2, 30.98, 2, '2024-04-20 00:00:00'),
(4, 2, 49.98, 2, '2024-04-20 00:00:00'),
(5, 1, 9.99, 1, '2024-04-20 00:00:00'),
(6, 1, 19.99, 0, '2024-04-20 00:00:00'),
(7, 1, 19.99, 0, '2024-04-20 00:00:00'),
(8, 1, 15.99, 0, '2024-04-20 00:00:00'),
(9, 1, 11.99, 1, '2024-04-20 00:00:00'),
(10, 1, 17.99, 1, '2024-04-20 00:00:00');

SELECT user_id, username, email FROM Users;

SELECT * FROM Samples WHERE Genre = 'House';

SELECT Title, Genre, Price FROM Samples ORDER BY Price DESC;
SELECT Genre, COUNT(*) AS SampleCount FROM Samples GROUP BY Genre ORDER BY SampleCount DESC;

SELECT s.Title, u.username, up.Upload_date
FROM Uploads up
JOIN Samples s ON up.Sample_id = s.sample_id
JOIN Users u ON up.User_id = u.user_id
WHERE up.Upload_date >= DATE_SUB(NOW(), INTERVAL 7 DAY)
ORDER BY up.Upload_date DESC;

SELECT DISTINCT u.username, u.email
FROM Users u
JOIN Uploads up ON u.user_id = up.User_id
JOIN downloads d ON u.user_id = d.User_id;

SELECT s.Title, s.Genre, COUNT(d.Download_id) AS DownloadCount
FROM Samples s
JOIN downloads d ON s.sample_id = d.Sample_id
GROUP BY s.sample_id, s.Title, s.Genre
ORDER BY DownloadCount DESC
LIMIT 1;

SELECT s.Genre, SUM(t.Amount) AS TotalRevenue
FROM Samples s
JOIN Transactions t ON s.sample_id = t.Sample_id
GROUP BY s.Genre
ORDER BY TotalRevenue DESC;

SELECT u.username, u.email
FROM Users u
JOIN Uploads up ON u.user_id = up.User_id
WHERE u.user_id NOT IN (SELECT Buyer_id FROM Transactions);

SELECT s.Title, s.Genre
FROM Samples s
LEFT JOIN downloads d ON s.sample_id = d.Sample_id
WHERE d.Download_id IS NULL;

SELECT s.Title, 
       COUNT(DISTINCT d.Download_id) AS TotalDownloads,
       COUNT(DISTINCT t.Transaction_id) AS TotalPurchases,
       CASE 
         WHEN COUNT(DISTINCT d.Download_id) > 0 
         THEN (COUNT(DISTINCT t.Transaction_id) / COUNT(DISTINCT d.Download_id)) * 100 
         ELSE 0 
       END AS ConversionRate
FROM Samples s
LEFT JOIN downloads d ON s.sample_id = d.Sample_id
LEFT JOIN Transactions t ON s.sample_id = t.Sample_id
GROUP BY s.sample_id, s.Title
HAVING TotalDownloads > 0
ORDER BY ConversionRate DESC;

SELECT u.username, SUM(t.Amount) AS TotalSales
FROM Users u
JOIN Uploads up ON u.user_id = up.User_id
JOIN Samples s ON up.Sample_id = s.sample_id
JOIN Transactions t ON s.sample_id = t.Sample_id
GROUP BY u.user_id, u.username
ORDER BY TotalSales DESC
LIMIT 1;

SELECT Genre, AVG(Price) AS AveragePrice
FROM Samples
GROUP BY Genre
ORDER BY AveragePrice DESC;

SELECT t.Transaction_id, t.Transaction_ref, u.username AS Buyer, 
       s.Title AS SampleName, t.Amount
FROM Transactions t
JOIN Users u ON t.Buyer_id = u.user_id
JOIN Samples s ON t.Sample_id = s.sample_id
ORDER BY t.Transaction_id;

SELECT DISTINCT u.username, u.email
FROM Users u
JOIN downloads d ON u.user_id = d.User_id
WHERE u.user_id NOT IN (SELECT Buyer_id FROM Transactions);

SELECT 
    DATE_FORMAT(t.Transaction_id, '%Y-%m') AS Month,
    COUNT(t.Transaction_id) AS TransactionCount,
    SUM(t.Amount) AS TotalSales
FROM Transactions t
GROUP BY Month
ORDER BY Month;

SELECT u.username, COUNT(d.Download_id) AS DownloadCount
FROM Users u
JOIN downloads d ON u.user_id = d.User_id
GROUP BY u.user_id, u.username
ORDER BY DownloadCount DESC
LIMIT 1;

SELECT u.username, ta.Total_sales_amount
FROM Top_Artists ta
JOIN Users u ON ta.User_id = u.user_id
ORDER BY ta.Total_sales_amount DESC
LIMIT 5;

UPDATE Top_Artists ta
SET 
    Total_uploads = (SELECT COUNT(*) FROM Uploads WHERE User_id = ta.User_id),
    Total_sales_amount = (
        SELECT COALESCE(SUM(t.Amount), 0)
        FROM Uploads up
        JOIN Transactions t ON up.Sample_id = t.Sample_id
        WHERE up.User_id = ta.User_id
    ),
    Total_downloads = (
        SELECT COUNT(*)
        FROM Uploads up
        JOIN downloads d ON up.Sample_id = d.Sample_id
        WHERE up.User_id = ta.User_id
    ),
    Last_updated = NOW()
WHERE EXISTS (SELECT 1 FROM Users u WHERE u.user_id = ta.User_id);

SELECT s.Title, u.username AS Uploader, up.Upload_date
FROM Samples s
JOIN Uploads up ON s.sample_id = up.Sample_id
JOIN Users u ON up.User_id = u.user_id
LEFT JOIN downloads d ON s.sample_id = d.Sample_id
WHERE d.Download_id IS NULL;

SELECT AVG(TIMESTAMPDIFF(HOUR, up.Upload_date, MIN(d.Download_date))) AS AvgHoursToFirstDownload
FROM Uploads up
JOIN downloads d ON up.Sample_id = d.Sample_id
GROUP BY up.Upload_id;

SELECT 
    u.username,
    COUNT(DISTINCT up.Upload_id) AS UploadsCount,
    COUNT(DISTINCT d.Download_id) AS DownloadsCount,
    COUNT(DISTINCT t.Transaction_id) AS PurchasesCount,
    COALESCE(SUM(t.Amount), 0) AS TotalSpent
FROM Users u
LEFT JOIN Uploads up ON u.user_id = up.User_id
LEFT JOIN downloads d ON u.user_id = d.User_id
LEFT JOIN Transactions t ON u.user_id = t.Buyer_id
GROUP BY u.user_id, u.username
ORDER BY UploadsCount DESC, DownloadsCount DESC;
