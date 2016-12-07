# Pugin
Pugin is a component-based pattern design library that holds all of the reusable partials, styles and scripts for elements of Parliamentary Digital Service microservices. It is named after the designer [Augustus Welby Northmore  Pugin](https://en.wikipedia.org/wiki/Augustus_Pugin), who provided designs for the interior of the Palace of Westminster.

## Installation
Instead of releasing Pugin on RubyGems.org and versioning twice, at Parliamentary Digital Service we use Pugin as a git submodule to keep versioning in once place.

To install:

1. `cd` into your consuming application directory
2. On your command line, run: `git submodule add https://github.com/ukparliament/pugin.git pugin`. This will version a subfolder called _pugin_ in your consuming application root.
3. Add the following into your Gemfile: `gem 'pugin', path: './pugin'`
4. On your command line, run: `bundle`
5. Run `make install -C pugin` from your application directory

## Usage
### pugin.json
References to directories to copy from or compile in are listed in a `pugin.json` file. This creates an easy way to see what files are being referenced and streamlines tasks such as JS minification and linting and copying multiple font sets easier. In `pugin.json`, you should specify Pugin's directories, and also your own apps directories to ensure they are run through the same compilation process. The keys for the arrays are the name of the task to be run.
For example:
```json
{
  "images": [
    "./pugin/app/assets/images",
    "./app/assets/images"
  ],
  "js": [
    "./pugin/app/assets/javascripts",
    "./app/assets/javascripts"
  ],
  "fonts": [
    "./pugin/app/assets/fonts",
    "./app/assets/fonts"
  ],
  "css": [
    "./app/assets/stylesheets"
  ]
}
```

The exception here is CSS, which you just specify your host apps stylesheet directory, where you should have a Sass file that imports Pugin's CSS, as shown below.

### CSS
When running `make install`, an example Sass file is created in your application. You can import CSS from Pugin in here, which will be compiled when running `make build -C pugin TASK=css` into your application root in a folder called `/public/_css`. Pugin replaces the Sprockets asset pipeline. You will need to reference the CSS file in your template.

For example, in your Sass file:
```css
@import "../../../pugin/app/assets/stylesheets/application";
@import "../../../pugin/app/assets/stylesheets/components/profile-card";
```

Then run `make build -C pugin TASK=css`, and in your layout HTML:
```html
<link rel="stylesheet" type="text/css" href="/_css/application.css">
```

### Browsersync and Watch tasks
At UK Parliament, we use Browsersync, which works hand in hand with our `watch` task. To run this, create two new Terminal instances. When in the host app directory, run `make browsersync -C pugin` in one window and `make watch -C pugin` in the other. When you edit a file, for instance a JavaScript file, the watch task will pick up the change and run the appropriate task (in this case, `make js`). Browsersync will then pick up that the compiled file has changed and will inject the change into your page.

### Individual tasks
You can run individual tasks through the build pipeline by running `make build -C pugin TASK={taskname}`. To see what tasks are available to run, checkout the [Makefile](https://github.com/ukparliament/pugin/blob/development/Makefile).

### Partials
To render a component partial, you can call either of the following:
```ruby
PUGIN.get_component_by_model('template_name', object)
PUGIN.get_component_by_single('template_name', singular_hash)
```
An example is:
```ruby
PUGIN.get_component_by_model('modules/profile-card', @person)
PUGIN.get_component_by_single('modules/profile-card', {member_name: "Jane Ivy"})
```
N.B. Both methods accept empty data inputs.

## Contributing
To contribute to Pugin, please fork this repository and create a branch in your fork. When installing, specify the submodule repository to your fork to allow you to test whatever you build.

Following writing your code, please create a pull request into the Pugin repository. It will be reviewed by a member of the internal Parliamentary Digital Service team.

## Licence
The gem is available under the [Open Parliament Licence](http://www.parliament.uk/site-information/copyright/open-parliament-licence/).
