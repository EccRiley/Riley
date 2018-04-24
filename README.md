# README

_Riley Smith_

_24 April 2018_

-----

## `{Riley}`: A fledgling R library (or set of libraries)

This is primarily an `R-package` built for personal reasons and is in the very early stages in terms of package development. I am primarily building this package as my personal starting point for learning the ins-and-outs of `R-package` development and version control with `Git`. However, in the interest of code-sharing and knowledge generation, I am making the development process public via this `Github` repository.

Currently, the functions and objects available in _Riley/**R**/_ are those that either I have written from scratch or those written by others which I have subsequently modified. Original source information regarding the latter category of functions is primarily only available in the source-code contained in _Riley/R/**SETUP.R**_. The contents of the _Riley/**man**/_ folder is severely lacking Rdocumentation files, which I am currently in the process of writing for each of the available functions in _**Riley/R/**_. 

-----

My ultimate goal with this is to create an `R` package containing tools (hopefullly) useful for implementing data analysis in mixed-methods research frameworks. I am developing the package under a methodological framework that values the unique importances, utilities, and natures of qualitative and quantitative data. Within this framework is an appreciation of and focus on the importance of _data management, cleaning, and preparation_ for analysis and presentation. A large portion of the functions and processes I am working on for the package are thus focused on these back-end activities, in addition to data analytic tools for processing and transforming qualitative (With the help of the already existing [**`RQDA`** package](http://rqda.r-forge.r-project.org)) and quantitative data in ways that speak to a truly mixed-methods analytic method. Additional components include tools for presenting data and analysis findings (and every step in between). These tools take advantage of the many, and growing, capabilities of [**`Rmarkdown`**](http://rmarkdown.rstudio.com) and [**`knitr`**](http://yihui.name/knitr/), and integrate styles inspired by [Edward Tufte](https://www.edwardtufte.com/tufte/) and the [**`tufte`**](https://cran.r-project.org/web/packages/tufte/index.html) `R` package.

-----

## Installation

Because the collective contents of this `R-package` remains a fledgling work in progess, _installation of `Riley` is not currently recommended_ unless you are working with the primary author ([@EccRiley](https://github.com/EccRiley) or are in need of one or more of **`Riley`**'s currently available functions and do not wish to re-write them yourself at the moment. 

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
    - [x] Add more descriptive description
- [-] Code Optimization (& pruning) _**`[IN PROGRESS]`**_
    - [-] effficiency (vectorization, dependency reduction) _**`[IN PROGRESS]`**_
    - [-] usability (& _usefulness_)
    - [-] versatility _**`[IN PROGRESS]`**_
    - [~] _consistency & reproducibility `[PERPETUALLY IN PROGRESS]`_
- [-] `R`Documentation _**`[IN PROGRESS]`**_
    - [ ] examples
    - [ ] intra-library linkages
    - [ ] inter-library linkages
    - [ ] vignettes
    - [ ] statistical/mathematical explanations & justifications where appropriate 
    - [ ] citations/credits throughout
- [ ] Library/Library Set Design & Nomenclature:
    - "`Rsmithing`"? (for a sub-library focused on _coding-specific utilities and linting_ (kind of like _"word-smithing"_, but for R)?)
