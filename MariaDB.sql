-- составьте выражение, использующее CTE (оператор WITH), внутри которого будет использован JOIN
WITH cte_customers AS (
SELECT customers.customerNumber, customers.customerName, orders.orderDate 
FROM customers
  INNER JOIN orders
ON customers.customerNumber = orders.customerNumber )
SELECT * 
FROM cte_customers; 
 
-- составьте выражение, использующее CTE (оператор WITH), внутри которого выполняется запрос из другого CTE  
WITH cte_customers AS (
SELECT customers.customerNumber, customers.customerName, orders.orderDate 
FROM customers
  INNER JOIN orders
ON customers.customerNumber = orders.customerNumber 
), 

cte_customers_numbers AS (
  SELECT * 
  FROM cte_customers 
  WHERE customernumber > 110 
 )
SELECT customernumber, customernumber, orderdate 
 FROM cte_customers_numbers; 
 
-- составьте выражение, использующее CTE (оператор WITH), и выполняющее JOIN с другим CTE
 WITH cte_customers AS (
SELECT customers.customerNumber, customers.customerName, orders.orderDate 
FROM customers
  INNER JOIN orders
ON customers.customerNumber = orders.customerNumber ),

cte_payments AS (
    SELECT customernumber, amount 
    FROM payments
)

SELECT* 
FROM cte_customers 
INNER JOIN cte_payments 
ON cte_payments.customernumber = cte_customers.customernumber; 

--добавьте индексы на таблицу employees, которые ускорят поиск по имени и фамилии сотрудников 
CREATE INDEX idx_name ON employees (firstname, lastname);  
CREATE INDEX idx_names ON employees (lastname, firstname); 
