create temp table touchtone (
    number integer primary key,
    letters text
);

insert into touchtone (number, letters) values (2, 'ABC');
insert into touchtone (number, letters) values (3, 'DEF');
insert into touchtone (number, letters) values (4, 'GHI');
insert into touchtone (number, letters) values (5, 'JKL');
insert into touchtone (number, letters) values (6, 'MNO');
insert into touchtone (number, letters) values (7, 'PQR');
insert into touchtone (number, letters) values (8, 'STU');
insert into touchtone (number, letters) values (9, 'VWX');
insert into touchtone (number, letters) values (0, 'YZ');

with first as (
    select
        customerid,
        replace(phone, '-', '') as shortphone,
        instr(name, ' ') as idx,
        substr(name, 1, instr(name, ' ')) as name,
        substr(name, instr(name, ' ')+1) as rest
    from customers
), second as (
    select
        c.customerid,
        instr(f.rest, ' ') as idx,
        substr(f.rest, 1, instr(f.rest, ' ')) as name,
        substr(f.rest, instr(f.rest, ' ')+1) as rest
    from customers c
    join first f on f.customerid = c.customerid
), third as (
    select
        c.customerId,
        instr(s.rest, ' ') as idx,
        s.rest as name
    from customers c
    join second s on s.customerid = c.customerid
)
select phone
from customers c
join first f on c.customerid = f.customerid
join second s on f.customerid = s.customerid
join third t on t.customerid = f.customerid
where length(f.shortphone) = length(t.name)
and
    (select number from touchtone where letters like '%' || upper(substr(t.name, 1, 1)) || '%')
    || (select number from touchtone where letters like '%' || upper(substr(t.name, 2, 1)) || '%')
    || (select number from touchtone where letters like '%' || upper(substr(t.name, 3, 1)) || '%')
    || (select number from touchtone where letters like '%' || upper(substr(t.name, 4, 1)) || '%')
    || (select number from touchtone where letters like '%' || upper(substr(t.name, 5, 1)) || '%')
    || (select number from touchtone where letters like '%' || upper(substr(t.name, 6, 1)) || '%')
    || (select number from touchtone where letters like '%' || upper(substr(t.name, 7, 1)) || '%')
    || (select number from touchtone where letters like '%' || upper(substr(t.name, 8, 1)) || '%')
    || (select number from touchtone where letters like '%' || upper(substr(t.name, 9, 1)) || '%')
    || (select number from touchtone where letters like '%' || upper(substr(t.name, 10, 1)) || '%')
                                  = f.shortphone;
