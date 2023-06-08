drop function if exists email;
delimiter $$
create function email(first_name varchar(50),last_name varchar(50)) 
returns varchar(255)
begin

return concat(replace(
    replace(
        replace(
            replace(
                replace(left(lower(first_name),1),'č','c'),'ć','c'),'ž','z'),'š','s'),'đ','dj')
	,'.',lower(
	replace(
        replace(
            replace(
                replace(
                    replace(
                        replace(upper(last_name),' ',''),'Ž','Z'),'Š','S'),'Č','C'),'Ć','C'),'Đ','DJ')),'@email.com');

end;
$$
delimiter ;
