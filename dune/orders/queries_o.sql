SELECT GRADE,COUNT(DISTINCT CUSTOMER_ID)
FROM CUSTOMER
GROUP BY GRADE
HAVING GRADE>(SELECT AVG(GRADE)
FROM CUSTOMER
WHERE CITY='BANGALORE');





SELECT name, COUNT(customer_id)
FROM salesman s, customer c
WHERE s.salesman_id = c.salesman_id
GROUP BY name
HAVING COUNT(customer_id) > 1;



select s.salesman_id, s.name, c.cust_name
from salesman s, customer c
where s.salesman_id= c.salesman_id
union
select s.salesman_id, s.name, 'no match'
FROM SALESMAN S
where salesman_id not in(
select salesman_id
FROM CUSTOMER c)
ORDER BY 1 ASC;



CREATE VIEW V_SALESMAN AS
SELECT O.ORDER_DATE, S.SALESMAN_ID, S.NAME
FROM SALESMAN S,ORDERS O
WHERE S.SALESMAN_ID = O.SALESMAN_ID
AND O.PURCHASE_AMOUNT= (SELECT MAX(PURCHASE_AMOUNT)
FROM ORDERS C
WHERE C.ORDER_DATE=O.ORDER_DATE);

SELECT * FROM V_SALESMAN;

DELETE FROM SALESMAN
WHERE SALESMAN_ID=1000;
