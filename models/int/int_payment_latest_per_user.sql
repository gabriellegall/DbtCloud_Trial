SELECT 
    payment_user_id
    , MAX(payment_date) AS first_payment_date
    , TRUE              AS has_payment
FROM {{ ref("stg_lydia__payments") }}
GROUP BY payment_user_id