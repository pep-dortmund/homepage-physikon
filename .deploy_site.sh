#!/bin/bash
set -e # exit with nonzero exit code if anything fails

# clear and re-create the out directory
if [[ $TRAVIS_BRANCH == 'main' ]] && [[ $TRAVIS_PULL_REQUEST = false ]]
then
	# add remote ssh-key to key-storage
	# first add remote host to known hosts
	ssh-keyscan -t rsa $DEPLOY_HOST 2> /dev/null | sort -u - ~/.ssh/known_hosts -o ~/.ssh/known_hosts
	# decrypt private shh key
	openssl aes-256-cbc -K  $encrypted_3fc62a950146_key -iv $encrypted_3fc62a950146_iv -in deploy_key.enc -out deploy_key -d


	# start ssh-agent and add the key
	eval "$(ssh-agent -s)"
	chmod 600 deploy_key
	ssh-add deploy_key

	rm -rf ~/out || exit 0;
	# compile the website
	bundle exec jekyll build -d ~/out --config _config.yml
	# upload site
	rsync -rq --delete --exclude=".*" ~/out/ $DEPLOY_USER@$DEPLOY_HOST:$DEPLOY_PATH
else
	echo "NOT ON MAIN BRANCH, WILL NOT DEPLOY SITE"
fi
