
<!-- README.md is generated from README.Rmd. Please edit that file -->
[This repository](https://github.com/WinVector/addinexamplesWV) is a fork of [RStudio's original](https://github.com/rstudio/addinexamples). We have renamed the package and removed all other functionality so that this package does not interfere with installing and using the original package. The original did not provide the pipe add-in shortcuts we discuss below.

This package supplies the following [RStudio add-ins](https://rstudio.github.io/rstudioaddins/):

-   **"Insert `%.>%`"** inserts "`%.>%`" ([`wrapr`](https://winvector.github.io/wrapr/)'s ["dot arrow pipe"](https://winvector.github.io/wrapr/articles/dot_pipe.html)")
-   **"Insert `(.)`"** inserts "`(.)`" ("argument stand-in")
-   **"Insert `->.;`"** inserts "`->.;`" (["Bizarro pipe"](http://www.win-vector.com/blog/2016/12/magrittrs-doppelganger/))
-   **"Insert `:=`"** inserts "`:=`" ([`wrapr`](https://winvector.github.io/wrapr/)'s ["named map builder"](https://winvector.github.io/wrapr/reference/named_map_builder.html))
-   **"Insert `%>.%`"** inserts "`%>.%`" ([`wrapr`](https://winvector.github.io/wrapr/)'s ["to dot pipe"](https://winvector.github.io/wrapr/reference/grapes-greater-than-.-grapes.html)")
-   **"Insert `%>%`"** inserts "`%>%`" (["Magrittr pipe"](https://CRAN.R-project.org/package=magrittr), also usually available as a separate RStudio editor binding as `Shift-ALT-m`)
-   **"Insert `%<>%`"** inserts "`%<>%`" (["Magrittr compound pipe"](https://CRAN.R-project.org/package=magrittr))
-   **"Insert `%<-%`"** inserts "`%<-%`" (["Zealot assign"](https://CRAN.R-project.org/package=zeallot))

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

Basically:

-   You type a function name and then press `F10`. This gives you the template for function arguments which you either leave alone (if the function only takes one argument) or edit to add in the additional arguments you need. This replaces pressing space after you type in a function name.
-   You press `F9` when you are done with a pipeline step and then enter or return.

Try the above in the RStudio editor and the RStudio console, it works really well both places.

Bizarro pipe can be used the same way as we just used dot pipe (but does not require any package for implementation, as it is an emergent behavior of pre-existing base-`R` semantics):

``` r
4 ->.;
    exp(.) ->.;
    sqrt(.) ->.;
    sin(.)
```

    ## [1] 0.893855

Be aware that the value of a Bizarro pipeline comes off the right bottom end of the pipeline (not the top left end as with dot pipe). So to pick up the Bizarro pipeline value you need to use a right assignment of the form `->` at the end of the pipeline (or use `{}`). This is, however, one of the features that makes [Bizarro pipe superior for step debugging](http://www.win-vector.com/blog/2017/01/using-the-bizarro-pipe-to-debug-magrittr-pipelines-in-r/).

Both of these pipes also work with more complicated function signatures, and with [`dplyr`](https://CRAN.R-project.org/package=dplyr):

``` r
# assuming you have dplyr installed
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
    ##   name           mean_height
    ##   <chr>                <dbl>
    ## 1 Luke Skywalker        172.
    ## 2 Han Solo              180.

Another set of good choices for binding are:

-   `Alt-Enter` for "Insert `%.>%`" (or even `Alt-;`)
-   `Alt-Space` for "Insert `(.)`"
-   `Alt-=` for "Insert `:=`".

That way you are treating the argument list as a space-like separator and the pipe symbol as a line-end-like separator.

User mappings
-------------

Three user controllable add-ins are registered as part of this package: `insert usr1`, `insert usr2`, and `insert usr3`. The user at run-time can change what function is called when the add-in is activated. For example to re-bind the first user add-in to insert `:=` run the following `R` code:

``` r
options("addinexamplesWV.usrFn1" = function() { rstudioapi::insertText(" := ") })
```

This allows changing settings without rebuilding the package.
