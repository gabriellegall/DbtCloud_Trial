{# Check that all users who received a payment do appear in the transactions - as expected #}
SELECT * FROM {{ ref ("int_payment_first_per_user") }}
WHERE payment_user_id NOT IN (SELECT transaction_user_id FROM {{ ref ("stg_lydia__transactions") }})