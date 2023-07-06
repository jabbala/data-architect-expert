/**
*   *********************************
*   AUTHOR: GUNASEKAR JABBALA
*   EMAIL: gunasekar.ai.dev@gmail.com
*   *********************************
*/

/**
*   ***************************************************************************************************
*   Question 1: Return a list of employees with Job Titles and Department Names
*   ***************************************************************************************************
*/

SELECT DISTINCT E.EMP_ID, E.EMP_NM, J.JOB_TITLE, D.DEPARTMENT_NM
FROM EMPLOYEE_HISTORY EH
JOIN EMPLOYEE E ON EH.EMP_ID = E.EMP_ID
JOIN JOB J ON J.ID = EH.JOB_ID
JOIN DEPARTMENT D ON D.ID = EH.DEPARTMENT_ID;

/**
*   ***************************************************************************************************
*   Question 2: Insert Web Programmer as a new job title
*   ***************************************************************************************************
*/
    
INSERT INTO JOB(JOB_TITLE) VALUES('Web Programmer');


/**
*   ***************************************************************************************************
*   Question 3: Correct the job title from web programmer to web developer
*   ***************************************************************************************************
*/

UPDATE JOB SET JOB_TITLE = 'Web Developer' WHERE JOB_TITLE = 'Web Programmer';

/**
*   ***************************************************************************************************
*   Question 4: Delete the job title Web Developer from the database
*   ***************************************************************************************************
*/

DELETE FROM JOB WHERE JOB_TITLE='Web Developer';

/**
*   ***************************************************************************************************
*   Question 5: How many employees are in each department?
*   ***************************************************************************************************
*/

SELECT 
	D.DEPARTMENT_NM,
    COUNT(*)
FROM EMPLOYEE_HISTORY EH
JOIN DEPARTMENT D on D.ID = EH.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_NM
ORDER BY DEPARTMENT_NM;

--OR

SELECT 
	DEPARTMENT_NM,
    COUNT(*)
FROM HUMAN_READABLE_VIEW_WITH_ALL_ATTRIBUTES
GROUP BY DEPARTMENT_NM
ORDER BY DEPARTMENT_NM;

/**
*   ***************************************************************************************************
*   Question 6: Write a query that returns current and past jobs 
*   (include employee name, job title, department, manager name, start and end date for position) for employee Toni Lembeck.
*   ***************************************************************************************************
*/

SELECT
	E.EMP_NM,
    J.JOB_TITLE,
    D.DEPARTMENT_NM,
    M.EMP_NM AS MANAGER,
    EH.START_DT,
    EH.END_DT
FROM EMPLOYEE_HISTORY EH
JOIN EMPLOYEE E ON E.EMP_ID = EH.EMP_ID
JOIN JOB J ON J.ID = EH.JOB_ID
JOIN DEPARTMENT D ON D.ID = EH.DEPARTMENT_ID
JOIN EMPLOYEE M ON M.EMP_ID = EH.MANAGER_ID
WHERE E.EMP_NM = 'Toni Lembeck';


