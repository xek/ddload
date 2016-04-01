ALTER TABLE orders DROP {% if pg %}CONSTRAINT{% else %}FOREIGN KEY{% endif %} orders_items_item_code;
