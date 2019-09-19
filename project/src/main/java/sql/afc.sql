select * from 

select * from ITEM;

select * from afcorder;


select rownum from AFCORDER;

insert into AFCORDER values('test', 'test','test', '1', '100','100','test', 2019/11/11/01/02/15/1,null,null, null,null,null,null);


select * from afcorder where or_num ='afc1568870415633';


select to_char(or_date, 'yyyy-mm-dd') or_date, sum(totalPrice) totalPrice from AFCORDER group by to_char(or_date, 'yyyy-mm-dd'); 