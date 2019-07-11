------------------------------Q1------------------------------
SELECT title
  FROM field;

------------------------------Q2------------------------------
SELECT count(*)
  FROM academic
 WHERE deptnum = 100;

------------------------------Q3------------------------------
SELECT instname, deptname
  FROM department
 ORDER BY instname, deptname ASC;

------------------------------Q4------------------------------
SELECT qr.deptnum
  FROM
     (SELECT dept.deptnum "deptnum", count(ac.acnum) "cnt"
        FROM department dept, academic ac
       WHERE dept.deptnum = ac.deptnum
       GROUP BY dept.deptnum
      HAVING count(ac.acnum) >= 2) qr;

------------------------------Q5------------------------------
SELECT * 
  FROM academic
 WHERE title = NULL;

------------------------------Q6------------------------------
SELECT ac.famname, ac.givename
  FROM academic ac,
       author au,
       field fi,
       interest inst
 WHERE ac.acnum = au.acnum
   AND au.acnum = inst.acnum
   AND inst.fieldnum = fi.fieldnum
   AND lower(fi.title) = "logic programming" ;
   -- In strings comparison LOWER/UPPER functions make our code more reliable

------------------------------Q7------------------------------
SELECT fi.fieldnum, fi.title, count(inst.acnum)
  FROM field fi,
       interest inst
 WHERE fi.fieldnum = inst.fieldnum
 GROUP BY fi.fieldnum, fi.title
HAVING count(inst.acnum) >= 10;

------------------------------Q8------------------------------
SELECT famname, givename, max(au.panum)
  FROM academic ac,
       author au
 WHERE ac.acnum = au.acnum
 GROUP BY famname, givename;

------------------------------Q9------------------------------
SELECT count(*)
  FROM academic ac
 WHERE ac.acnum NOT IN (SELECT au.acnum
                          FROM author au);

------------------------------Q10-----------------------------
SELECT qr.fieldnum, qr.title
  FROM 
     (SELECT fi.fieldnum "fieldnum", fi.title "title", count(inst.acnum) "cnt"
        FROM field fi,
            interest inst,
            academic ac
        WHERE fi.fieldnum = inst.fieldnum
          AND inst.acnum = ac.acnum
          AND lower(fi.title) LIKE "%data%" 
          AND ac.deptnum = 100
        GROUP BY fi.fieldnum , fi.title
        HAVING count(inst.acnum) >= 1) qr;