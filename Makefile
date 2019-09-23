.PHONY: serve build install

serve:
	@bundle exec jekyll serve --watch

build:
	@bundle exec jekyll build

install:
	@bundle install
