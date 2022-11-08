--Name : Wissam Hamed
--Student ID : 101243840


--01
select c.email_address,
       COUNT(o.order_id) as Number_of_Orders,
       SUM((oi.item_price-oi.discount_amount)*oi.quantity) as Total_amount 
from   customers c 
       inner join orders o on c.customer_id=o.customer_id
       inner join order_items oi on o.order_id=oi.order_id
GROUP BY c.email_address HAVING COUNT(o.order_id)>1 ORDER BY Total_amount desc;


--02
select p.product_name, SUM((oi.item_price-oi.discount_amount)*oi.quantity) as Total_amount from order_items oi 
        inner join products p on p.product_id= oi.product_id
group by p.product_name,oi.item_price;


--03
select c.email_address,count(quantity) as Count_of_Products from customers c 
    inner join orders  o on c.customer_id=o.customer_id
    inner join order_items oi on oi.order_id=o.order_id
group by c.email_address ;


--4
SELECT DISTINCT category_name
FROM categories c where c.category_id IN (select p.category_id from products p)
ORDER BY category_name;


--5
select product_name,list_price from products where list_price> (select AVG(list_price)from products);


--6
select c.category_name from categories c where NOT EXISTS (select c.category_id from products p where c.category_id=p.category_id ) ;


--7
select product_name from products where
discount_percent IN (select discount_percent from products group by discount_percent having count(discount_percent)=1 ) ; 


--8
select email_address as email,MAX(o.order_id) as Order_id,MAX(order_date)as lastdate from customers c 
inner join orders o on c.customer_id=o.customer_id group by email_address
