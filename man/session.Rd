% $Id: session.Rd,v 1.5 2003/04/04 13:50:44 warnes Exp $
%
% $Log: session.Rd,v $
% Revision 1.5  2003/04/04 13:50:44  warnes
%
% - Change 'T' to 'TRUE'
%
% Revision 1.4  2003/03/15 23:03:43  warnes
%
% - Clarified, spell-checked, and fixed a syntax error in help files.
%
% Revision 1.3  2002/04/30 14:20:01  warneg
%
% - Added texteval function & documentation
% - Added keywords to session.Rd
%
% Revision 1.2  2002/04/12 19:32:05  warneg
% - Added code to remove temporary variable used to store search path
%   and library path
% - Added cvs tags to the top of files
%
%

\name{save.session}
\alias{save.session}
\alias{restore.session}
\title{Save and restore session information, including loaded packages
  and attached data objects.}
\description{
  Save and restore session information, including loaded packages and
  attached data objects.
}
\usage{
save.session(file=".RSession", ...)
restore.session(file=".RSession", ...)
}
\arguments{
  \item{file}{ Filename for the session information. }
  \item{\dots}{ Optional arguments for \code{save()} or \code{load()}. }
}
\details{
  These two functions save and restore R session information.  In
  addition to the objects in the session, the list of currently loaded
  packages and the search path are (re)stored.

  Open graphics devices, \code{sinks}s, pipes, etc. will not be stored.
  \code{save.session} issues a  warning to this effect if any graphics
  devices are open. 
}
\value{
  No return value.
}
\author{ Gregory R. Warnes \email{gregory\_r\_warnes@groton.pfizer.com}}
\note{ Future enhancements may allow the restoration of the size,
  location, and graphics settings of graphics devices. }

\seealso{ \code{\link{save}}, \code{\link{save.image}},
  \code{\link{load}} }

\examples{

  ls(all=TRUE) # show all data objects
  search()  # list search path

  # save the current R session to the file "RSession.Rda"
  save.session("RSession.Rda")

  \dontrun{
  # exit R without saving data
  q("no")

  # restart R
  R 
  }

  # load a saved R session from "RSession.Rda"
  restore.session("RSession.Rda")

  ls(all=TRUE) # show all data objects
  search()  # list search path

}
\keyword{data}
\keyword{programming}

