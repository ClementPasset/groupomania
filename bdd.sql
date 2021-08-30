DROP TABLE IF EXISTS comments;
DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    is_admin BOOLEAN DEFAULT FALSE
)
CHARACTER SET utf8;

CREATE TABLE posts (
    id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    content VARCHAR(255) NOT NULL,
    imgURL VARCHAR(255),
    created_at DATETIME NOT NULL,
    user_id INTEGER,
    CONSTRAINT fk_userpost_id
        FOREIGN KEY (user_id)
        REFERENCES users(id)
        ON DELETE SET NULL
)
CHARACTER SET utf8;

CREATE TABLE comments (
    id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_id INTEGER,
    post_id INTEGER,
    content TEXT NOT NULL,
    created_at DATETIME NOT NULL,
    CONSTRAINT fk_usercomment_id
        FOREIGN KEY (user_id)
        REFERENCES users(id)
        ON DELETE SET NULL,
    CONSTRAINT fk_post_id
        FOREIGN KEY (post_id)
        REFERENCES posts(id)
        ON DELETE CASCADE
)
CHARACTER SET utf8;