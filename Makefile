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
	$(eval TMPDIR := $(shell mktemp -d))
	@cp -r _site/. $(TMPDIR)/.; \
	 git checkout gh-pages || exit 1;\
	 rm -rf ./*; \
	 \cp -r $(TMPDIR)/. .; \
	 git commit -am "Deployment" || exit 1; \
	 git push --set-upstream origin gh-pages || exit 1; \
	 git checkout master
