INSERT INTO unused_table {% if pg %}DEFAULT VALUES{% else %}VALUES (){% endif %};

INSERT INTO vendors(vendor_code, vendor_name, vendor_city, vendor_country)
SELECT * FROM (SELECT %%_id1%% AS id1, '%%_str1%%' AS str1,
 '%%_str2%%' AS str2, '%%_str3%%' AS str3) AS tmp
WHERE NOT EXISTS (SELECT * FROM vendors
 WHERE vendor_code = %%_id1%% OR vendor_name = '%%_str1%%');

INSERT INTO items(
  item_code, item_name, purchase_unit, sale_unit, purchase_price, sale_price)
SELECT * FROM (SELECT %%_id1%% AS id1, '%%_str1%%' AS str1,
 '%%_str2%%' AS str2, '%%_str3%%' AS str3,
 %%_int1%%.%%_int3%% AS i1i3, %%_int2%%.%%_int3%% AS i2i3) AS tmp
WHERE NOT EXISTS (
 SELECT * FROM items WHERE item_code = %%_id1%% OR item_name = '%%_str1%%');

INSERT INTO orders(
 ord_no, ord_date, item_code, item_name, item_grade, ord_qty, ord_amount)
SELECT * FROM (SELECT
 %%_id2%% AS id2, now() AS dte, %%_id1%% AS id1, '%%_str1%%' AS str1,
 'A' AS a, %%_int3%% AS i3, %%_int1%% AS i1) AS tmp
WHERE NOT EXISTS (SELECT * FROM orders WHERE ord_no = %%_id2%%)
 AND EXISTS (SELECT * FROM items WHERE item_code = %%_id1%%);
