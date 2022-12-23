-- 516-994-3023 3-21 -> 4-19
with contractor_hood as (
    select address, citystatezip from customers where phone = '212-771-8924'
)
select ch.address, c.*
from customers c
join contractor_hood ch on
    c.citystatezip = ch.citystatezip
where (substr(birthdate, 6, 2) = '03' and cast(substr(birthdate, 9,2) as integer) >= 21)
    or (substr(birthdate, 6, 2) = '04' and cast(substr(birthdate, 9,2) as integer) <= 19);
