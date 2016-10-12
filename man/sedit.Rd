\name{sedit}
\alias{sedit}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Open and source an R-Script.
}
\description{
The function is created entirely for my own lazyness, and simply sources the specified \code{R-Script} (\code{x}) and opens the same file in \code{R}.
}
\usage{
sedit(x)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{An excutable R-script file.
%%     ~~Describe \code{x} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
Returns any values determined within the sourced \code{R-script} (\code{x})
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
Rachel M. Smith
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{

}
\examples{
x <- file("x.R", "w") # open an output file connection (see '?writeLines')
cat("#' TITLE this is a test", "y <- rnorm(100)", file = x, sep = "\n") # add something to the the file
close(x) # close the connection
sedit("x.R") # source and open file "x.R".