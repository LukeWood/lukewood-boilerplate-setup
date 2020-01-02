all: deploy-client

none-unstaged-client:
	git diff-index --quiet HEAD

build-client:
	cd client/js_src && npm run build
	cd client && hugo

deploy-client: build-client none-unstaged-client
	git add -f client/public
	git commit -m "TEMP COMMIT WILL REMOVE"
	git subtree split --prefix client/public -b gh-pages
	git reset --soft HEAD~1
	git push -f origin gh-pages:gh-pages
	git branch -D gh-pages

require-host:
ifndef HOST
	$(error HOST is not set)
endif
	true
