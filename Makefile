CONFIGS=pgsql mysql
SOURCES=$(wildcard templates/*.*)
TESTS=$(foreach sql,$(CONFIGS),$(addprefix tsung-$(sql)-,$(notdir $(basename $(wildcard templates/tests/*.sql)))))

all: $(TESTS)

open:
	python open.py

tsung-%: tsung-pgsql-% tsung-mysql-%

tsung-pgsql-%: pgsql-%
	mkdir -p tsung/pgsql-$*
	tsung -f tsung-pgsql-$*.xml -l tsung/pgsql-$* start

tsung-mysql-%: mysql-%
	mkdir -p tsung/mysql-$*
	tsung -f tsung-mysql-$*.xml -l tsung/mysql-$* start

pgsql-%: templates/tests/%.sql $(SOURCES)
	python generate.py pgsql $*

mysql-%: templates/tests/%.sql $(SOURCES)
	python generate.py mysql $*
