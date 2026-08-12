CREATE TABLE customers (
  id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name TEXT
);

CREATE TABLE orders (
  id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  customer_id INTEGER,
  price INTEGER
);

INSERT INTO customers (name) VALUES
  ('Alice'),
  ('Bob'),
  ('Charlie'),
  ('David'),
  ('Eve'),
  ('Frank'),
  ('Grace'),
  ('Hank');

INSERT INTO orders (customer_id, price) VALUES
  (1, 50),
  (2, 100),
  (3, 150),
  (4, 200),
  (5, 250),
  (6, 30),
  (7, 70),
  (8, 400);
-- Do not modify above this line. --

-- Problem solved using ANY operator
-- SELECT name
-- FROM customers
-- WHERE id = ANY (
--     SELECT DISTINCT customer_id
--     FROM orders
--     WHERE price < 100
-- )
-- ORDER BY name;


WITH max_price_customer AS(
  SELECT customer_id, MAX(price) AS max_price
  FROM orders
  GROUP BY customer_id
  HAVING MAX(price) < 100
)

SELECT name
FROM customers c
JOIN max_price_customer mpc
ON c.id = mpc.customer_id
ORDER BY name;
