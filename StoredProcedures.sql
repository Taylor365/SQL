----STORED PROCEDURES
CREATE PROCEDURE MyTestProc
AS
SET NOCOUNT ON
SELECT * FROM [HumanResources].[Shift]

--TO RUN PROCEDURE
EXECUTE MyTestProc


CREATE PROCEDURE MyTestProc2
AS
SET NOCOUNT OFF
SELECT * FROM [HumanResources].[Shift]

EXECUTE MyTestProc2


DROP PROC MyTestProc
DROP PROC MyTestProc2

---PARAMETERED PROCEDURE
CREATE PROCEDURE MyFirstParamProcedure
@Param_Name VARCHAR(50)
AS
SET NOCOUNT ON
SELECT * FROM [HumanResources].[Shift]
WHERE NAME = @Param_Name

EXECUTE MyFirstParamProcedure @Param_Name = 'Day'

DROP PROC MyFirstParamProcedure


---Passing a default parameter
CREATE PROCEDURE MyFirstParamProcedure
@Param_Name VARCHAR(50) = 'Evening'
AS
SET NOCOUNT ON
SELECT * FROM [HumanResources].[Shift]
WHERE NAME = @Param_Name

EXECUTE MyFirstParamProcedure


---OUTPUT PARAMETER
CREATE PROCEDURE MyOutputSP
@TopShift VARCHAR(50)OUTPUT
AS
SET @TopShift = (SELECT TOP(1) ShiftID FROM [HumanResources].[Shift])

DECLARE @outputresult VARCHAR(50)
EXEC MyOutputSP @outputresult output
SELECT @outputresult

DROP PROC MyOutputSP


---RETURNING VALUES FROM STORED PROCEDURES
CREATE PROC MyFirstReturningSP
AS
RETURN 12

DECLARE @ReturnValue INT
EXEC @Returnvalue = MyFirstReturningSP
SELECT @ReturnValue

