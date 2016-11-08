# Node modules for CSS files
NODE_SASS=node ./node_modules/.bin/node-sass

# Node modules for JS files
ESLINT=node ./node_modules/.bin/eslint
UGLIFY_JS=node ./node_modules/.bin/uglifyjs

# Basepaths
# CSS
BASEPATH_DEST_CSS=../public/_css
BASEPATH_PUGIN_CSS=assets/css
BASEPATH_RAILS_CSS=../app/assets/stylesheets/application.css
BASEPATH_SRC_CSS=../app/assets/stylesheets
# JS
BASEPATH_DEST_JS=../public/_js
BASEPATH_PUGIN_JS=assets/js
BASEPATH_SRC_JS=../app/assets/javascripts
# Fonts
BASEPATH_DEST_FONTS=../public/_fonts
BASEPATH_SRC_FONTS=app/assets/fonts

build: fonts css js_vendor js_pugin js_lint js
build_production: fonts css js_vendor js_pugin js
clean: clean_css clean_js clean_fonts
initialise: prepare build

clean_css:
	@rm -rf $(BASEPATH_DEST_CSS)

clean_fonts:
	@rm -rf $(BASEPATH_DEST_FONTS)

clean_js:
	@rm -rf $(BASEPATH_DEST_JS)

css:
	@echo 'Compiling CSS'
	@mkdir -p $(BASEPATH_DEST_CSS)
	@$(NODE_SASS) $(BASEPATH_SRC_CSS) -o $(BASEPATH_DEST_CSS) --source-map $(BASEPATH_DEST_CSS) --quiet
	@node scripts/postbuild-css.js --directory $(BASEPATH_DEST_CSS)/**/*
	@echo 'Finished compiling CSS'

fonts:
	@echo 'Copying fonts'
	@mkdir -p $(BASEPATH_DEST_FONTS)
	@cp -a $(BASEPATH_SRC_FONTS)/. $(BASEPATH_DEST_FONTS) || :
	@echo 'Finished copying fonts'

js:
	@echo 'Compiling app JS'
	@mkdir -p $(BASEPATH_DEST_JS)
	@$(UGLIFY_JS) `find $(BASEPATH_SRC_JS) -type f -name "*.js"` -o $(BASEPATH_DEST_JS)/application.js --source-map $(BASEPATH_DEST_JS)/application.js.map --prefix 1 --source-map-url application.js.app
	@echo 'Finished compiling app JS'

js_pugin:
	@echo 'Compiling Pugin JS'
	@mkdir -p $(BASEPATH_DEST_JS)
	@$(UGLIFY_JS) `find $(BASEPATH_PUGIN_JS) -type f -name "*.js"` -o $(BASEPATH_DEST_JS)/pugin.js --source-map $(BASEPATH_DEST_JS)/pugin.js.map --prefix 1 --source-map-url pugin.js.app
	@echo 'Finished compiling Pugin JS'

js_lint:
	@echo 'Linting JS'
	@$(ESLINT) $(BASEPATH_SRC_JS)/**/*.js -c .eslintrc.js
	@echo 'Finished linting JS'

prepare:
	@mv $(BASEPATH_RAILS_CSS) $(BASEPATH_SRC_CSS)/application.scss
	@npm i

watch:
	@node scripts/watch.js "$(BASEPATH_PUGIN_CSS)/**/*" "$(BASEPATH_PUGIN_JS)/**/*"
