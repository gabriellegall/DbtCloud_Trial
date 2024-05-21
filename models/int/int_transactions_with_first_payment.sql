WITH CTE_DATE_DEFINITION AS 
(
    SELECT
        t.transaction_user_id
        , t.transaction_id
        , t.transaction_date
        , t.transaction_amount
        , {{ dbt_utils.star(from=ref('int_payment_first_per_user'), except=['payment_user_id']) }}
        , MIN(t.transaction_date) OVER (PARTITION BY t.transaction_user_id) AS first_transaction_date
        , MAX(t.transaction_date) OVER () AS dataset_end_date
    FROM {{ ref("stg_lydia__transactions") }} t
    LEFT OUTER JOIN {{ ref("int_payment_first_per_user") }} p
        ON t.transaction_user_id = p.payment_user_id
    ORDER BY t.transaction_user_id, t.transaction_date
)

SELECT 
    *
    , CASE 
        WHEN transaction_date < payment_first_date THEN 1
        WHEN transaction_date >= payment_first_date THEN 0
        ELSE NULL END AS is_transaction_before_payment
FROM CTE_DATE_DEFINITION