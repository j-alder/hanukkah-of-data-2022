with cleaning_products as (
    select sku from products where desc like '%cleaner%'
), cleaning_orders_items as (
    select *
    from orders_items oi
    join cleaning_products cp on oi.sku = cp.sku
), cleaning_orders as (
    select o.*
    from orders o
    join cleaning_orders_items coi
        on o.orderid = coi.orderid
), cleaning_customers as (
    select c.*
    from customers c
    join cleaning_orders co
        on co.customerid = c.customerid
), contractors_in_timeframe as (
    select phone, count(*) as visits
    from cleaning_customers cc
    join cleaning_orders co
        on co.customerid = cc.customerid
    where substr(name,1,1) = 'J'
    and substr(name, instr(name, ' ') + 1, 1) = 'D'
    and strftime('%Y', co.ordered) = '2017'
    group by phone
)
select phone
from contractors_in_timeframe
where visits > 1;
