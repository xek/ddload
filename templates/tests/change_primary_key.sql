{% if pg %}
CREATE UNIQUE INDEX items_item_code_item_name ON items (item_code, item_name);
ALTER TABLE items DROP CONSTRAINT items_pkey CASCADE,
 ADD PRIMARY KEY USING INDEX items_item_code_item_name;
{% else %}
ALTER TABLE items DROP PRIMARY KEY, ADD PRIMARY KEY(item_code, item_name);
ALTER TABLE orders DROP FOREIGN KEY orders_items_item_code;
{% endif %}
ALTER TABLE orders ADD FOREIGN KEY (item_code, item_name) REFERENCES items(item_code, item_name);
