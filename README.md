# librariesappDB
create a complete database system for an online library app that can handle many libraries, different book collections, and interactions with users. This system will help users borrow books, place holds on items, and register accounts, all while making sure that the data is accurate, following our rules, and making the experience smooth for users.

**Table Relationships**
Library to Books:
Relationship Type: One-to-Many (One library can have multiple books)
Foreign Key: library_id in Books references library_id in Library

User to Loans:
Relationship Type: One-to-Many (One user can have multiple loans)
Foreign Key: user_id in Loans references user_id in Users

Book to Loans:
Relationship Type: One-to-Many (One book can be borrowed multiple times)
Foreign Key: book_id in Loans references book_id in Books

User to Holds:
Relationship Type: One-to-Many (One user can have multiple holds)
Foreign Key: user_id in Holds references user_id in Users

Book to Holds:
Relationship Type: One-to-Many (One book can have multiple holds)
Foreign Key: book_id in Holds references book_id in Books

**Business Rules**
Books:
title: NOT NULL
author: NOT NULL
category: NOT NULL
total_quantity: NOT NULL, CHECK(total_quantity >= 0)
available_quantity: NOT NULL, CHECK(available_quantity >= 0)

Users:
username: NOT NULL
email: NOT NULL
password: NOT NULL
first_name: NOT NULL
last_name: NOT NULL
address: NOT NULL

Loans:
loan_date: NOT NULL
due_date: NOT NULL
return_date: Can be NULL (if book hasn't been returned yet)

Holds:
hold_date: NOT NULL
expiry_date: NOT NULL (to indicate when the hold expires)
