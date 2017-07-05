# Pugin Components Rails
[pugin-components-ruby][pugin-components-ruby] is a component-based pattern design library created by the [Parliamentary Digital Service][pds] that holds all of the reusable partials for elements of the UK Parliament's microservices.

[![Build Status][shield-travis]][info-travis] [![Test Coverage][shield-coveralls]][info-coveralls] [![License][shield-license]][info-license]

> **NOTE:** This gem is in active development and is likely to change at short notice. It is not recommended that you use this in any production environment.

### Contents
<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
  - [Example](#example)
  - [Adding the Parliamentary layout](#adding-the-parliamentary-layout)
    - [Including rel-alternate links](#including-rel-alternate-links)
      - [Example](#example-1)
- [Getting Started with Development](#getting-started-with-development)
  - [Running the tests](#running-the-tests)
- [Contributing](#contributing)
- [License](#license)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->


## Requirements
[pugin-components-ruby][pugin-components-ruby] requires the following:
* [Ruby][ruby] - [click here][ruby-version] for the exact version
* [Bundler][bundler]
* [Rails][rails]
* [HAML][haml]


## Installation
Within your rails application, add the below to your `Gemfile`.
```bash
gem 'pugin'
```


## Usage
This gem's main function is to expose front-end components and assets to the host application's asset pipeline.

Once you add the gem to your `Gemfile` run:
```bash
bundle install
```

Now all of the view components should be available within your host application.

### Example
```erb
<%= render partial: 'pugin/components/status' %>
```
### Adding the Parliamentary layout
Add the following line into the application controller within your host application
```erb
layout 'pugin/layouts/pugin'
```

#### Including rel-alternate links
When rendering using the Parliamentary layout, if you'd like to document rel-alternates like so:

```html
<link rel="alternate" type="application/rdf+json" href="https://api.example.com/some/url" />
<link rel="alternate" type="application/rdf+xml" href="https://api.example.com/some/other/url" />
```

You can do so automatically by setting `Pugin.alternates`.

##### Example
Within your controller:

```ruby
alternates = [
  { type: 'application/rdf+json', href: 'https://api.example.com/some/url' },
  { type: 'application/rdf+xml', href: 'https://api.example.com/some/other/url' }
]

Pugin.alternates = alternates
```


## Getting Started with Development
To clone the repository and set up the dependencies, run the following:
```bash
git clone https://github.com/ukparliament/pugin-components-ruby.git
cd pugin-components-ruby
bundle install
```

### Running the tests
We use [RSpec][rspec] as our testing framework and tests can be run using:
```bash
bundle exec rake
```


## Contributing
If you wish to submit a bug fix or feature, you can create a pull request and it will be merged pending a code review.

1. Fork the repository
1. Create your feature branch (`git checkout -b my-new-feature`)
1. Commit your changes (`git commit -am 'Add some feature'`)
1. Push to the branch (`git push origin my-new-feature`)
1. Ensure your changes are tested using [Rspec][rspec]
1. Create a new Pull Request


## License
[pugin-components-ruby][pugin-components-ruby] is licensed under the [Open Parliament Licence][info-license].

[ruby]:                   https://www.ruby-lang.org/en/
[bundler]:                http://bundler.io
[rspec]:                  http://rspec.info
[pugin-components-ruby]: 	https://github.com/ukparliament/parliament.uk-pugin-components-ruby
[pds]:                    https://www.parliament.uk/mps-lords-and-offices/offices/bicameral/parliamentary-digital-service/
[ruby-version]:           https://github.com/ukparliament/pugin/blob/master/.ruby-version
[rails]:                  http://rubyonrails.org
[haml]:                   http://haml.info

[info-travis]:            https://travis-ci.org/ukparliament/pugin
[shield-travis]:          https://img.shields.io/travis/ukparliament/pugin.svg

[info-coveralls]:         https://coveralls.io/github/ukparliament/pugin
[shield-coveralls]:       https://img.shields.io/coveralls/ukparliament/pugin.svg

[info-license]:           http://www.parliament.uk/site-information/copyright/open-parliament-licence/
[shield-license]:         https://img.shields.io/badge/license-Open%20Parliament%20Licence-blue.svg
