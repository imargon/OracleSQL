----oracle 操作日志查询

select * from v$logfile;
select * from v$log;
select * from v$sql;
desc v$sql;
desc v$sqlarea;
select * from v$sqlarea;
select * from v$sqltext;

select userenv('language') from dual;
select * from sys.nls_database_parameters;
select * from sys.nls_session_parameters;

SELECT * FROM V$NLS_PARAMETERS;
select * from sys.dbms_lob;
select * from sys.dbms_output;
----- 查看建表时间
select t1.* from User_Objects t1 where lower(t1.OBJECT_NAME) like 'd_user_account_change%';

---- 查找字段
select table_name, column_name from user_tab_columns  where column_name = 'DFSUM';

select * from v$sql
where to_char(to_timestamp(FIRST_LOAD_TIME, 'yyyy-mm-dd hh24:mi:ss'),'yyyymmdd') >= 20160301
  and to_char(to_timestamp(FIRST_LOAD_TIME, 'yyyy-mm-dd hh24:mi:ss'),'yyyymmdd') < 20160331;

----v$sql 日志记录
select 
       --"SQL_FULLTEXT",
       "SQL_TEXT",
       "FIRST_LOAD_TIME",
      --- "LAST_LOAD_TIME", 
      module,
     "PROGRAM_ID"
      -- "LAST_ACTIVE_TIME"   
  from v$sql t1
 where to_char(to_timestamp(FIRST_LOAD_TIME, 'yyyy-mm-dd hh24:mi:ss'),'yyyymmdd') >= 20160531
   and to_char(to_timestamp(FIRST_LOAD_TIME, 'yyyy-mm-dd hh24:mi:ss'),'yyyymmdd') <= 20160603
   and t1.SQL_TEXT like 'insert%' or t1.SQL_TEXT like 'update%'
   order by FIRST_LOAD_TIME,SQL_TEXT;


----系统密码重置
update B_M_SYS_USER set PASSWORD='E10ADC3949BA59ABBE56E057F20F883E' where ACCOUNT='1998'

select * from B_M_SYS_USER  t where   t.account ='1998' for update;

t.user_name ='朱立新' 


 
for update;
---- E10ADC3949BA59ABBE56E057F20F883E

update "REP"."D_SYS_DATE" set "BBXT_DATE" = :1 where "BBXT_DATE" = :2 and "STATE" = :3

select * from rep.d_sys_date

----v$sqlarea 日志记录

select 
       "SQL_FULLTEXT",
       ---"SQL_TEXT",
       "FIRST_LOAD_TIME",
       "LAST_LOAD_TIME",       
       ---"PROGRAM_ID",
       "LAST_ACTIVE_TIME"
  from v$sqlarea
 where to_char(to_timestamp(FIRST_LOAD_TIME, 'yyyy-mm-dd hh24:mi:ss'),'yyyymmdd') >= 20160308
   and to_char(to_timestamp(FIRST_LOAD_TIME, 'yyyy-mm-dd hh24:mi:ss'),'yyyymmdd') <  20160311
   and "SQL_TEXT" like '%长期不动户%'   
   order by FIRST_LOAD_TIME;


select FIRST_LOAD_TIME,to_char(to_timestamp(FIRST_LOAD_TIME,'yyyy-mm-dd hh24:mi:ss'),'yyyymmdd') from v$sql;
select to_char('2015/9/15 22:00:04','mi') from dual;
select trunc(sysdate,'mi'),sysdate from dual;


CREATE TABLE "REP"."CCC" 
   (	"ZH" VARCHAR2(32), 
   	"YEHZ" NUMBER(16,2), 
	  "ZHYE" NUMBER(16,2), 
	  "KHBH" VARCHAR2(12)
   );

---20151231定期贵宾


insert into ccc select  b.zh, yehz,yg,a.khbh from  ( select khbh ,  max(ye) yg , sum(ye)  yehz from d_ds_fhzxx  where rq = to_date('20151231','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grdq') group by khbh   having sum(ye)/10000 >= 100   ) a , d_ds_fhzxx b where b.rq = to_date('20151231','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grdq') and a.khbh = b.khbh and yg = ye;
insert into ccc select  b.zh, yehz,yg,a.khbh from  ( select khbh ,  max(ye) yg , sum(ye)  yehz from d_ds_fhzxx  where rq = to_date('20151231','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grdq') group by khbh   having sum(ye)/10000 >= 20 and sum(ye)/10000 < 50   ) a , d_ds_fhzxx b where b.rq = to_date('20151231','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grdq') and a.khbh = b.khbh and yg = ye;
insert into ccc select  b.zh, yehz,yg,a.khbh from  ( select khbh ,  max(ye) yg , sum(ye)  yehz from d_ds_fhzxx  where rq = to_date('20151231','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grdq') group by khbh   having sum(ye)/10000 >= 50 and sum(ye)/10000 < 100   ) a , d_ds_fhzxx b where b.rq = to_date('20151231','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grdq') and a.khbh = b.khbh and yg = ye;

