# Fraud Transaction Analysis

## Project Overview

This project analyzes financial transaction data to identify patterns associated with fraudulent transactions and distinguish them from legitimate activity. SQL was used to investigate transaction patterns, while Microsoft Power BI was used to visualize key findings and communicate insights.

The analysis focuses on transaction types, transaction amounts, account balance changes, transaction timing, and the performance of existing fraud indicators.

## Business Problem

Financial fraud can result in financial losses and undermine trust in payment systems. Identifying unusual transaction patterns can help organizations strengthen fraud monitoring and make more informed risk management decisions.

This project investigates transaction data to identify patterns associated with fraud, assess the usefulness of existing fraud indicators, and develop data-driven recommendations for improving fraud detection.

## Project Objectives

- Identify transaction types with the highest numbers of fraudulent transactions and the highest fraud rates.
- Compare transaction amounts between fraudulent and legitimate transactions.
- Investigate account balance changes before and after transactions.
- Examine when fraudulent transactions occur.
- Evaluate how frequently fraudulent transactions are identified by the existing fraud indicator.
- Identify transaction characteristics that may help distinguish suspicious activity.
- Develop recommendations for improving fraud monitoring and detection.

## Tools and Technologies

- **SQL Server:** Data querying, aggregation, and investigation of transaction patterns.
- **Microsoft Power BI:** Data visualization and dashboard development.
- **CSV:** Source data format used for the analysis.
- **GitHub:** Project documentation and portfolio presentation.

## Analytical Approach

The analysis followed a structured process:

1. **Problem definition:** Established the business questions guiding the investigation.
2. **Data investigation:** Used SQL queries to examine transaction types, amounts, account balances, timing, and fraud indicators.
3. **Pattern identification:** Compared fraudulent and legitimate transactions to identify notable differences.
4. **Data visualization:** Used Power BI to present key metrics and transaction patterns.
5. **Recommendations:** Translated analytical findings into practical suggestions for improving fraud monitoring.

## Key Business Questions

The analysis addressed the following questions:

1. Which transaction types have the highest numbers of fraudulent transactions and the highest fraud rates?
2. How do fraudulent and legitimate transactions differ in transaction amounts?
3. Are there patterns in account balances before and after fraudulent transactions?
4. At what points in the transaction timeline does fraud occur most frequently?
5. Are fraudulent transactions associated with particular patterns in origin and destination accounts?
6. How often are fraudulent transactions flagged by the existing fraud indicator?
7. Which transaction characteristics may be most useful for identifying potentially fraudulent activity?
8. How could the fraud monitoring and flagging process be improved?

## Key Findings

### 1. Fraud by Transaction Type

CASH_OUT recorded 578 fraudulent transactions, while TRANSFER recorded 564. These were the two transaction types with the highest fraud counts in the analysis.

Fraud counts and fraud rates provide different insights. Counts show the number of observed cases, while rates account for the total number of transactions in each category.

### 2. Transaction Amounts

The average transaction amount differed substantially between fraudulent and legitimate transactions.

- **Fraudulent transactions:** Approximately 1,192,628.93.
- **Legitimate transactions:** Approximately 157,539.66.

The average amount for fraudulent transactions was approximately 7.6 times higher than that for legitimate transactions.

This suggests that transaction amount may be a useful risk indicator to investigate further. However, a high transaction amount alone does not prove that a transaction is fraudulent.

### 3. Account Balance Changes

The average origin account balance after fraudulent transactions was substantially lower than the average balance before those transactions.

The analysis also identified differences in average destination account balances between fraudulent and legitimate transactions.

These findings suggest that account balance movements may provide useful context when investigating suspicious transactions. Further transaction-level analysis would be needed to establish how consistently these patterns occur.

### 4. Fraud Over Time

Fraudulent transactions occurred at multiple points in the transaction timeline. Some time steps recorded more fraudulent transactions than others.

Comparing fraud counts with total transaction volumes at each time step is important for determining whether particular periods have higher fraud rates rather than simply higher transaction volumes.

### 5. Fraud Flagging Performance

The initial analysis returned a 0% flagged rate among fraudulent transactions using the existing fraud flag indicator.

This indicates that the flag did not identify the fraudulent transactions in the analyzed results. Investigating the indicator's configuration and the rules used to flag transactions is therefore an important consideration for improving fraud monitoring.

## Power BI Dashboard

The Power BI dashboard presents key metrics and visual comparisons from the analysis, including:

- Total transaction volume, fraud cases, fraud rate, and fraudulent transaction value.
- Fraudulent transaction counts by transaction type.
- Comparisons of transaction amounts between fraudulent and legitimate transactions.
- Account balance patterns before and after transactions.
- Fraud distribution across the transaction timeline.
- Existing fraud flagging performance.

The dashboard provides a visual overview of the main findings and supports the interpretation of patterns identified through SQL analysis.

## Recommendations

Based on the findings, the following improvements are recommended:

- **Review the existing fraud flagging process:** Investigate why fraudulent transactions were not flagged in the analyzed results.
- **Evaluate transaction amounts:** Assess whether unusually large transactions can contribute to a broader risk scoring approach.
- **Monitor account balance changes:** Investigate significant balance reductions and other unusual movements in conjunction with transaction context.
- **Compare fraud rates by transaction type:** Use rates alongside counts to identify categories with a higher concentration of fraudulent activity.
- **Examine transaction sequences:** Where account-level data permits, investigate repeated transactions and unusual patterns involving origin and destination accounts.
- **Validate detection rules:** Test potential indicators against historical transactions and assess missed fraud cases and false positives.

These recommendations should be tested and validated before being implemented as operational fraud detection rules.

## Limitations

The findings describe patterns observed in the available dataset and do not establish that any individual transaction is fraudulent based on a single characteristic.

Average values can be influenced by extreme transactions, while fraud counts can be affected by differences in transaction volumes across categories. Additional validation is necessary before using the observed patterns as operational detection rules.

The reliability of conclusions about flagging performance also depends on the quality and configuration of the available fraud indicator.

## Conclusion

The analysis identified meaningful differences between fraudulent and legitimate transactions, particularly in average transaction amounts and origin account balance patterns. CASH_OUT and TRANSFER also accounted for the highest numbers of fraudulent transactions in the initial investigation.

The findings highlight the value of combining SQL-based investigation with Power BI visualization to identify patterns, communicate insights, and develop recommendations. They also demonstrate the importance of validating potential risk indicators before using them to support fraud detection decisions.
