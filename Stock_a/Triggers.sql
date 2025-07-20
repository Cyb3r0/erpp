CREATE OR REPLACE TRIGGER STOCK_A.T_TRANSACTION_SARF
 AFTER  INSERT 
 ON TRANSACTION

FOR   EACH  ROW
BEGIN

IF :NEW.TRANS_TYPE=2  THEN 
declare
	v_kaid_id number(10);
	v_period_id number(10);
	v_daily1 number(10);
	v_daily2 number(10);
	v_customer_account number(10);
	v_customer_account_name varchar2(200);
	v_customer_main_account number(10);
	v_customer_main_account_name varchar2(200);
		v_box_account number(10);
	v_box_account_name varchar2(200);
	v_box_main_account number(10);
	v_box_main_account_name varchar2(200);
	v_last_box_name varchar2(200);
	v_last_box_id number(10);
	V_PUR_MAIN_ID   NUMBER;
	 V_PUR_MAIN_NAME VARCHAR2(100);
	  V_PUR_BRANCH_ID NUMBER;
	   V_PUR_BRANCH_NAME VARCHAR2(100);
	    V_PUR_ACCOUNT_ID NUMBER;
		 V_PUR_ACCOUNT_NAME VARCHAR2(100);
		 	 
		 V_DAMAGE_MAIN_ID NUMBER;
		  V_DAMAGE_MAIN_NAME VARCHAR2(100);
		   V_DAMAGE_BRANCH_ID NUMBER;
		    V_DAMAGE_BRANCH_NAME VARCHAR2(100);
			 V_DAMAGE_ACCOUNT_ID NUMBER; 
			 V_DAMAGE_ACCOUNT_NAME VARCHAR2(100);
			 
			 
			 V_TAX_MAIN_ID NUMBER;
		  V_TAX_MAIN_NAME VARCHAR2(100);
		   V_TAX_BRANCH_ID NUMBER;
		    V_TAX_BRANCH_NAME VARCHAR2(100);
			 V_TAX_ACCOUNT_ID NUMBER; 
			 V_TAX_ACCOUNT_NAME VARCHAR2(100);
			 
			 
			 SUM_TOT    NUMBER;
	x   date;
	begin



	
select nvl(max(kaid.kaid_id),0)+1
into v_kaid_id
from kaid;

select max(period_id)
into v_period_id
from periods
where periods.period_state=1;

insert into kaid (kaid_id,kaid_date,worker_id,period_id,sanad_sarf_id,KAID_NOTES,TYP,BILL_CODE)
values(v_kaid_id,:NEW.TRANS_DATE,'1',v_period_id,:NEW.TRANS_CODE,'”‰œ ’—› «·Ï '||'  '||:NEW.CUS_VEN_NAME  
||' „ﬁ«»· '||:NEW.NOTES
,11,:NEW.TRANS_CODE);


select nvl(max(daily.daily_id),0)+1 ,nvl(max(daily.daily_id),0)+2
into v_daily1 ,v_daily2
from daily;
---   customer or supplier -------------

select SUPPLIER_ACCOUNT ,SUPPLIER_account_name, SUPPLIER_main_account ,SUPPLIER_main_account_name
into v_customer_account ,v_customer_account_name,v_customer_main_account ,v_customer_main_account_name 
from setting;

----  Pay From Box or pay from save --------------

	
select box_account ,box_account_name,box_main_account,box_main_account_name ,last_box_name ,last_box_id
into v_box_account,v_box_account_name,v_box_main_account,v_box_main_account_name ,v_last_box_name ,v_last_box_id
from setting;


if :NEW.PAY_TYPE = 1 then --and  :BOX between 124001 and 124999

select box_account ,box_account_name,box_main_account,box_main_account_name ,last_box_name ,last_box_id
into v_box_account,v_box_account_name,v_box_main_account,v_box_main_account_name ,v_last_box_name ,v_last_box_id
from setting;

ELSE

	select '123' ,'«·»‰Êﬂ',save_main_account,save_main_account_name ,:NEW.BOX_NAME ,:NEW.BOX
into v_box_account,v_box_account_name,v_box_main_account,v_box_main_account_name ,v_last_box_name ,v_last_box_id
from setting;

end if;


if :NEW.CUS_VEN_TYPE = 1 then

select customer_account ,customer_account_name, customer_main_account ,customer_main_account_name
into v_customer_account ,v_customer_account_name,v_customer_main_account ,v_customer_main_account_name 
from setting;

elsif  :NEW.CUS_VEN_TYPE = 2 then
	
select SUPPLIER_ACCOUNT ,SUPPLIER_ACCOUNT_NAME, SUPPLIER_MAIN_ACCOUNT ,SUPPLIER_MAIN_ACCOUNT_NAME
into v_customer_account ,v_customer_account_name,v_customer_main_account ,v_customer_main_account_name 
from setting;

end if;


insert into daily (daily_id,main_account,main_desc,branch_account,branch_desc,account_id,account_name,madeen,daen,notes,period_id,kaid_id,COST_ID,TYP)values
                  (v_daily1,v_customer_main_account,v_customer_main_account_name,v_customer_account,v_customer_account_name,:NEW.CUS_VEN_CODE,:NEW.CUS_VEN_NAME,:NEW.PAYED,'0','”‰œ ’—› «·Ï '||'  '||:NEW.CUS_VEN_NAME  
||' „ﬁ«»· '||:NEW.NOTES,v_period_id,v_kaid_id,128001,11);


insert into daily (daily_id,main_account,main_desc,branch_account,branch_desc,account_id,account_name,madeen,daen,notes,period_id,kaid_id,COST_ID,TYP)values  --v_last_box_id,v_last_box_name
                    (v_daily2,v_box_main_account,v_box_main_account_name,v_box_account,v_box_account_name,:NEW.BOX,:NEW.BOX_NAME,'0',:NEW.PAYED,'”‰œ ’—› «·Ï '||'  '||:NEW.CUS_VEN_NAME  
||' „ﬁ«»· '||:NEW.NOTES,v_period_id,v_kaid_id,128001,11);




	


end;
	end if;
	
END;
/



-----------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER STOCK_A.T_TRANSACTION_QABD
 AFTER  INSERT 
 ON TRANSACTION

FOR   EACH  ROW
BEGIN

IF :NEW.TRANS_TYPE=1  THEN 
declare
	v_kaid_id number(10);
	v_period_id number(10);
	v_daily1 number(10);
	v_daily2 number(10);
	v_customer_account number(10);
	v_customer_account_name varchar2(200);
	v_customer_main_account number(10);
	v_customer_main_account_name varchar2(200);
		v_box_account number(10);
	v_box_account_name varchar2(200);
	v_box_main_account number(10);
	v_box_main_account_name varchar2(200);
	v_last_box_name varchar2(200);
	v_last_box_id number(10);
	V_PUR_MAIN_ID   NUMBER;
	 V_PUR_MAIN_NAME VARCHAR2(100);
	  V_PUR_BRANCH_ID NUMBER;
	   V_PUR_BRANCH_NAME VARCHAR2(100);
	    V_PUR_ACCOUNT_ID NUMBER;
		 V_PUR_ACCOUNT_NAME VARCHAR2(100);
		 	 
		 V_DAMAGE_MAIN_ID NUMBER;
		  V_DAMAGE_MAIN_NAME VARCHAR2(100);
		   V_DAMAGE_BRANCH_ID NUMBER;
		    V_DAMAGE_BRANCH_NAME VARCHAR2(100);
			 V_DAMAGE_ACCOUNT_ID NUMBER; 
			 V_DAMAGE_ACCOUNT_NAME VARCHAR2(100);
			 
			 
			 V_TAX_MAIN_ID NUMBER;
		  V_TAX_MAIN_NAME VARCHAR2(100);
		   V_TAX_BRANCH_ID NUMBER;
		    V_TAX_BRANCH_NAME VARCHAR2(100);
			 V_TAX_ACCOUNT_ID NUMBER; 
			 V_TAX_ACCOUNT_NAME VARCHAR2(100);
			 
			 
			 SUM_TOT    NUMBER;
	x   date;
	begin

	
