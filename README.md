# Pugin
Pugin is a component-based pattern design library that holds all of the reusable partials, styles and scripts for elements of Parliamentary Digital Service microservices. It is named after the designer [Augustus Welby Northmore  Pugin](https://en.wikipedia.org/wiki/Augustus_Pugin), who provided designs for the interior of the Palace of Westminster.

## Installation
Instead of releasing Pugin on RubyGems.org and versioning twice, at Parliamentary Digital Service we use Pugin as a git submodule to keep versioning in once place.

To install:

1. `cd` into your consuming application directory
2. On your command line, run: `git submodule add https://github.com/ukpds/pugin.git pugin`. This will version a subfolder called _pugin_ in your consuming application directory.
3. Add the following into your Gemfile: `gem 'pugin', path: './pugin'`
4. On your command line, run: `bundle`
5. Run `make initialise -C pugin` from your application directory

## Usage
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

### CSS
When running `make initialise`, a Sass file is created in your application. You can import CSS from Pugin in here, which will be compiled when running `make css -C pugin` into your application root in a folder called `/public/_css`. Pugin replaces the Sprockets asset pipeline. You will need to reference the CSS file in your template.

For example, in your Sass file:
```css
@import "../../../pugin/app/assets/stylesheets/application";
@import "../../../pugin/app/assets/stylesheets/components/profile-card";
```

Then run `make css -C pugin`, and in your layout HTML:
```html
<link rel="stylesheet" type="text/css" href="/_css/application.css">
```

## Usage
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

### CSS
When running `make initialise`, a Sass file is created in your application. You can import CSS from Pugin in here, which will be compiled when running `make css -C pugin` into your application root in a folder called `/public/_css`. Pugin replaces the Sprockets asset pipeline. You will need to reference the CSS file in your template.

For example, in your Sass file:
```css
@import "../../../pugin/app/assets/stylesheets/application";
@import "../../../pugin/app/assets/stylesheets/components/profile-card";
```

Then run `make css -C pugin`, and in your layout HTML:
```html
<link rel="stylesheet" type="text/css" href="/_css/application.css">
```

## Contributing
To contribute to Pugin, please fork this repository and create a branch in your fork. When installing, specify the submodule repository to your fork to allow you to test whatever you build.

Following writing your code, please create a pull request into the Pugin repository. It will be reviewed by a member of the internal Parliamentary Digital Service team.

## Licence
The gem is available under the [Open Parliament Licence](http://www.parliament.uk/site-information/copyright/open-parliament-licence/).
