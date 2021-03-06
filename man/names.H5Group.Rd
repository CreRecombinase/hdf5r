% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/high_level_UI.R
\name{names.H5Group}
\alias{names.H5Group}
\alias{names.H5File}
\title{Get the names of the items in the group or at the \code{/} root of the file}
\usage{
\method{names}{H5Group}(x)

\method{names}{H5File}(x)
}
\arguments{
\item{x}{An object of class \code{\link{H5File}} or \code{\link{H5Group}}}
}
\value{
A character vector with the names of the items in the group/file.
}
\description{
Get the names of the items in the group or at the \code{/} root of the file
}
\details{
Works similar to the regular \code{names} function for a list. The names of the items of either a
\code{\link{H5File}} at the root or a \code{\link{H5Group}} are returned as a character vector.
The items are then accessed, again similar to a list, using \code{[[}.
}
\author{
Holger Hoefling
}
