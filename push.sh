#!/bin/sh

setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
}

commit_files() {
  git checkout -b travis-test2
  git add testdata
  git commit --message "Travis build: $TRAVIS_BUILD_NUMBER"
}

upload_files() {
  git remote add origin https://${GH_TOKEN}@github.com/KenardaPara/veriler.git > /dev/null 2>&1
  git push --set-upstream origin travis-test2
}

setup_git
commit_files
upload_files
