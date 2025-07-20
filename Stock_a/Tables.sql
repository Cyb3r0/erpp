alter table BILL_DETAIL
 add(TAX_RAT1  number(10) default 0  )
-----------------------------------------------------------------------------------------------
 alter table  BILL_MASTER
 add(BOX  number(10) default 124001  )
 
 alter table  BILL_MASTER
 add(BOX_NAME  varchar2(100) default  '«·Œ“Ì‰… «·—∆Ì”Ì…'  )
 
  alter table  BILL_MASTER
 add( SUM_TAX  number(10) default 0  )
 
   alter table  BILL_MASTER
 add( PAY_REMAIN2  number(10) default 0  )
 
    alter table  BILL_MASTER
 add(PAY_CASH2  number(10) default 0  )
 
 -----------------------------------------------------------------------------------------------

   alter table  ITEMS
 add(TAX_RAT  number(10) default 0  )
 
    alter table  ITEMS
 add( ACTION_TO_STOCK number(2) default 0  )
 
  -----------------------------------------------------------------------------------------------
  
  
CREATE TABLE TREE_SETTING_ACCOUNT
(
  CUS_MAIN_ID             NUMBER,
  CUS_MAIN_NAME           VARCHAR2(100 BYTE),
  CUS_BRANCH_ID           NUMBER,
  CUS_BRANCH_NAME         VARCHAR2(100 BYTE),
  VEN_MAIN_ID             NUMBER,
  VEN_MAIN_NAME           VARCHAR2(100 BYTE),
  VEN_BRANCH_ID           NUMBER,
  VEN_BRANCH_NAME         VARCHAR2(100 BYTE),
  TAX_MAIN_ID             NUMBER,
  TAX_MAIN_NAME           VARCHAR2(100 BYTE),
  TAX_BRANCH_ID           NUMBER,
  TAX_BRANCH_NAME         VARCHAR2(100 BYTE),
  TAX_ACCOUNT_ID          NUMBER,
  TAX_ACCOUNT_NAME        VARCHAR2(100 BYTE),
  PUR_MAIN_ID             NUMBER,
  PUR_MAIN_NAME           VARCHAR2(100 BYTE),
  PUR_BRANCH_ID           NUMBER,
  PUR_BRANCH_NAME         VARCHAR2(100 BYTE),
  PUR_ACCOUNT_ID          NUMBER,
  PUR_ACCOUNT_NAME        VARCHAR2(100 BYTE),
  SAL_MAIN_ID             NUMBER,
  SAL_MAIN_NAME           VARCHAR2(100 BYTE),
  SAL_BRANCH_ID           NUMBER,
  SAL_BRANCH_NAME         VARCHAR2(100 BYTE),
  SAL_ACCOUNT_ID          NUMBER,
  SAL_ACCOUNT_NAME        VARCHAR2(100 BYTE),
  RE_BUY_MAIN_ID          NUMBER,
  RE_BUY_MAIN_NAME        VARCHAR2(100 BYTE),
  RE_BUY_BRANCH_ID        NUMBER,
  RE_BUY_BRANCH_NAME      VARCHAR2(100 BYTE),
  RE_BUY_ACCOUNT_ID       NUMBER,
  RE_BUY_ACCOUNT_NAME     VARCHAR2(100 BYTE),
  RE_SALE_MAIN_ID         NUMBER,
  RE_SALE_MAIN_NAME       VARCHAR2(100 BYTE),
  RE_SALE_BRANCH_ID       NUMBER,
  RE_SALE_BRANCH_NAME     VARCHAR2(100 BYTE),
  RE_SALE_ACCOUNT_ID      NUMBER,
  RE_SALE_ACCOUNT_NAME    VARCHAR2(100 BYTE),
  RE_DAMAGE_MAIN_ID       NUMBER,
  RE_DAMAGE_MAIN_NAME     VARCHAR2(100 BYTE),
  RE_DAMAGE_BRANCH_ID     NUMBER,
  RE_DAMAGE_BRANCH_NAME   VARCHAR2(100 BYTE),
  RE_DAMAGE_ACCOUNT_ID    NUMBER,
  RE_DAMAGE_ACCOUNT_NAME  VARCHAR2(100 BYTE)
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       2147483645
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


--------------------------------------------------------------------------------------------------------------------------
  alter table  PROG_NAME
 add( PRO number(2) default 1 )
--------------------------------------------------------------------------------------------------------------------------

 alter table  TRANSACTION
 add(BOX  number(10) default 124001  )
 
 alter table  TRANSACTION
 add(BOX_NAME  varchar2(100) default  '«·Œ“Ì‰… «·—∆Ì”Ì…'  )
 ------------------------------------------------------------------------------------------------------------------------------------------------------
 
 ALTER TABLE SETTING_BILL ADD (
  UNIQUE (USER_ID));
 ------------------------------------------------------------------------------------------------------------------------------
 
    alter table  DAILY
 add(SEND_MSG  number(5) default 0  ) 
 
     alter table  DAILY
 add(TYP  number(5) default 0  ) 

   ------------------------------------------------------------------------------------------------------------------------------
