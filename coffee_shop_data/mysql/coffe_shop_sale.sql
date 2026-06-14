create database coffee_shop_sale
use coffee_shop_sale;
go
select name from sys.tables;
select * from coffee_shop_sales;

UPDATE coffee_shop_sales
SET transaction_date = CONVERT(datetime, transaction_date,103);

UPDATE coffee_shop_sales
SET transaction_time = CONVERT(datetime, transaction_time,120);

ALTER TABLE coffee_shop_sales
ALTER COLUMN transaction_date DATE;

ALTER TABLE coffee_shop_sales
ALTER COLUMN transaction_time TIME;

ALTER TABLE coffee_shop_sales
ALTER COLUMN transaction_qty INT;
--Tong doanh thu tung thang
SELECT ROUND(SUM (unit_price * transaction_qty),1) AS Total_sales
FROM coffee_shop_sales
WHERE
MONTH(transaction_date) = 5 --May Month

--Selected Month
SELECT	
MONTH(transaction_date) AS month,
ROUND(SUM(unit_price * transaction_qty)) AS total_sales,
FROM coffee_shop_sales
WH
(SUM(unit_price * transaction_qty) - LAG(SUM(unit_price * transaction_qty),1)
Over ( order by month(transaction_date))) / LAG(SUM(unit_price * transaction_qty)1)
over ( order by month(transaction_sate))) * 100 AS mom_increase_percentage
from
	coffee_shop_sales
where
MONTH(transaction_date) IN (4,5) --cac thang can tinh
GROUP BY
MONTH(transaction_date)
ORDER BY
MONTH(transaction_date);



EXEC sp_help coffee_shop_sales;