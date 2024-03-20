-- Table customers --
CREATE TABLE customers(
    id INT PRIMARY KEY,
    firstname TEXT,
    lastname TEXT,
    email TEXT
);

INSERT INTO customers VALUES
    (1, "Yuji", "Itadori", "yuji@jookkru.co"),
    (2, "Sataru", "Gojo", "satoru@jookkru.co"),
    (3, "Maki", "Zenin", "maki@jookkru.co"),
    (4, "Sukuna", "Theoldman", "oldman@jookkru.co"),
    (5, "Doraemon", "Thedestroyer", "doraemon@jookkru.co");

-- Table menus --
CREATE TABLE menus(
    id INT PRIMARY KEY,
    name TEXT,
    price REAL
);

INSERT INTO menus VALUES
    (1, "Magarita", 199),
    (2, "Pepperoni", 299),
    (3, "Truffle", 499),
    (4, "Hawaiian", 150),
    (5, "Meat deluxe", 299),
    (6, "vegie lover", 199),
    (7, "Lasagna", 150),
    (8, "Garlic bread", 80),
    (9, "French fries", 40),
    (10, "Cesar salad", 120);

-- Table orders --
CREATE TABLE orders(
  orderid INT PRIMARY KEY,
  customerid INT,
  menuid INT,
  orderdate TEXT,
  quantity INT,
  totalprice INT);

INSERT INTO orders VALUES
    (1, 1, 2, "2023-11-01", 1, 299),
    (2, 1, 9, "2023-11-01", 3, 120),
    (3, 2, 1, "2023-10-30", 1, 299),
    (4, 2, 8, "2023-10-30", 3, 240),
    (5, 2, 10, "2023-10-30", 1, 120),
    (6, 4, 7, "2023-09-01", 10, 1500),
    (7, 5, 9, "2023-11-04", 20, 800),
    (8, 3, 6, "2023-10-25", 3, 597),
    (9, 4, 5, "2023-10-02", 2, 598),
    (10, 2, 4, "2023-09-09", 2, 300);

-- select all
.mode box
SELECT * FROM customers;
SELECT * FROM menus;
SELECT * FROM orders;

-- join clause
SELECT
    cus.firstname,
    cus.lastname,
    men.name AS order_name,
    sum(ord.quantity) * ord.totalprice as total,
    sum(quantity)
FROM customers AS cus
JOIN orders AS ord ON cus.id = ord.customerid
JOIN menus AS men ON ord.meunid = men.id
GROUP by 1
ORDER by 1 DESC;

-- subquery
SELECT
      t1.firstname,
      t1.lastname,
      t2.name AS order_name,
      sum(t2.quantity) * t2.totalprice as total,
      sum(t2.quantity)
FROM (SELECT * FROM customers AS cus
      JOIN orders AS ord ON cus.id = ord.customerid) AS t1
JOIN (SELECT * FROM orders AS ord
      JOIN menus AS men ON ord.meunid = men.id) AS t2
ON t1.id = t2.id
GROUP BY 1
ORDER BY 1 DESC;

-- WITH clause
WITH sub_cus AS(
    SELECT *
    FROM customers as cus
    join orders as ord on cus.id = ord.customerid), 
    sub_menu AS(
    select *
    from menus as men
    join orders as ord on men.id = ord.menuid)

SELECT
  t1.firstname,
    t1.lastname,
    t2.name AS menu_name,
    SUM(t1.quantity) AS total_quan,
    SUM(t1.quantity) * t1.totalprice AS sum_total
FROM sub_cus as t1
join sub_menu as t2 on t1.id = t2.customerid
GROUP By 1,2
ORDER BY 1;
