ALTER TABLE orders ADD CONSTRAINT orders_items_item_code FOREIGN KEY (item_code) REFERENCES items(item_code);
