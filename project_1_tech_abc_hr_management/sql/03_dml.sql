/**
*   *************************************************
*   Author: Gunasekar Jabbala
*   Email:  gunasekar.ai.dev@gmail.com
*   *************************************************
*/

/**
*   *************************************************
*   DML - INSERT - STATE 
*   *************************************************
*/
INSERT INTO STATE(ID, STATE)
SELECT 
    ROW_NUMBER() OVER( ORDER BY STATE) AS ID, 
    STATE  
FROM (
	SELECT DISTINCT STATE FROM PROJ_STG
);

/**
*   *************************************************
*   DML - INSERT - LOCATION 
*   *************************************************
*/
INSERT INTO LOCATION(ID, LOCATION)
SELECT 
    ROW_NUMBER() OVER( ORDER BY LOCATION) AS ID, 
    LOCATION  
FROM (
	SELECT DISTINCT LOCATION FROM PROJ_STG
);

/**
*   *************************************************
*   DML - INSERT - ADDRESS 
*   *************************************************
*/
INSERT INTO ADDRESS(ID, ADDRESS, LOCATION, CITY, STATE)
SELECT 
    ROW_NUMBER() OVER( ORDER BY ADDRESS) AS ID,
    ADDRESS, 
    LOCATION,
    CITY,
    STATE
FROM (
	SELECT DISTINCT ADDRESS, 
        LOCATION,
        CITY,
        STATE 
    FROM PROJ_STG PS
);

/**
*   *************************************************
*   DML - INSERT - CITY
*   *************************************************
*/
INSERT INTO CITY(ID, CITY)
SELECT 
    ROW_NUMBER() OVER( ORDER BY CITY) AS ID, 
    CITY  
FROM (
	SELECT DISTINCT CITY FROM PROJ_STG
);

/**
*   *************************************************
*   DML - INSERT - EDUCATION LEVEL
*   *************************************************
*/
INSERT INTO EDUCATION_LEVEL(ID, EDUCATION_LVL)
SELECT 
    ROW_NUMBER() OVER( ORDER BY EDUCATION_LVL) AS ID, 
    EDUCATION_LVL  
FROM (
	SELECT DISTINCT EDUCATION_LVL FROM PROJ_STG
);

/**
*   *************************************************
*   DML - INSERT - DEPARTMENT
*   *************************************************
*/
INSERT INTO DEPARTMENT(ID, DEPARTMENT_NM)
SELECT 
    ROW_NUMBER() OVER( ORDER BY DEPARTMENT_NM) AS ID, 
    DEPARTMENT_NM  
FROM (
	SELECT DISTINCT DEPARTMENT_NM FROM PROJ_STG
);

/**
*   *************************************************
*   DML - INSERT - JOB
*   *************************************************
*/
INSERT INTO JOB(ID, JOB_TITLE)
SELECT 
    ROW_NUMBER() OVER( ORDER BY JOB_TITLE) AS ID, 
    JOB_TITLE  
FROM (
	SELECT DISTINCT JOB_TITLE FROM PROJ_STG
);

/**
*   *************************************************
*   DML - INSERT - SALARY
*   *************************************************
*/
INSERT INTO SALARY(ID, SALARY)
SELECT 
    ROW_NUMBER() OVER( ORDER BY SALARY) AS ID, 
    SALARY  
FROM (
	SELECT DISTINCT SALARY FROM PROJ_STG
);

/**
*   *************************************************
*   DML - INSERT - EMPLOYEE
*   *************************************************
*/
INSERT INTO EMPLOYEE(EMP_ID, EMP_NM, EMAIL, HIRE_DT)
SELECT 
    EMP_ID, 
    EMP_NM,
    EMAIL,
    HIRE_DT 
FROM (
	SELECT DISTINCT EMP_ID, EMP_NM, EMAIL, HIRE_DT FROM PROJ_STG
);

/**
*   *************************************************
*   DML - INSERT - EMPLOYEE_HISTORY
*   *************************************************
*/

INSERT INTO EMPLOYEE_HISTORY(
  EMP_ID, 
  ADDRESS_ID,
  SALARY_ID,
  MANAGER_ID,
  EDUCATION_ID,
  JOB_ID,
  DEPARTMENT_ID,
  START_DT,
  END_DT
)
SELECT 
    PS.EMP_ID AS EMP_ID,
    A.ID AS ADDRESS_ID,
    SA.ID AS SALARY_ID,
    E.EMP_ID AS MANAGER_ID,
    EL.ID AS EDUCATION_ID,
    J.ID AS JOB_ID,
    D.ID AS DEPARTMENT_ID,
    PS.START_DT,
    PS.END_DT
FROM
    PROJ_STG PS
    LEFT OUTER JOIN EMPLOYEE E on E.EMP_NM = PS.MANAGER
    LEFT OUTER JOIN ADDRESS A ON A.ADDRESS = PS.ADDRESS
    LEFT OUTER JOIN SALARY SA  ON SA.SALARY = PS.SALARY
    LEFT OUTER JOIN EDUCATION_LEVEL EL ON EL.EDUCATION_LVL = PS.EDUCATION_LVL
    LEFT OUTER JOIN DEPARTMENT D ON D.DEPARTMENT_NM = PS.DEPARTMENT_NM
    LEFT OUTER JOIN JOB J ON J.JOB_TITLE = PS.JOB_TITLE;
