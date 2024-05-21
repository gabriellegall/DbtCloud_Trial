SELECT
    CAST(spender_id AS text)                        AS transaction_user_id
    , CAST(operation_id AS text)                    AS transaction_id
    , TO_DATE(date, 'DD/MM/YYYY')                   AS transaction_date
    , CAST(amount AS decimal)                       AS transaction_amount
    , CAST(status AS text)                          AS transaction_status
    , CAST(plan AS text)                            AS transaction_user_plan
    , TO_DATE(card_activation_date, 'DD/MM/YYYY')   AS transaction_user_card_activation_date
FROM {{ ref("transactions") }}