
BUILD_DIR=build/

SCSS_FILES=$(shell find src -iname *.scss)

.PHONY: clean css

css: $(SCSS_FILES)
	mkdir -p $(BUILD_DIR)
	node-sass --output-style="nested" src/bundle.scss $(BUILD_DIR)bundle.css
	node-sass --output-style="compressed" src/bundle.scss $(BUILD_DIR)bundle.min.css

serve: css
	python -m SimpleHTTPServer

clean:
	rm -rf $(BUILD_DIR)
