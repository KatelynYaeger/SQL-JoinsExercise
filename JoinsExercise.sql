/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name 
and the category name */
SELECT P.NAME AS PRODUCT, C.NAME AS CATEGORY 
FROM PRODUCTS AS P
INNER JOIN CATEGORIES AS C ON C.CATEGORYID = P.CATEGORYID
WHERE C.NAME = 'COMPUTERS';

 
/* joins: find all product names, product prices, and products ratings that 
have a rating of 5 */
SELECT P.NAME AS PRODUCTNAME, P.PRICE, R.RATING FROM PRODUCTS AS P
INNER JOIN REVIEWS AS R ON R.PRODUCTID = P.PRODUCTID
WHERE RATING = 5;
 
/* joins: find the employee with the most total quantity sold.  use the 
sum() function and group by */
SELECT E.FIRSTNAME, E. LASTNAME, SUM(S.QUANTITY) AS TOTAL 
FROM SALES AS S
INNER JOIN EMPLOYEES AS E ON E.EMPLOYEEID = S.EMPLOYEEID
GROUP BY E.EMPLOYEEID
ORDER BY TOTAL DESC
LIMIT 2;

/* joins: find the name of the department, and the name of the category for 
Appliances and Games */
SELECT D.NAME AS 'DEPARTMENTNAME', C.NAME AS 'CATEGORYNAME' 
FROM DEPARTMENTS AS D
INNER JOIN CATEGORIES AS C ON C.DEPARTMENTID = D.DEPARTMENTID
WHERE C.NAME = 'APPLIANCES' OR C.NAME = 'GAMES';

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT P.NAME, SUM(S.QUANTITY) AS 'TOTAL SOLD', 
SUM(S.QUANTITY * S.PRICEPERUNIT) AS 'TOTAL PRICE SOLD' FROM PRODUCTS AS P
INNER JOIN SALES AS S ON S.PRODUCTID = P.PRODUCTID
WHERE P.NAME = 'EAGLES: HOTEL CALIFORNIA';

/* joins: find Product name, reviewer name, rating, and comment on 
the Visio TV. 
(only return for the lowest rating!) */
SELECT P.NAME, R.REVIEWER, R.RATING, R.COMMENT 
FROM PRODUCTS AS P
INNER JOIN REVIEWS AS R ON R.PRODUCTID = P.PRODUCTID
WHERE P.NAME = 'VISIO TV' AND R.RATING = 1;

/* Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, the employee's first and last name, 
the name of each product, how many of that product they sold */
SELECT e.EmployeeID, e.FirstName, e.LastName, p.Name, 
SUM(S.QUANTITY) AS TOTALSOLD FROM SALES AS S
INNER JOIN EMPLOYEES AS E ON E.EMPLOYEEID = S.EMPLOYEEID
INNER JOIN PRODUCTS AS P ON P.PRODUCTID = S.PRODUCTID
GROUP BY E.EMPLOYEEID, P.PRODUCTID
ORDER BY TOTALSOLD DESC;





