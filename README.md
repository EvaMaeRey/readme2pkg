
<!-- README.md is generated from README.Rmd. Please edit that file -->

# readme2pkg

<!-- badges: start -->

<!-- badges: end -->

The goal of readme2pkg collects strategies for making the README.Rmd the
main workplace and/or storytelling document.

0.  Write problem statement (can be verbose code)
1.  write useful code (can be rearrangement of verbose code)
2.  test interactively
3.  create package folder architecture,
    e.g. devtools::create(“../readme2pkg/”)
4.  send function to .R folder `readme2pkg::chunk_to_dir_r()`
5.  formalize test and send to test folder
    `readme2pkg::chunk_to_dir_tests_testthat()`
6.  iterate
7.  move to ‘later stage’ (functions and tests 1st home is no longer
    README, but R and tests folders)
8.  promote
      - refine readme language to publication ready
      - create publication source file .Rmd; pull in portion of readme
        as child
      - create other promo, pull in readme in a way that allow chunk
        quotation and reuse

# Origins

where this emerged?

  - ind2cat; ggjudge; mytidytuesday
  - reflecting on litr - very similar framework, but too bundled up for
    me, greater focus on package development.

# Very early stage development, function development in the .RMD

## Select

1)  if you should work on functions or use installed package functions
    (a good check to see if package functions are actually working)
2)  If functions should be quoted in the readme.

<!-- end list -->

```` default

```{r}
use_chunk_function <- TRUE  # package function if FALSE
show_function <- FALSE
```
````

# Write some functions

```` default

```{r one_plus_one}
one_plus_one <- function(){1 + 1}
```

```{r two_plus_two}
two_plus_two <- function(){2 + 2}
```
````

# try out the functions

```` default

```{r trying out the function}
one_plus_one()
two_plus_two()
```
````

# send function to .R

```` default

```{r}
chunk_to_r(chunk_name = c("one_plus_one", 
                              "two_plus_two"))
```
````

## Formalized trying out function as tests

```` default

```{r test_judge_chunk_code, eval = }
testthat::test_that("multiplication works", {
  expect_equal(two_plus_two(), 4)
})
```
````

## send function to tests/testthat file

```` default

```{r, eval = F}
chunk_send_to_dir_tests_testthat("test_judge_chunk_code")
```
````

# Run checks w devtools, adjust code in Rmd as needed. Install package, restart R.

# Awkward in-between phase Turn off function chunks and load library at top of .Rmarkdown; execute to make sure package itself is working.

# Later stage development

After the initial stage of development the homebase of functions should
probably change to be true to the package structure.

Eventually things will feel circular and hairy if you do to much
development in .Rmd. So, you will want the homebase of your code to be
in the R folder and in a .R file.

You should delete the development code chunks. (check the contents out
of .R filse before making this move, lol. )

Then you can quote “.R” functions if would like to show the details of
your implementation, as follows.

```` default

```{r}
readLines("R/two_plus_two.R") -> implementation
```

```{r, code = implementation, eval= F}
```
````

# strategy for using code chunks from README.Rmd without all the readme text… ()

For summary products …

```` default

```{r read_in_chunks, eval = F, echo = F, results='hide'}
knitr::knit_child("../../../README.rmd")
```

```{r}
knitr::knit_code$get() |> names() # lists all current doc chunk names including from child README.rmd
```
````

# strategy for using readme as text as first cut in journal article

```` default

---
title: "Article Proposal: Concise indicator variable recoding with ind2cat"
author:
  # see ?rjournal_article for more information
  - name: Evangeline Reynolds
    affiliation: Affiliation
    address:
    - line 1
    - line 2
    url: https://journal.r-project.org
    orcid: 0000-0002-9079-593X
    email:  author1@work
abstract: >
  Indicator variables are easy to create, store, and interpret....
bibliography: RJreferences.bib
output: rticles::rjournal_article
---

```{r, include=F}
knitr::opts_chunk$set(message = F, 
                      warning = F, 
                      comment = "    ", 
                      out.width = "69%")
kabel_format <- "latex"


library(magrittr)
readLines("../../../README.Rmd")  %>%  .[44:length(.)] %>% 
  writeLines("../../../readme_extract.Rmd")
```

```{r, child = "../../../readme_extract.Rmd"}
```
````
