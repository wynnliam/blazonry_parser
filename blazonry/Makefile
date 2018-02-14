SRC= ./src/blazonry/*.java
OUT= ./bin/

.PHONY: run clean

all: $(SRC)
	javac $(SRC) -g -d $(OUT)

run:
	cd bin; java blazonry/Blazonry

clean:
	rm -rf $(OUT)/*
