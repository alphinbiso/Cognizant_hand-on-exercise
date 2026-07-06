-- Scenario 1

BEGIN
    FOR cust IN (
        SELECT CustomerID, Age, LoanInterest
        FROM Customers
    )
    LOOP
        IF cust.Age > 60 THEN

            UPDATE Customers
            SET LoanInterest = LoanInterest - 1
            WHERE CustomerID = cust.CustomerID;

        END IF;

    END LOOP;

    COMMIT;
END;
/

--------------------------------------------------------

-- Scenario 2

BEGIN

    FOR cust IN (
        SELECT CustomerID, Balance
        FROM Customers
    )
    LOOP

        IF cust.Balance > 10000 THEN

            UPDATE Customers
            SET IsVIP = 'TRUE'
            WHERE CustomerID = cust.CustomerID;

        END IF;

    END LOOP;

    COMMIT;

END;
/

--------------------------------------------------------

-- Scenario 3

SET SERVEROUTPUT ON;

BEGIN

    FOR loan IN (

        SELECT CustomerID,
               LoanDueDate
        FROM Loans

        WHERE LoanDueDate
        BETWEEN SYSDATE
        AND SYSDATE + 30

    )

    LOOP

        DBMS_OUTPUT.PUT_LINE(
            'Reminder: Loan due for Customer ID '
            || loan.CustomerID ||
            ' on '
            || TO_CHAR(loan.LoanDueDate,'DD-MON-YYYY')
        );

    END LOOP;

END;
/