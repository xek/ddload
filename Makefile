SOURCES=templates/tsung.xml
CONFIGS=pgsql mysql
TESTS=tsung-mysql tsung-pgsql

all: $(CONFIGS)

$(CONFIGS): $(SOURCES)
	python generate.py $@

$(TESTS):
	tsung -f $@.xml -m - start
