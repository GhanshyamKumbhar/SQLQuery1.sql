/*SP WITH PARAMATERS*/

SELECT * FROM EMPLOYEES

ALTER  TABLE [dbo].[Employees]
ADD GRNDER VARCHAR(100)

ALTER  TABLE [dbo].[Employees]
ADD DEPT_ID INT

---------------------------------------------------------------------
UPDATE EMPLOYEES
SET GENDER = 'F', DEPT_ID = 10
WHERE EMP_ID = 102

SELECT * FROM EMPLOYEES

DELETE GRNDER FROM [dbo].[Employees]
-----------------------------------------------------------------------------

CREATE PROC spGetEmployees_ByGender_And_Department
@Gender NVARCHAR(20),
@Dep_ID INT
AS
BEGIN
SELECT EMP_NAME, GENDER, DEPT_ID FROM EMPLOYEES
WHERE GENDER = @Gender AND DEPT_ID = @Dep_ID
END

---------------------------------------------------------------------------------------
spGetEmployees_ByGender_And_Department
@Gender = 'M',
@Dep_ID = 10

ALTER TABLE EMPLOYEES
DROP COLUMN GRNDER


-----------------------------------------------------------------------------------------------------
SELECT *FROM EMPLOYEES

------QUERY TO GIVE AGGREGATE DATA BY THE COLUMN GENDER----
SELECT EMP_NAME, GENDER, COUNT(*) AS TOTAL,
AVG(SALARY) AS AVG_SAL,
MIN(SALARY) AS MIN_SAL,
MAX(SALARY) AS MAX_SAL
FROM EMPLOYEES
GROUP BY GENDER, EMP_NAME

-----------------------------------------------------------------------------------------------------
/*OVER CLAUSE*/

------------------------------------------------------------------------------------------------------------------
SELECT EMP_NAME, SALARY, GENDER,
COUNT (GENDER) OVER (PARTITION BY GENDER) AS GENDER_TOTAL,
AVG(SALARY) OVER (PARTITION BY GENDER) AS AVG_SAL,
MIN(SALARY) OVER (PARTITION BY GENDER) AS MIN_SAL,
MAX(SALARY) OVER (PARTITION BY GENDER) AS MAX_SAL
FROM EMPLOYEES
----------------------------------------------------------------

SELECT EMP_NAME, SALARY, GENDER,
COUNT (GENDER) OVER (PARTITION BY SALARY) AS GENDER_TOTAL,
AVG(SALARY) OVER (PARTITION BY GENDER) AS AVG_SAL,
MIN(SALARY) OVER (PARTITION BY GENDER) AS MIN_SAL,
MAX(SALARY) OVER (PARTITION BY GENDER) AS MAX_SAL
FROM EMPLOYEES