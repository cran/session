# $Id: texteval.R,v 1.3 2002/06/20 17:01:57 warnesgr Exp $
#
# $Log: texteval.R,v $
# Revision 1.3  2002/06/20 17:01:57  warnesgr
# Fixed typo in printed()
#
# Revision 1.2  2002/06/12 15:57:28  warnesgr
#
# - Belated checkin of changes to texteval.R to add the function
#   'printed' which does not include the evaluated commands in the output.
# - Updated the texteval.Rd help file.
#
# Revision 1.1  2002/04/30 14:20:01  warneg
#
# - Added texteval function & documentation
# - Added keywords to session.Rd
#

texteval <- function( sourceText, collapse=NULL, echo=TRUE )
  {
    sourceConn <- textConnection(sourceText, open="r")
    resultConn <- textConnection("resultText", open="w")
    sink(resultConn)
    tmp <- source(file=sourceConn, local=FALSE, echo=echo, print.eval=TRUE)
    sink()
    close(resultConn)
    close(sourceConn)
    return( paste(c(resultText, collapse), collapse=collapse) )
    # the reason for c(result, collapse) is so that we get the line
    # terminator on the last line of output.  Otherwise, it just shows up
    # between the lines.
  }


printed <- function( sourceText, collapse=NULL )
  {
    return( texteval(sourceText, collapse, FALSE) )
  }
