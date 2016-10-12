\name{dt}
\alias{dt}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
\code{DT::datatable()} with my personal default settings.
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
dt(x, caption = deparse(substitute(x)), rownames = FALSE, class = c("row-border"), filter = 'none', options = list(pageLength = 300, lengthMenu = c(200, 500, 1000, 1500), info = TRUE, dom = 'tip', ...), ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
  a data object (either a matrix or a data fram)
  }
  \item{caption}{
  String value for table caption. Currently, the default is the user's label for \code{x}.
  }
  \item{rownames}{
  Logical (\code{FALSE}). Should the output include the rownames of \code{x} as the first column?
  }
}
\details{
See \code{?DT::datatable}.
}
\value{
Returns an HTML datatable.
}
\references{
See \code{?DT::datatable} and http://rstudio.github.io/DT.
}
\author{
Rachel M. Smith
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{DT::datatable}}
}
\examples{
x <- data.frame(y = seq(1:26), z = letters)
dt(x)