select nvl(max(kaid.kaid_id),0)+1
into v_kaid_id
from kaid;

select max(period_id)
into v_period_id
from periods
where periods.period_state=1;

insert into kaid (kaid_id,kaid_date,worker_id,period_id,sanad_sarf_id,KAID_NOTES,TYP,BILL_CODE)
values(v_kaid_id,:NEW.TRANS_DATE,'1',v_period_id,:NEW.TRANS_CODE,'”‰œ ﬁ»÷ „‰ '||'  '||:NEW.CUS_VEN_NAME  
||' „ﬁ«»· '||:NEW.NOTES
,10,:NEW.TRANS_CODE);


select nvl(max(daily.daily_id),0)+1 ,nvl(max(daily.daily_id),0)+2
into v_daily1 ,v_daily2
from daily;
---   customer or supplier -------------

if :NEW.PAY_TYPE = 1 then --and  :BOX between 124001 and 124999

select box_account ,box_account_name,box_main_account,box_main_account_name ,last_box_name ,last_box_id
into v_box_account,v_box_account_name,v_box_main_account,v_box_main_account_name ,v_last_box_name ,v_last_box_id
from setting;

ELSE

	select '123' ,'«·»‰Êﬂ',save_main_account,save_main_account_name ,:NEW.BOX_NAME ,:NEW.BOX
into v_box_account,v_box_account_name,v_box_main_account,v_box_main_account_name ,v_last_box_name ,v_last_box_id
from setting;

end if;


if :NEW.CUS_VEN_TYPE = 1 then

select customer_account ,customer_account_name, customer_main_account ,customer_main_account_name
into v_customer_account ,v_customer_account_name,v_customer_main_account ,v_customer_main_account_name 
from setting;

elsif  :NEW.CUS_VEN_TYPE = 2 then
	
select SUPPLIER_ACCOUNT ,SUPPLIER_ACCOUNT_NAME, SUPPLIER_MAIN_ACCOUNT ,SUPPLIER_MAIN_ACCOUNT_NAME
into v_customer_account ,v_customer_account_name,v_customer_main_account ,v_customer_main_account_name 
from setting;

end if;

insert into daily (daily_id,main_account,main_desc,branch_account,branch_desc,account_id,account_name,madeen,daen,notes,period_id,kaid_id,COST_ID,TYP)values  --v_last_box_id,v_last_box_name
                    (v_daily1,v_box_main_account,v_box_main_account_name,v_box_account,v_box_account_name,:NEW.BOX,:NEW.BOX_NAME,:NEW.PAYED,'0','”‰œ ﬁ»÷ „‰ '||'  '||:NEW.CUS_VEN_NAME  
||' „ﬁ«»· '||:NEW.NOTES,v_period_id,v_kaid_id,128001,10);



insert into daily (daily_id,main_account,main_desc,branch_account,branch_desc,account_id,account_name,madeen,daen,notes,period_id,kaid_id,COST_ID,TYP)values
                  (v_daily2,v_customer_main_account,v_customer_main_account_name,v_customer_account,v_customer_account_name,:NEW.CUS_VEN_CODE,:NEW.CUS_VEN_NAME,'0',:NEW.PAYED,'”‰œ ﬁ»÷ „‰ '||'  '||:NEW.CUS_VEN_NAME  
||' „ﬁ«»· '||:NEW.NOTES,v_period_id,v_kaid_id,128001,10);




	


end;
	end if;
	
END;
/



--------------------------------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER STOCK_A.T_TRANSACTION_DELETE

 BEFORE  DELETE 
 ON TRANSACTION
FOR   EACH  ROW
BEGIN
IF :OLD.TRANS_TYPE  =1 THEN 
delete from KAID  where  SANAD_SARF_ID = :OLD.TRANS_CODE AND TYP =10  ;
ELSE 
delete from KAID  where  SANAD_SARF_ID = :OLD.TRANS_CODE AND TYP =11  ;
END IF;


END ;
/



------------------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER STOCK_A.T_BILL_MASTER_SALE
 AFTER  INSERT 
 ON BILL_MASTER

FOR   EACH  ROW
BEGIN

IF :NEW.FLAG=1   THEN 
declare
	v_kaid_id number(10);
	v_period_id number(10);
	v_daily1 number(10);
	v_daily2 number(10);
	v_customer_account number(10);
	v_customer_account_name varchar2(200);
	v_customer_main_account number(10);
	v_customer_main_account_name varchar2(200);
		v_box_account number(10);
	v_box_account_name varchar2(200);
	v_box_main_account number(10);
	v_box_main_account_name varchar2(200);
	v_last_box_name varchar2(200);
	v_last_box_id number(10);
	V_PUR_MAIN_ID   NUMBER;
	 V_PUR_MAIN_NAME VARCHAR2(100);
	  V_PUR_BRANCH_ID NUMBER;
	   V_PUR_BRANCH_NAME VARCHAR2(100);
	    V_PUR_ACCOUNT_ID NUMBER;
		 V_PUR_ACCOUNT_NAME VARCHAR2(100);
		 	 
		 V_TAX_MAIN_ID NUMBER;
		  V_TAX_MAIN_NAME VARCHAR2(100);
		   V_TAX_BRANCH_ID NUMBER;
		    V_TAX_BRANCH_NAME VARCHAR2(100);
			 V_TAX_ACCOUNT_ID NUMBER; 
			 V_TAX_ACCOUNT_NAME VARCHAR2(100);
			 
			 SUM_TOT    NUMBER;
	x   date;
	begin


 	
SELECT TAX_MAIN_ID, TAX_MAIN_NAME, TAX_BRANCH_ID, TAX_BRANCH_NAME, TAX_ACCOUNT_ID, TAX_ACCOUNT_NAME
INTO V_TAX_MAIN_ID, V_TAX_MAIN_NAME, V_TAX_BRANCH_ID, V_TAX_BRANCH_NAME, V_TAX_ACCOUNT_ID, V_TAX_ACCOUNT_NAME
FROM TREE_SETTING_ACCOUNT;
	
	SELECT SAL_MAIN_ID, SAL_MAIN_NAME, SAL_BRANCH_ID, SAL_BRANCH_NAME, SAL_ACCOUNT_ID, SAL_ACCOUNT_NAME
	INTO V_PUR_MAIN_ID, V_PUR_MAIN_NAME, V_PUR_BRANCH_ID, V_PUR_BRANCH_NAME, V_PUR_ACCOUNT_ID, V_PUR_ACCOUNT_NAME
	FROM TREE_SETTING_ACCOUNT;

	
	
select nvl(max(kaid.kaid_id),0)+1
into v_kaid_id
from kaid;



select max(period_id)
into v_period_id
from periods
where periods.period_state=1;

