/* ==========================================================
   NYKAA BUSINESS GROWTH & PROFITABILITY ANALYSIS
   Author: Paras Dhawan
   Tool: PostgreSQL (pgAdmin)
   Dataset: nykaa_dashboard_view
   ========================================================== */


/* ==========================================================
   1. COMPLETE DATA PREVIEW
   ========================================================== */

SELECT *
FROM nykaa_dashboard_view;


/* ==========================================================
   2. REVENUE TREND OVER TIME
   ========================================================== */

SELECT
quarter,
revenue_cr
FROM nykaa_dashboard_view
ORDER BY quarter_order;


/* ==========================================================
   3. QUARTER-OVER-QUARTER REVENUE GROWTH %
   ========================================================== */

SELECT
quarter,
revenue_cr,

LAG(revenue_cr) OVER
(ORDER BY quarter_order) AS previous_revenue,

ROUND(
(
revenue_cr -
LAG(revenue_cr) OVER(ORDER BY quarter_order)
)
/
LAG(revenue_cr) OVER(ORDER BY quarter_order)
* 100,
2
) AS revenue_growth_pct

FROM nykaa_dashboard_view;


/* ==========================================================
   4. CUSTOMER GROWTH TREND
   ========================================================== */

SELECT
quarter,
total_mauv
FROM nykaa_dashboard_view
ORDER BY quarter_order;


/* ==========================================================
   5. ORDER GROWTH TREND
   ========================================================== */

SELECT
quarter,
total_orders
FROM nykaa_dashboard_view
ORDER BY quarter_order;


/* ==========================================================
   6. CUSTOMER ACQUISITION TREND
   ========================================================== */

SELECT
quarter,
total_autc
FROM nykaa_dashboard_view
ORDER BY quarter_order;


/* ==========================================================
   7. CONVERSION RATE ANALYSIS
   ========================================================== */

SELECT
quarter,

ROUND(
(total_orders / total_mauv) * 100,
2
) AS conversion_rate_pct

FROM nykaa_dashboard_view
ORDER BY quarter_order;


/* ==========================================================
   8. REVENUE PER CUSTOMER
   ========================================================== */

SELECT
quarter,

ROUND(
revenue_cr / total_mauv,
2
) AS revenue_per_customer

FROM nykaa_dashboard_view
ORDER BY quarter_order;


/* ==========================================================
   9. ORDERS GENERATED PER USER
   ========================================================== */

SELECT
quarter,

ROUND(
total_orders / total_mauv,
2
) AS orders_per_user

FROM nykaa_dashboard_view
ORDER BY quarter_order;


/* ==========================================================
   10. TOTAL GMV BY SEGMENT
   ========================================================== */

SELECT

SUM(beauty_gmv) AS total_beauty_gmv,

SUM(fashion_gmv) AS total_fashion_gmv

FROM nykaa_dashboard_view;


/* ==========================================================
   11. BEAUTY SHARE VS FASHION SHARE
   ========================================================== */

SELECT

ROUND(
SUM(beauty_gmv)
/
(
SUM(beauty_gmv)
+
SUM(fashion_gmv)
)
*100,
2
) AS beauty_share_pct,

ROUND(
SUM(fashion_gmv)
/
(
SUM(beauty_gmv)
+
SUM(fashion_gmv)
)
*100,
2
) AS fashion_share_pct

FROM nykaa_dashboard_view;


/* ==========================================================
   12. BEAUTY VS FASHION CUSTOMER BASE
   ========================================================== */

SELECT
quarter,
beauty_mauv,
fashion_mauv
FROM nykaa_dashboard_view
ORDER BY quarter_order;


/* ==========================================================
   13. BEAUTY VS FASHION ORDERS
   ========================================================== */

SELECT
quarter,
beauty_orders,
fashion_orders
FROM nykaa_dashboard_view
ORDER BY quarter_order;


/* ==========================================================
   14. BEAUTY VS FASHION AOV
   ========================================================== */

SELECT
quarter,
beauty_aov,
fashion_aov
FROM nykaa_dashboard_view
ORDER BY quarter_order;


/* ==========================================================
   15. SEGMENT GMV TREND
   ========================================================== */

SELECT
quarter,
beauty_gmv,
fashion_gmv
FROM nykaa_dashboard_view
ORDER BY quarter_order;


/* ==========================================================
   16. EBITDA TREND
   ========================================================== */

SELECT
quarter,
ebitda_cr
FROM nykaa_dashboard_view
ORDER BY quarter_order;


/* ==========================================================
   17. PAT TREND
   ========================================================== */

SELECT
quarter,
pat_cr
FROM nykaa_dashboard_view
ORDER BY quarter_order;


/* ==========================================================
   18. EBITDA MARGIN TREND
   ========================================================== */

SELECT
quarter,
ebitda_margin
FROM nykaa_dashboard_view
ORDER BY quarter_order;


/* ==========================================================
   19. PAT MARGIN TREND
   ========================================================== */

SELECT
quarter,
pat_margin
FROM nykaa_dashboard_view
ORDER BY quarter_order;


/* ==========================================================
   20. REVENUE VS PROFIT RELATIONSHIP
   ========================================================== */

SELECT
quarter,
revenue_cr,
pat_cr
FROM nykaa_dashboard_view
ORDER BY revenue_cr;


/* ==========================================================
   21. BEST REVENUE QUARTER
   ========================================================== */

SELECT
quarter,
revenue_cr

FROM nykaa_dashboard_view

ORDER BY revenue_cr DESC

LIMIT 1;


/* ==========================================================
   22. BEST EBITDA MARGIN QUARTER
   ========================================================== */

SELECT
quarter,
ebitda_margin

FROM nykaa_dashboard_view

ORDER BY ebitda_margin DESC

LIMIT 1;


/* ==========================================================
   23. BEST PAT MARGIN QUARTER
   ========================================================== */

SELECT
quarter,
pat_margin

FROM nykaa_dashboard_view

ORDER BY pat_margin DESC

LIMIT 1;


/* ==========================================================
   24. TOTAL BUSINESS PERFORMANCE SUMMARY
   ========================================================== */

SELECT

SUM(revenue_cr) AS total_revenue,

SUM(ebitda_cr) AS total_ebitda,

SUM(pat_cr) AS total_pat,

SUM(total_mauv) AS total_customers,

SUM(total_orders) AS total_orders

FROM nykaa_dashboard_view;


/* ==========================================================
   25. BUSINESS RECOMMENDATION ANALYSIS
   ========================================================== */

SELECT
quarter,

beauty_orders,
fashion_orders,

beauty_aov,
fashion_aov,

beauty_gmv,
fashion_gmv

FROM nykaa_dashboard_view

ORDER BY quarter_order;


/* ==========================================================
   END OF ANALYSIS
   ========================================================== */