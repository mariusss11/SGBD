-- An index in SQL is a database object that improves the speed of data retrieval operations on a table.
-- It works similarly to an index in a book, allowing the database to find rows more quickly.
-- Indexes are created on one or more columns of a table.

-- There are 2 type of indexes:

-- Clustered 
-- They are ussualy created automatically on PRIMARY KEY and UNIQUE columns and sort out the entire tabel

-- Non-clustered 
-- They are created on columns we have more requests

USE EcoCarRental;

CREATE INDEX idx_customer_names ON Customer (first_name, last_name);
-- This is an index created on table Customer, columns first_name and last_name
-- They are requested a lot of types so a litlle bit of speed will be just good

CREATE INDEX idx_car_details ON Car (make, model, year, price_per_day);
-- This is an index create on table Car, for the columns that are usually retrived




