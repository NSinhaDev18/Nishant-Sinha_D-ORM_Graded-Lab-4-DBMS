create database ecommerce;
use ecommerce;
create table supplier(SUPP_ID int unsigned primary key auto_increment,
 SUPP_NAME varchar(50) NOT NULL, 
 SUPP_CITY varchar(50) NOT NULL, 
 SUPP_PHONE varchar(50) NOT NULL);
-- describe supplier;
create table customer(
CUS_ID int unsigned primary key auto_increment, 
CUS_NAME varchar(20) NOT NULL, 
CUS_PHONE varchar(10) NOT NULL,
CUS_CITY varchar(30) NOT NULL, 
CUS_GENDER enum('M', 'F')not null);
-- describe customer;

create table category(
CAT_ID int unsigned primary key auto_increment,
CAT_NAME varchar(20) not null);
-- describe category;

create table product(
PRO_ID int unsigned primary key auto_increment,
PRO_NAME varchar(20) not null, 
PRO_DESC varchar(60) not null,
CAT_ID int unsigned, foreign key(CAT_ID) references category(CAT_ID));
-- describe product;

create table supplier_pricing(
PRICING_ID int unsigned primary key auto_increment,
PRO_ID int unsigned, foreign key(PRO_ID) references product(PRO_ID),
SUPP_ID int unsigned, foreign key(SUPP_ID) references supplier(SUPP_ID),
SUPP_PRICE int default 0);
-- describe supplier_pricing;

create table orders(
ORD_ID int unsigned primary key auto_increment,
ORD_AMOUNT int unsigned not null,
ORD_DATE date not null,
CUS_ID int unsigned, foreign key(CUS_ID) references customer(CUS_ID),
PRICING_ID int unsigned, foreign key(PRICING_ID) references supplier_pricing(PRICING_ID));

create table rating(
RAT_ID int unsigned primary key auto_increment,
ORD_ID int unsigned, foreign key(ORD_ID) references orders(ORD_ID),
RAT_RATSTARS int unsigned not null);

insert into supplier(SUPP_NAME,SUPP_CITY,SUPP_PHONE) values("Rajesh Retails", "Delhi", "1234567890");
insert into supplier(SUPP_NAME,SUPP_CITY,SUPP_PHONE) values("Appario Ltd.","Mumbai", "2589631470");
insert into supplier(SUPP_NAME,SUPP_CITY,SUPP_PHONE) values("Knome products","Banglore","9785462315");
insert into supplier(SUPP_NAME,SUPP_CITY,SUPP_PHONE) values("Bansal Retails","Kochi", "8975463285");
insert into supplier(SUPP_NAME,SUPP_CITY,SUPP_PHONE) values("Mittal Ltd.","Lucknow","7898456532");
select * from supplier;

insert into customer(CUS_NAME,CUS_PHONE,CUS_CITY,CUS_GENDER) 
values("AAKASH", "9999999999","DELHI",'M');
insert into customer(CUS_NAME,CUS_PHONE,CUS_CITY,CUS_GENDER) values("AMAN", "9785463215","NOIDA",'M');
insert into customer(CUS_NAME,CUS_PHONE,CUS_CITY,CUS_GENDER) values("NEHA", "9999999999","MUMBAI",'F');
insert into customer(CUS_NAME,CUS_PHONE,CUS_CITY,CUS_GENDER) values("MEGHA", "9994562399","KOLKATA",'F');
insert into customer(CUS_NAME,CUS_PHONE,CUS_CITY,CUS_GENDER) values("PULKIT", "7895999999","LUCKNOW",'M');
select * from customer;

INSERT INTO category(CAT_NAME) VALUES("BOOKS");
	INSERT INTO category(CAT_NAME) VALUES("GAMES");
	INSERT INTO category(CAT_NAME) VALUES("GROCERIES");
	INSERT INTO category(CAT_NAME) VALUES("ELECTRONICS");
    INSERT INTO category(CAT_NAME) VALUES("CLOTHES");
    select * from category;

INSERT INTO product(PRO_NAME, PRO_DESC, CAT_ID) VALUES 
("GTA V","Windows 7 and above with i5 processor and 8GB RAM");
update product set CAT_ID=2  where PRO_ID=1;
select * from product;
INSERT INTO product values
(1, "GTA V","Windows 7 and above with i5 processor and 8GB RAM",2),
(2,"TSHIRT","SIZE-L with Black, Blue and White variations",5),
(3,"ROG LAPTOP	","Windows 10 with 15inch screen, i7 processor, 1TB SSD",4),
(4,"OATS","Highly Nutritious from Nestle",3),
(5,"HARRY POTTER","Best Collection of all time by J.K Rowling",1),
(6,"MILK","1L Toned Milk",3),
(7,"Boat Earphones","1.5Meter long Dolby Atmos",4),
(8,"Jeans","Stretchable Denim Jeans with various sizes and color",5),
(9,"Project IGI","compatible with windows 7 and above",2),
(10,"Hoodie","Black GUCCI for 13 yrs and above",5),
(11,"Rich Dad Poor Dad","Written by RObert Kiyosaki",1),
(12,"Train Your Brain","By Shireen Stephen",1);

