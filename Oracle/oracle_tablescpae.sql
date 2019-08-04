SELECT UPPER(F.TABLESPACE_NAME) "表空间名",
　　D.TOT_GROOTTE_MB "表空间大小(M)",
　　D.TOT_GROOTTE_MB - F.TOTAL_BYTES "已使用空间(M)",
　　TO_CHAR(ROUND((D.TOT_GROOTTE_MB - F.TOTAL_BYTES) / D.TOT_GROOTTE_MB * 100,2),'990.99') || '%' "使用比",
　　F.TOTAL_BYTES "空闲空间(M)",
　　F.MAX_BYTES "最大块(M)"
　　FROM (SELECT TABLESPACE_NAME,
　　ROUND(SUM(BYTES) / (1024 * 1024), 2) TOTAL_BYTES,
　　ROUND(MAX(BYTES) / (1024 * 1024), 2) MAX_BYTES
　　FROM SYS.DBA_FREE_SPACE
　　GROUP BY TABLESPACE_NAME) F,
　　(SELECT DD.TABLESPACE_NAME,
　　 ROUND(SUM(DD.BYTES) / (1024 * 1024), 2) TOT_GROOTTE_MB
　　FROM SYS.DBA_DATA_FILES DD
　　GROUP BY DD.TABLESPACE_NAME) D
　　WHERE D.TABLESPACE_NAME = F.TABLESPACE_NAME
　　ORDER BY 1;

 alter tablespace USERS add datafile '/oracle/oradata/oradata_space0.dbf' size 10240M;
 
 ----
 SELECT  A.TABLESPACE_NAME
        ,A.BYTES / 1024 / 1024 "SUM MB"
        ,(A.BYTES - B.BYTES) / 1024 / 1024 "USED MB"
        ,B.BYTES / 1024 / 1024 "FREE MB"
        ,ROUND(((A.BYTES - B.BYTES) / A.BYTES) * 100, 2) "PERCENT_USED"
  FROM (SELECT TABLESPACE_NAME, SUM(BYTES) BYTES
           FROM DBA_DATA_FILES
          GROUP BY TABLESPACE_NAME) A,
        (SELECT TABLESPACE_NAME, SUM(BYTES) BYTES, MAX(BYTES) LARGEST
           FROM DBA_FREE_SPACE
          GROUP BY TABLESPACE_NAME) B
 WHERE A.TABLESPACE_NAME = B.TABLESPACE_NAME
 ORDER BY ((A.BYTES - B.BYTES) / A.BYTES) DESC;
