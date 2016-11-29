# Node modules for CSS files
NODE_SASS=node ./node_modules/.bin/node-sass

# Node modules for JS files
ESLINT=node ./node_modules/.bin/eslint
UGLIFY_JS=node ./node_modules/.bin/uglifyjs

# Node modules for images
SVGO= node ./node_modules/.bin/svgo

install:
	@bundle i
	@npm i
	@make loader

# JS
BASEPATH_DEST_JS=../public/_js

clean_js:
	@rm -rf $(BASEPATH_DEST_JS)

js:
	@echo 'Compiling JS'
	@mkdir -p $(BASEPATH_DEST_JS)
	@$(UGLIFY_JS) `find {$(GET_FROM)} -type f -name "*.js"` -o $(BASEPATH_DEST_JS)/application.js --source-map $(BASEPATH_DEST_JS)/application.js.map --source-map-url application.js.map
	@echo 'Finished compiling JS'

js_vendor:
	@echo 'Compiling vendor JS'
	@mkdir -p $(BASEPATH_DEST_JS)
	@$(UGLIFY_JS) $(GET_FROM) -o $(BASEPATH_DEST_JS)/vendor.js --screw-ie8 --source-map $(BASEPATH_DEST_JS)/vendor.js.map --prefix 1 --source-map-url vendor.js.map
	@echo 'Finished compiling vendor JS'

# Images
BASEPATH_DEST_IMAGES=../public/_img

clean_images:
	@rm -rf $(BASEPATH_DEST_IMAGES)

images: clean_images
	@echo 'Copying images'
	@mkdir -p $(BASEPATH_DEST_IMAGES)
	@cp -r {$(GET_FROM)} $(BASEPATH_DEST_IMAGES)
	@$(SVGO) -f $(BASEPATH_DEST_IMAGES) --enable=removeTitle
	@echo 'Finished copying images'

# Fonts
BASEPATH_DEST_FONTS=../public/_fonts

clean_fonts:
	@rm -rf $(BASEPATH_DEST_FONTS)

fonts: clean_fonts
	@echo 'Copying fonts'
	@mkdir -p $(BASEPATH_DEST_FONTS)
	@cp -r {$(GET_FROM)} $(BASEPATH_DEST_FONTS)
	@echo 'Finished copying fonts'

# CSS
BASEPATH_DEST_CSS=../public/_css

clean_css:
	@rm -rf $(BASEPATH_DEST_CSS)

css: clean_css
	@echo 'Compiling CSS'
	@mkdir -p $(BASEPATH_DEST_CSS)
	@$(NODE_SASS) $(GET_FROM) -o $(BASEPATH_DEST_CSS) --source-map $(BASEPATH_DEST_CSS) --quiet
	@node scripts/postbuild-css.js --directory $(BASEPATH_DEST_CSS)/**/*
	@echo 'Finished compiling CSS'

# MANIFEST POC
loader:
	@node scripts/pugin-loader.js
