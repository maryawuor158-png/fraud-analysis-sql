/*
PROJECT: FRAUD DETECTION ANALYSIS

OBJECTIVE:
To investigate fraudulent transactions, identify patterns
associated with fraud, and generate insights that may help
improve fraud detection.

=========================================================
QUESTION 1:
How many transactions are fraudulent compared with legitimate transactions?
=========================================================
*/

select
isfraud,
count(*) as total_transcations
from fraud_analysis.fraudulent
GROUP BY isfraud

-- What percentage of all transactions are fraudulent?

SELECT
    COUNT(*) * 100.0 /
    (SELECT COUNT(*) FROM fraud_analysis.fraudulent)
    AS fraud_percentage
FROM fraud_analysis.fraudulent
WHERE isfraud = 1;

-- How much money is involved in fraudulent transactions compared with legitimate transactions?

SELECT
    isfraud,
    COUNT(*) AS total_transactions,
    SUM(amount) AS total_transaction_amount
FROM fraud_analysis.fraudulent
GROUP BY isfraud;

-- Which transaction types have the highest number of fraudulent transactions and the highest fraud rates?

SELECT
    type,
    COUNT(*) AS total_transactions,
    SUM(isFraud) AS total_fraud,
    (SUM(isFraud) * 100.0 / COUNT(*)) AS fraud_rate
FROM fraud_analysis.fraudulent
GROUP BY type
ORDER BY total_fraud DESC;

-- Compare transaction amounts for fraudulent and legitimate transactions

SELECT
    'Fraudulent' AS transaction_status,
    COUNT(*) AS total_transactions,
    AVG(amount) AS average_amount,
    MIN(amount) AS minimum_amount,
    MAX(amount) AS maximum_amount,
    SUM(amount) AS total_amount
FROM fraud_analysis.fraudulent
WHERE isFraud = 1

UNION ALL

SELECT
    'Legitimate' AS transaction_status,
    COUNT(*) AS total_transactions,
    AVG(amount) AS average_amount,
    MIN(amount) AS minimum_amount,
    MAX(amount) AS maximum_amount,
    SUM(amount) AS total_amount
FROM fraud_analysis.fraudulent
WHERE isFraud = 0;

-- Compare account balances before and after transactions

SELECT
    'Fraudulent' AS transaction_status,
    AVG(oldbalanceOrg) AS avg_old_balance_orig,
    AVG(newbalanceOrig) AS avg_new_balance_orig,
    AVG(oldbalanceDest) AS avg_old_balance_dest,
    AVG(newbalanceDest) AS avg_new_balance_dest
FROM fraud_analysis.fraudulent
WHERE isFraud = 1

UNION ALL

SELECT
    'Legitimate' AS transaction_status,
    AVG(oldbalanceOrg) AS avg_old_balance_orig,
    AVG(newbalanceOrig) AS avg_new_balance_orig,
    AVG(oldbalanceDest) AS avg_old_balance_dest,
    AVG(newbalanceDest) AS avg_new_balance_dest
FROM fraud_analysis.fraudulent
WHERE isFraud = 0;

-- At what points in the transaction timeline does fraud occur most frequently?

SELECT
    step,
    COUNT(*) AS total_fraud
FROM fraud_analysis.fraudulent
WHERE isFraud = 1
GROUP BY step
ORDER BY total_fraud DESC;

-- Investigate origin and destination account patterns

SELECT
    type,
    COUNT(*) AS total_fraud,
    AVG(oldbalanceOrg) AS avg_origin_balance_before,
    AVG(newbalanceOrig) AS avg_origin_balance_after,
    AVG(oldbalanceDest) AS avg_destination_balance_before,
    AVG(newbalanceDest) AS avg_destination_balance_after
FROM fraud_analysis.fraudulent
WHERE isFraud = 1
GROUP BY type
ORDER BY total_fraud DESC;

-- How often are fraudulent transactions flagged?

SELECT
    COUNT(*) AS total_fraud,
    SUM(isFlaggedFraud) AS flagged_fraud,
    COUNT(*) - SUM(isFlaggedFraud) AS unflagged_fraud,
    SUM(isFlaggedFraud) * 100.0 / COUNT(*) AS flagged_percentage
FROM fraud_analysis.fraudulent
WHERE isFraud = 1;

-- Investigate unusual transaction amounts and balance changes

SELECT
    isFraud,
    COUNT(*) AS total_transactions,
    AVG(amount) AS avg_transaction_amount,
    AVG(oldbalanceOrg - newbalanceOrig) AS avg_origin_balance_change,
    AVG(newbalanceDest - oldbalanceDest) AS avg_destination_balance_change
FROM fraud_analysis.fraudulent
GROUP BY isFraud
ORDER BY isFraud DESC;

-- Compare characteristics of fraudulent and legitimate transactions

SELECT
    isFraud,
    COUNT(*) AS total_transactions,
    AVG(amount) AS avg_amount,
    AVG(oldbalanceOrg) AS avg_origin_balance_before,
    AVG(newbalanceOrig) AS avg_origin_balance_after,
    AVG(oldbalanceDest) AS avg_destination_balance_before,
    AVG(newbalanceDest) AS avg_destination_balance_after,
    AVG(isFlaggedFraud * 1.0) * 100 AS flagged_percentage
FROM fraud_analysis.fraudulent
GROUP BY isFraud
ORDER BY isFraud DESC;

-- Are any origin accounts associated with multiple fraudulent transactions?
SELECT
    nameOrig,
    COUNT(*) AS fraud_transactions,
    SUM(amount) AS total_fraud_amount
FROM fraud_analysis.fraudulent
WHERE isFraud = 1
GROUP BY nameOrig
ORDER BY fraud_transactions DESC, total_fraud_amount DESC;

-- Are any destination accounts associated with multiple fraudulent transactions?
SELECT
    nameDest,
    COUNT(*) AS fraud_transactions,
    SUM(amount) AS total_fraud_amount
FROM fraud_analysis.fraudulent
WHERE isFraud = 1
GROUP BY nameDest
ORDER BY fraud_transactions DESC, total_fraud_amount DESC;

-- Are fraud rates different across the transaction timeline?
SELECT
    step,
    COUNT(*) AS total_transactions,
    SUM(isFraud) AS fraud_cases,
    SUM(isFraud) * 100.0 / COUNT(*) AS fraud_rate_percentage
FROM fraud_analysis.fraudulent
GROUP BY step
ORDER BY fraud_rate_percentage DESC;

-- Are there missing values in important fields?.

SELECT
    COUNT(*) AS total_rows,
    COUNT(*) - COUNT(type) AS missing_type,
    COUNT(*) - COUNT(amount) AS missing_amount,
    COUNT(*) - COUNT(isFraud) AS missing_fraud_labels,
    COUNT(*) - COUNT(oldbalanceOrg) AS missing_origin_balance_before,
    COUNT(*) - COUNT(newbalanceOrig) AS missing_origin_balance_after,
    COUNT(*) - COUNT(oldbalanceDest) AS missing_destination_balance_before,
    COUNT(*) - COUNT(newbalanceDest) AS missing_destination_balance_after,
    COUNT(*) - COUNT(isFlaggedFraud) AS missing_flag_values
FROM fraud_analysis.fraudulent;