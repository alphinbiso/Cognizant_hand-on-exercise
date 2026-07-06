       /* SCENARIO 1*/

CREATE TABLE Accounts (
    AccountID NUMBER PRIMARY KEY,
    CustomerName VARCHAR2(50),
    AccountType VARCHAR2(20),
    Balance NUMBER(10,2)
);

INSERT INTO Accounts VALUES (101,'John','Savings',10000);
INSERT INTO Accounts VALUES (102,'Alice','Current',25000);
INSERT INTO Accounts VALUES (103,'David','Savings',5000);

COMMIT;

CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest
IS
BEGIN

    UPDATE Accounts
    SET Balance = Balance + (Balance * 0.01)
    WHERE AccountType = 'Savings';

    COMMIT;

END;
/

BEGIN
    ProcessMonthlyInterest;
END;
/

SELECT * FROM Accounts;

-----------------------------------------------------------

/*scenario 2*/
CREATE TABLE Employees (
    EmployeeID NUMBER PRIMARY KEY,
    EmployeeName VARCHAR2(50),
    Department VARCHAR2(30),
    Salary NUMBER(10,2)
);

INSERT INTO Employees VALUES (1,'John','IT',50000);
INSERT INTO Employees VALUES (2,'Alice','IT',60000);
INSERT INTO Employees VALUES (3,'David','HR',45000);

COMMIT;

CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus(

    p_department IN VARCHAR2,
    p_bonus IN NUMBER

)

IS
BEGIN

    UPDATE Employees

    SET Salary = Salary + (Salary * p_bonus / 100)

    WHERE Department = p_department;

    COMMIT;

END;
/

BEGIN

    UpdateEmployeeBonus('IT',10);

END;
/

SELECT * FROM Employees;

-----------------------------------------------------------

/*scenario 3
*/
CREATE OR REPLACE PROCEDURE TransferFunds(

    p_sourceAccount IN NUMBER,
    p_destinationAccount IN NUMBER,
    p_amount IN NUMBER

)

IS

    v_balance NUMBER;

BEGIN

    SELECT Balance

    INTO v_balance

    FROM Accounts

    WHERE AccountID = p_sourceAccount;

    IF v_balance >= p_amount THEN

        UPDATE Accounts

        SET Balance = Balance - p_amount

        WHERE AccountID = p_sourceAccount;

        UPDATE Accounts

        SET Balance = Balance + p_amount

        WHERE AccountID = p_destinationAccount;

        COMMIT;

        DBMS_OUTPUT.PUT_LINE('Transfer Successful');

    ELSE

        DBMS_OUTPUT.PUT_LINE('Insufficient Balance');

    END IF;

END;
/

BEGIN

    TransferFunds(101,102,3000);

END;
/

SELECT * FROM Accounts;