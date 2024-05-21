SELECT 
    CAST(member_id AS text)                         AS payment_user_id
    , CAST(operation_id AS text)                    AS payment_id
    , TO_DATE(date, 'DD/MM/YYYY')                   AS payment_date
    , CAST(amount AS decimal)                       AS payment_amount
FROM {{ ref("payments") }}