INSERT INTO used_table {% if pg %}DEFAULT VALUES{% else %}VALUES (){% endif %};
SELECT * FROM used_table;
SELECT rand{% if pg %}om{% endif %}();
