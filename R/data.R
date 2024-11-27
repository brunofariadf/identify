## ------------------------------------------
##                          Date: 2022-01-07
## ------------------------------------------
## Project: identify
## Author: Bruno Faria
## 
## GUI: vscode (1.63.2)
## Version R: 4.1.0
## Platform: windows (10.0.14393)
## ------------------------------------------

#' Stadiums in World
#'
#' A dataset containing the the country, city name, stadium name and capacity from stadiums in World.
#'
#' @format A data frame with 12 rows and 3 columns:
#' \describe{
#'   \item{country}{country name.}
#'   \item{city}{city name and state name.}
#'   \item{name}{stadium name.}
#'   \item{club}{stadium to club.}
#'   \item{capacity}{maximum capacity of stadium fans.}
#' }
#' @source \url{http://stadiumdb.com/}

"stadium"

#' Packages from language programming R
#'
#' A dataset containing the package name, depends and license from packages from language programming R.
#'
#' @format A data frame with 8 rows and 3 columns:
#' \describe{
#'   \item{package}{package name.}
#'   \item{depends}{dependency from package.}
#'   \item{license}{license of use from package.}
#' }
#' @source \code{rpkg::cran_package_all()}

"package"

# load("./data/stadium.rda")
# stadium <- as.data.frame(stadium)
# save(stadium, file = "./data/stadium.rda")

# pkg_i <- c("ggplot2", "dplyr", "shiny", "rmarkdown",
#             "data.table", "Rcpp", "magrittr", "kableExtra")
# package <- rpkg::rpkg_locale_package(pkg_i, format_column = FALSE)
# package <- subset(package, 
#     select = c(package, depends, license))
# save(package, file = "./data/package.rda")
