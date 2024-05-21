SELECT 
    payment_user_id
    , MIN(payment_date) AS payment_first_date
    , TRUE              AS has_payment
FROM {{ ref("stg_lydia__payments") }}
GROUP BY payment_user_id