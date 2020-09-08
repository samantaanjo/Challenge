/*Question 1

A.	Think about what could be going wrong with our calculation. Think about a better way to evaluate this data. 
 $3145.13 is the average of order amount column. It does not represent the result for the formula of OVA.
/*B.	What metric would you report for this dataset? */
•	Number of transactions
•	Revenue per visitor (RPV)

/*C.	What is its value? */
•	Number of transactions = 5000
•	Revenue per visitor (RPV) = total revenue / by the total number of visitors = $157,256.40/301 = $522,44.*/
	
/*Question 2
A.	How many orders were shipped by Speedy Express in total?*/
/* 54 */
SELECT  count(*) as total FROM ORDERS where shipperID in (SELECT shipperID FROM shippers where ShipperName = 'Speedy Express');


/*B.	What is the last name of the employee with the most orders?*/
/* Peacock */ 
select  lastName from Employees where EmployeeID in 
(SELECT EmployeeID FROM   
    (SELECT EmployeeID, count(*)
          from Orders 
          group by EmployeeID 
          order by count(*) desc  
          limit 1 
     ) 
 )

/*C.	What product was ordered the most by customers in Germany?*/

-- 31	Gorgonzola Telino	14	4	12 - 100 g pkgs	12.5

select * from products where ProductID in (
 Select productID from (
 select ProductID, count(*)
   from OrderDetails 

 where OrderID 
    in ( select OrderId 
    		from Orders 
         where CustomerID in
                ( select customerID 
                   from Customers 
                   where Country = 'Germany'
                 )
       )

 group by ProductID 
 order by count(*) desc  
 limit 1 
 ))
