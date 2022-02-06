# 1. Write a query to get Product name and quantity/unit.  

SELECT northwind.products.product_name, northwind.products.quantity_per_unit FROM northwind.products;

#2. Write a query to get current Product list (Product ID and name).  

SELECT northwind.products.id, northwind.products.product_name  FROM northwind.products WHERE northwind.products.discontinued =0;

#3. Write a query to get discontinued Product list (Product ID and name). 

SELECT northwind.products.id, northwind.products.product_name FROM northwind.products WHERE northwind.products.discontinued =1; #should this val be zero?


#4. Write a query to get most expense and least expensive Product list (name and unit price).  

SELECT northwind.products.product_name, northwind.products.list_price FROM northwind.products WHERE 
northwind.products.list_price = (SELECT MAX(northwind.products.list_price) FROM northwind.products) OR 
northwind.products.list_price = (SELECT MIN(northwind.products.list_price) FROM northwind.products)
ORDER BY northwind.products.list_price DESC; #DESC keyword like ascending=False in python


#5. Write a query to get Product list (id, name, unit price) where current products cost less than $20.  

SELECT northwind.products.id, northwind.products.product_name, northwind.products.list_price 
FROM northwind.products 
WHERE northwind.products.discontinued =0 
HAVING northwind.products.list_price  <20
ORDER BY northwind.products.list_price;

#6. Write a query to get Product list (id, name, unit price) where products cost between $15 and $25.  

SELECT northwind.products.id, northwind.products.product_name, northwind.products.list_price FROM northwind.products
HAVING northwind.products.list_price <=25 AND #why can you do both where and having in this situation?
northwind.products.list_price>=15
ORDER BY northwind.products.list_price;

#7. Write a query to get Product list (name, unit price) of above average price.

SELECT northwind.products.product_name, northwind.products.list_price FROM northwind.products
WHERE northwind.products.list_price > (SELECT avg(northwind.products.list_price) FROM northwind.products)
ORDER BY northwind.products.list_price;
  
#8. Write a query to get Product list (name, unit price) of ten most expensive products.  

SELECT northwind.products.product_name, northwind.products.list_price  FROM northwind.products
ORDER BY northwind.products.list_price DESC
LIMIT 10; #how to handle ties?

#9. Write a query to count current and discontinued products. 

SELECT COUNT(northwind.products.product_name) FROM northwind.products
GROUP BY northwind.products.discontinued; #is this asking to count the current and disc products seperately or together? 

#10. Write a query to get Product list (name, units on order, units in stock) of stock is less than the quantity on order.  

SELECT northwind.products.product_name, northwind.order_details.quantity AS onOrder, northwind.inventory_transactions.quantity AS inStock
FROM northwind.products JOIN northwind.order_details ON northwind.products.id = northwind.order_details.product_id
JOIN northwind.inventory_transactions ON northwind.products.id = northwind.inventory_transactions.product_id
WHERE northwind.inventory_transactions.quantity < northwind.order_details.quantity;


