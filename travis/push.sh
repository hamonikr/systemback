#!/bin/sh

setup_git() {
  git config --global user.email "root@hamonikr.org"
  git config --global user.name "hamonikr"
}

commit_deb_files() {
  git checkout -b deploy
  mkdir packages && mv ../*.deb packages/
  git add packages/*
  git commit --message "Travis build: $TRAVIS_BUILD_NUMBER"
}

upload_files() {
  git remote add new https://${GH_TOKEN}@github.com/hamonikr/systemback.git > /dev/null 2>&1
  git push new deploy
}

setup_git
commit_deb_files
upload_files
