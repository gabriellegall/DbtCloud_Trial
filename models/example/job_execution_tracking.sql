{{
    config (
        materialized            = 'incremental'    
        , on_schema_change      = 'append_new_columns'
        , incremental_strategy  = 'append'
    )
}}

SELECT
    '{{ run_started_at.astimezone(modules.pytz.timezone("Europe/Paris")).strftime("%Y-%m-%d %H:%M:%S") }}'  AS date_time_load -- date
    , '{{ invocation_id }}'                                                                                 AS run_id