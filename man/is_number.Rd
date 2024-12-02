% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/is.R
\name{is_number}
\alias{is_number}
\title{Check the number in vector}
\usage{
is_number(x, type = "one")
}
\arguments{
\item{x}{not null class vector.}

\item{type}{character class vector that indicates the type of search in the vector. If "one" the search stops when true and does not check the entire vector. If "all" the search checks the entire vector.}
}
\description{
The \code{is_number()} check if the vector has an number.
}
\examples{
is_number("")                    #FALSE
is_number(".")                   #FALSE
is_number(" ")                   #FALSE
is_number("na")                  #FALSE
is_number(NA)                    #FALSE
is_number(".5")                  #TRUE
is_number("5L")                  #TRUE
is_number("5.1")                 #TRUE
is_number("5/4")                 #TRUE
is_number("pi")                  #FALSE
is_number("sin(pi/2)")           #TRUE
is_number("Inf")                 #FALSE
is_number("1i^2")                #TRUE
is_number("!#$\%&*()_-[{]};.")    #FALSE
is_number("!#$\%&*()_-[{]};.5")   #TRUE
is_number(5)                     #TRUE
is_number(5L)                    #TRUE
is_number(5.1)                   #TRUE
is_number(5/4)                   #TRUE
is_number(pi)                    #TRUE
is_number(sin(pi/2))             #TRUE
is_number(Inf)                   #FALSE
is_number(-Inf)                  #FALSE
is_number(1i^2)                  #TRUE
is_number(1i + 1)                #TRUE
is_number(c("", NA, "hi"))       #FALSE
}
