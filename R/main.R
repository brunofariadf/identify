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

#' Structure from data frame
#'
#' The `str_data()` obtains information about the structure of the data frame.
#'
#' @usage str_data(data, measure = 'mb', format_column = TRUE)
#' @param data object class data frame.
#' @param measure character class vector that indicates the unit of measure for calculating the object's size in the calling environment. Option is 'bytes', 'kb, 'mb', 'gb' and 'tb'.
#' @param format_column logical class vector to format column with characters of length > 16.
#' @return o retorno e quadro de dados com informacao
#' @export 
#' @examples
#' str_data(mtcars)
#' str_data(iris)

str_data <- function(data, measure = "mb", format_column = TRUE) {
    .check_str_data(data, measure, format_column)
}

#' Structure of column in data frame
#'
#' The `str_head()` is structure of the beginning of each column in the data frame.
#'
#' @usage str_head(data, format_column = TRUE)
#' @param data object class data frame.
#' @param format_column logical class vector to format column with characters of length > 16.
#' @export 
#' @examples
#' str_head(mtcars)
#' str_head(iris)

str_head <- function(data, format_column = TRUE) {
    .check_str_head(data, format_column)
}

#' Structure from column class in data frame
#'
#' The `str_class()` obtains information about the structure from column of the data frame.
#'
#' @usage str_class(data, format_column = TRUE)
#' @param data object class data frame.
#' @param format_column logical class vector to format column with characters of length > 16.
#' @export 
#' @examples
#' str_class(mtcars)
#' str_class(iris)

str_class <- function(data, format_column = TRUE) {
    .check_str_class(data, format_column)
}

#' Extract the punctuation type from the vector in the data frame
#'
#' The `extract_punctuation()` extract the punctuation type from the vector in the data frame.
#'
#' @usage extract_punctuation(data, format_column = TRUE)
#' @param data object class data frame.
#' @param format_column logical class vector to format column with characters of length > 16.
#' @export 
#' @examples
#' extract_punctuation(identify::stadium)
#' extract_punctuation(identify::package)

extract_punctuation <- function(data, format_column = TRUE) {
    .check_extract(data, format_column, "punctuation")
}

#' Extract the accent type from the vector in the data frame
#'
#' The `extract_accent()` extract the accent type from the vector in the data frame.
#'
#' @usage extract_accent(data, format_column = TRUE)
#' @param data object class data frame.
#' @param format_column logical class vector to format column with characters of length > 16.
#' @export 
#' @examples
#' data_i <- apply(stadium, 2, convert_utf8)
#' data_i <- as.data.frame(data_i)
#' identify::extract_accent(data_i)

extract_accent <- function(data, format_column = TRUE) {
    .check_extract(data, format_column, "accent")
}

#' Get the files list in directory
#'
#' The `detect_file()` detect the files with extension in directory.
#'
#' @usage detect_file(path, measure = "mb", format_column = TRUE)
#' @param path character class vector that indicates the path from file list.
#' @param measure character class vector that indicates the unit of measure for calculating the object's size in the calling environment. Option is 'bytes', 'kb, 'mb', 'gb' and 'tb'.
#' @param format_column logical class vector to format column with characters of length > 16.
#' @export 
#' @examples
#' detect_file(getwd())

detect_file <- function(path, measure = "mb", format_column = TRUE) {
  .check_file(path, measure, format_column)
}
