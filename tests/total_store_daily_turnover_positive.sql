SELECT
    report_date,
    store_id,
    sum(total_turnover) as total_turnover
FROM {{ref("mrt_daily_turnover_analysis")}}
GROUP BY
   report_date,
    store_id
HAVING
    total_turnover < 0