CREATE TABLE products (
         id SERIAL PRIMARY KEY,
         productName VARCHAR(30) NOT NULL,
         company VARCHAR(20) NOT NULL,
         productCount INT DEFAULT 0,
         price NUMERIC NOT NULL,
         isDiscounted BOOL
);

INSERT INTO products (productName, company, productCount, price, isDiscounted)
VALUES('iPhone X', 'Apple', 3, 76000, false),
      ('iPhone 8', 'Apple', 2, 71000, true),
      ('iPhone 7', 'Apple', 5, 42000, true),
      ('Galaxy S9', 'Samsung', 2, 46000, false),
      ('Galaxy S8 Plus', 'Samsung', 1, 56000, true),
      ('Desire 12', 'HTC', 5, 28000, true),
      ('Nokia 9', 'HMD Global', 6, 38000, true
);


SELECT *
FROM products
WHERE  products.company not in ('HTC'); --1

SELECT *
FROM products
WHERE company ='Apple' AND price<75000;--2

SELECT *
FROM products
where price>=46000 ; --3

select productName,price
from products
group by productName,price
order by max(price) desc
limit 2;  --4

select productName,price
from products --5
group by productName, price
order by min(price) asc
limit 1; --5

SELECT *
from products
where price = (select min(price) from products); --5

SELECT *
from products
where isDiscounted='true';--6

SELECT *
from products
where isDiscounted='false';--7

select *
from products
order by price desc ;--8

SELECT sum(price) from products;--9

select productName,productCount from products
group by productName,productCount
having productCount<=2;--10

