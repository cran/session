\name{texteval}
\alias{texteval}
\alias{printed}
\title{Evaluate string(s) containing R commands and return the text
  transcript or printed results}
\description{
  Evaluate string(s) containing R commands and return the text
  transcript or printed results
}
\usage{
texteval(sourceText, collapse=NULL, echo=TRUE)
printed(sourceText, collapse=NULL)
}
\arguments{
  \item{sourceText}{ Vector of string to be evaluated.  }
  \item{collapse}{ Line separator. Defaults to \code{NULL} }
  \item{echo}{ Should commands be shown in output. Defaults to
    \code{TRUE} }
}
\details{
  \code{texteval} and \code{printed} evaluate the contents of sourceText
  using \code{source} and the results are captured using a
  \code{textConnection}.  If \code{collapse} is NULL, a
  vector of strings is returned, one element for each line of output.
  (Empty strings for blank lines).  If \code{collapse} is non-NULL, the
  a single character string is formed by pasting the individuals
  elements together separated by this value.  When \code{echo} is TRUE,
  \code{texteval} will return a transcript that includes both printed
  output and evaluated commands. When \code{echo} is FALSE,
  \code{texteval} will return only the printed output.  \code{printed}
  always returns only the printed output.

  These functions were created to allow strings provided from external
  processes (for example by rpy or RSPerl) to be evaluated as if they
  were scripts.
}

\value{
  A single character string if \code{collapse} is non-NULL, otherwise a
  vector of character strings.
}

\author{ Gregory R. Warnes \email{gregory\_r\_warnes@groton.pfizer.com}}

\seealso{ \code{\link{source}}, \code{\link{textConnection}},
  \code{\link{sink}}, \code{\link{parse}}, \code{\link{eval}} 
}

\examples{

# define a script string
script <- "x <- rnorm(100)\ny <- x + rnorm(100,0.25)\nsummary(lm(y~x))"

# evaluate the script string, returning a transcript.
result <- texteval(script, "\n")
cat(result)

# evaluate the script string, returning the printed output.
result <- printed(script, "\n")
cat(result)

}
\keyword{data}
\keyword{programming}

