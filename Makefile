SHELL=/bin/bash

install:
	yarn install --force --ignore-scripts


######################################################################

release: patch build publish

######################################################################

build:
	rm -rf ./dist
	yarn run release
	yarn run demo
	cp ./src/icons/LICENSE ./dist/icons/LICENSE
	cp ./src/icons/README.md ./dist/icons/README.md
	cp ./src/icons/package.json ./dist/icons/package.json
	cp ./dist/icons/icons.css ./dist/icons/icons.scss
	cp ./src/icons/README.md ./README.md
	cp ./src/icons/LICENSE ./LICENSE

patch:
	cd src/icons && yarn version --patch --no-git-tag-version --no-commit-hooks

minor:
	cd src/icons && yarn version --minor --no-git-tag-version --no-commit-hooks

major:
	cd src/icons && yarn version --major --no-git-tag-version --no-commit-hooks

publish:
	cd dist/icons && yarn pack && yarn publish --access public





