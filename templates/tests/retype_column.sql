ALTER TABLE orders {% if pg %}ALTER COLUMN ord_qty TYPE bigint USING ord_qty::bigint{% else %}MODIFY ord_qty INTEGER{% endif %};
