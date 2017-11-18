
<!-- README.md is generated from README.Rmd. Please edit that file -->
Note: John Mount, Win-Vector LLC, 11-17-2017
--------------------------------------------

[This repository](https://github.com/WinVector/addinexamplesWV) is a fork of [RStudio's original](https://github.com/rstudio/addinexamples). We have renamed the package and removed all other functionality so that this package does not interfere with installing and using the original package.

This package supplies the following [RStudio add-ins](https://rstudio.github.io/rstudioaddins/):

-   **"Insert `%.>%`"** which inserts "`%.>%`" ([`wrapr`](https://winvector.github.io/wrapr/)'s ["dot pipe"](https://winvector.github.io/wrapr/articles/dot_pipe.html)")
-   **"Insert `(.)`"** which inserts "`(.)`" ("argument stand-in").
-   **"Insert `->.;`"** which inserts "`->.;`" (["Bizarro pipe"](http://www.win-vector.com/blog/2016/12/magrittrs-doppelganger/))
-   **"Insert `%>%`"** which inserts "`%>%`" (["Magrittr pipe"](https://CRAN.R-project.org/package=magrittr))

The above are useful when bound to keyboard shortcuts in [RStudio](https://www.rstudio.com/products/RStudio/).

Installation
------------

The `R` code to install is below.

We first ensure that you have the latest [CRAN](https://cran.r-project.org) release versions of:

-   [devtools](https://github.com/hadley/devtools)
-   [htmltools](https://github.com/rstudio/htmltools)
-   [shiny](https://github.com/rstudio/shiny)
-   [miniUI](https://github.com/rstudio/miniUI)
-   [formatR](https://CRAN.R-project.org/package=formatR)
-   [wrapr](https://CRAN.R-project.org/package=wrapr)

``` r
install.packages(c("devtools", "htmltools", "shiny", 
                   "miniUI", "formatR", "wrapr"))
```

Then we install this package itself from GitHub:

``` r
devtools::install_github("WinVector/addinexamples")
```

Finally bind "Insert `%.>%`" to `F9` (which has a right-facing glyph on some Mac keyboards) via `Tools->Addins->BrowseAddins->KeyboardShortCuts`.

Use
---

Once you have installed and configured all of the above you can press `F9` to "Insert `%.>%`" where you are typing. "`%.>%`" is the `wrapr` "dot pipe" (an alternative to the [`magrittr`](https://CRAN.R-project.org/package=magrittr) `%>%` pipe). This allows easy conversion of nested function application into left to right sequential pipe notation.

For example:

``` r
sin(sqrt(exp(4)))
```

    ## [1] 0.893855

``` r
library("wrapr")

4 %.>%
    exp(.) %.>%
    sqrt(.) %.>%
    sin(.)
```

    ## [1] 0.893855

Dot pipe insists on explicit marking of function arguments with "`.`". If you also bind "Insert `(.)`" to `F10` typing the above pipelines can become *very* fast and efficient.

Bizarro pipe works similarly (but does not require any package for implementation, as it is an emergent behavior of pre-existing base-`R` semantics):

``` r
4 ->.;
    exp(.) ->.;
    sqrt(.) ->.;
    sin(.)
```

    ## [1] 0.893855

Both of these pipes also work with more complicated function signatures, and with [`dplyr`](https://CRAN.R-project.org/package=dplyr):

``` r
suppressPackageStartupMessages(library("dplyr"))

starwars %.>%
    group_by(., name) %.>%
    summarize(., mean_height = mean(height)) %.>%
    ungroup(.) %.>%
    left_join(data_frame(name = c("Han Solo", 
                                "Luke Skywalker")), 
            ., 
            by = 'name') %.>%
    arrange(., desc(name))
```

    ## # A tibble: 2 x 2
    ##             name mean_height
    ##            <chr>       <dbl>
    ## 1 Luke Skywalker         172
    ## 2       Han Solo         180