insert into kaid (kaid_id,kaid_date,worker_id,period_id,sanad_sarf_id,KAID_NOTES,TYP, BILL_CODE)
values(V_kaid_id,:NEW.BILL_DATE,'1',v_period_id,0,'»Ì⁄ »÷«⁄…'
||' »—ﬁ„ ›« Ê—… '||:NEW.BILL_CODE
,1, :NEW.BILL_CODE);


select nvl(max(daily.daily_id),0)+1 ,nvl(max(daily.daily_id),0)+2
into v_daily1 ,v_daily2
from daily;
---   customer or supplier -------------

select SUPPLIER_ACCOUNT ,SUPPLIER_account_name, SUPPLIER_main_account ,SUPPLIER_main_account_name
into v_customer_account ,v_customer_account_name,v_customer_main_account ,v_customer_main_account_name 
from setting;

----  Pay From Box or pay from save --------------

	
select box_account ,box_account_name,box_main_account,box_main_account_name ,last_box_name ,last_box_id
into v_box_account,v_box_account_name,v_box_main_account,v_box_main_account_name ,v_last_box_name ,v_last_box_id
from setting;


if :NEW.PAY_TYPE = 1 then --and  :BOX between 124001 and 124999
	
	
	
select box_account ,box_account_name,box_main_account,box_main_account_name ,last_box_name ,last_box_id
into v_box_account,v_box_account_name,v_box_main_account,v_box_main_account_name ,v_last_box_name ,v_last_box_id
from setting;

	elsif:NEW.PAY_TYPE = 2 then 
	
	
select SUPPLIER_ACCOUNT ,SUPPLIER_account_name, SUPPLIER_main_account ,SUPPLIER_main_account_name,last_box_name ,last_box_id
into v_box_account,v_box_account_name,v_box_main_account,v_box_main_account_name ,v_last_box_name ,v_last_box_id
from setting;


elsif :NEW.PAY_TYPE = 3   then 
	
	
	
	select '123' ,'«·»‰Êﬂ',save_main_account,save_main_account_name ,:NEW.BOX_NAME ,:NEW.BOX
into v_box_account,v_box_account_name,v_box_main_account,v_box_main_account_name ,v_last_box_name ,v_last_box_id
from setting;

end if;


if :NEW.PAY_TYPE = 2 then  


                 insert into daily (daily_id,main_account,main_desc,branch_account,branch_desc,account_id,account_name,madeen,daen,notes,period_id,kaid_id,COST_ID,TYP)values
                  (v_daily1,v_box_main_account,v_box_main_account_name,v_box_account,v_box_account_name,:NEW.BOX,:NEW.BOX_NAME, :new.PAY_REMAIN2,0,'»Ì⁄ »÷«⁄…'
                   ||' »—ﬁ„ ›« Ê—… '||:NEW.BILL_CODE, v_period_id,V_KAID_ID,:NEW.BRANCH_CODE,1);
				  
				  
				  insert into daily (daily_id,main_account,main_desc,branch_account,branch_desc,account_id,account_name,madeen,daen,notes,period_id,kaid_id,COST_ID,TYP)values  --v_last_box_id,v_last_box_name
                  (v_daily2,V_PUR_MAIN_ID, V_PUR_MAIN_NAME, V_PUR_BRANCH_ID, V_PUR_BRANCH_NAME, V_PUR_ACCOUNT_ID, V_PUR_ACCOUNT_NAME,
				  '0',(:new.PAY_REMAIN2-:NEW.SUM_TAX),'»Ì⁄ »÷«⁄…'
                  ||' »—ﬁ„ ›« Ê—… '||:NEW.BILL_CODE,v_period_id,V_KAID_ID,:NEW.BRANCH_CODE,1);
				  
insert into daily (daily_id,main_account,main_desc,branch_account,branch_desc,account_id,account_name,madeen,daen,notes,period_id,kaid_id,COST_ID,TYP)values  --v_last_box_id,v_last_box_name
                  (v_daily2+1,V_TAX_MAIN_ID, V_TAX_MAIN_NAME, V_TAX_BRANCH_ID, V_TAX_BRANCH_NAME, V_TAX_ACCOUNT_ID, V_TAX_ACCOUNT_NAME,
				  '0',:NEW.SUM_TAX,'»Ì⁄ »÷«⁄…'
                  ||' »—ﬁ„ ›« Ê—… '||:NEW.BILL_CODE,v_period_id,V_KAID_ID,:NEW.BRANCH_CODE,1);


else 


                 insert into daily (daily_id,main_account,main_desc,branch_account,branch_desc,account_id,account_name,madeen,daen,notes,period_id,kaid_id,COST_ID,TYP)values
                  (v_daily1,v_box_main_account,v_box_main_account_name,v_box_account,v_box_account_name,:NEW.BOX,:NEW.BOX_NAME, :new.PAY_CASH2,0,'»Ì⁄ »÷«⁄…'
||' »—ﬁ„ ›« Ê—… '||:NEW.BILL_CODE, v_period_id,V_KAID_ID,:NEW.BRANCH_CODE,1);


				  insert into daily (daily_id,main_account,main_desc,branch_account,branch_desc,account_id,account_name,madeen,daen,notes,period_id,kaid_id,COST_ID,TYP)values  --v_last_box_id,v_last_box_name
                  (v_daily2,V_PUR_MAIN_ID, V_PUR_MAIN_NAME, V_PUR_BRANCH_ID, V_PUR_BRANCH_NAME, V_PUR_ACCOUNT_ID, V_PUR_ACCOUNT_NAME
				 ,0 ,(:new.PAY_CASH2-:NEW.SUM_TAX),'»Ì⁄ »÷«⁄…'
||' »—ﬁ„ ›« Ê—… '||:NEW.BILL_CODE,v_period_id,V_KAID_ID,:NEW.BRANCH_CODE,1);
				  
insert into daily (daily_id,main_account,main_desc,branch_account,branch_desc,account_id,account_name,madeen,daen,notes,period_id,kaid_id,COST_ID,TYP)values  --v_last_box_id,v_last_box_name
                  (v_daily2+1,V_TAX_MAIN_ID, V_TAX_MAIN_NAME, V_TAX_BRANCH_ID, V_TAX_BRANCH_NAME, V_TAX_ACCOUNT_ID, V_TAX_ACCOUNT_NAME
				 ,0 ,:NEW.SUM_TAX,'»Ì⁄ »÷«⁄…'
||' »—ﬁ„ ›« Ê—… '||:NEW.BILL_CODE,v_period_id,V_KAID_ID,:NEW.BRANCH_CODE,1);


			

end if;
end;
	
	
	END IF;
END;
/



------------------------------------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER STOCK_A.T_BILL_MASTER_RE_SALE
 AFTER  INSERT 
 ON BILL_MASTER

FOR   EACH  ROW
BEGIN

IF :NEW.FLAG=2  THEN 
declare
	v_kaid_id number(10);
	v_period_id number(10);
	v_daily1 number(10);
	v_daily2 number(10);
	v_customer_account number(10);
	v_customer_account_name varchar2(200);
	v_customer_main_account number(10);
	v_customer_main_account_name varchar2(200);
		v_box_account number(10);
	v_box_account_name varchar2(200);
	v_box_main_account number(10);
	v_box_main_account_name varchar2(200);
	v_last_box_name varchar2(200);
	v_last_box_id number(10);
	V_PUR_MAIN_ID   NUMBER;
	 V_PUR_MAIN_NAME VARCHAR2(100);
	  V_PUR_BRANCH_ID NUMBER;
	   V_PUR_BRANCH_NAME VARCHAR2(100);
	    V_PUR_ACCOUNT_ID NUMBER;
		 V_PUR_ACCOUNT_NAME VARCHAR2(100);
		 	 
		 V_TAX_MAIN_ID NUMBER;
		  V_TAX_MAIN_NAME VARCHAR2(100);
		   V_TAX_BRANCH_ID NUMBER;
		    V_TAX_BRANCH_NAME VARCHAR2(100);
			 V_TAX_ACCOUNT_ID NUMBER; 
			 V_TAX_ACCOUNT_NAME VARCHAR2(100);
			 
			 SUM_TOT    NUMBER;
	x   date;
	begin

 	
