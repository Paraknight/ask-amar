# Directories
IN  = src
OUT = build

JADE_FILES = $(wildcard $(IN)/*.jade)
LSC_FILES  = $(wildcard $(IN)/*.ls)

# Compile Jade and LiveScript
all: jade lsc

jade: $(JADE_FILES:$(IN)/%.jade=$(OUT)/%.html)
lsc:  $(LSC_FILES:$(IN)/%.ls=$(OUT)/%.js)

# Compile modified Jade
$(OUT)/%.html: $(IN)/%.jade
	jade -o $(OUT) $^

# Compile modified LiveScript
$(OUT)/%.js: $(IN)/%.ls
	lsc -o $(OUT) $^

.PHONY: all jade lsc clean

clean:
	rm -rf $(OUT)
