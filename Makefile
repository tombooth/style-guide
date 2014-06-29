
BUILD_DIR=build/

SCSS_FILES=$(shell find src -iname *.scss)

.PHONY: clean css

css: $(SCSS_FILES)
	mkdir -p $(BUILD_DIR)
	node-sass --output-style="nested" --inculde-path=src/ src/bundle.scss $(BUILD_DIR)bundle.css
	node-sass --output-style="compressed" --inculde-path=src/ src/bundle.scss $(BUILD_DIR)bundle.min.css

watch:
	fswatch -or src/ | xargs -n1 -I{} make css

serve: css
	python -m SimpleHTTPServer

clean:
	rm -rf $(BUILD_DIR)
