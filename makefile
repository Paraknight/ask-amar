# Directories
IN  = src
OUT = build

JADE_FILES = $(wildcard $(IN)/*.jade)
STYL_FILES = $(wildcard $(IN)/*.styl)
LSC_FILES  = $(wildcard $(IN)/*.ls)

# Compile Jade, Stylus, and LiveScript
all: jade styl lsc

jade: $(JADE_FILES:$(IN)/%.jade=$(OUT)/%.html)
styl: $(STYL_FILES:$(IN)/%.styl=$(OUT)/%.css)
lsc:  $(LSC_FILES:$(IN)/%.ls=$(OUT)/%.js)

# Compile modified Jade
$(OUT)/%.html: $(IN)/%.jade
	jade -o $(OUT) $^

# Compile modified Stylus
$(OUT)/%.css: $(IN)/%.styl
	stylus -o $(OUT) $^

# Compile modified LiveScript
$(OUT)/%.js: $(IN)/%.ls
	lsc -o $(OUT) $^

.PHONY: all jade styl lsc clean

clean:
	rm -rf $(OUT)
