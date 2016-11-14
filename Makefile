# Node modules for CSS files
NODE_SASS=node ./node_modules/.bin/node-sass

# Node modules for JS files
ESLINT=node ./node_modules/.bin/eslint
UGLIFY_JS=node ./node_modules/.bin/uglifyjs

# Node modules for images
SVGO= node ./node_modules/.bin/svgo

build: fonts css js_pugin js_lint js
build_production: fonts css js_pugin js
clean: clean_css clean_js clean_fonts clean_images
initialise: install prepare build

install:
	@bundle i
	@npm i

# Prepare a new project
BASEPATH_RAILS_CSS=../app/assets/stylesheets/application.css

prepare:
	@mv $(BASEPATH_RAILS_CSS) $(BASEPATH_SRC_CSS)/application.scss

# Fonts
BASEPATH_DEST_FONTS=../public/_fonts
BASEPATH_PUGIN_FONTS=app/assets/fonts
BASEPATH_SRC_FONTS=../app/assets/fonts

clean_fonts:
	@rm -rf $(BASEPATH_DEST_FONTS)

fonts:
	@echo 'Copying fonts'
	@mkdir -p $(BASEPATH_DEST_FONTS) $(BASEPATH_SRC_FONTS) $(BASEPATH_PUGIN_FONTS)
	@cp -r {$(BASEPATH_PUGIN_FONTS)/.,$(BASEPATH_SRC_FONTS)/.} $(BASEPATH_DEST_FONTS)
	@echo 'Finished copying fonts'

# CSS
BASEPATH_DEST_CSS=../public/_css
BASEPATH_PUGIN_CSS=app/assets/stylesheets
BASEPATH_SRC_CSS=../app/assets/stylesheets

clean_css:
	@rm -rf $(BASEPATH_DEST_CSS)

css:
	@echo 'Compiling CSS'
	@mkdir -p $(BASEPATH_DEST_CSS)
	@$(NODE_SASS) $(BASEPATH_SRC_CSS) -o $(BASEPATH_DEST_CSS) --source-map $(BASEPATH_DEST_CSS) --quiet
	@node scripts/postbuild-css.js --directory $(BASEPATH_DEST_CSS)/**/*
	@echo 'Finished compiling CSS'

# JS
BASEPATH_DEST_JS=../public/_js
BASEPATH_PUGIN_JS=app/assets/javascripts
BASEPATH_SRC_JS=../app/assets/javascripts

clean_js:
	@rm -rf $(BASEPATH_DEST_JS)

js:
	@echo 'Compiling app JS'
	@mkdir -p $(BASEPATH_DEST_JS)
	@$(UGLIFY_JS) `find $(BASEPATH_SRC_JS) -type f -name "*.js"` -o $(BASEPATH_DEST_JS)/application.js --screw-ie8 --source-map $(BASEPATH_DEST_JS)/application.js.map --prefix 1 --source-map-url application.js.app
	@echo 'Finished compiling app JS'

js_pugin:
	@echo 'Compiling Pugin JS'
	@mkdir -p $(BASEPATH_DEST_JS)
	@$(UGLIFY_JS) `find $(BASEPATH_PUGIN_JS) -type f -name "*.js"` -o $(BASEPATH_DEST_JS)/pugin.js --screw-ie8 --source-map $(BASEPATH_DEST_JS)/pugin.js.map --prefix 1 --source-map-url pugin.js.app
	@echo 'Finished compiling Pugin JS'

js_lint:
	@echo 'Linting JS'
	@$(ESLINT) $(BASEPATH_SRC_JS)/**/*.js -c .eslintrc.js
	@echo 'Finished linting JS'

# Images
BASEPATH_DEST_IMAGES=../public/_img
BASEPATH_PUGIN_IMAGES=app/assets/images/pugin
BASEPATH_SRC_IMAGES=../app/assets/images

clean_images:
	@rm -rf $(BASEPATH_DEST_IMAGES)/pugin

images:
	@echo 'Copying images'
	@mkdir -p $(BASEPATH_DEST_IMAGES)
	@cp -a $(BASEPATH_PUGIN_IMAGES)/. $(BASEPATH_DEST_IMAGES)/pugin || :
	@cp -a $(BASEPATH_SRC_IMAGES)/. $(BASEPATH_DEST_IMAGES) || :
	@$(SVGO) -f $(BASEPATH_DEST_IMAGES)/** --enable=removeTitle
	@echo 'Finished copying images'

# Watcher
watch:
	@node scripts/watch.js "$(BASEPATH_PUGIN_CSS)/**/*" "$(BASEPATH_PUGIN_JS)/**/*" "$(BASEPATH_SRC_JS)/**/*" "$(BASEPATH_SRC_CSS)"
