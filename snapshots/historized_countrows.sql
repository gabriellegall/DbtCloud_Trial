{% snapshot historized_countrows %}

{{
    config (
      unique_key      = 'count'
      , strategy      = 'check'
      , target_schema = generate_schema_name()
      , check_cols    = 'all'
    )
}}

SELECT
  *
FROM {{ ref('countrows') }}

{% endsnapshot %}