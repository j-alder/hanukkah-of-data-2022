select distinct customerid, shipped, cast(strftime('%H', shipped) as integer) as hour
from orders 
where cast(strftime('%H', shipped) as integer) < 5
group by customerid;
