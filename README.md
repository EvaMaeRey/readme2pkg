
  - [{readme2pkg} lets you send code chunks to .R files in a project
    subdirectory.](#readme2pkg-lets-you-send-code-chunks-to-r-files-in-a-project-subdirectory)
      - [Background and motivation](#background-and-motivation)
      - [Other’s reflecting on how it might be difficult to find the
        ‘narrative’ from an R
        package](#others-reflecting-on-how-it-might-be-difficult-to-find-the-narrative-from-an-r-package)
  - [More great package building resources to be aware
    of](#more-great-package-building-resources-to-be-aware-of)
  - [How we make and use {readme2pkg}](#how-we-make-and-use-readme2pkg)
  - [Part 0. Presteps](#part-0-presteps)
      - [A. created a github repository,
        e.g. <https://github.com/EvaMaeRey/readme2pkg>](#a-created-a-github-repository-eg-httpsgithubcomevamaereyreadme2pkg)
      - [B. create a local directory ("coolest\_pkg) via projects,
        linking your
        repo.](#b-create-a-local-directory-coolest_pkg-via-projects-linking-your-repo)
      - [C. create README.rmd in a directory via
        usethis::use\_readme\_rmd()](#c-create-readmermd-in-a-directory-via-usethisuse_readme_rmd)
  - [Part 1. Develop functionality (in
    readme)](#part-1-develop-functionality-in-readme)
      - [write `chunk_to_dir()`](#write-chunk_to_dir)
      - [write `chunk_to_r()` and
        `chunk_to_tests_testthat()`](#write-chunk_to_r-and-chunk_to_tests_testthat)
      - [Try it out](#try-it-out)
  - [Part 2. Packaging and documentation 🚧 ✅ ()from
    readme](#part-2-packaging-and-documentation---from-readme)
      - [Step i. Minimal requirements for github package. Have
        you:](#step-i-minimal-requirements-for-github-package-have-you)
          - [Created files for package archetecture with
            `devtools::create("./ggbarlabs")`
            ✅](#created-files-for-package-archetecture-with-devtoolscreateggbarlabs-)
          - [Moved functions R folder? ✅](#moved-functions-r-folder-)
          - [Added roxygen skeleton? ✅](#added-roxygen-skeleton-)
          - [Managed dependencies? ✅](#managed-dependencies-)
          - [Chosen a license? ✅](#chosen-a-license-)
          - [Run `devtools::check()` and addressed errors?
            ✅](#run-devtoolscheck-and-addressed-errors-)
          - [Push to github](#push-to-github)
      - [Step ii: Listen and iterate 🚧](#step-ii-listen-and-iterate-)
          - [Consulted with potential users
            🚧](#consulted-with-potential-users-)
          - [Consulted with technical experts e.g. statasticians,
            software developers,
            etc.](#consulted-with-technical-experts-eg-statasticians-software-developers-etc)
      - [Step iii. Polish. Have you…](#step-iii-polish-have-you)
          - [Settled on examples and put them in the roxygen skeleton?
            🚧](#settled-on-examples-and-put-them-in-the-roxygen-skeleton-)
          - [Written formal tests of functions?
            🚧](#written-formal-tests-of-functions-)
          - [Sent tests in this readme to package via readme2pkg
            🚧](#sent-tests-in-this-readme-to-package-via-readme2pkg-)
          - [Have you worked added a description and author information
            in the DESCRIPTION file?
            🚧](#have-you-worked-added-a-description-and-author-information-in-the-description-file-)
          - [Addressed *all* notes, warnings and errors.
            🚧](#addressed-all-notes-warnings-and-errors-)
      - [Promote (less detail here at this point - reflects the rawness
        of
        readme2pkg)](#promote-less-detail-here-at-this-point---reflects-the-rawness-of-readme2pkg)
          - [Package website built? 🚧](#package-website-built-)
          - [Package website deployed? 🚧](#package-website-deployed-)
      - [Harden](#harden)
          - [Submit to CRAN? 🚧](#submit-to-cran-)
  - [Reports, Environment](#reports-environment)
      - [Description file extract](#description-file-extract)
      - [Environment](#environment)
      - [`devtools::check()` report](#devtoolscheck-report)
  - [Install development package with
    `devtools::build()`](#install-development-package-with-devtoolsbuild)
      - [Repo Directory and files
        report](#repo-directory-and-files-report)

<!-- README.md is generated from README.Rmd. Please edit that file -->

``` r
package_exists <- T
print_reports <- F
build_package <- T
build_package_w_readme <- T

print_reports_action <- ifelse(print_reports, "asis", "hide")
```

# {readme2pkg} lets you send code chunks to .R files in a project subdirectory.

Code chunks are cool in storytelling, and sometimes we’d like to reuse
this code verbatim and send the contents to .R files. chunk\_to\_dir and
friends are meant to solve this problem.

Here is the contents of a code chunk named “add\_one\_code”

``` r
add_one <- function(x){
  
  return(x + 1)
  
}
```

with readme2pkg::chunk\_to\_dir we are able to create an ‘R file with
the name ’add\_one\_code.R’ that contains the code from the chunk as
follows. It will be saved in the R directory.

``` r

readme2pkg::chunk_to_dir("add_one_code", dir = "R")
```

## Background and motivation

<!-- badges: start -->

<!-- badges: end -->

I would like to

  - educate on new strategies for extending ggplot2
  - I would like to extend ggplot2
  - I like to have more fun while developing by doing so
    colaboratively\!
  - I’m happy to work with non-package developer and would like my
    decision to be informed by their expertise.
  - All these goals, but limits on time

## Other’s reflecting on how it might be difficult to find the ‘narrative’ from an R package

> ‘finding ways to contribute to open source packages can be daunting um
> how do you like what what process do you have when you’re first like
> looking at a new project that you might be involved in a new package
> …’ Colin

> … where do you start? Because i know for damn sure you don’t want to
> open the r directory and start reading the files in alphabetical order
> right which is in some sense kind of feels like the most natural thing
> to do because you’re like pretty sure that the r folder is the
> business end of the package and then because we’re plagued by
> alphabetical ordering it sort of feels like maybe you should just
> start clicking on the files and reading them and i know that does not
> work very well um so at this point like when i for some reason like
> need to become involved in a

> … you know you know books are meant to be read. Right, like there’s a
> beginning a middle and an end or like you’re told it’s a reference
> book and and it’s kind of clear how to go to a particular place.
> Packages are not meant to be read and so it is i think fundamentally
> kind of awkward … <https://www.youtube.com/watch?v=5LktoXh7WvY>

# More great package building resources to be aware of

  - Jacob Bien & Patrick Vossler’s
    [litr](https://jacobbien.github.io/litr-project/index.html) -
    similar motivation, but felt more like for use on a finished
    product? I guess I like the steps more unbundled than ‘one function
    to rule them all’.

  - Yihui Xie’s blog 2014-12-29’ [Write An R Package Using Literate
    Programming Techniques](https://yihui.org/rlp/)

  - Hadley Wickham and Jennifer Bryan’s [R
    Packages](http://r-pkgs.had.co.nz/)

  - Jim Hester’s [‘You can build a package in 20 minutes’
    talk](https://posit.co/resources/videos/you-can-make-a-package-in-20-minutes-jim-hester/)

  - My [companion
    guide](https://evamaerey.github.io/package_in_20_minutes/package_in_20_minutes)
    to Jim Hester’s talk

  - Cosima Meyer’s [How to write your own R package and publish it on
    CRAN](https://www.mzes.uni-mannheim.de/socialsciencedatalab/article/r-package/),
    and from her compiled list, more great resourses I missed in my
    first round:
    
      - [How to develop good R packages (for open science) (Maëlle
        Salmon)](https://masalmon.eu/2017/12/11/goodrpackages/)
      - [devtools Cheat
        Sheet](https://rawgit.com/rstudio/cheatsheets/master/package-development.pdf)
      - [Writing an R package from scratch (Hilary
        Parker)](https://hilaryparker.com/2014/04/29/writing-an-r-package-from-scratch/)
      - [Your first R package in 1 hour (Shannon
        Pileggi)](https://www.pipinghotdata.com/talks/2020-10-25-your-first-r-package-in-1-hour/)
      - [R package primer (Karl
        Broman)](https://kbroman.org/pkg_primer/)
      - [Checklist for R Package (Re-)Submissions on CRAN (Saskia
        Otto)](https://www.marinedatascience.co/blog/2020/01/09/checklist-for-r-package-re-submissions-on-cran/)
      - [Continuous integration with GitHub Actions (Dean Attali
        )](https://deanattali.com/blog/migrating-travis-to-github/)

  - RPackages

  - <https://www.youtube.com/watch?v=5LktoXh7WvY>

The goal of readme2pkg collects strategies for making the README.Rmd the
main workplace and/or storytelling document.

# How we make and use {readme2pkg}

# Part 0. Presteps

## A. created a github repository, e.g. <https://github.com/EvaMaeRey/readme2pkg>

## B. create a local directory ("coolest\_pkg) via projects, linking your repo.

You can do this from RStudio via New Project -\> Version Control -\> Git
-\> Repository URL (fill field with git repo URL from part A)

## C. create README.rmd in a directory via usethis::use\_readme\_rmd()

# Part 1. Develop functionality (in readme)

Write useful code (might be rearrangement of verbose code).

`chunk_to_dir()` will create a file with the chunk name

## write `chunk_to_dir()`

``` r
#' Title
#'
#' @param chunk_name
#' @param dir
#' @param extension
#' @param file_name
#'
#' @return
#' @export
#'
#' @examples
chunk_to_dir <- function(chunk_name, dir = "R/", extension = ".R"){

    for(i in 1:length(chunk_name)){

  knitr::knit_code$get(name = chunk_name[i]) |>
    paste(collapse = "\n") |>
    writeLines(con = paste0(dir, chunk_name[i], extension))

    }
  
  }
```

## write `chunk_to_r()` and `chunk_to_tests_testthat()`

``` r
#' Title
#'
#' @param chunk_name
#'
#' @return
#' @export
#'
#' @examples
chunk_to_r <- function(chunk_name){

  chunk_to_dir(chunk_name = chunk_name)

}


#' Title
#'
#' @param chunk_name
#'
#' @return
#' @export
#'
#' @examples
chunk_to_tests_testthat <- function(chunk_name){

  chunk_to_dir(chunk_name = chunk_name, dir = "tests/testthat/")

}
```

You may notice that we’ve inserted a ‘roxygen’ skeleton as well. This is
for the purpose of documenting the functions in a package.  
At this point, we haven’t completed the work of describing parameters
and filling in the title and adding an example, and describing what is
returned. However, including the skeleton is will allow the functions
work in the package *as exported functions* (`#' @export`) and serve as
a reminder that we have more work to do in terms of documentation.

## Try it out

We’re gonna send our code to the r folder… With the functions we just
created. Knitr never stops 😮\!

``` r
chunk_to_r("chunk_to_dir")
chunk_to_r("convenience")
```

It would be good to turn this section into formal tests, but I’m not
exactly sure what the best practice is for functions that create new
files and self reference as knitr functions do. Would be good to get
some technical expertise on that.

-----

# Part 2. Packaging and documentation 🚧 ✅ ()from readme

## Step i. Minimal requirements for github package. Have you:

### Created files for package archetecture with `devtools::create("./ggbarlabs")` ✅

### Moved functions R folder? ✅

You can use this code to list all names of code chunks

``` r
knitr::knit_code$get() |> names() # lists all current doc chunk names including from child README.rmd
#>  [1] "unnamed-chunk-1"  "unnamed-chunk-2"  "add_one_code"     "unnamed-chunk-3" 
#>  [5] "chunk_to_dir"     "convenience"      "unnamed-chunk-4"  "unnamed-chunk-5" 
#>  [9] "unnamed-chunk-6"  "unnamed-chunk-7"  "unnamed-chunk-8"  "unnamed-chunk-9" 
#> [13] "unnamed-chunk-10" "unnamed-chunk-11" "unnamed-chunk-12" "unnamed-chunk-13"
#> [17] "unnamed-chunk-14"
```

Then send code chunks to directories as desired.

``` r
library(readme2pkg)
#> 
#> Attaching package: 'readme2pkg'
#> The following objects are masked _by_ '.GlobalEnv':
#> 
#>     chunk_to_dir, chunk_to_r, chunk_to_tests_testthat
chunk_to_r("chunk_to_dir")
chunk_to_r("convenience")
```

### Added roxygen skeleton? ✅

For auto documentation and making sure proposed functions are
*exported*, add roxygen skeleton. in RStudio, Place cursor in code, then
go to navbar, and Code -\> Insert Roxygen Skeleton

### Managed dependencies? ✅

Dependenancies must be declared in your package.

This means you’ll use the `::` notation, e.g. `package::function()`. In
your function.

Additionally, you’ll send package dependencies to your DESCRIPTION file;
which can be done automatically with use this:

``` r
usethis::use_package("knitr")
```

### Chosen a license? ✅

``` r
usethis::use_mit_license()
```

### Run `devtools::check()` and addressed errors? ✅

### Push to github

## Step ii: Listen and iterate 🚧

### Consulted with potential users 🚧

### Consulted with technical experts e.g. statasticians, software developers, etc.

## Step iii. Polish. Have you…

### Settled on examples and put them in the roxygen skeleton? 🚧

### Written formal tests of functions? 🚧

### Sent tests in this readme to package via readme2pkg 🚧

That would look like this…

    chunk_to_tests_testthat("test_geom_barlab_count")

### Have you worked added a description and author information in the DESCRIPTION file? 🚧

### Addressed *all* notes, warnings and errors. 🚧

## Promote (less detail here at this point - reflects the rawness of readme2pkg)

### Package website built? 🚧

### Package website deployed? 🚧

## Harden

### Submit to CRAN? 🚧

# Reports, Environment

## Description file extract

## Environment

Here I just want to print the packages and the versions

``` r
all <- sessionInfo() |> print() |> capture.output()
all[11:17]
#> [1] ""                                                                         
#> [2] "attached base packages:"                                                  
#> [3] "[1] stats     graphics  grDevices utils     datasets  methods   base     "
#> [4] ""                                                                         
#> [5] "other attached packages:"                                                 
#> [6] "[1] readme2pkg_0.0.0.9000"                                                
#> [7] ""
```

## `devtools::check()` report

``` r
# rm(list = c("geom_barlab_count", "geom_barlab_count_percent"))
devtools::check(pkg = ".")
#> ℹ Updating readme2pkg documentation
#> ℹ Loading readme2pkg
#> Warning: ── Conflicts ─────────────────────────────────────────── readme2pkg conflicts
#> ──
#> ✖ `chunk_to_dir` masks `readme2pkg::chunk_to_dir()`.
#> ✖ `chunk_to_r` masks `readme2pkg::chunk_to_r()`.
#> ✖ `chunk_to_tests_testthat` masks `readme2pkg::chunk_to_tests_testthat()`.
#> ℹ Did you accidentally source a file rather than using `load_all()`?
#>   Run `rm(list = c("chunk_to_dir", "chunk_to_r", "chunk_to_tests_testthat"))`
#>   to remove the conflicts.
#> Warning: [chunk_to_dir.R:3] @param requires name and description
#> Warning: [chunk_to_dir.R:4] @param requires name and description
#> Warning: [chunk_to_dir.R:5] @param requires name and description
#> Warning: [chunk_to_dir.R:8] @return requires a value
#> Warning: [chunk_to_dir.R:11] @examples requires a value
#> Warning: [convenience.R:5] @return requires a value
#> Warning: [convenience.R:8] @examples requires a value
#> Warning: [convenience.R:20] @return requires a value
#> Warning: [convenience.R:23] @examples requires a value
#> Error: R CMD check found WARNINGs
```

# Install development package with `devtools::build()`

``` r
devtools::build()
```

## Repo Directory and files report

Let’s look at the repository contents.

``` r
fs::dir_tree(recurse = T)
#> .
#> ├── DESCRIPTION
#> ├── LICENSE
#> ├── LICENSE.md
#> ├── NAMESPACE
#> ├── R
#> │   ├── chunk_to_dir.R
#> │   └── convenience.R
#> ├── README.Rmd
#> ├── README.md
#> ├── man
#> │   ├── chunk_to_dir.Rd
#> │   ├── chunk_to_r.Rd
#> │   └── chunk_to_tests_testthat.Rd
#> └── readme2pkg.Rproj
```

<!-- # 2. test interactively -->

<!-- # 3. create package folder architecture, e.g. -->

<!-- devtools::create("../coolest_pkg/") -->

<!-- # 3. send function to .R folder `readme2pkg::chunk_to_dir_r()` -->

<!-- # 4. formalize test and send to test folder  -->

<!-- `readme2pkg::chunk_to_dir_tests_testthat()` -->

<!-- # 5. iterate; run checks; build; document; push to github; tell your friends -->

<!-- # 6. move to 'later stage' (functions and tests 1st home is no longer README, but # R and tests folders) -->

<!-- # 7. promote -->

<!--     - refine readme language to publication ready -->

<!--     - create publication source file .Rmd; pull in portion of readme as child -->

<!--     - create other promo, pull in readme in a way that allow chunk quotation and reuse -->

<!-- # Very early stage development, function development in the .RMD -->

<!-- # Write some functions -->

<!-- ````{verbatim} -->

<!-- ```{r one_plus_one} -->

<!-- one_plus_one <- function(){1 + 1} -->

<!-- ``` -->

<!-- ```{r two_plus_two} -->

<!-- two_plus_two <- function(){2 + 2} -->

<!-- ``` -->

<!-- ```` -->

<!-- # try out the functions -->

<!-- these little tests might also serve as function examples - note that you can insert a roxygen skeleton within code chunks. -->

<!-- ````{verbatim}  -->

<!-- ```{r trying out the function} -->

<!-- one_plus_one() -->

<!-- two_plus_two() -->

<!-- ``` -->

<!-- ```` -->

<!-- # send function to .R -->

<!-- ````{verbatim}  -->

<!-- ```{r} -->

<!-- chunk_to_r(chunk_name = c("one_plus_one",  -->

<!--                               "two_plus_two")) -->

<!-- ``` -->

<!-- ```` -->

<!-- ## Formalized 'trying out function' as tests -->

<!-- ````{verbatim} -->

<!-- ```{r test_judge_chunk_code, eval = } -->

<!-- testthat::test_that("multiplication works", { -->

<!--   expect_equal(two_plus_two(), 4) -->

<!-- }) -->

<!-- ``` -->

<!-- ```` -->

<!-- ## send function to tests/testthat file -->

<!-- ````{verbatim}  -->

<!-- ```{r, eval = F} -->

<!-- chunk_send_to_dir_tests_testthat("test_judge_chunk_code") -->

<!-- ``` -->

<!-- ```` -->

<!-- # Run checks w devtools, adjust code in Rmd as needed.  Install package, restart R. -->

<!-- # tell your friends about your work in progress; remotes::install_github() -->

<!-- # Awkward in-between phase Turn off function chunks and load library at top of .Rmarkdown; execute to make sure package itself is working? -->

<!-- # Later stage development -->

<!-- After the initial stage of development the homebase of functions should probably change to be true to the package structure. -->

<!-- Eventually things will feel circular and hairy if you do to much development in the .Rmd.  So, you will want the homebase of your code to be in the R folder and in a .R file. -->

<!-- You should delete the development code chunks.   (check the contents out of .R filse before making this move, lol. )  -->

<!-- Then you can quote ".R" functions if would like to show the details of your implementation, as follows.  -->

<!-- ````{verbatim} -->

<!-- ```{r} -->

<!-- readLines("R/two_plus_two.R") -> implementation -->

<!-- ``` -->

<!-- ```{r, code = implementation, eval= F} -->

<!-- ``` -->

<!-- ```` -->

<!-- # Journal article -->

<!-- The Rmd itself may serve as the basis for a journal article.  Hopefully, the writing will just get better and better from the different vantage points.   -->

<!-- A strategy... -->

<!-- ````{verbatim} -->

<!-- --- -->

<!-- title: "Article Proposal: Concise indicator variable recoding with ind2cat" -->

<!-- author: -->

<!--   # see ?rjournal_article for more information -->

<!--   - name: Evangeline Reynolds -->

<!--     affiliation: Affiliation -->

<!--     address: -->

<!--     - line 1 -->

<!--     - line 2 -->

<!--     url: https://journal.r-project.org -->

<!--     orcid: 0000-0002-9079-593X -->

<!--     email:  author1@work -->

<!-- abstract: > -->

<!--   Indicator variables are easy to create, store, and interpret.... -->

<!-- bibliography: RJreferences.bib -->

<!-- output: rticles::rjournal_article -->

<!-- --- -->

<!-- ```{r, include=F} -->

<!-- knitr::opts_chunk$set(message = F,  -->

<!--                       warning = F,  -->

<!--                       comment = "    ",  -->

<!--                       out.width = "69%") -->

<!-- kabel_format <- "latex" -->

<!-- library(magrittr) -->

<!-- readLines("../../../README.Rmd")  %>%  .[44:length(.)] %>%  -->

<!--   writeLines("../../../readme_extract.Rmd") -->

<!-- ``` -->

<!-- ```{r, child = "../../../readme_extract.Rmd"} -->

<!-- ``` -->

<!-- ```` -->
