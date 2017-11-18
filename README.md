
<!-- README.md is generated from README.Rmd. Please edit that file -->
Note: John Mount, Win-Vector LLC, 11-17-2017
--------------------------------------------

[This repository](https://github.com/WinVector/addinexamplesWV) is a fork of [RStudio's original](https://github.com/rstudio/addinexamples).

Supplies [`insertDotPipeAddin()`](https://github.com/WinVector/addinexamplesWV/blob/master/R/insertDotPipeAddin.R) which inserts [`wrapr`](https://winvector.github.io/wrapr/)'s [`%.>%`](https://winvector.github.io/wrapr/articles/dot_pipe.html) ("dot pipe").

We have renamed the package and removed all other functionality so that this package does not interfere with installing and using the original package.

Installation
------------

The `R` code to install is below.

We first ensure that you have the latest versions of:

-   [devtools](https://github.com/hadley/devtools)
-   [htmltools](https://github.com/rstudio/htmltools)
-   [shiny](https://github.com/rstudio/shiny)
-   [miniUI](https://github.com/rstudio/miniUI)
-   [formatR](https://CRAN.R-project.org/package=formatR)
-   [wrapr](https://CRAN.R-project.org/package=wrapr)

``` r
if (!requireNamespace("devtools", quietly = TRUE)) {
  install.packages("devtools")
}
install.packages(c("htmltools", "shiny", "miniUI", "formatR", "wrapr"))
```

Then we install this package itself from GitHub:

``` r
# installing forked version instead of original "rstudio/addinexamples"
devtools::install_github("WinVector/addinexamples")
```

Finally bind "Insert `%.>%`" to `F9` (which has a right-facing glyph on some Mac keyboards) via `Tools->Addins->BrowseAddins->KeyboardShortCuts`.

Use
---

Once you have installed and configured all of the above you can press `F9` to insert "`%.>%`" where you are typing. "`%.>%`" is the `wrapr` "dot pipe" (an alternative to the [`magrittr`](https://CRAN.R-project.org/package=magrittr) `%>%` pipe). This allows easy conversion of nested function application into left to right sequential pipe notation.

For example:

``` r
sin(sqrt(exp(4)))
```

    ## [1] 0.893855

``` r
library("wrapr")

4 %.>% exp(.) %.>% sqrt(.) %.>% sin(.)
```

    ## [1] 0.893855

If you also bind "Insert `(.)`" to `F10` typing the above pipelines can become very fast and efficient.
