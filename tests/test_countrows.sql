-- tests/test_job_log_more_than_10_rows.sql

{% set job_log = ref('countrows') %}

WITH row_count AS (
    SELECT
        COUNT(*) AS num_rows
    FROM {{ job_log }}
)
SELECT *
FROM row_count
WHERE num_rows > 10