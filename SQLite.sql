-- Customers Table
Create Table CustomerDetails (
  customer_id INT PRIMARY KEY,
  customer_name CHAR(100),
  customer_number INTEGER(10),
  customer_location CHAR(40)
  );
  
--insert the values to the customer details table
INSERT INTO CustomerDetails VALUES (101,'Tufayl',0140401412,'Chennai');
INSERT INTO CustomerDetails VALUES (102,'Akhil',9998887771,'Thanjavur');
INSERT INTO CustomerDetails VALUES (103,'Giri',6440486693,'Thiruvarur');
INSERT INTO CustomerDetails VALUES (104,'Santhosh',9148186031,'Madurai');
INSERT INTO CustomerDetails vALUES (105,'Lokesh',6788768990,'Selam');
INSERT INTO CustomerDetails VALUES (106,'Sam',1122334455,'Coimbatore');
INSERT INTO CustomerDetails VALUES (107,'Raja',9080706050,'Erode');
INSERT INTO CustomerDetails VALUES (108,'Dhoni',1020304050,'Namakkal');
INSERT INTO CustomerDetails VALUES (109,'Rohit',6543210987,'Karur');
Insert Into CustomerDetails VALUES (110,'Samson',7766554400,'Trichy');
  
SELECT * FROM CustomerDetails;
  
  
  -- Products table
CREATE TABLE ProductDetails (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(60),
    price DECIMAL(8, 2)
);

-- insert values in product details
INSERT INTO ProductDetails VALUES (1,'Shampoo',300.00);
INSERT INTO ProductDetails VALUES (2,'Soap',100);
INSERT INTO ProductDetails VALUES (3,'Hairoil',250.0);
INSERT INTO ProductDetails VALUES (4,'Biscuits',30);
INSERT INTO ProductDetails VALUES (5,'WaterBottle',30);
INSERT INTO ProductDetails VALUES (6,'Chocolates',150);
INSERT INTO ProductDetails VALUES (7,'Candy',10.00);

SELECT * FROM ProductDetails;

-- Orders table
CREATE TABLE OrderDetails (
    order_id INT PRIMARY KEY,
    Ocustomer_id INT,
    Oproduct_id INT,
    quantity INT,
    order_date DATE,
    FOREIGN KEY (Ocustomer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (Oproduct_id) REFERENCES products(product_id)
);

--insert record to the order details table
INSERT INTO OrderDetails VALUES (1,101,3,5,'2026-01-10');
INSERT INTO OrderDetails VALUES (2,104,4,3,'2026-01-11');
INSERT INTO OrderDetails VALUES (3,103,7,4,'2026-01-12');
INSERT INTO OrderDetails VALUES (4,102,6,2,'2026-01-15');  
INSERT INTO OrderDetails VALUES (5,101,1,2,'2026-01-17');
INSERT INTO OrderDetails VALUES (6,104,6,2,'2026-01-19');  
INSERT INTO OrderDetails VALUES (7,101,7,10,'2026-01-25');  
INSERT INTO OrderDetails VALUES (8,103,1,2,'2026-02-02');  
INSERT INTO OrderDetails VALUES (9,108,3,8,'2026-02-05');  
INSERT INTO OrderDetails VALUES (10,110,4,2,'2026-02-10');  
INSERT INTO OrderDetails VALUES (11,109,5,15,'2026-02-15');  
INSERT INTO OrderDetails VALUES (12,107,2,3,'2026-02-20');  

SELECT * FROM OrderDetails; -- View the records in the table


--top n customers by total revenue
SELECT customer_id, customer_name, SUM(quantity * price) AS total_revenue, GROUP_CONCAT(product_name) AS Product_List FROM OrderDetails
JOIN CustomerDetails ON Ocustomer_id = customer_id --join the order and customer table to match the record
JOIN ProductDetails on Oproduct_id = product_id --join the order and product table to match the record
GROUP BY customer_id, customer_name --group rows have same values in specific columns
Order by total_revenue DESC --Arrange the revenue values descending order
LIMIT 5; --set limit to show only 5 records


--Creating the monthly sales view using order_date column
CREATE VIEW Monthly_Sales_View AS
SELECT strftime('%Y-%m', order_date) AS sales_month, SUM(quantity) AS total_qty, SUM(quantity * price) AS total_sales 
FROM OrderDetails
JOIN ProductDetails ON Oproduct_id = product_id
GROUP BY sales_month; --Combine all date from the same month to show the month record

SELECT * FROM Monthly_Sales_View;


--Most popular product based on quantity sold
SELECT product_name, SUM(quantity) AS total_sold,
    RANK() OVER (ORDER BY SUM(quantity) DESC) AS popularity_rank FROM OrderDetails --rank() over(ranking across rows) rank of total quantity
JOIN ProductDetails ON Oproduct_id = product_id
GROUP BY product_name --group rows have same values in specific columns(Unique records)
ORDER BY popularity_rank ASC; --orderby rank Using ascending order