SELECT TAX_MAIN_ID, TAX_MAIN_NAME, TAX_BRANCH_ID, TAX_BRANCH_NAME, TAX_ACCOUNT_ID, TAX_ACCOUNT_NAME
INTO V_TAX_MAIN_ID, V_TAX_MAIN_NAME, V_TAX_BRANCH_ID, V_TAX_BRANCH_NAME, V_TAX_ACCOUNT_ID, V_TAX_ACCOUNT_NAME
FROM TREE_SETTING_ACCOUNT;
	
	SELECT RE_SALE_MAIN_ID, RE_SALE_MAIN_NAME, RE_SALE_BRANCH_ID, RE_SALE_BRANCH_NAME, RE_SALE_ACCOUNT_ID, RE_SALE_ACCOUNT_NAME
	INTO V_PUR_MAIN_ID, V_PUR_MAIN_NAME, V_PUR_BRANCH_ID, V_PUR_BRANCH_NAME, V_PUR_ACCOUNT_ID, V_PUR_ACCOUNT_NAME
	FROM TREE_SETTING_ACCOUNT;

	
	
select nvl(max(kaid.kaid_id),0)+1
into v_kaid_id
from kaid;



select max(period_id)
into v_period_id
from periods
where periods.period_state=1;

insert into kaid (kaid_id,kaid_date,worker_id,period_id,sanad_sarf_id,KAID_NOTES,TYP, BILL_CODE)
values(V_kaid_id,:NEW.BILL_DATE,'1',v_period_id,0,'„—œÊœ«  »÷«⁄…'
||' »—ﬁ„ ›« Ê—… '||:NEW.BILL_CODE
,2, :NEW.BILL_CODE);


select nvl(max(daily.daily_id),0)+1 ,nvl(max(daily.daily_id),0)+2
into v_daily1 ,v_daily2
from daily;
---   customer or supplier -------------

select SUPPLIER_ACCOUNT ,SUPPLIER_account_name, SUPPLIER_main_account ,SUPPLIER_main_account_name
into v_customer_account ,v_customer_account_name,v_customer_main_account ,v_customer_main_account_name 
from setting;

----  Pay From Box or pay from save --------------

	
select box_account ,box_account_name,box_main_account,box_main_account_name ,last_box_name ,last_box_id
into v_box_account,v_box_account_name,v_box_main_account,v_box_main_account_name ,v_last_box_name ,v_last_box_id
from setting;


if :NEW.PAY_TYPE = 1 then --and  :BOX between 124001 and 124999
	
	
	
select box_account ,box_account_name,box_main_account,box_main_account_name ,last_box_name ,last_box_id
into v_box_account,v_box_account_name,v_box_main_account,v_box_main_account_name ,v_last_box_name ,v_last_box_id
from setting;

	elsif:NEW.PAY_TYPE = 2 then 
	
	
select SUPPLIER_ACCOUNT ,SUPPLIER_account_name, SUPPLIER_main_account ,SUPPLIER_main_account_name,last_box_name ,last_box_id
into v_box_account,v_box_account_name,v_box_main_account,v_box_main_account_name ,v_last_box_name ,v_last_box_id
from setting;


elsif :NEW.PAY_TYPE = 3   then 
	
	
	
	select '123' ,'«·»‰Êﬂ',save_main_account,save_main_account_name ,:NEW.BOX_NAME ,:NEW.BOX
into v_box_account,v_box_account_name,v_box_main_account,v_box_main_account_name ,v_last_box_name ,v_last_box_id
from setting;

end if;


if :NEW.PAY_TYPE = 2 then  


				  
				  insert into daily (daily_id,main_account,main_desc,branch_account,branch_desc,account_id,account_name,madeen,daen,notes,period_id,kaid_id,COST_ID,TYP)values  --v_last_box_id,v_last_box_name
                  (v_daily1,V_PUR_MAIN_ID, V_PUR_MAIN_NAME, V_PUR_BRANCH_ID, V_PUR_BRANCH_NAME, V_PUR_ACCOUNT_ID, V_PUR_ACCOUNT_NAME,
				 (:new.PAY_REMAIN2-:NEW.SUM_TAX),0,'„—œÊœ«  »÷«⁄…'
||' »—ﬁ„ ›« Ê—… '||:NEW.BILL_CODE,v_period_id,V_KAID_ID,:NEW.BRANCH_CODE,2);
				  
insert into daily (daily_id,main_account,main_desc,branch_account,branch_desc,account_id,account_name,madeen,daen,notes,period_id,kaid_id,COST_ID,TYP)values  --v_last_box_id,v_last_box_name
                  (v_daily1+1,V_TAX_MAIN_ID, V_TAX_MAIN_NAME, V_TAX_BRANCH_ID, V_TAX_BRANCH_NAME, V_TAX_ACCOUNT_ID, V_TAX_ACCOUNT_NAME,
				 :NEW.SUM_TAX,0,'„—œÊœ«  »÷«⁄…'
||' »—ﬁ„ ›« Ê—… '||:NEW.BILL_CODE,v_period_id,V_KAID_ID,:NEW.BRANCH_CODE,2);

                 insert into daily (daily_id,main_account,main_desc,branch_account,branch_desc,account_id,account_name,madeen,daen,notes,period_id,kaid_id,COST_ID,TYP)values
                  (v_daily2+1,v_box_main_account,v_box_main_account_name,v_box_account,v_box_account_name,:NEW.BOX,:NEW.BOX_NAME,0, :new.PAY_REMAIN2,'„—œÊœ«  »÷«⁄…'
||' »—ﬁ„ ›« Ê—… '||:NEW.BILL_CODE, v_period_id,V_KAID_ID,:NEW.BRANCH_CODE,2);

else 
					 
				  insert into daily (daily_id,main_account,main_desc,branch_account,branch_desc,account_id,account_name,madeen,daen,notes,period_id,kaid_id,COST_ID,TYP)values  --v_last_box_id,v_last_box_name
                  (v_daily1,V_PUR_MAIN_ID, V_PUR_MAIN_NAME, V_PUR_BRANCH_ID, V_PUR_BRANCH_NAME, V_PUR_ACCOUNT_ID, V_PUR_ACCOUNT_NAME,
				 (:new.PAY_CASH2-:NEW.SUM_TAX),0,'„—œÊœ«  »÷«⁄…'
||' »—ﬁ„ ›« Ê—… '||:NEW.BILL_CODE,v_period_id,V_KAID_ID,:NEW.BRANCH_CODE,2);
				  