INSERT INTO supplier_pricing VALUES 
(1, 1,2,1500),
(2,3,5,30000),
(3,5,1,3000),
(4,2,3,2500),
(5,4,1,1000);
select * from supplier_pricing;

select * from supplier_pricing;

INSERT INTO orders(ORD_ID,ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID) VALUES
		-- (101,1500, "2021-10-06",2,1);
		-- (102,1000, "2021-10-12",3,5);
 		-- (103,30000, "2021-09-16",5,2);
 		-- (104,1500, "2021-10-05",1,1);
		-- (105,3000, "2021-08-16",4,3);
		-- (106,1450, "2021-08-18",1,4);
		-- (107,789, "2021-09-01",3,5);
		-- (108,780, "2021-09-07",5,2);
		-- (109,3000, "2021-08-10",5,3);
		(110,2500, "2021-09-10",2,4),
		(111,1000, "2021-09-15",4,5),
		(112,789, "2021-09-16",4,1),
		(113,31000, "2021-09-16",1,2),
		(114,1000, "2021-09-16",3,4),
		(115,3000, "2021-09-16",5,3),
		(116,99, "2021-09-17",2,1);
        select * from orders;

INSERT INTO rating(RAT_ID,ORD_ID,RAT_RATSTARS) VALUES
		(1,101,4),
		(2,102,3),
		(3,103,1),
		(4,104,2),
		(5,105,4),
		(6,106,3),
		(7,107,4),
		(8,108,4),
		(9,109,3),
		(10,110,5),
		(11,111,3),
		(12,112,4),
		(13,113,2),
		(14,114,1),
		(15,115,1),
		(16,116,0);
        select * from rating;
        
-- 4)	Display the total number of customers based on gender who have placed individual orders of worth at least Rs.3000

SELECT cus_gender, COUNT(DISTINCT customer.cus_id) as TotalCustomers
FROM customer
JOIN orders ON customer.cus_id = orders.cus_id
WHERE orders.ORD_AMOUNT >= 3000
GROUP BY cus_gender;

-- 5) Display all the orders along with product name ordered by a customer having Customer_Id=2

select cus_name, cus_city, o.ORD_AMOUNT, o.pricing_id, s.PRO_ID, p.PRO_NAME, p.PRO_DESC
   from customer inner join orders as o 
     on customer.cus_id=o.CUS_ID 
     inner join supplier_pricing as s
       on o.PRICING_ID = s.PRICING_ID
     inner join product as p
       on s.PRO_ID=p.PRO_ID
     and customer.cus_id=2;

-- 6) Display the Supplier details of who can supply more than one product.

select s.supp_name, count(p.PRO_NAME) as num_of_products from supplier as s inner join supplier_pricing as sp on s.SUPP_ID=sp.SUPP_ID
        inner join product as p on sp.PRO_ID=p.PRO_ID
        group by s.SUPP_NAME
        having num_of_products > 1;

-- 7) Find the least expensive product from each category and print the table with category id, name, product name and price of the product.

SELECT c.CAT_ID, c.CAT_NAME, p.PRO_NAME, sp.SUPP_PRICE
FROM category c
inner join product p ON c.CAT_ID = p.CAT_ID
inner join supplier_pricing sp ON p.PRO_ID = sp.PRO_ID
inner join (
    SELECT p.CAT_ID, MIN(sp.SUPP_PRICE) AS min_price
    FROM product p
    inner join supplier_pricing sp ON p.PRO_ID = sp.PRO_ID
    GROUP BY p.CAT_ID
) min_prices ON p.CAT_ID = min_prices.CAT_ID AND sp.SUPP_PRICE = min_prices.min_price;


-- 8) Display the Id and Name of the Product ordered after “2021-10-05”. 

select c.cus_name, o.ord_amount, o.ord_date, p.pro_name, p.PRO_DESC  from orders as o inner join supplier_pricing as sp 
         on o.PRICING_ID=sp.PRICING_ID
     inner join product as p on sp.pro_id=p.PRO_ID   
     inner join customer as c
       on o.CUS_ID=c.cus_id
    where o.ORD_DATE > "2021-09-01";
    
-- 9) Display customer name and gender whose names start or end with character 'A'.

  select customer.cus_name,customer.cus_gender from customer where customer.cus_name like 'A%' or customer.cus_name like '%A';

