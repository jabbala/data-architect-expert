/**
*   *********************************
*   AUTHOR: GUNASEKAR JABBALA
*   EMAIL: gunasekar.ai.dev@gmail.com
*   *********************************
*/
/**
*   **************************************************************************************************
*   DDL - DROP - TABLE
*   **************************************************************************************************
*/
DROP TABLE IF EXISTS EMPLOYEE;
DROP TABLE IF EXISTS DEPARTMENT;
DROP TABLE IF EXISTS ADDRESS;
DROP TABLE IF EXISTS LOCATION;
DROP TABLE IF EXISTS CITY;
DROP TABLE IF EXISTS STATE;
DROP TABLE IF EXISTS SALARY;
DROP TABLE IF EXISTS JOB;
DROP TABLE IF EXISTS EDUCATION_LEVEL;
DROP TABLE IF EXISTS EMPLOYEE_HISTORY;



/**
*   **************************************************************************************************
*   DDL - CREATE - TABLE
*   **************************************************************************************************
*/


/**
*   *************************************************
*   EMPLOYEE TABLE
*   *************************************************
*/

CREATE TABLE EMPLOYEE (
    EMP_ID          VARCHAR(8) PRIMARY KEY,
    EMP_NM          VARCHAR(60) NOT NULL,
    EMAIL           VARCHAR(60),
    HIRE_DT         DATE
);

/**
*   *************************************************
*   DEPARTMENT TABLE
*   *************************************************
*/

CREATE TABLE DEPARTMENT
(
    ID              INT PRIMARY KEY,
    DEPARTMENT_NM   VARCHAR(60) NOT NULL
);

/**
*   *************************************************
*   ADDRESS TABLE
*   *************************************************
*/

CREATE TABLE ADDRESS(
    ID              INT PRIMARY KEY,
    ADDRESS         VARCHAR(100),
    LOCATION        VARCHAR(60),
    CITY            VARCHAR(60),
    STATE           VARCHAR(2)
);

/**
*   *************************************************
*   EDUCATION LEVEL TABLE
*   *************************************************
*/
CREATE TABLE EDUCATION_LEVEL
(
    ID              INT PRIMARY KEY,
    EDUCATION_LVL   VARCHAR(60)
);

/**
*   *************************************************
*   EDUCATION LEVEL TABLE
*   *************************************************
*/
CREATE TABLE JOB
(   
    ID          INT PRIMARY KEY,
    JOB_TITLE   VARCHAR(100)
);

/**
*   *************************************************
*   SALARY TABLE
*   *************************************************
*/
CREATE TABLE SALARY
(   
    ID          INT PRIMARY KEY,
    SALARY      INT
);

/**
*   *************************************************
*   CITY TABLE
*   *************************************************
*/
CREATE TABLE CITY
(   
    ID         INT PRIMARY KEY,
    CITY       VARCHAR(60)
);

/**
*   *************************************************
*   STATE TABLE
*   *************************************************
*/
CREATE TABLE STATE
(   
    ID          INT PRIMARY KEY,
    STATE       VARCHAR(2)
);

/**
*   *************************************************
*   LOCATION TABLE
*   *************************************************
*/
CREATE TABLE LOCATION
(   
    ID         INT PRIMARY KEY,
    LOCATION   VARCHAR(60)
);



/**
*   *************************************************
*   EMPLOYEE HISTIORY
*   *************************************************
*/
CREATE TABLE EMPLOYEE_HISTORY
(
    EMP_ID          VARCHAR(8),
    ADDRESS_ID      INT,
    EDUCATION_ID    INT,
    MANAGER_ID      VARCHAR(8), 
    JOB_ID          INT,
    DEPARTMENT_ID   INT,
    SALARY_ID       INT,
    START_DT        DATE,
    END_DT          DATE
);


