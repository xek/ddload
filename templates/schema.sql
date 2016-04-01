CREATE TABLE unused_table (id serial primary key);
CREATE TABLE used_table (id serial primary key);

CREATE TABLE vendors (
 vendor_code integer PRIMARY KEY,
 vendor_name character(35),
 vendor_city character(15),
 vendor_country character(20)
);

CREATE INDEX vendors_vendor_name_idx ON vendors (vendor_name);

CREATE TABLE items (
 item_code integer,
 item_name character(35),
 purchase_unit character(10),
 sale_unit character(10),
 purchase_price numeric(10,2),
 sale_price numeric(10,2),
 PRIMARY KEY (item_code)
);

ALTER TABLE items ADD CONSTRAINT items_item_name_unique UNIQUE (item_name);

CREATE TABLE orders (
 ord_no integer PRIMARY KEY,
 ord_date date,
 item_code integer,
 item_grade character(1),
 ord_qty numeric,
 ord_amount numeric
);
ALTER TABLE orders ADD CONSTRAINT orders_items_item_code FOREIGN KEY (item_code) REFERENCES items(item_code);
