#!/bin/sh

setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
}

commit_files() {
  git add besdata
  git commit --message "Data Updated: $TRAVIS_BUILD_NUMBER"
}

upload_files() {
  git remote add origin https://${GH_TOKEN}@github.com/KenardaPara/veriler.git 
  git push origin master
}

if [ "$TRAVIS_EVENT_TYPE" = "cron" ] ; then
    setup_git
    commit_files
    upload_files
fi
   
