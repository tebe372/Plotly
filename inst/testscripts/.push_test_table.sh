#!/bin/bash

# exit on error
set -e

# -----------------------------------------------------------------------
# When pushing to a pull request on GitHub, Travis does two builds:
# (1) One for the pull request itself. In this case, $TRAVIS_PULL_REQUEST 
# is 'false' and $TRAVIS_BRANCH contains the branch name
# (2) One to *simulate* a merge with master. In this case, $TRAVIS_PULL_REQUEST
# is the pull ID number and $TRAVIS_BRANCH = 'master'
# 
# Read more about Travis environment variables --
# http://docs.travis-ci.com/user/ci-environment/
# -----------------------------------------------------------------------

# We need the pull request number to talk to the GitHub API, make comments, etc.
[ "${TRAVIS_PULL_REQUEST}" = "false" ] && exit 0

git config --global user.name "cpsievert"
git config --global user.email "cpsievert1@gmail.com"

# Since Travis does `git clone --branch=$TRAVIS_BRANCH --depth=50`, 
# we can't simply `git checkout master`. As far as I can tell, we are
# forced to re-clone -- https://gist.github.com/cpsievert/698c7f1404f972782e71

cd ..
rm -rf plotly/
git clone https://github.com/ropensci/plotly.git
git clone https://github.com/ropensci/plotly-test-table.git
cd plotly-test-table
git checkout gh-pages

Rscript ../plotly/inst/testscripts/comment.R $TRAVIS_PULL_REQUEST $TRAVIS_BUILD_ID $GH_TOKEN
