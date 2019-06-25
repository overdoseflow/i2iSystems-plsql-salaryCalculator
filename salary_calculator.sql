
PROCEDURE get_money_exchange
(
SALARY IN number,
d_turkish_lira OUT number
)
IS
BEGIN
select * from (
  select employee_id,first_name,last_name,salary as maxsalary, row_number() over (order by salary desc) rn from hr.employees e
)
where rn = 1; 
END;
SET SERVEROUTPUT ON;
DECLARE
d_salary number:=maxsalary;
d_turkish_lira number:=maxsalary*5;
BEGIN
get_money_exchange(d_salary, d_turkish_lira);
dbms_output.put_line('Turkish Lira version is'||d_turkish_lira);
END;

/

