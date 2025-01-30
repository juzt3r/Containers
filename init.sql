-- Thanks ChatGPT

CREATE TABLE IF NOT EXISTS USERS (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO USERS (username, email) VALUES
('johndoe', 'johndoe@example.com'),
('janedoe', 'janedoe@example.com'),
('alice', 'alice@example.com'),
('Eirik', 'escimo@Gay4Pay.com'),
('Leif', 'LeifTheBoss@SuperDude.com'),
('bob', 'bob@example.com');
