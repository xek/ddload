{% if pg %}
CREATE UNIQUE INDEX orders_item_code_item_name ON items (item_code, item_name);
ALTER TABLE items DROP CONSTRAINT items_pkey;
ALTER TABLE items ADD PRIMARY KEY USING INDEX orders_item_code_item_name;
{% else %}
ALTER TABLE items DROP PRIMARY KEY, ADD PRIMARY KEY(item_code, item_name);
{% endif %}
