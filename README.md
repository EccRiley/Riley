# README

_Riley Smith_

_12 October 2014_

-----

## `{Riley}` A Fledgling `R-Package` in Progress

This is primarily an `R-package` built for personal reasons and is in the very early stages in terms of package development. I am primarily building this package as my personal starting point for learning the ins-and-outs of `R-package` development and version control with `Git`. However, in the interest of code-sharing and knowledge generation, I am making the development process public via this `Github` repository.

Currently, the functions and objects available in **`Riley/R/`** are those that either I have written from scratch or those written by others which I have subsequently modified. Original source information regarding the latter category of functions is primarily only available in the source-code contained in "_`Riley/R/SETUP.R`_". The contents of the **`Riley/man/`** folder is severely lacking Rdocumentation files, which I am currently in the process of writing for each of the available functions in **`Riley/R/`**. 

-----

# [Installation](#install)

Because the collective contents of this `R-package` remains a fledgling work in progess, _installation of `Riley` is not currently recommended_ unless you are working with the primary author (@EccRiley) or are in need of one or more of `Riley`'s currently available functions and do not wish to re-write them yourself at the moment. 

```{r eval=FALSE}
if (!require('devtools')) install.packages('devtools'); require('devtools')
devtools::install_github('EccRiley/Riley')
```

-----

## [Package Updates and News](#updates)

Any major updates to the package (i.e., changes that would prompt a revision to the [above](#install) anti-installation warning) will be immediately reflected in this _`README.md`_ document. However, in anticipation of frequent and abundant changes to the `Riley` in the near future, smaller updates will be recorded in [_`NEWS.md`_](NEWS.md).


-----

# [`To-Do`](#todo)

- [x] Initial package build
- [x] `LICENSE` file
- [x] `DESCRIPTION` file
- [ ] Complete `RDocumentation` of package contents
    - [ ] With source credits where appropriate
