SELECT
    t.transaction_user_id
    , t.transaction_date
    , t.transaction_amount
    , {{ dbt_utils.star(from=ref('int_payment_first_per_user'), except='payment_user_id') }}
FROM {{ ref("stg_lydia__transactions") }} t
LEFT OUTER JOIN {{ ref("int_payment_first_per_user") }} p
    ON t.transaction_user_id = p.payment_user_id