---20151231活期贵宾
insert into ccc select  b.zh, yehz,yg,a.khbh from  ( select khbh ,  max(ye) yg , sum(ye)  yehz from d_ds_fhzxx  where rq = to_date('20151231','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grhq') group by khbh   having sum(ye)/10000 >= 100   ) a , d_ds_fhzxx b where b.rq = to_date('20151231','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grhq') and a.khbh = b.khbh and yg = ye;
insert into ccc select  b.zh, yehz,yg,a.khbh from  ( select khbh ,  max(ye) yg , sum(ye)  yehz from d_ds_fhzxx  where rq = to_date('20151231','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grhq') group by khbh   having sum(ye)/10000 >= 20 and sum(ye)/10000 < 50   ) a , d_ds_fhzxx b where b.rq = to_date('20151231','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grhq') and a.khbh = b.khbh and yg = ye;
insert into ccc select  b.zh, yehz,yg,a.khbh from  ( select khbh ,  max(ye) yg , sum(ye)  yehz from d_ds_fhzxx  where rq = to_date('20151231','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grhq') group by khbh   having sum(ye)/10000 >= 50 and sum(ye)/10000 < 100   ) a , d_ds_fhzxx b where b.rq = to_date('20151231','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grhq') and a.khbh = b.khbh and yg = ye;

truncate table rep.ccc;

---select zgmc, name, count(*)
select  name, count(*)
  from d_user_account_change a, d_user_change b, b_m_sys_bran, ccc c
 where b.ksrq <= to_date('20151231', 'yyyymmdd')
   and b.jsrq >= to_date('20151231', 'yyyymmdd')
   and a.ksrq <= to_date('20151231', 'yyyymmdd')
   and a.jsrq >= to_date('20151231', 'yyyymmdd')
   and a.zgbh = b.zgbh
   and bmdm = code
   and a.zh = c.zh
 group by  name;
 
select * from ods.abpf10;              
 
---20160331 定期贵宾
insert into ccc select  b.zh, yehz,yg,a.khbh from  ( select khbh ,  max(ye) yg , sum(ye)  yehz from d_ds_fhzxx  where rq = to_date('20160331','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grdh') group by khbh   having sum(ye)/10000 >= 100  ) a , d_ds_fhzxx b where b.rq = to_date('20160331','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grdh') and a.khbh = b.khbh and yg = ye;
insert into ccc select  b.zh, yehz,yg,a.khbh from  ( select khbh ,  max(ye) yg , sum(ye)  yehz from d_ds_fhzxx  where rq = to_date('20160331','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grdh') group by khbh   having sum(ye)/10000 >= 20 and sum(ye)/10000 < 50   ) a , d_ds_fhzxx b where b.rq = to_date('20160331','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grdh') and a.khbh = b.khbh and yg = ye;
insert into ccc select  b.zh, yehz,yg,a.khbh from  ( select khbh ,  max(ye) yg , sum(ye)  yehz from d_ds_fhzxx  where rq = to_date('20160331','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grdh') group by khbh   having sum(ye)/10000 >= 50 and sum(ye)/10000 < 100   ) a , d_ds_fhzxx b where b.rq = to_date('20160331','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grdh') and a.khbh = b.khbh and yg = ye;

---20160331 活期贵宾

insert into ccc select  b.zh, yehz,yg,a.khbh from  ( select khbh ,  max(ye) yg , sum(ye)  yehz from d_ds_fhzxx  where rq = to_date('20160331','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grhq') group by khbh   having sum(ye)/10000 >= 100  ) a , d_ds_fhzxx b where b.rq = to_date('20160331','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grhq') and a.khbh = b.khbh and yg = ye;
insert into ccc select  b.zh, yehz,yg,a.khbh from  ( select khbh ,  max(ye) yg , sum(ye)  yehz from d_ds_fhzxx  where rq = to_date('20160331','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grhq') group by khbh   having sum(ye)/10000 >= 20 and sum(ye)/10000 < 50   ) a , d_ds_fhzxx b where b.rq = to_date('20160331','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grhq') and a.khbh = b.khbh and yg = ye;
insert into ccc select  b.zh, yehz,yg,a.khbh from  ( select khbh ,  max(ye) yg , sum(ye)  yehz from d_ds_fhzxx  where rq = to_date('20160331','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grhq') group by khbh   having sum(ye)/10000 >= 50 and sum(ye)/10000 < 100   ) a , d_ds_fhzxx b where b.rq = to_date('20160331','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grhq') and a.khbh = b.khbh and yg = ye;



