{% if pg %}
UPDATE pg_database SET encoding = pg_char_to_encoding('UTF8') WHERE datname = '{{dbname}}';
REINDEX DATABASE {{dbname}};
{% else %}
ALTER TABLE orders CONVERT TO CHARACTER SET utf8 COLLATE utf8_unicode_ci;
{% endif %}
