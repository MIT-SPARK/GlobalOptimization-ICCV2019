.PHONY: serve clean build install deploy

DEPLOY_BRANCH="gh-pages"

serve:
	@bundle exec jekyll serve --watch

build:
	@bundle exec jekyll build

clean:
	rm -r _site

install:
	@bundle install

deploy: build
	@git push origin `git subtree split --prefix _site master`:gh-pages --force