insert into daily (daily_id,main_account,main_desc,branch_account,branch_desc,account_id,account_name,madeen,daen,notes,period_id,kaid_id,COST_ID,TYP)values  --v_last_box_id,v_last_box_name
                  (v_daily1+1,V_TAX_MAIN_ID, V_TAX_MAIN_NAME, V_TAX_BRANCH_ID, V_TAX_BRANCH_NAME, V_TAX_ACCOUNT_ID, V_TAX_ACCOUNT_NAME,
				  :NEW.SUM_TAX,0,'„—œÊœ«  »÷«⁄…'
||' »—ﬁ„ ›« Ê—… '||:NEW.BILL_CODE,v_period_id,V_KAID_ID,:NEW.BRANCH_CODE,2);


insert into daily (daily_id,main_account,main_desc,branch_account,branch_desc,account_id,account_name,madeen,daen,notes,period_id,kaid_id,COST_ID,TYP)values
                  (v_daily2+1,v_box_main_account,v_box_main_account_name,v_box_account,v_box_account_name,:NEW.BOX,:NEW.BOX_NAME, 0,:new.PAY_CASH2,'„—œÊœ«  »÷«⁄…'
||' »—ﬁ„ ›« Ê—… '||:NEW.BILL_CODE, v_period_id,V_KAID_ID,:NEW.BRANCH_CODE,2);			

end if;
end;
	
	
	END IF;
END;
/



-------------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER STOCK_A.T_BILL_MASTER_RE_BUY
 AFTER  INSERT 
 ON BILL_MASTER

FOR   EACH  ROW
BEGIN

IF :NEW.FLAG=5   THEN 
declare
	v_kaid_id number(10);
	v_period_id number(10);
	v_daily1 number(10);
	v_daily2 number(10);
	v_customer_account number(10);
	v_customer_account_name varchar2(200);
	v_customer_main_account number(10);
	v_customer_main_account_name varchar2(200);
		v_box_account number(10);
	v_box_account_name varchar2(200);
	v_box_main_account number(10);
	v_box_main_account_name varchar2(200);
	v_last_box_name varchar2(200);
	v_last_box_id number(10);
	V_PUR_MAIN_ID   NUMBER;
	 V_PUR_MAIN_NAME VARCHAR2(100);
	  V_PUR_BRANCH_ID NUMBER;
	   V_PUR_BRANCH_NAME VARCHAR2(100);
	    V_PUR_ACCOUNT_ID NUMBER;
		 V_PUR_ACCOUNT_NAME VARCHAR2(100);
		 	 
		 V_TAX_MAIN_ID NUMBER;
		  V_TAX_MAIN_NAME VARCHAR2(100);
		   V_TAX_BRANCH_ID NUMBER;
		    V_TAX_BRANCH_NAME VARCHAR2(100);
			 V_TAX_ACCOUNT_ID NUMBER; 
			 V_TAX_ACCOUNT_NAME VARCHAR2(100);
			 
			 SUM_TOT    NUMBER;
	x   date;
	begin

 	
SELECT TAX_MAIN_ID, TAX_MAIN_NAME, TAX_BRANCH_ID, TAX_BRANCH_NAME, TAX_ACCOUNT_ID, TAX_ACCOUNT_NAME
INTO V_TAX_MAIN_ID, V_TAX_MAIN_NAME, V_TAX_BRANCH_ID, V_TAX_BRANCH_NAME, V_TAX_ACCOUNT_ID, V_TAX_ACCOUNT_NAME
FROM TREE_SETTING_ACCOUNT;
	
	SELECT RE_BUY_MAIN_ID, RE_BUY_MAIN_NAME, RE_BUY_BRANCH_ID, RE_BUY_BRANCH_NAME, RE_BUY_ACCOUNT_ID, RE_BUY_ACCOUNT_NAME
	INTO V_PUR_MAIN_ID, V_PUR_MAIN_NAME, V_PUR_BRANCH_ID, V_PUR_BRANCH_NAME, V_PUR_ACCOUNT_ID, V_PUR_ACCOUNT_NAME
	FROM TREE_SETTING_ACCOUNT;

	
	
select nvl(max(kaid.kaid_id),0)+1
into v_kaid_id
from kaid;



select max(period_id)
into v_period_id
from periods
where periods.period_state=1;

insert into kaid (kaid_id,kaid_date,worker_id,period_id,sanad_sarf_id,KAID_NOTES,TYP, BILL_CODE)
values(V_kaid_id,:NEW.BILL_DATE,'1',v_period_id,0,'„—œÊ«  „‘ —Ì« '
||' »—ﬁ„ ›« Ê—… '||:NEW.DOC_NO
,5, :NEW.BILL_CODE);


select nvl(max(daily.daily_id),0)+1 ,nvl(max(daily.daily_id),0)+2
into v_daily1 ,v_daily2
from daily;
---   customer or supplier -------------

select SUPPLIER_ACCOUNT ,SUPPLIER_account_name, SUPPLIER_main_account ,SUPPLIER_main_account_name
into v_customer_account ,v_customer_account_name,v_customer_main_account ,v_customer_main_account_name 
from setting;

----  Pay From Box or pay from save --------------

	
select box_account ,box_account_name,box_main_account,box_main_account_name ,last_box_name ,last_box_id
into v_box_account,v_box_account_name,v_box_main_account,v_box_main_account_name ,v_last_box_name ,v_last_box_id
from setting;


if :NEW.PAY_TYPE = 1 then --and  :BOX between 124001 and 124999
	
	
	
select box_account ,box_account_name,box_main_account,box_main_account_name ,last_box_name ,last_box_id
into v_box_account,v_box_account_name,v_box_main_account,v_box_main_account_name ,v_last_box_name ,v_last_box_id
from setting;

	elsif:NEW.PAY_TYPE = 2 then 
	
	
select SUPPLIER_ACCOUNT ,SUPPLIER_account_name, SUPPLIER_main_account ,SUPPLIER_main_account_name,last_box_name ,last_box_id
into v_box_account,v_box_account_name,v_box_main_account,v_box_main_account_name ,v_last_box_name ,v_last_box_id
from setting;


elsif :NEW.PAY_TYPE = 3   then 
	
	
	
	select '123' ,'«·»‰Êﬂ',save_main_account,save_main_account_name ,:NEW.BOX_NAME ,:NEW.BOX
into v_box_account,v_box_account_name,v_box_main_account,v_box_main_account_name ,v_last_box_name ,v_last_box_id
from setting;

end if;


if :NEW.PAY_TYPE = 2 then  

                 insert into daily (daily_id,main_account,main_desc,branch_account,branch_desc,account_id,account_name,madeen,daen,notes,period_id,kaid_id,COST_ID,TYP)values
                  (v_daily1,v_box_main_account,v_box_main_account_name,v_box_account,v_box_account_name,:NEW.BOX,:NEW.BOX_NAME, :new.PAY_REMAIN2,0,'„—œÊ«  „‘ —Ì« '
||' »—ﬁ„ ›« Ê—… '||:NEW.DOC_NO, v_period_id,V_KAID_ID,:NEW.BRANCH_CODE,5);
				  
				  insert into daily (daily_id,main_account,main_desc,branch_account,branch_desc,account_id,account_name,madeen,daen,notes,period_id,kaid_id,COST_ID,TYP)values  --v_last_box_id,v_last_box_name
                  (v_daily2,V_PUR_MAIN_ID, V_PUR_MAIN_NAME, V_PUR_BRANCH_ID, V_PUR_BRANCH_NAME, V_PUR_ACCOUNT_ID, V_PUR_ACCOUNT_NAME
				 ,0 ,(:new.PAY_REMAIN2-:NEW.SUM_TAX),'„—œÊ«  „‘ —Ì« '
                  ||' »—ﬁ„ ›« Ê—… '||:NEW.DOC_NO,v_period_id,V_KAID_ID,:NEW.BRANCH_CODE,5);
				  
