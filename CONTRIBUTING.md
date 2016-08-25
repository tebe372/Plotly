# Contributing to plotly.js

## Opening issues

See the [opening issues template](https://github.com/ropensci/plotly/blob/master/.github/ISSUE_TEMPLATE.md)

## Development guidelines

If you'd like to contribute changes to plotly, we use [the GitHub flow](https://guides.github.com/introduction/flow/index.html) for proposing, submitting, reviewing, and accepting changes. If you haven't done this before, Hadley Wickham provides a nice overview of git (<http://r-pkgs.had.co.nz/git.html>), as well as best practices for submitting pull requests (<http://r-pkgs.had.co.nz/git.html#pr-make>). We also recommend using his style guide when writing code (<http://adv-r.had.co.nz/Style.html>).

If your pull request fixes a bug, or implements a new feature, it's a good idea to write a test (<http://r-pkgs.had.co.nz/tests.html>) to demonstrate it's working. If you'd like to closely simulate the tests that run when you submit your pull request, open R under your local plotly git repo, then do the following:

```r
# the pull request number is arbitrary when running locally
Sys.setenv('TRAVIS_PULL_REQUEST' = '1')
Sys.setenv('TRAVIS_COMMIT' = substr(system('git rev-parse HEAD', intern = T), 1, 7))
devtools::load_all(); source('tests/testthat.R', chdir = TRUE)
```

You can also build a ggplot2/plotly comparison table. To do so, you'll first need to clone the [plotly-test-table](https://github.com/cpsievert/plotly-test-table) repo.

```shell
$ git clone https://github.com/cpsievert/plotly-test-table.git ../plotly-test-table
```

Then, from R:

```r
Sys.setenv('PLOTLY_TABLE' = 'TRUE')
devtools::load_all(); source('tests/testthat.R', chdir = TRUE)
```

## Code of Conduct

We want to encourage a warm, welcoming, and safe environment for contributing to this project. See the [code of conduct](https://github.com/ropensci/plotly/blob/master/CONDUCT.md) for more information.
