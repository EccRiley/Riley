\name{Rtdf}
\alias{Rtdf}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Print and/or store \code{table} object as \code{data.frame}.
}
\description{
This is a simple convenience wrapper function to print and/or store objects returned in \code{table class} as either a \code{matrix}, \code{dataframe} or \code{list}, which allows for more versatility in the printing methods for tabulations (e.g., presenting tabulations "long-ways", as opposed to the default short, and therefore potentially wide, method for the \code{table class}). Currently only implemented for one object interpretable as a factor, since \code{stats::ftable()} exists for multi-object tabulation
}
\usage{
R.tdf(x, names = c(deparse(substitute(x)), "Freq"), cls = "df")
}
\arguments{
  \item{x}{
  an object suitable for tabulating discrete counts (i.e., interpretable as a factor). See documentation for \code{\link{base::table}}.
  }
  \item{names}{
  Character vector containing the labels to be used for \code{colnames} when \code{cls} is either \code{data.frame} or \code{matrix}. Currently, the default is the deparsed object tag.
  }
  \item{cls}{
  Character string (\code{"df"}) indicating the output class. Can be one of "\code{data.frame}"/"\code{df}" (default), "\code{matrix}"/"\code{mat}", or "\code{list}"/"\code{ls}"
  }
}
\details{
See \code{?base::table}.
}
\value{
Returns an object in the class indicated for \code{cls} containing the frequency tabulation of discrete values in \code{x}.
}
\references{
%% todo %%
}
\author{
Rachel M. Smith
}
\note{
%%  todo %%
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{base::table}}, \code{\link{stats::ftable}} for multi-object tabulation.
}
\examples{}