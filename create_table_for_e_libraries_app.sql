CREATE TABLE Library (
    library_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    location VARCHAR(255) NOT NULL
);

CREATE TABLE Books (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    category VARCHAR(255) NOT NULL,
    total_quantity INT NOT NULL CHECK(total_quantity >= 0),
    available_quantity INT NOT NULL CHECK(available_quantity >= 0),
    library_id INT REFERENCES Library(library_id)
);

CREATE TABLE Users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    address VARCHAR(255) NOT NULL
);

CREATE TABLE Loans (
    loan_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES Users(user_id),
    book_id INT REFERENCES Books(book_id),
    library_id INT REFERENCES Library(library_id),
    loan_date DATE NOT NULL,
    due_date DATE NOT NULL,
    return_date DATE
);

CREATE TABLE Holds (
    hold_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES Users(user_id),
    book_id INT REFERENCES Books(book_id),
    library_id INT REFERENCES Library(library_id),
    hold_date DATE NOT NULL,
    expiry_date DATE NOT NULL
);
