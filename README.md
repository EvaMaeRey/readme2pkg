
  - [{readme2pkg}](#readme2pkg)
      - [In practice](#in-practice)
      - [Background and motivation](#background-and-motivation)
  - [How we make and use {readme2pkg}](#how-we-make-and-use-readme2pkg)
  - [Part 0. Presteps](#part-0-presteps)
      - [A. created a github repository,
        e.g. <https://github.com/EvaMaeRey/readme2pkg>](#a-created-a-github-repository-eg-httpsgithubcomevamaereyreadme2pkg)
      - [B. create a local directory (“coolest\_pkg”) via projects,
        linking your
        repo.](#b-create-a-local-directory-coolest_pkg-via-projects-linking-your-repo)
      - [C. create README.rmd in a directory via
        usethis::use\_readme\_rmd()](#c-create-readmermd-in-a-directory-via-usethisuse_readme_rmd)
  - [Part 1. Develop functionality (in
    readme)](#part-1-develop-functionality-in-readme)
      - [pull in `return_chunk_code`, which is in a development
        package…](#pull-in-return_chunk_code-which-is-in-a-development-package)
      - [write `chunk_to_dir()`](#write-chunk_to_dir)
      - [write `chunk_to_r()` and
        `chunk_to_tests_testthat()`](#write-chunk_to_r-and-chunk_to_tests_testthat)
      - [Try it out](#try-it-out)
  - [Efficiently writing convenience functions with templating and
    expansion](#efficiently-writing-convenience-functions-with-templating-and-expansion)
      - [`chunk_variants_to_dir()`](#chunk_variants_to_dir)
      - [Part 2.](#part-2)
          - [Make it a package…](#make-it-a-package)
      - [Create package architecture… ✅](#create-package-architecture-)
          - [Moving functions R folder… ✅](#moving-functions-r-folder-)
          - [Managed dependencies? ✅](#managed-dependencies-)
          - [Chosen a license? ✅](#chosen-a-license-)
          - [Chose a development stage
            badge](#chose-a-development-stage-badge)
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

# {readme2pkg}

The intent of {readme2pkg} is to let you build quick packages right from
a README.Rmd. The function `readme2pkg::chunk_to_dir` (and friends) lets
you send code chunk contents to a new file in a subdirectory. This means
you don’t have to manage a bunch of files that constitute a package - at
least in the early stages.

Also, the
[EvaMaeRey/readme2pkg.template](https://github.com/EvaMaeRey/readme2pkg.template)
repo on github template repository that meant to complement the
readme2pkg workflow. Using the README.Rmd in the template, you can
populate the sections with your material (introduction and functions,
etc). And this README template contains a ‘living’ checklist that will
help you get through the steps of creating a package, including building
the file architecture, licensing, documentation, and builds. The
checklist items are run through {devtools} and {usethis} packages. Code
is included that lets you ‘check-off’ the items as you run the code.

## In practice

Imagine you write this function in a code chunk:

```` verbatim


```r
times_two <- function(x){
  
  x*2
  
}
```
````

With `readme2pkg::chunk_to_dir()` we are able to create an `.R` file
with the name `add_one_code.R` that contains the code from the chunk as
follows. It will be saved in the R directory, which will make it part of
the package.

```` verbatim


```r
readme2pkg::chunk_to_dir("times_two", dir = "R")
```
````

At this point, it is not an exported or documented function. To do that
you’d just need to add a Roxygen skeleton (before using `chunk_to_dir`)
to the code chunk and use devtools::document.

If you are unsure that you want to export/document the function, there’s
no rush. You can still access the function with the tripple colon
syntax: `:::`. For example:

```` verbatim


```r
mynewpackage:::times_two(x = 6)
```
````

## Background and motivation

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

Motivations:

  - expose internals early on in development
  - manage files more easily
  - have function fit into a narrative

People Benefits:

  - have more fun while developing by doing so collaboratively?
  - work with non-package developer and have my decision to be informed
    by their expertise - possibly getting their feedback right in
    github?
  - keep better track of where I am in the development process.

# How we make and use {readme2pkg}

# Part 0. Presteps

## A. created a github repository, e.g. <https://github.com/EvaMaeRey/readme2pkg>

## B. create a local directory (“coolest\_pkg”) via projects, linking your repo.

You can do this from RStudio via New Project -\> Version Control -\> Git
-\> Repository URL (fill field with git repo URL from part A)

## C. create README.rmd in a directory via usethis::use\_readme\_rmd()

# Part 1. Develop functionality (in readme)

## pull in `return_chunk_code`, which is in a development package…

``` r
library(tidyverse)
```

```` r
# Awesome!
check_is_live <- function(){
  
  is_live <- FALSE
  
  # Check to see if we're in editor context
  if (requireNamespace("rstudioapi", quietly = TRUE) &&
      rstudioapi::isAvailable()) {

    is_live <- tryCatch({
      rstudioapi::getSourceEditorContext()
      TRUE
    }, error = function(e) FALSE)

  }  
  
  return(is_live)
  
}

# so cool!
text_chunk_extract <- function(.text, chunk_name) {

  # Find the start of the desired chunk
  chunk_regex <- paste0('\\`\\`\\`\\{[A-z]+ ', chunk_name, '(\\}|(,.*\\}))$')

  start_chunk <- .text |>
    stringr::str_which(chunk_regex)

  if (length(start_chunk) == 0) {

    stop(paste0("Error: No chunk found with name '", chunk_name, "'"))

  } else if (length(start_chunk) > 1) {

    stop(paste0("Error: Duplicate chunk name '", chunk_name, "'"))

  }

  end_chunk <- .text[-c(1:start_chunk)] |>
    stringr::str_which(stringr::fixed("```")) |>
    min() + start_chunk

  chunk_text <- .text[(start_chunk):(end_chunk)] |>
    stringr::str_c(collapse = "\n")

  attributes(chunk_text) <- NULL

  return(chunk_text)

}

chunk_remove_fencing_and_options <- function(code_chunk){
  
  # does not yet, in fact, remove options like these: 
  # | my-chunk, echo = FALSE, fig.width = 10,
  # | fig.cap = "This is a long long
  # |   long long caption."
  
 chunk_as_vec <- stringr::str_split(code_chunk,"\\n")[[1]] 
 
 # remove fencing which are first and last lines
 return(chunk_as_vec[2:(length(chunk_as_vec)-1)])
  
}

# wow!
return_chunk_code_live <- function(chunk_name) {

  
    ed        <- rstudioapi::getSourceEditorContext()
    source    <- ed$contents

    # can we use knitr tools to directly parse source for us? 
    # tmp       <- tempfile()
    # writeLines(source, tmp)
    # readLines(tmp)
    # knitr::knit_code$get(name = tmp)
    
    my_code_chunk  <- text_chunk_extract(.text = source, chunk_name)

    # If neither of those worked, error
    if (is.null(my_code_chunk)) {

    stop(paste0("Error: No chunk found with name '", chunk_name, "'"))

    }

    # remove chunk fencing, first and last lines
    my_code <- chunk_remove_fencing_and_options(my_code_chunk)
    
    return(my_code)
  
}

#' Title
#'
#' @param chunk_name a character string with the name of the chunk of interest
#'
#' @return a vector of the code contained in the referenced chunk
#' @export 
#'
#' @examples
return_chunk_code <- function(chunk_name){
  
  is_live <- check_is_live()
  
  if(is_live){
    return_chunk_code_live(chunk_name)
  }else{
  knitr::knit_code$get(name = chunk_name) |> as.vector()
    }

}
````

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

  # knitr::knit_code$get(name = chunk_name[i]) |>
  return_chunk_code(chunk_name = chunk_name[i]) |>  
    paste(collapse = "\n") |>
    writeLines(con = paste0(dir,"/",  chunk_name[i], extension))

    }
  
  }
```

``` r
return_chunk_code("chunk_to_dir")
#>  [1] "#' Title"                                                               
#>  [2] "#'"                                                                     
#>  [3] "#' @param chunk_name"                                                   
#>  [4] "#' @param dir"                                                          
#>  [5] "#' @param extension"                                                    
#>  [6] "#' @param file_name"                                                    
#>  [7] "#'"                                                                     
#>  [8] "#' @return"                                                             
#>  [9] "#' @export"                                                             
#> [10] "#'"                                                                     
#> [11] "#' @examples"                                                           
#> [12] "chunk_to_dir <- function(chunk_name, dir = \"R/\", extension = \".R\"){"
#> [13] ""                                                                       
#> [14] "    for(i in 1:length(chunk_name)){"                                    
#> [15] ""                                                                       
#> [16] "  # knitr::knit_code$get(name = chunk_name[i]) |>"                      
#> [17] "  return_chunk_code(chunk_name = chunk_name[i]) |>  "                   
#> [18] "    paste(collapse = \"\\n\") |>"                                       
#> [19] "    writeLines(con = paste0(dir,\"/\",  chunk_name[i], extension))"     
#> [20] ""                                                                       
#> [21] "    }"                                                                  
#> [22] "  "                                                                     
#> [23] "  }"
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
created…\! But later

It would be good to turn this section into formal tests, but I’m not
exactly sure what the best practice is for functions that create new
files and self reference as knitr functions do. Would be good to get
some technical expertise on that.

# Efficiently writing convenience functions with templating and expansion

``` r
#' Print specific character string
#'
#' @return a character string
#' @export 
#'
#' @examples
#' print_hello()
print_hello <- function(){
  
  "Hello"
  
}
```

## `chunk_variants_to_dir()`

``` r
#' Title
#'
#' @param chunk_name 
#' @param chunk_name_suffix 
#' @param file_name 
#' @param dir 
#' @param replace1 
#' @param replacements1 
#' @param replace2 
#' @param replacements2 
#' @param replace3 
#' @param replacements3 
#' @param replace4 
#' @param replacements4 
#'
#' @return
#' @export
#'
#' @examples
chunk_variants_to_dir <- function(chunk_name, 
                                             chunk_name_suffix = "_variants",
                                             file_name = NULL,
                                             dir = "R/",
                                             replace1, 
                                             replacements1, 
                                             replace2 = NULL, 
                                             replacements2 = NULL, 
                                             replace3 = NULL, 
                                             replacements3 = NULL, 
                                             replace4 = NULL, 
                                             replacements4 = NULL){
  
  template <-  return_chunk_code(chunk_name) 
  script_contents <- c()  
  if(is.null(file_name)){file_name <- paste0(chunk_name, chunk_name_suffix, ".R")}

for(i in 1:length(replacements1)){
  
  template_mod <- stringr::str_replace_all(template, replace1, replacements1[i])
  
  if(!is.null(replace2)){
    template_mod <- stringr::str_replace_all(template_mod, replace2, replacements2[i])}
  
    if(!is.null(replace3)){
    template_mod <- stringr::str_replace_all(template_mod, replace3, replacements3[i])}
  
      if(!is.null(replace4)){
    template_mod <- stringr::str_replace_all(template_mod, replace4, replacements4[i])}
  
  
  script_contents <- c(script_contents, template_mod)
  
}  
  
 writeLines(script_contents, paste0(dir, file_name))
  
}
```

``` r
chunk_variants_to_dir("print_hello",
                                 replace1 = "hello",
                                 replacements1 = c("hello", "bye"),
                                 replace2 = "Hello",
                                 replacements2 = c("Hello", "Bye"))
```

## Part 2.

### Make it a package…

## Create package architecture… ✅

``` r
devtools::create()
```

### Moving functions R folder… ✅

Then send code chunks to directories as desired (using the functions we
created\!\!)

``` r
chunk_to_r("knitcodegetlive")
chunk_to_r("chunk_to_dir")
chunk_to_r("chunk_to_r")
chunk_to_r("chunk_variants_to_dir")
```

### Managed dependencies? ✅

Dependencies must be declared in your package.

This means

1.  you’ll use the `::` notation, e.g. `package::function()` in your
    function.  
2.  you’ll send package dependencies to your DESCRIPTION file; which can
    be done automatically with use this:

<!-- end list -->

``` r
usethis::use_package("knitr")
usethis::use_package("stringr")
usethis::use_package("rstudioapi")
```

### Chosen a license? ✅

``` r
usethis::use_mit_license()
```

### Chose a development stage badge

``` r
usethis::use_lifecycle_badge("experimental")
#> ✔ Setting active project to '/Users/evangelinereynolds/Google
#> Drive/r_packages/readme2pkg'
```

### Run `devtools::check()` and addressed errors? ✅

``` r
devtools::check()
```

### Push to github

RStudio: Console/Terminal/RMarkdown/Jobs:

Terminal -\> git add . -\> git commit -m “first commit” -\> git push

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
#> [6] " [1] lubridate_1.9.2      forcats_1.0.0        stringr_1.5.0       "      
#> [7] " [4] dplyr_1.1.0          purrr_1.0.1          readr_2.1.4         "
```

## `devtools::check()` report

``` r
# rm(list = c("geom_barlab_count", "geom_barlab_count_percent"))
devtools::check(pkg = ".")
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
#> │   ├── chunk_to_r.R
#> │   ├── chunk_variants_to_dir.R
#> │   ├── knitcodegetlive.R
#> │   └── utils-pipe.R
#> ├── README.Rmd
#> ├── README.md
#> ├── man
#> │   ├── chunk_to_dir.Rd
#> │   ├── chunk_to_r.Rd
#> │   ├── chunk_to_tests_testthat.Rd
#> │   ├── chunk_variants_to_dir.Rd
#> │   ├── pipe.Rd
#> │   └── return_chunk_code.Rd
#> └── readme2pkg.Rproj
```
