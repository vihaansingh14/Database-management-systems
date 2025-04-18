CREATE DATABASE wonfour_db;
USE wonfour_db;
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    profile_image VARCHAR(255),
    bio TEXT,
    join_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    last_login DATETIME,
    is_verified BOOLEAN DEFAULT FALSE,
    remember_token VARCHAR(255),
    reset_token VARCHAR(255),
    reset_token_expires DATETIME
);
CREATE TABLE samples (
    sample_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    category ENUM('drums', 'bass', 'synth', 'vocal', 'fx', 'guitar', 'piano', 'brass', 'other') NOT NULL,
    genre VARCHAR(50) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    file_path VARCHAR(255) NOT NULL,
    image_path VARCHAR(255),
    duration_seconds INT,
    bpm INT,
    key_signature VARCHAR(10),
    upload_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    download_count INT DEFAULT 0,
    is_featured BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);
CREATE TABLE purchases (
    purchase_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    sample_id INT NOT NULL,
    purchase_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    amount DECIMAL(10,2) NOT NULL,
    payment_method VARCHAR(50),
    transaction_id VARCHAR(100),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (sample_id) REFERENCES samples(sample_id)
);
INSERT INTO users (first_name, last_name, username, email, password_hash, profile_image, bio, is_verified) VALUES
('Alex', 'Johnson', 'alexbeats', 'alex@example.com', '$2a$10$N9qo8uLOickgx2ZMRZoMy.MrYV7ZRHH3Z8JYJ5fW7yW7qj1Jp5QbK', 'alex.jpg', 'Professional beat maker specializing in hip-hop and trap', TRUE),
('Sarah', 'Williams', 'sarahsynth', 'sarah@example.com', '$2a$10$N9qo8uLOickgx2ZMRZoMy.MrYV7ZRHH3Z8JYJ5fW7yW7qj1Jp5QbK', 'sarah.jpg', 'Electronic music producer and sound designer', TRUE),
('Mike', 'Brown', 'mikebass', 'mike@example.com', '$2a$10$N9qo8uLOickgx2ZMRZoMy.MrYV7ZRHH3Z8JYJ5fW7yW7qj1Jp5QbK', 'mike.jpg', 'Bass specialist with 10 years of experience', FALSE),
('Emma', 'Davis', 'emmadrums', 'emma@example.com', '$2a$10$N9qo8uLOickgx2ZMRZoMy.MrYV7ZRHH3Z8JYJ5fW7yW7qj1Jp5QbK', 'emma.jpg', 'Drum programmer for various genres', TRUE),
('James', 'Wilson', 'jamesfx', 'james@example.com', '$2a$10$N9qo8uLOickgx2ZMRZoMy.MrYV7ZRHH3Z8JYJ5fW7yW7qj1Jp5QbK', 'james.jpg', 'Sound effects creator for films and games', FALSE),
('Lisa', 'Taylor', 'lisavox', 'lisa@example.com', '$2a$10$N9qo8uLOickgx2ZMRZoMy.MrYV7ZRHH3Z8JYJ5fW7yW7qj1Jp5QbK', 'lisa.jpg', 'Vocalist and vocal sample creator', TRUE);
INSERT INTO samples (user_id, title, description, category, genre, price, file_path, image_path, duration_seconds, bpm, key_signature) VALUES
(1, 'Urban Trap Drum Kit', 'Hard-hitting trap drums with 808s', 'drums', 'Hip-Hop', 19.99, 'samples/urban_trap.wav', 'images/urban_trap.jpg', 180, 140, 'C minor'),
(2, 'Future Bass Synth Pack', 'Bright and punchy future bass synths', 'synth', 'EDM', 24.99, 'samples/future_bass.wav', 'images/future_bass.jpg', 240, 150, 'F major'),
(3, 'Deep House Basslines', 'Warm analog basslines for deep house', 'bass', 'House', 14.99, 'samples/deep_house.wav', 'images/deep_house.jpg', 210, 124, 'G minor'),
(4, 'Acoustic Drum Loops', 'Organic acoustic drum recordings', 'drums', 'Rock', 12.99, 'samples/acoustic_drums.wav', 'images/acoustic_drums.jpg', 195, 115, 'None'),
(5, 'Cinematic Impacts', 'Powerful cinematic impact sounds', 'fx', 'Film', 29.99, 'samples/cinematic.wav', 'images/cinematic.jpg', 90, NULL, 'None'),
(6, 'Soul Vocal Samples', 'Female vocal chops and adlibs', 'vocal', 'R&B', 17.99, 'samples/soul_vocals.wav', 'images/soul_vocals.jpg', 165, 92, 'A minor');
INSERT INTO reviews (user_id, sample_id, rating, review_text) VALUES
(2, 1, 4.5, 'Great trap drums, exactly what I needed for my track!'),
(3, 1, 5.0, 'Perfect 808s, will definitely buy more from this artist'),
(1, 2, 4.0, 'Nice synths but some are a bit too bright for my taste'),
(4, 3, 4.5, 'Warm and punchy basslines, great for deep house'),
(5, 4, 3.5, 'Good quality but limited variety in the pack'),
(6, 5, 5.0, 'Absolutely stunning cinematic sounds, worth every penny');
INSERT INTO top_rankings (sample_id, position, week_start) VALUES
(1, 1, '2023-11-01'),
(2, 2, '2023-11-01'),
(3, 3, '2023-11-01'),
(4, 4, '2023-11-01'),
(5, 5, '2023-11-01'),
(6, 6, '2023-11-01');
