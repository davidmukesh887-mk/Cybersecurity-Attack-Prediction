CREATE DATABASE Cybersecurity_DB;

USE Cybersecurity_DB;

SHOW DATABASES;
USE cybersecurity_db;

CREATE TABLE Cybersecurity_Attacks (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Actual_Attack VARCHAR(100),
    Predicted_Attack VARCHAR(100),
    Prediction_Status VARCHAR(50),
    Model_Accuracy FLOAT
);
SHOW TABLES;
USE Cybersecurity_DB;

SELECT COUNT(*) 
FROM cybersecurity_attacks;

SELECT * 
FROM cybersecurity_attacks
LIMIT 10;

DESCRIBE cybersecurity_attacks;

SELECT COUNT(*)
FROM cybersecurity_attacks;

SELECT * 
FROM cybersecurity_attacks
LIMIT 10;

SELECT Prediction_Status, COUNT(*)
FROM cybersecurity_attacks
GROUP BY Prediction_Status;

SELECT AVG(Model_Accuracy)
FROM cybersecurity_attacks;

SELECT *
FROM cybersecurity_attacks
LIMIT 10;

SELECT
COUNT(*) AS Total_Records,
COUNT(Actual_Attack) AS Actual_Attack_Count,
COUNT(Predicted_Attack) AS Predicted_Attack_Count,
COUNT(Prediction_Status) AS Status_Count,
COUNT(Model_Accuracy) AS Accuracy_Count
FROM cybersecurity_attacks;

SELECT
COUNT(*) AS Total,
COUNT(Prediction_Status) AS Status_Filled,
COUNT(Model_Accuracy) AS Accuracy_Filled
FROM cybersecurity_attacks;

SELECT
    Actual_Attack,
    Predicted_Attack,
    COUNT(*) AS Total
FROM cybersecurity_attacks
GROUP BY Actual_Attack, Predicted_Attack;

SELECT
    Actual_Attack,
    Predicted_Attack,
    COUNT(*) AS Total
FROM cybersecurity_attacks
GROUP BY Actual_Attack, Predicted_Attack
ORDER BY Actual_Attack, Predicted_Attack;

SELECT
    SUM(CASE
        WHEN Actual_Attack = Predicted_Attack
        THEN 1 ELSE 0
    END) AS Correct_Predictions,

    SUM(CASE
        WHEN Actual_Attack <> Predicted_Attack
        THEN 1 ELSE 0
    END) AS Wrong_Predictions,

    COUNT(*) AS Total_Records,

    ROUND(
        SUM(CASE
            WHEN Actual_Attack = Predicted_Attack
            THEN 1 ELSE 0
        END) * 100.0 / COUNT(*), 2
    ) AS Accuracy_Percentage

FROM cybersecurity_attacks;

SELECT
    Actual_Attack,
    COUNT(*) AS Total_Attacks
FROM cybersecurity_attacks
GROUP BY Actual_Attack
ORDER BY Total_Attacks DESC;

SELECT
    Actual_Attack,
    COUNT(*) AS Total_Attacks
FROM cybersecurity_attacks
GROUP BY Actual_Attack
ORDER BY Total_Attacks DESC;

SELECT
    Actual_Attack,
    COUNT(*) AS Total_Attacks
FROM cybersecurity_attacks
GROUP BY Actual_Attack
ORDER BY Total_Attacks DESC;

USE cybersecurity_db;

SELECT *
FROM cybersecurity_attacks
LIMIT 10;

SELECT
    Actual_Attack,
    Predicted_Attack,
    CASE
        WHEN Actual_Attack = Predicted_Attack THEN 'Correct'
        ELSE 'Incorrect'
    END AS Prediction_Status
FROM cybersecurity_attacks
LIMIT 10;

UPDATE cybersecurity_attacks
SET Prediction_Status =
    CASE
        WHEN Actual_Attack = Predicted_Attack THEN 'Correct'
        ELSE 'Incorrect'
    END;

UPDATE cybersecurity_attacks
SET Prediction_Status =
    CASE
        WHEN Actual_Attack = Predicted_Attack THEN 'Correct'
        ELSE 'Incorrect'
    END;
    
    SELECT
    Prediction_Status,
    COUNT(*) AS Total
FROM cybersecurity_attacks
GROUP BY Prediction_Status;

SELECT
    COUNT(*) AS Total_Records,
    SUM(CASE WHEN Prediction_Status = 'Correct' THEN 1 ELSE 0 END) AS Correct_Predictions,
    ROUND(
        SUM(CASE WHEN Prediction_Status = 'Correct' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS Model_Accuracy
FROM cybersecurity_attacks;

SELECT
    Actual_Attack,
    COUNT(*) AS Total_Attacks,
    SUM(CASE
        WHEN Prediction_Status = 'Correct' THEN 1
        ELSE 0
    END) AS Correct_Count,
    SUM(CASE
        WHEN Prediction_Status = 'Incorrect' THEN 1
        ELSE 0
    END) AS Incorrect_Count
FROM cybersecurity_attacks
GROUP BY Actual_Attack
ORDER BY Total_Attacks DESC;
