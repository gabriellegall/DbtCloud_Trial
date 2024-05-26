WITH CTE_COHORT_PER_USER AS 
(
    SELECT transaction_user_id, MIN(transaction_date_yearmonth) AS first_transaction_date FROM {{ ref("stg_lydia__transactions") }} GROUP BY transaction_user_id
)

SELECT
    transaction_date_yearmonth
    , first_transaction_date
    , COUNT(DISTINCT t1.transaction_user_id)
FROM {{ ref("stg_lydia__transactions") }} t1
LEFT OUTER JOIN CTE_COHORT_PER_USER cohort ON t1.transaction_user_id = cohort.transaction_user_id
GROUP BY transaction_date_yearmonth, first_transaction_date
ORDER BY transaction_date_yearmonth ASC