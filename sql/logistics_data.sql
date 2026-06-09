
SELECT *
FROM logistics_data
LIMIT 10;


--Total Revenue
SELECT
    ROUND(SUM("Sales")) AS total_revenue
FROM logistics_data;

--Total Orders
SELECT
    COUNT(DISTINCT "Order Id") AS total_orders
FROM logistics_data;

--Revenue by Market
SELECT
    "Market",
    ROUND(SUM("Sales")) AS revenue
FROM logistics_data
GROUP BY "Market"
ORDER BY revenue DESC;

--Top 10 Revenue Regions
SELECT
    "Order Region",
    ROUND(SUM("Sales")) AS revenue
FROM logistics_data
GROUP BY "Order Region"
ORDER BY revenue DESC
LIMIT 10;

--Top 10 Profitable Regions
SELECT
    "Order Region",
    ROUND(SUM("Order Profit Per Order")) AS profit
FROM logistics_data
GROUP BY "Order Region"
ORDER BY profit DESC
LIMIT 10;

--Revenue by Customer Segment
SELECT
    "Customer Segment",
    ROUND(SUM("Sales")) AS revenue
FROM logistics_data
GROUP BY "Customer Segment"
ORDER BY revenue DESC;

--Profit by Customer Segment
SELECT
    "Customer Segment",
    ROUND(SUM("Order Profit Per Order")) AS profit
FROM logistics_data
GROUP BY "Customer Segment"
ORDER BY profit DESC;

--Late Delivery Rate
SELECT
ROUND(
100.0 *
SUM(CASE
WHEN "Late_delivery_risk" = 1
THEN 1 ELSE 0 END)
/ COUNT(*)
,2) AS late_delivery_rate
FROM logistics_data;

--Shipping Mode Performance
SELECT
    "Shipping Mode",
    COUNT(*) AS total_orders,
    ROUND(
        AVG("Days for shipping (real)")
    ,2) AS avg_shipping_days
FROM logistics_data
GROUP BY "Shipping Mode"
ORDER BY avg_shipping_days;

--Top Product Categories by Revenue
SELECT
    "Category Name",
    ROUND(SUM("Sales")) AS revenue
FROM logistics_data
GROUP BY "Category Name"
ORDER BY revenue DESC;

--Top Product Categories by Profit
SELECT
    "Category Name",
    ROUND(SUM("Order Profit Per Order")) AS profit
FROM logistics_data
GROUP BY "Category Name"
ORDER BY profit DESC;

--Top 10 Products by Revenue
SELECT
    "Product Name",
    ROUND(SUM("Sales")) AS revenue
FROM logistics_data
GROUP BY "Product Name"
ORDER BY revenue DESC
LIMIT 10;

--Top 10 Products by Profit
SELECT
    "Product Name",
    ROUND(SUM("Order Profit Per Order")) AS profit
FROM logistics_data
GROUP BY "Product Name"
ORDER BY profit DESC
LIMIT 10;
--
--Countries with Highest Revenue
SELECT
    "Order Country",
    ROUND(SUM("Sales")) AS revenue
FROM logistics_data
GROUP BY "Order Country"
ORDER BY revenue DESC
LIMIT 10;

--Countries with Highest Profit
SELECT
    "Order Country",
    ROUND(SUM("Order Profit Per Order")) AS profit
FROM logistics_data
GROUP BY "Order Country"
ORDER BY profit DESC
LIMIT 10;

--Profit Margin by Category
SELECT
    "Category Name",

    ROUND(
        SUM("Order Profit Per Order")
        /
        SUM("Sales") * 100
    ) AS profit_margin_pct

FROM logistics_data
GROUP BY "Category Name"
ORDER BY profit_margin_pct DESC;

--Top Growth Opportunities
SELECT
    "Order Region",

    ROUND(SUM("Sales")) AS revenue,

    ROUND(
        SUM("Order Profit Per Order")
    ) AS profit

FROM logistics_data

GROUP BY "Order Region"

ORDER BY profit DESC;