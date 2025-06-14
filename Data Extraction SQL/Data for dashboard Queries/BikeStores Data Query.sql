select ord.order_id,concat(cus.first_name,' ',cus.last_name) as customes,
cus.city,cus.state,
ord.order_date ,
sum(ite.quantity) as 'total units',
sum(ite.quantity*ite.list_price) as 'revenue',
pro.product_name,
cat.category_name,
sto.store_name,
concat(sta.first_name,' ',sta.last_name) as 'sales rep'
from sales.orders ord
join sales.customers cus
On ord.customer_id=cus.customer_id

join sales.order_items ite
On ord.order_id=ite.order_id

join production.products pro
on pro.product_id=ite.product_id

join production.categories cat
on cat.category_id=pro.category_id

join sales.stores sto
on sto.store_id=ord.store_id

join sales.staffs sta
on sta.staff_id=ord.staff_id

Group By ord.order_id,concat(cus.first_name,' ',cus.last_name),
cus.city,cus.state,
ord.order_date,
pro.product_name,
cat.category_name,
sto.store_name,
concat(sta.first_name,' ',sta.last_name) ;