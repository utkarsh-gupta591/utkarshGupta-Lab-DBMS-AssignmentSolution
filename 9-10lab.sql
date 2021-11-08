3) select count(CUS_GENDER) from customer join orders on customer.CUS_ID = orders.CUS_ID where ORD_AMOUNT>=3000 group by CUS_GENDER;

4) select ORD_ID, ORD_AMOUNT, ORD_DATE, p2.PRO_ID, PRO_NAME from orders o
join productDetails p1 on o.PROD_ID = p1.PROD_ID join product p2 on p1.PRO_ID = p2.PRO_ID where o.CUS_ID = 2;

5) select s.* from supplier s join productDetails p on s.SUPP_ID = p.SUPP_ID
group by p.SUPP_ID having count(p.SUPP_ID) > 1;

6) select category.* from `orders` inner join productDetails on `orders`.prod_id=productDetails.prod_id 
inner join product on product.pro_id=productDetails.pro_id inner join category on 
category.cat_id=product.cat_id having min(`orders`.ord_amount);

7) select p.PRO_ID, PRO_NAME from product p join productDetails p1 on p.PRO_ID = p1.PRO_ID join
orders o on p1.PROD_ID = o.PROD_ID where ORD_DATE > "2021-10-05";

8) select s.SUPP_ID, SUPP_NAME, CUS_NAME, RAT_RATSTARS from supplier s join rating r on s.SUPP_ID = r.SUPP_ID join
customer c on r.CUS_ID = c.CUS_ID order by RAT_RATSTARS desc limit 3;

9) select CUS_NAME, CUS_GENDER from customer where CUS_NAME like 'A%' or CUS_NAME like '%A';

10) select sum(ORD_AMOUNT) from orders o join customer c on o.CUS_ID = c.CUS_ID and CUS_GENDER = "M";

11) select * from customer c left join orders o on c.CUS_ID = o.CUS_ID;

12) delimiter &&
create procedure displayRating()
begin
select s.SUPP_ID, SUPP_NAME, RAT_RATSTARS, 
case
when RAT_RATSTARS > 4 then 'Genuine Suuplier'
when RAT_RATSTARS > 2 then 'Average Supplier'
else 'Supplier should not be considered'
end as Verdict
from supplier s join rating r on s.SUPP_ID = r.SUPP_ID;
end &&
call displayRating();