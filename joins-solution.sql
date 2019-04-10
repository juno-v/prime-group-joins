/* STORE RESPONSES TO EXERCISE QUESTIONS BELOW */

/* 
For each of the following questions:
Write a comment that specifies which question you are answering. (SQL comments are two dashes, followed by text.)
Write the SQL query that answers the question, below that comment.
Once one person writes half of the queries, switch off.
 */

1. Get all customers and their addresses.
SELECT "customers"."first_name","customers"."last_name", "addresses" FROM "customers"
JOIN "addresses" ON "customers"."id" = "address"."id";

2. Get all orders and their line items (orders, quantity and product).
SELECT "order_date", "quantity", "products"."description" FROM "orders"
JOIN "line_items" ON "line_items"."order_id" = "orders"."id"
JOIN "products" ON "line_items"."product_id" = "products"."id";

3. Which warehouses have cheetos?
SELECT "products"."description", "warehouse"."warehouse" FROM "products" 
JOIN "warehouse_product" ON "warehouse_product"."product_id" = "products"."id"
JOIN "warehouse" ON "warehouse_product"."warehouse_id" = "warehouse"."id"
WHERE "products"."description" = 'cheetos';

4. Which warehouses have diet pepsi?
SELECT "products"."description", "warehouse"."warehouse" FROM "products" 
JOIN "warehouse_product" ON "warehouse_product"."product_id" = "products"."id"
JOIN "warehouse" ON "warehouse_product"."warehouse_id" = "warehouse"."id"
WHERE "products"."description" = 'diet pepsi';

5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT "customers"."first_name", "addresses" ,"orders"."address_id"  , count("orders"."id") AS "number of orders per customer" FROM "customers"
JOIN "addresses" ON "customers"."id" = "addresses"."customer_id" 
JOIN "orders" ON "orders"."address_id" = "addresses"."id"
GROUP BY "orders"."address_id","customers"."first_name", "addresses" 

6. How many customers do we have?
SELECT count(*) AS "Number of customers" FROM "customers" 

7. How many products do we carry?
SELECT count(*) AS "Number of products carried" FROM "products"

8. What is the total available on-hand quantity of diet pepsi?
-- 8. What is the total available on-hand quantity of diet pepsi?
SELECT "products"."description", SUM("warehouse_product"."on_hand") FROM "products"
JOIN "warehouse_product" ON "warehouse_product"."product_id" = "products"."id"
WHERE "products"."description" = 'diet pepsi' 
GROUP BY "products"."description"



