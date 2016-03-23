INSERT INTO gens {% if pg %}DEFAULT VALUES{% else %}VALUES (){% endif %};
SELECT * FROM gens;
SELECT * FROM te;
