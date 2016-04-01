{% if pg %}
UPDATE pg_database SET encoding = pg_char_to_encoding('UTF8') WHERE datname = 'test';
REINDEX DATABASE test;
{% else %}
ALTER TABLE orders CONVERT TO CHARACTER SET utf8 COLLATE utf8_unicode_ci;
{% endif %}
