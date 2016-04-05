ALTER TABLE orders ADD CONSTRAINT orders_items_item_name FOREIGN KEY (item_name) REFERENCES items(item_name);
