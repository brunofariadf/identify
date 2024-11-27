## ------------------------------------------
##                          Date: 2022-05-24
## ------------------------------------------
## Project: identify
## Author: Bruno Faria
## 
## GUI: vscode (1.67.2)
## Version R: 4.1.0
## Platform: windows (10.0.14393)
## ------------------------------------------

#' Convert utf8
#'
#' The `convert_utf8()` convert utf8 to unicode character.
#'
#' @usage convert_utf8(x)
#' @param x character class vector.
#' @export 
#' @examples
#' convert_utf8('\u00f3')
#' convert_utf8('\u00e3o')

convert_utf8 <- function(x) {
    .check_convert_utf8(x)
}

## remove before
## not export

.rm_before <- function(x, reference) {
    pattern <- paste0(".*\\", reference)
    unlist(stringi::stri_replace_all_regex(x, pattern = pattern, reference))
}
