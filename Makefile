all: deploy-client

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

dev-server:
	tmux new-session -s dev -d "cd client && hugo server -D --disableFastRender"
	tmux new-window -t dev "cd client/js_src && npm run watch"
	tmux new-window -t dev "cd server/api && iex -S mix"
	tmux attach -t dev
