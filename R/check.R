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

## --------------------------------------------------------------------------------
## str - date: 2022-05-24 17:38:54
## --------------------------------------------------------------------------------

.check_str_data <- function(data, measure, format_column) {
    if (!is.data.frame(data)) {
        stop(.msg_default("data", type = "dataframe_i"))
    }

    if (!(nrow(data) >= 1)) {
        stop("'data' is a object from data.frame class with row >= 1.")
    }

    if (!is.character(measure)) {
        stop(.msg_default("measure", type = "character_i"))
    }

    if (!length(measure) == 1) {
        stop("'measure' is a character class vector with length = 1.")
    }

    if (!length(measure) == 1 && !nchar(measure) >= 1) {
        stop("'measure' is a character class vector with number of characters > 1.")
    }

    if (!is.element(measure, c("bytes", "kb", "mb", "gb", "tb"))) {
        stop("'measure' is a character class vector with option 'bytes', 'kb', 'mb', 'gb', and 'tb'.")
    }

    if (is.logical(format_column)) {
        if (!is.element(format_column, c(TRUE, FALSE))) {
            stop(.msg_default("measure", type = "logical_i"))
        }
    } else {
            stop(.msg_default("measure", type = "logical_i"))
    }

    .get_str_data(data, measure, format_column)
}

# check input str_head()
# not export

.check_str_head <- function(data, format_column) {
    if (!is.data.frame(data)) {
        stop(.msg_default("data", type = "dataframe_i"))
    }

    if (!(nrow(data) >= 1)) {
        stop("'data' is a object from data.frame class with row >= 1.")
    }

    if (is.logical(format_column)) {
        if (!is.element(format_column, c(TRUE, FALSE))) {
            stop(.msg_default("format_column", type = "logical_i"))
        }
    } else {
            stop(.msg_default("format_column", type = "logical_i"))
    }

    .get_str_head(data, format_column)  
}

# check input str_class()
# not export

.check_str_class <- function(data, format_column) {
    if (!is.data.frame(data)) {
        stop(.msg_default("data", type = "dataframe_i"))
    }

    if (!(nrow(data) >= 1)) {
        stop("'data' is a object from data.frame class with row >= 1.")
    }

    if (is.logical(format_column)) {
        if (!is.element(format_column, c(TRUE, FALSE))) {
            stop(.msg_default("format_column", type = "logical_i"))
        }
    } else {
            stop(.msg_default("format_column", type = "logical_i"))
    }

    .get_str_class(data, format_column)
}

## --------------------------------------------------------------------------------
## is - date: 2022-05-28 11:49:56
## --------------------------------------------------------------------------------

# check pattern
# not export

.check_patern_general <- function(x, type, pattern) {
    if (is.null(x)) {
        stop("'x' is a vector from class not null.")
    }

    if (!is.character(type)) {
        stop("'path' is a vector from character class.")
    }

    if (!length(type) == 1) {
        stop("'path' is a character class vector with length = 1.")
    }

    if (!length(type) == 1 && !nchar(type) >= 1) {
        stop("'type' is a character class vector with number of characters > 1.")
    }

    if (!is.element(type, c("one", "all"))) {
        stop("'type' is a character class vector with option 'one' and 'all'.")
    }

    .get_pattern_general(x, type, pattern)
}

## --------------------------------------------------------------------------------
## extract - date: 2022-05-28 12:34:33
## --------------------------------------------------------------------------------

# check extract
# not export

.check_extract <- function(data, format_column, pattern_i) {
    if (!is.data.frame(data)) {
        stop("'data' is a object from data.frame class.")
    }

    if (!(nrow(data) >= 1)) {
        stop("'data' is a object from data.frame class with row >= 1.")
    }

    if (is.logical(format_column)) {
        if (!is.element(format_column, c(TRUE, FALSE))) {
            stop("'format_column' is a logical class vector with option 'TRUE' and 'FALSE'.")
        }
    } else {
            stop("'format_column' is a logical class vector with option 'TRUE' and 'FALSE'.")
    }

    .get_extract(data, format_column, pattern_i)
}

## --------------------------------------------------------------------------------
## detect - date: 2022-05-28 12:59:15
## --------------------------------------------------------------------------------

# check file in dir
# not export

.check_file <- function(path, measure, format_column) {
    if (!is.character(path)) {
        stop(.msg_default("path", type = "character_i"))
    }

    if (!length(path) == 1) {
        stop("'path' is a character class vector with length = 1.")
    }

    if (!length(path) == 1 && !nchar(path) >= 1) {
        stop("'path' is a character class vector with number of characters > 1.")
    }

    if (!dir.exists(path)) {
        stop(paste0(path, " it is not an existing directory path."))
    }

    if (!is.element(measure, c("bytes", "kb", "mb", "gb", "tb"))) {
        stop("'measure' is a character class vector with option 'bytes', 'kb', 'mb', 'gb', and 'tb'.")
    }

    if (!.check_exists_extension(path)) {
        stop("there is no extension on the declared path.")
    }

    if (is.logical(format_column)) {
        if (!is.element(format_column, c(TRUE, FALSE))) {
            stop(.msg_default("format_column", type = "logical_i"))
        }
    } else {
            stop(.msg_default("format_column", type = "logical_i"))
    }

    .get_file(path, measure, format_column)    
}

## --------------------------------------------------------------------------------
## convert - date: 2022-05-29 17:40:49
## --------------------------------------------------------------------------------

.check_convert_utf8 <- function(x) {
    if (!is.character(x)) {
        stop(.msg_default("x", type = "character_i"))
    }

    .get_convert_utf8(x)
}
