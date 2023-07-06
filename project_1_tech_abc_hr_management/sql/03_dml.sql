/**
*   *************************************************
*   Author: Gunasekar Jabbala
*   Email:  gunasekar.ai.dev@gmail.com
*   *************************************************
*/

/**
*   *************************************************
*   DML - INSERT - ADDRESS 
*   *************************************************
*/
INSERT INTO ADDRESS(ADDRESS, LOCATION, CITY, STATE) SELECT DISTINCT ADDRESS, LOCATION, CITY, STATE FROM PROJ_STG PS;

/**
*   *************************************************
*   DML - INSERT - EDUCATION LEVEL
*   *************************************************
*/
INSERT INTO EDUCATION_LEVEL(EDUCATION_LVL) SELECT DISTINCT EDUCATION_LVL FROM PROJ_STG;

/**
*   *************************************************
*   DML - INSERT - DEPARTMENT
*   *************************************************
*/
INSERT INTO DEPARTMENT(DEPARTMENT_NM) SELECT DISTINCT DEPARTMENT_NM FROM PROJ_STG;

/**
*   *************************************************
*   DML - INSERT - JOB
*   *************************************************
*/
INSERT INTO JOB(JOB_TITLE) SELECT DISTINCT JOB_TITLE FROM PROJ_STG;

/**
*   *************************************************
*   DML - INSERT - SALARY
*   *************************************************
*/
INSERT INTO SALARY(SALARY) SELECT DISTINCT SALARY FROM PROJ_STG;

/**
*   *************************************************
*   DML - INSERT - EMPLOYEE
*   *************************************************
*/
INSERT INTO EMPLOYEE(EMP_ID, EMP_NM, EMAIL, HIRE_DT) SELECT DISTINCT EMP_ID, EMP_NM, EMAIL, HIRE_DT FROM PROJ_STG;

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
    M.EMP_ID AS MANAGER_ID,
    EL.ID AS EDUCATION_ID,
    J.ID AS JOB_ID,
    D.ID AS DEPARTMENT_ID,
    PS.START_DT,
    PS.END_DT
FROM
    PROJ_STG PS
    LEFT OUTER JOIN EMPLOYEE E on E.EMP_NM = PS.EMP_ID
    LEFT OUTER JOIN EMPLOYEE M on M.EMP_NM = PS.MANAGER
    LEFT OUTER JOIN ADDRESS A ON A.ADDRESS = PS.ADDRESS
    LEFT OUTER JOIN SALARY SA  ON SA.SALARY = PS.SALARY
    LEFT OUTER JOIN EDUCATION_LEVEL EL ON EL.EDUCATION_LVL = PS.EDUCATION_LVL
    LEFT OUTER JOIN DEPARTMENT D ON D.DEPARTMENT_NM = PS.DEPARTMENT_NM
    LEFT OUTER JOIN JOB J ON J.JOB_TITLE = PS.JOB_TITLE;
