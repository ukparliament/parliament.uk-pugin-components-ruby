.PHONY: checkout_to_release deploy_to_release

# Github variables
GITHUB_API=https://api.github.com
ORG=ukparliament
REPO=parliament.uk-pugin-components-ruby
LATEST_REL=$(GITHUB_API)/repos/$(ORG)/$(REPO)/releases/latest
REL_TAG=$(shell curl -s $(LATEST_REL) | jq -r '.tag_name')

checkout_to_release:
	git checkout -b release $(REL_TAG)

deploy_to_release:
	gem build *.gemspec
	gem push *.gem
	rm *.gem