select a.NAME,b.zgbh,b.zgmc,b.bmdm,c.user_level from B_M_SYS_BRAN a , D_USER_CHANGE b, b_m_sys_user c where c.account = b.zgbh and  a.code = b.bmdm and b.bmdm = 117 and to_char(b.ksrq,'yyyymmdd') <= '20160206' and to_char(b.jsrq,'yyyymmdd')>= '20160206'
select a.NAME,b.zgbh,b.zgmc,b.bmdm,c.user_level from B_M_SYS_BRAN a , D_USER_CHANGE b, b_m_sys_user c where c.account = b.zgbh and  a.code = b.bmdm and b.bmdm = 127 and to_char(b.ksrq,'yyyymmdd') <= '20160331' and to_char(b.jsrq,'yyyymmdd')>= '20160331'
select a.NAME,b.zgbh,b.zgmc,b.bmdm,c.user_level from B_M_SYS_BRAN a , D_USER_CHANGE b, b_m_sys_user c where c.account = b.zgbh and  a.code = b.bmdm and b.bmdm = 131 and to_char(b.ksrq,'yyyymmdd') <= '20160402' and to_char(b.jsrq,'yyyymmdd')>= '20160402'
select a.NAME,b.zgbh,b.zgmc,b.bmdm,c.user_level from B_M_SYS_BRAN a , D_USER_CHANGE b, b_m_sys_user c where c.account = b.zgbh and  a.code = b.bmdm and b.bmdm = 132 and to_char(b.ksrq,'yyyymmdd') <= '20160402' and to_char(b.jsrq,'yyyymmdd')>= '20160402'
select a.NAME,b.zgbh,b.zgmc,b.bmdm,c.user_level from B_M_SYS_BRAN a , D_USER_CHANGE b, b_m_sys_user c where c.account = b.zgbh and  a.code = b.bmdm and b.bmdm = 138 and to_char(b.ksrq,'yyyymmdd') <= '20160331' and to_char(b.jsrq,'yyyymmdd')>= '20160331'


select  t3.code,t3.name,t1.rjkmye
  from rep.d_accman_year_rj t1, rep.d_user_change t2, rep.b_m_sys_bran t3
 where t1.tjdm = 'ndsck'
   and rq = to_date('20160331', 'yyyymmdd')
   and t2.ksrq <= to_date('20160331', 'yyyymmdd')
   and t2.jsrq >= to_date('20160331', 'yyyymmdd')
   and bmdm = code
   group by t3.code,t3.name
 order by code ;
 

select  name, sum(rjkmye)
  from d_accman_year_rj a, d_user_change b, b_m_sys_bran,rep.d_sum_code t4
 where a.tjdm = 'ndsck'
   and rq = to_date('20151231', 'yyyymmdd')
   and b.ksrq <= to_date('20151231', 'yyyymmdd')
   and b.jsrq >= to_date('20151231', 'yyyymmdd')
   and a.zgbh = b.zgbh
   and bmdm = code
   and t4.tjdm='21101'
   group by name
 order by code;
 
 
 
select zgmc, name, rjkmye
  from d_accman_year_rj a, d_user_change b, b_m_sys_bran
 where tjdm = 'ndsck'
   and rq = to_date('20160331', 'yyyymmdd')
   and b.ksrq <= to_date('20160331', 'yyyymmdd')
   and b.jsrq >= to_date('20160331', 'yyyymmdd')
   and bmdm = code
 order by code;


select khbh,
       zjlx,
       zjh,
       zwkhmc,
       to_date(zjxq, 'yyyymmdd') zjxq,
       zhzt,
       to_date(djrq, 'yyyymmdd') djrq,
       zh,
       dz,
       dh,
       bz,
       zgbh,
       zgmc,
       ye
  from (select ca10cno    khbh,
               ca10crdtyp zjlx,
               ca10crdid  zjh,
               ca10cname  zwkhmc,
               ca10vlddat zjxq,
               ab10stat   zhzt,
               ca10datek  djrq,
               a.zh,
               ca10addr   dz,
               ca10tel    dh,
               ab10ctls   bz,
               b.zgbh,
               b.zgmc,
               ab10amt2   ye
          from ods.capf10,
               ods.abpf10,
               ods.adpf10,
               d_user_account_change a,
               d_user_change         b
         where ca10cid = ab10ctid
           and ab10acid = ad10id
           and ca10cname like '%袁芳洲%'
           and ad10acno = a.zh
           and a.ksrq <= to_date('20160407', 'yyyymmdd')
           and a.jsrq >= to_date('20160407', 'yyyymmdd')
           and b.ksrq <= to_date('20160407', 'yyyymmdd')
           and b.jsrq >= to_date('20160407', 'yyyymmdd')
           and a.zgbh = b.zgbh
           and bmdm != '120'
         order by a.zh, ca10cno)

-----数据恢复
 create table rep.d_user_account_change_recover
 as
 select * from rep.d_user_account_change
 as of timestamp  to_timestamp('2016-05-20/11:47:47','yyyy-mm-dd hh24:mi:ss');
 
 select * from v$archived_log;
 SELECT * FROM v$loghist;
 SELECT name,log_mode FROM v$database;
select * from v$log_history ;

select * from v$sql;
select * from v$recovery_file_dest;
select * from v$datafile;

select * from ods.plns_t_fact_loan;
select * from ods.ulns_customer_info t2 where t2.customername = '彭朕';
select * from ods.abpf10 t where t.ab10name='彭朕';
select t1.rowid,t1.* from ods.capf10 t1 where t1.ca10name = '彭朕';

