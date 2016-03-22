SOURCES=templates/tsung.xml
CONFIGS=pgsql mysql

all: $(CONFIGS)

$(CONFIGS): $(SOURCES)
	python generate.py $@
