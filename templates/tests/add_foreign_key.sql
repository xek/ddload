DELETE FROM orders WHERE item_name NOT IN (SELECT item_name FROM items);
ALTER TABLE orders ADD CONSTRAINT orders_items_item_name FOREIGN KEY (item_name) REFERENCES items(item_name);