insert into daily (daily_id,main_account,main_desc,branch_account,branch_desc,account_id,account_name,madeen,daen,notes,period_id,kaid_id,COST_ID,TYP)values  --v_last_box_id,v_last_box_name
                  (v_daily2+1,V_TAX_MAIN_ID, V_TAX_MAIN_NAME, V_TAX_BRANCH_ID, V_TAX_BRANCH_NAME, V_TAX_ACCOUNT_ID, V_TAX_ACCOUNT_NAME
				 ,0 ,:NEW.SUM_TAX,'„—œÊ«  „‘ —Ì« '
                  ||' »—ﬁ„ ›« Ê—… '||:NEW.DOC_NO,v_period_id,V_KAID_ID,:NEW.BRANCH_CODE,5);


else 



                 insert into daily (daily_id,main_account,main_desc,branch_account,branch_desc,account_id,account_name,madeen,daen,notes,period_id,kaid_id,COST_ID,TYP)values
                  (v_daily1,v_box_main_account,v_box_main_account_name,v_box_account,v_box_account_name,:NEW.BOX,:NEW.BOX_NAME, :new.PAY_CASH2,0,'„—œÊ«  „‘ —Ì« '
                  ||' »—ﬁ„ ›« Ê—… '||:NEW.DOC_NO, v_period_id,V_KAID_ID,:NEW.BRANCH_CODE,5);
				  
				  
				  insert into daily (daily_id,main_account,main_desc,branch_account,branch_desc,account_id,account_name,madeen,daen,notes,period_id,kaid_id,COST_ID,TYP)values  --v_last_box_id,v_last_box_name
                  (v_daily2,V_PUR_MAIN_ID, V_PUR_MAIN_NAME, V_PUR_BRANCH_ID, V_PUR_BRANCH_NAME, V_PUR_ACCOUNT_ID, V_PUR_ACCOUNT_NAME
				 ,0 ,(:new.PAY_CASH2-:NEW.SUM_TAX),'„—œÊ«  „‘ —Ì« '
                  ||' »—ﬁ„ ›« Ê—… '||:NEW.DOC_NO,v_period_id,V_KAID_ID,:NEW.BRANCH_CODE,5);
				  
insert into daily (daily_id,main_account,main_desc,branch_account,branch_desc,account_id,account_name,madeen,daen,notes,period_id,kaid_id,COST_ID,TYP)values  --v_last_box_id,v_last_box_name
                  (v_daily2+1,V_TAX_MAIN_ID, V_TAX_MAIN_NAME, V_TAX_BRANCH_ID, V_TAX_BRANCH_NAME, V_TAX_ACCOUNT_ID, V_TAX_ACCOUNT_NAME
				 ,0 ,:NEW.SUM_TAX,'„—œÊ«  „‘ —Ì« '
                  ||' »—ﬁ„ ›« Ê—… '||:NEW.DOC_NO,v_period_id,V_KAID_ID,:NEW.BRANCH_CODE,5);


				


end if;
end;
	
	
	END IF;
END;
/



-----------------------------------------------------
CREATE OR REPLACE TRIGGER STOCK_A.T_BILL_MASTER_DELETE
 BEFORE  DELETE 
 ON BILL_MASTER
FOR   EACH  ROW
BEGIN
delete from BILL_DETAIL  where BILL_CODE = :old.BILL_CODE  AND FLAG=:OLD.FLAG;
delete from KAID  where BILL_CODE = :old.BILL_CODE  AND typ=:OLD.FLAG;
END ;
/



---------------------------------------------------
CREATE OR REPLACE TRIGGER STOCK_A.T_BILL_MASTER_DAMAGE
 AFTER  INSERT 
 ON BILL_MASTER

FOR   EACH  ROW
BEGIN

IF :NEW.FLAG=7  THEN 
declare
	v_kaid_id number(10);
	v_period_id number(10);
	v_daily1 number(10);
	v_daily2 number(10);
	v_customer_account number(10);
	v_customer_account_name varchar2(200);
	v_customer_main_account number(10);
	v_customer_main_account_name varchar2(200);
		v_box_account number(10);
	v_box_account_name varchar2(200);
	v_box_main_account number(10);
	v_box_main_account_name varchar2(200);
	v_last_box_name varchar2(200);
	v_last_box_id number(10);
	V_PUR_MAIN_ID   NUMBER;
	 V_PUR_MAIN_NAME VARCHAR2(100);
	  V_PUR_BRANCH_ID NUMBER;
	   V_PUR_BRANCH_NAME VARCHAR2(100);
	    V_PUR_ACCOUNT_ID NUMBER;
		 V_PUR_ACCOUNT_NAME VARCHAR2(100);
		 	 
		 V_DAMAGE_MAIN_ID NUMBER;
		  V_DAMAGE_MAIN_NAME VARCHAR2(100);
		   V_DAMAGE_BRANCH_ID NUMBER;
		    V_DAMAGE_BRANCH_NAME VARCHAR2(100);
			 V_DAMAGE_ACCOUNT_ID NUMBER; 
			 V_DAMAGE_ACCOUNT_NAME VARCHAR2(100);
			 
			 
			 V_TAX_MAIN_ID NUMBER;
		  V_TAX_MAIN_NAME VARCHAR2(100);
		   V_TAX_BRANCH_ID NUMBER;
		    V_TAX_BRANCH_NAME VARCHAR2(100);
			 V_TAX_ACCOUNT_ID NUMBER; 
			 V_TAX_ACCOUNT_NAME VARCHAR2(100);
			 
			 
			 SUM_TOT    NUMBER;
	x   date;
	begin


		SELECT PUR_MAIN_ID, PUR_MAIN_NAME, PUR_BRANCH_ID, PUR_BRANCH_NAME, PUR_ACCOUNT_ID, PUR_ACCOUNT_NAME 
	INTO V_PUR_MAIN_ID, V_PUR_MAIN_NAME, V_PUR_BRANCH_ID, V_PUR_BRANCH_NAME, V_PUR_ACCOUNT_ID, V_PUR_ACCOUNT_NAME
	FROM TREE_SETTING_ACCOUNT;
	
	SELECT RE_DAMAGE_MAIN_ID, RE_DAMAGE_MAIN_NAME, RE_DAMAGE_BRANCH_ID, RE_DAMAGE_BRANCH_NAME, RE_DAMAGE_ACCOUNT_ID, RE_DAMAGE_ACCOUNT_NAME
	INTO V_DAMAGE_MAIN_ID, V_DAMAGE_MAIN_NAME,  V_DAMAGE_BRANCH_ID, V_DAMAGE_BRANCH_NAME, V_DAMAGE_ACCOUNT_ID, V_DAMAGE_ACCOUNT_NAME 
	FROM TREE_SETTING_ACCOUNT;

	SELECT TAX_MAIN_ID, TAX_MAIN_NAME, TAX_BRANCH_ID, TAX_BRANCH_NAME, TAX_ACCOUNT_ID, TAX_ACCOUNT_NAME
INTO V_TAX_MAIN_ID, V_TAX_MAIN_NAME, V_TAX_BRANCH_ID, V_TAX_BRANCH_NAME, V_TAX_ACCOUNT_ID, V_TAX_ACCOUNT_NAME
FROM TREE_SETTING_ACCOUNT;
	
