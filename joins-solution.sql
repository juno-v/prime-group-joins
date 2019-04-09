/* STORE RESPONSES TO EXERCISE QUESTIONS BELOW */

/* 
For each of the following questions:
Write a comment that specifies which question you are answering. (SQL comments are two dashes, followed by text.)
Write the SQL query that answers the question, below that comment.
Once one person writes half of the queries, switch off.
 */

1. Get all customers and their addresses.
2. Get all orders and their line items (orders, quantity and product).
3. Which warehouses have cheetos?
4. Which warehouses have diet pepsi?
5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
6. How many customers do we have?
7. How many products do we carry?
8. What is the total available on-hand quantity of diet pepsi?




-- get some data back out!
-- select all data joined together
SELECT * FROM "person"
JOIN "person_hobby" ON "person"."id" = "person_hobby"."person_id"
JOIN "hobby" ON 	   "hobby"."id"  = "person_hobby"."hobby_id";

-- select hobbies and skillz for a specific person
SELECT "hobby"."description", "person_hobby"."skillz" FROM "person"
JOIN "person_hobby" ON "person"."id" = "person_hobby"."person_id"
JOIN "hobby" ON 	   "hobby"."id"  = "person_hobby"."hobby_id"
--WHERE "person_hobby"."person_id" = 3;
WHERE "person"."id" = 3;

-- moar aggregates
-- minimum value for skillz
SELECT MIN("skillz") FROM "person_hobby";

-- average skill
SELECT AVG("skillz") AS "skill_average" FROM "person_hobby";

-- how many users have each hobby?
SELECT "hobby"."description", count("person_hobby"."hobby_id") FROM "hobby"
JOIN "person_hobby" ON "hobby"."id" = "person_hobby"."hobby_id"
GROUP BY "hobby"."description";
