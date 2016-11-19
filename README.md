# README

_Riley Smith_

_18 November 2016_

-----

## `{Riley}` A Fledgling `R-Package`

This is primarily an `R-package` built for personal reasons and is in the very early stages in terms of package development. I am primarily building this package as my personal starting point for learning the ins-and-outs of `R-package` development and version control with `Git`. However, in the interest of code-sharing and knowledge generation, I am making the development process public via this `Github` repository.

Currently, the functions and objects available in **`Riley/R/`** are those that either I have written from scratch or those written by others which I have subsequently modified. Original source information regarding the latter category of functions is primarily only available in the source-code contained in "_`Riley/R/SETUP.R`_". The contents of the **`Riley/man/`** folder is severely lacking Rdocumentation files, which I am currently in the process of writing for each of the available functions in **`Riley/R/`**. 

-----

## Installation

Because the collective contents of this `R-package` remains a fledgling work in progess, _installation of `Riley` is not currently recommended_ unless you are working with the primary author (@EccRiley) or are in need of one or more of `Riley`'s currently available functions and do not wish to re-write them yourself at the moment. 

```{r eval=FALSE}
if (!require('devtools')) install.packages('devtools'); require('devtools')
devtools::install_github('EccRiley/Riley')
```

-----

# Package Updates and News

Any major updates to the package (i.e., changes that would prompt a revision to the _above_ anti-installation warning) will be immediately reflected in this _`README.md`_ document. However, in anticipation of frequent and abundant changes to the `Riley` in the near future, smaller updates will be recorded in [_`NEWS.md`_](NEWS.md).


-----

# `To-Do`

- [x] Initial package build
- [x] `LICENSE` file (create)
    - [x] Add license to `LICENSE` file
- [x] `DESCRIPTION` file (create)
    - [ ] Add more descriptive description
- [ ] Complete `RDocumentation` of package contents _[In progress]_
    - [ ] With source credits where appropriate
- [ ] Organize package contents _[In progress]_
    - [ ] Pare-down to only include functions related to the package purpose
    - [ ] Vectorization
- [ ] Package name (actual - not the "Riley" placeholder)
- [ ] Package Vignette/Tutorial(s)
