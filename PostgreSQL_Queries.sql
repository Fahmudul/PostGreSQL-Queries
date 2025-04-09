-- Created books table
-- create table books 
-- (
-- id serial primary key,
-- title VARCHAR(100) not NULL,
-- author varchar(70) not NULL,
-- price DECIMAL(7,3) CHECK(price>0),
-- stock int,
-- published_year int
-- )

-- Inserting data into books table
-- 
-- INSERT INTO books (title, author, price, stock, published_year) VALUES
-- ('The Pragmatic Programmer', 'Andrew Hunt', 45.999, 10, 1999),
-- ('Clean Code', 'Robert C. Martin', 39.500, 0, 2008),
-- ('Design Patterns', 'Erich Gamma', 55.750, 8, 1994),
-- ('Refactoring', 'Martin Fowler', 49.250, 12, 1999),
-- ('You Don''t Know JS', 'Kyle Simpson', 29.999, 20, 2014),
-- ('The Mythical Man-Month', 'Frederick P. Brooks Jr.', 34.600, 7, 1975),
-- ('Introduction to Algorithms', 'Thomas H. Cormen', 69.950, 5, 2009),
-- ('The Clean Coder', 'Robert C. Martin', 37.800, 0, 2011),
-- ('Eloquent JavaScript', 'Marijn Haverbeke', 28.750, 18, 2018),
-- ('Code Complete', 'Steve McConnell', 52.900, 9, 2004),
-- ('Cracking the Coding Interview', 'Gayle Laakmann McDowell', 41.299, 0, 2015),
-- ('Deep Learning', 'Ian Goodfellow', 79.500, 6, 2016),
-- ('Computer Networking', 'James F. Kurose', 65.250, 4, 2012),
-- ('Python Crash Course', 'Eric Matthes', 30.400, 17, 2015),
-- ('Effective Java', 'Joshua Bloch', 43.750, 0, 2018);


-- Created cutomers Table

-- create table customers (
-- id serial primary KEY,
-- "name" varchar(100) not null,
-- email varchar(60) not null,
-- joined_date DATE default now()::date
-- );
-- 


-- Inserting data into customers table
-- INSERT INTO customers ("name", email, joined_date) VALUES
-- ('John Doe', 'johndoe@example.com', '2023-01-15'),
-- ('Alice Smith', 'alice.smith@example.com', '2022-07-22'),
-- ('Michael Johnson', 'michael.j@example.com', '2021-11-05'),
-- ('Emily Davis', 'emily.d@example.com', '2023-06-10'),
-- ('Robert Brown', 'robert.b@example.com', '2024-02-18'),
-- ('Sophia Wilson', 'sophia.w@example.com', '2020-09-30'),
-- ('James Anderson', 'james.a@example.com', '2019-05-25'),
-- ('Olivia Martinez', 'olivia.m@example.com', '2023-08-14'),
-- ('William Thomas', 'william.t@example.com', '2021-12-03'),
-- ('Ava Harris', 'ava.h@example.com', '2022-04-07'),
-- ('Benjamin Clark', 'benjamin.c@example.com', '2020-06-19'),
-- ('Charlotte Lewis', 'charlotte.l@example.com', '2018-03-12'),
-- ('Daniel Walker', 'daniel.w@example.com', '2017-11-28'),
-- ('Mia Hall', 'mia.h@example.com', '2024-01-02'),
-- ('Henry Allen', 'henry.a@example.com', '2023-09-05');
-- 

-- Created orders table
-- create table orders (
-- id serial primary key,
-- customer_id int ,
-- book_id int,
-- Foreign key (customer_id) REFERENCES customers(id) on delete CASCADE,
-- Foreign key (book_id) REFERENCES books(id),
-- quantity int check(quantity >=0),
-- order_date TIMESTAMP  default current_TIMESTAMP
-- 
-- )
-- 

-- Inserting data into orders
-- INSERT INTO orders (customer_id, book_id, quantity, order_date) VALUES
-- (5, 12, 2, '2023-07-12 14:30:00'),
-- (12, 6, 3, '2024-01-08 18:45:00'),
-- (3, 9, 2, '2021-11-30 09:10:00'),
-- (7, 14, 1, '2023-04-05 16:20:00'),
-- (10, 1, 4, '2020-09-17 12:00:00'),
-- (4, 7, 2, '2024-02-20 08:50:00'),
-- (15, 5, 3, '2023-06-10 22:10:00'),
-- (9, 8, 5, '2020-08-27 19:30:00'),
-- (6, 10, 2, '2022-03-15 11:25:00'),
-- (11, 4, 3, '2023-10-22 07:55:00'),
-- (13, 15, 4, '2023-09-04 17:45:00'),
-- (5, 6, 2, '2021-04-11 09:20:00'),
-- (3, 12, 3, '2020-10-30 23:50:00'),
-- (12, 9, 2, '2024-06-21 13:00:00'),
-- (7, 1, 5, '2022-01-19 18:10:00');

-- 


-- Q-1 Find books that are out of stock.
select * 
     from books 
     where stock =0;

-- Q-2  Retrieve the most expensive book in the store.
select * 
    from books 
    where price = (select max(price) from books);


-- Q-3 Find the total number of orders placed by each customer.
select max("name") as "name", sum(quantity) as total_orders
     from customers 
     join orders 
     on customers.id = customer_id
     group by email;


-- Q-4 Calculate the total revenue generated from book sales.
 select sum(price*quantity) as total_revenue 
     from orders  
     join customers
     On orders.customer_id = customers.id
     join books
     on orders.book_id = books.id ;


-- Q-5 List all customers who have placed more than one order.
select "name", quantity, email
     from orders  
     Join customers 
     on orders.customer_id = customers.id
     where quantity > 1;

-- Q-6  Find the average price of books in the store.
select avg(price) as avg_book_price
     from books;

-- Q-7 Increase the price of all books published before 2000 by 10%.
update books
     set price = price + (price * 0.10)
     where published_year < 2000;

-- Q-8 Delete customers who haven't placed any orders.
DELETE FROM customers 
WHERE id NOT IN (
  SELECT DISTINCT customer_id
  FROM orders
)
RETURNING *;




