INSERT INTO authors (name) VALUES
                               ('Shevchenko'),
                               ('Rowling');

INSERT INTO books (title, author_id) VALUES
                                         ('Kateryna', 1),
                                         ('Kobzar', 1),
                                         ('Harry Potter', 2);

INSERT INTO readers (name) VALUES
                               ('Y Pavliuk'),
                               ('A Kozub');

INSERT INTO reader_books (reader_id, book_id) VALUES
                                                  (1, 1),
                                                  (1, 3),
                                                  (2, 2);
