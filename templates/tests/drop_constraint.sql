ALTER TABLE items DROP {% if pg %}CONSTRAINT{% else %}INDEX{% endif %} items_item_name_unique{% if pg %} CASCADE{% endif %};
