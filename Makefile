
BUILD_DIR=build/

THEME_FILES=$(shell find src/theme -iname *.scss | sed -E 's/^(.*)\.scss$$/\1.css/g')

.PHONY: clean css

css:
	mkdir -p $(BUILD_DIR)
	node-sass --output-style="nested" --inculde-path=src/ src/bundle.scss $(BUILD_DIR)bundle.css
	node-sass --output-style="compressed" --inculde-path=src/ src/bundle.scss $(BUILD_DIR)bundle.min.css

%.css: %.scss
	mkdir -p $(BUILD_DIR)theme
	node-sass --output-style="nested" --include-path=src/ $< $(BUILD_DIR)theme/$$(basename $@)

themes: $(THEME_FILES)

watch:
	fswatch -or src/ | xargs -n1 -I{} make css

serve: css themes
	python -m SimpleHTTPServer

clean:
	rm -rf $(BUILD_DIR)
