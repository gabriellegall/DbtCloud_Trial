SELECT
    {{ dbt_utils.star(from=ref('payments'), except='member_id') }}
FROM {{ ref('payments') }}