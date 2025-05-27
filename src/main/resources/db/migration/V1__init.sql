CREATE TABLE authors (
                         id SERIAL PRIMARY KEY,
                         name VARCHAR(255) NOT NULL
);

CREATE TABLE books (
                       id SERIAL PRIMARY KEY,
                       title VARCHAR(255) NOT NULL,
                       author_id INT REFERENCES authors(id)
);

CREATE TABLE readers (
                         id SERIAL PRIMARY KEY,
                         name VARCHAR(255) NOT NULL
);

CREATE TABLE reader_books (
                              reader_id INT REFERENCES readers(id),
                              book_id INT REFERENCES books(id),
                              PRIMARY KEY (reader_id, book_id)
);