select nvl(max(kaid.kaid_id),0)+1
into v_kaid_id
from kaid;

select max(period_id)
into v_period_id
from periods
where periods.period_state=1;

insert into kaid (kaid_id,kaid_date,worker_id,period_id,sanad_sarf_id,KAID_NOTES,TYP, BILL_CODE)
values(V_kaid_id,:NEW.BILL_DATE,'1',v_period_id,0,'»÷«⁄…  «·›… ··’‰›'
||' »—ﬁ„ ›« Ê—Â '||:new.BILL_CODE,7
, :NEW.BILL_CODE);


select nvl(max(daily.daily_id),0)+1 ,nvl(max(daily.daily_id),0)+2
into v_daily1 ,v_daily2
from daily;
---   customer or supplier -------------

select SUPPLIER_ACCOUNT ,SUPPLIER_account_name, SUPPLIER_main_account ,SUPPLIER_main_account_name
into v_customer_account ,v_customer_account_name,v_customer_main_account ,v_customer_main_account_name 
from setting;

----  Pay From Box or pay from save --------------

	
select box_account ,box_account_name,box_main_account,box_main_account_name ,last_box_name ,last_box_id
into v_box_account,v_box_account_name,v_box_main_account,v_box_main_account_name ,v_last_box_name ,v_last_box_id
from setting;


if :NEW.PAY_TYPE = 1 then --and  :BOX between 124001 and 124999
	
	
	
select box_account ,box_account_name,box_main_account,box_main_account_name ,last_box_name ,last_box_id
into v_box_account,v_box_account_name,v_box_main_account,v_box_main_account_name ,v_last_box_name ,v_last_box_id
from setting;

	elsif:NEW.PAY_TYPE = 2 then 
	
	
select SUPPLIER_ACCOUNT ,SUPPLIER_account_name, SUPPLIER_main_account ,SUPPLIER_main_account_name,last_box_name ,last_box_id
into v_box_account,v_box_account_name,v_box_main_account,v_box_main_account_name ,v_last_box_name ,v_last_box_id
from setting;

elsif :NEW.PAY_TYPE = 3   then 

	select '123' ,'«·»‰Êﬂ',save_main_account,save_main_account_name ,:NEW.BOX_NAME ,:NEW.BOX
into v_box_account,v_box_account_name,v_box_main_account,v_box_main_account_name ,v_last_box_name ,v_last_box_id
from setting;

end if;

                 insert into daily (daily_id,main_account,main_desc,branch_account,branch_desc,account_id,account_name,madeen,daen,notes,period_id,kaid_id,COST_ID,TYP)values
                  (v_daily1, V_DAMAGE_MAIN_ID, V_DAMAGE_MAIN_NAME,  V_DAMAGE_BRANCH_ID, V_DAMAGE_BRANCH_NAME, V_DAMAGE_ACCOUNT_ID, V_DAMAGE_ACCOUNT_NAME , :new.PAY_CASH2,0,'»÷«⁄…  «·›… ··’‰›'
||' »—ﬁ„ ›« Ê—Â '||:new.BILL_CODE, v_period_id,V_KAID_ID,:NEW.BRANCH_CODE,7);		  
		
			  insert into daily (daily_id,main_account,main_desc,branch_account,branch_desc,account_id,account_name,madeen,daen,notes,period_id,kaid_id,COST_ID,TYP)values  --v_last_box_id,v_last_box_name
                  (v_daily2,V_PUR_MAIN_ID, V_PUR_MAIN_NAME, V_PUR_BRANCH_ID, V_PUR_BRANCH_NAME, V_PUR_ACCOUNT_ID, V_PUR_ACCOUNT_NAME,
				0,(:new.PAY_CASH2-:NEW.SUM_TAX),'»÷«⁄…  «·›… ··’‰›'
||' »—ﬁ„ ›« Ê—Â '||:new.BILL_CODE,v_period_id,V_KAID_ID,:NEW.BRANCH_CODE,7);
				  
				  
				  			  insert into daily (daily_id,main_account,main_desc,branch_account,branch_desc,account_id,account_name,madeen,daen,notes,period_id,kaid_id,COST_ID,TYP)values  --v_last_box_id,v_last_box_name
                  (v_daily2+1,V_TAX_MAIN_ID, V_TAX_MAIN_NAME, V_TAX_BRANCH_ID, V_TAX_BRANCH_NAME, V_TAX_ACCOUNT_ID, V_TAX_ACCOUNT_NAME,
				0,:NEW.SUM_TAX,'»÷«⁄…  «·›… ··’‰›'
||' »—ﬁ„ ›« Ê—Â '||:new.BILL_CODE,v_period_id,V_KAID_ID,:NEW.BRANCH_CODE,7);




	


end;
	end if;
	
END;
/



--------------------------------------------------------------
CREATE OR REPLACE TRIGGER STOCK_A.T_BILL_MASTER_BUY
 AFTER  INSERT 
 ON BILL_MASTER

FOR   EACH  ROW
BEGIN

IF :NEW.FLAG=3   THEN 
declare
	v_kaid_id number(10);
	v_period_id number(10);
	v_daily1 number(10);
	v_daily2 number(10);
	v_customer_account number(10);
	v_customer_account_name varchar2(200);
	v_customer_main_account number(10);
	v_customer_main_account_name varchar2(200);
		v_box_account number(10);
	v_box_account_name varchar2(200);
	v_box_main_account number(10);
	v_box_main_account_name varchar2(200);
	v_last_box_name varchar2(200);
	v_last_box_id number(10);
	V_PUR_MAIN_ID   NUMBER;
	 V_PUR_MAIN_NAME VARCHAR2(100);
	  V_PUR_BRANCH_ID NUMBER;
	   V_PUR_BRANCH_NAME VARCHAR2(100);
	    V_PUR_ACCOUNT_ID NUMBER;
		 V_PUR_ACCOUNT_NAME VARCHAR2(100);
		 	 
		 V_TAX_MAIN_ID NUMBER;
		  V_TAX_MAIN_NAME VARCHAR2(100);
		   V_TAX_BRANCH_ID NUMBER;
		    V_TAX_BRANCH_NAME VARCHAR2(100);
			 V_TAX_ACCOUNT_ID NUMBER; 
			 V_TAX_ACCOUNT_NAME VARCHAR2(100);
			 
			 SUM_TOT    NUMBER;
	x   date;
	begin

	SELECT SUM(ITEM_TOTAL) INTO SUM_TOT  FROM BILL_DETAIL WHERE BILL_CODE = :NEW.BILL_CODE AND FLAG=3;
 	
SELECT TAX_MAIN_ID, TAX_MAIN_NAME, TAX_BRANCH_ID, TAX_BRANCH_NAME, TAX_ACCOUNT_ID, TAX_ACCOUNT_NAME
INTO V_TAX_MAIN_ID, V_TAX_MAIN_NAME, V_TAX_BRANCH_ID, V_TAX_BRANCH_NAME, V_TAX_ACCOUNT_ID, V_TAX_ACCOUNT_NAME
FROM TREE_SETTING_ACCOUNT;
	
	SELECT PUR_MAIN_ID, PUR_MAIN_NAME, PUR_BRANCH_ID, PUR_BRANCH_NAME, PUR_ACCOUNT_ID, PUR_ACCOUNT_NAME 
	INTO V_PUR_MAIN_ID, V_PUR_MAIN_NAME, V_PUR_BRANCH_ID, V_PUR_BRANCH_NAME, V_PUR_ACCOUNT_ID, V_PUR_ACCOUNT_NAME
	FROM TREE_SETTING_ACCOUNT;

	
	
select nvl(max(kaid.kaid_id),0)+1
into v_kaid_id
from kaid;



select max(period_id)
into v_period_id
from periods
where periods.period_state=1;

insert into kaid (kaid_id,kaid_date,worker_id,period_id,sanad_sarf_id,KAID_NOTES,TYP, BILL_CODE)
values(V_kaid_id,:NEW.BILL_DATE,'1',v_period_id,0,'‘—«¡ »÷«⁄… Ê«÷«› Â« «·Ï «·„” Êœ⁄ '
||' »—ﬁ„ ›« Ê—… '||:NEW.DOC_NO
,3, :NEW.BILL_CODE);


select nvl(max(daily.daily_id),0)+1 ,nvl(max(daily.daily_id),0)+2
into v_daily1 ,v_daily2
from daily;
---   customer or supplier -------------

select SUPPLIER_ACCOUNT ,SUPPLIER_account_name, SUPPLIER_main_account ,SUPPLIER_main_account_name
into v_customer_account ,v_customer_account_name,v_customer_main_account ,v_customer_main_account_name 
from setting;

----  Pay From Box or pay from save --------------

	
select box_account ,box_account_name,box_main_account,box_main_account_name ,last_box_name ,last_box_id
into v_box_account,v_box_account_name,v_box_main_account,v_box_main_account_name ,v_last_box_name ,v_last_box_id
from setting;


if :NEW.PAY_TYPE = 1 then --and  :BOX between 124001 and 124999
	
	
	
select box_account ,box_account_name,box_main_account,box_main_account_name ,last_box_name ,last_box_id
into v_box_account,v_box_account_name,v_box_main_account,v_box_main_account_name ,v_last_box_name ,v_last_box_id
from setting;

	elsif:NEW.PAY_TYPE = 2 then 
	
	
select SUPPLIER_ACCOUNT ,SUPPLIER_account_name, SUPPLIER_main_account ,SUPPLIER_main_account_name,last_box_name ,last_box_id
into v_box_account,v_box_account_name,v_box_main_account,v_box_main_account_name ,v_last_box_name ,v_last_box_id
from setting;


elsif :NEW.PAY_TYPE = 3   then 
	
	
	
	select '123' ,'«·»‰Êﬂ',save_main_account,save_main_account_name ,:NEW.BOX_NAME ,:NEW.BOX
into v_box_account,v_box_account_name,v_box_main_account,v_box_main_account_name ,v_last_box_name ,v_last_box_id
from setting;

end if;


if :NEW.PAY_TYPE = 2 then  

				  insert into daily (daily_id,main_account,main_desc,branch_account,branch_desc,account_id,account_name,madeen,daen,notes,period_id,kaid_id,COST_ID,TYP)values  --v_last_box_id,v_last_box_name
                  (v_daily1,V_PUR_MAIN_ID, V_PUR_MAIN_NAME, V_PUR_BRANCH_ID, V_PUR_BRANCH_NAME, V_PUR_ACCOUNT_ID, V_PUR_ACCOUNT_NAME
				  ,(:new.PAY_REMAIN2-:NEW.SUM_TAX),'0','‘—«¡ »÷«⁄… Ê«÷«› Â« «·Ï «·„” Êœ⁄ '
                  ||' »—ﬁ„ ›« Ê—… '||:NEW.DOC_NO,v_period_id,V_KAID_ID,:NEW.BRANCH_CODE,3);
				  
insert into daily (daily_id,main_account,main_desc,branch_account,branch_desc,account_id,account_name,madeen,daen,notes,period_id,kaid_id,COST_ID,TYP)values  --v_last_box_id,v_last_box_name
                  (v_daily1+1,V_TAX_MAIN_ID, V_TAX_MAIN_NAME, V_TAX_BRANCH_ID, V_TAX_BRANCH_NAME, V_TAX_ACCOUNT_ID, V_TAX_ACCOUNT_NAME
				  ,:NEW.SUM_TAX,'0','‘—«¡ »÷«⁄… Ê«÷«› Â« «·Ï «·„” Êœ⁄ '
                  ||' »—ﬁ„ ›« Ê—… '||:NEW.DOC_NO,v_period_id,V_KAID_ID,:NEW.BRANCH_CODE,3);


				

                 insert into daily (daily_id,main_account,main_desc,branch_account,branch_desc,account_id,account_name,madeen,daen,notes,period_id,kaid_id,COST_ID,TYP)values
                  (v_daily2+1,v_box_main_account,v_box_main_account_name,v_box_account,v_box_account_name,:NEW.BOX,:NEW.BOX_NAME,0, :new.PAY_REMAIN2,'‘—«¡ »÷«⁄… Ê«÷«› Â« «·Ï «·„” Êœ⁄ '
                  ||' »—ﬁ„ ›« Ê—… '||:NEW.DOC_NO, v_period_id,V_KAID_ID,:NEW.BRANCH_CODE,3);
else 

				  insert into daily (daily_id,main_account,main_desc,branch_account,branch_desc,account_id,account_name,madeen,daen,notes,period_id,kaid_id,COST_ID,TYP)values  --v_last_box_id,v_last_box_name
                  (v_daily1,V_PUR_MAIN_ID, V_PUR_MAIN_NAME, V_PUR_BRANCH_ID, V_PUR_BRANCH_NAME, V_PUR_ACCOUNT_ID, V_PUR_ACCOUNT_NAME
				  ,(:new.PAY_CASH2-:NEW.SUM_TAX),'0','‘—«¡ »÷«⁄… Ê«÷«› Â« «·Ï «·„” Êœ⁄ '
                  ||' »—ﬁ„ ›« Ê—… '||:NEW.DOC_NO,v_period_id,V_KAID_ID,:NEW.BRANCH_CODE,3);
				  
insert into daily (daily_id,main_account,main_desc,branch_account,branch_desc,account_id,account_name,madeen,daen,notes,period_id,kaid_id,COST_ID,TYP)values  --v_last_box_id,v_last_box_name
                  (v_daily1+1,V_TAX_MAIN_ID, V_TAX_MAIN_NAME, V_TAX_BRANCH_ID, V_TAX_BRANCH_NAME, V_TAX_ACCOUNT_ID, V_TAX_ACCOUNT_NAME
				  ,:NEW.SUM_TAX,'0','‘—«¡ »÷«⁄… Ê«÷«› Â« «·Ï «·„” Êœ⁄ '
                  ||' »—ﬁ„ ›« Ê—… '||:NEW.DOC_NO,v_period_id,V_KAID_ID,:NEW.BRANCH_CODE,3);


				

                 insert into daily (daily_id,main_account,main_desc,branch_account,branch_desc,account_id,account_name,madeen,daen,notes,period_id,kaid_id,COST_ID,TYP)values
                  (v_daily2+1,v_box_main_account,v_box_main_account_name,v_box_account,v_box_account_name,:NEW.BOX,:NEW.BOX_NAME,0, :new.PAY_CASH2,'‘—«¡ »÷«⁄… Ê«÷«› Â« «·Ï «·„” Êœ⁄ '
                  ||' »—ﬁ„ ›« Ê—… '||:NEW.DOC_NO, v_period_id,V_KAID_ID,:NEW.BRANCH_CODE,3);

end if;
end;
	
	
	END IF;
END;
/


-------------------------------------------------------------------------------------------------------------
