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
## check - date: 2022-05-24 17:40:54
## --------------------------------------------------------------------------------

## ------------------------------------------
## message
## ------------------------------------------

## message default
## not export

.msg_default <- function(x, type) {
    message_i <- c(
        character_i = "is a vector from character class.",
        internet_i = "unable to establish an internet connection.",
        logical_i = "'format_column' is a logical class vector with option 'TRUE' and 'FALSE'.",
        dataframe_i = "'data' is a object from data.frame class."
    )
    if (x == "" && type == "internet_i") {
        as.vector(message_i[type])
    } else {
        paste0("'", x, "' ", message_i[type])
    }
}

## ------------------------------------------
## str
## ------------------------------------------

## format with many characters
## not export

.format_character_length <- function(x){
  # select and condition
  i_len <- function(x) {
    x <- unlist(strsplit(x, ""))[1:16]
    x <- paste(c(x, "~"), sep = "", collapse = "")
    return(x)
  }
  
  # limit
  i_pos <- function(x) {
    nchar(x) > 16
  }

  # check
  check_i <- function(x) {
      if (i_pos(x)) i_len(x) else x
  }

  execute_i <- function(x) {
    if (length(x) >= 1 && is.na(x)) {
      return(x)
    } else {
        x_i <- tryCatch(unlist(lapply(x, check_i)), error = function(i)NA)
        return(x_i)
    }
  }

  unlist(lapply(x, execute_i))
}

## ------------------------------------------
## is
## ------------------------------------------

NULL

## --------------------------------------------------------------------------------
## is - date: 2022-05-28 11:53:53
## --------------------------------------------------------------------------------

## ------------------------------------------
## engineer
## ------------------------------------------

# check pattern
# not export

.check_pattern <- function(type) {
  switch (type,
          element = "[\\p{L}+\\p{Nd}+]",
          number = "\\p{Nd}",
          letter = "\\p{L}",
          # letter_r = "[[\u0041-\u005A\u0061-\u007A]]",
          punctuation = "[\\p{P}\\p{Sm}\\p{Sk}]",
          # accent = "[[À-ÿ]]|[[À-ú]]|[[À-ÖØ-öø-ÿ]]",
          # accent = "[[\\u00C0-\\u00FF]]",
          accent = "[\\u00C0-\\u00D6\\u00D8-\\u00F6\\u00F8-\\u024F]",
          space = "\\p{Zs}",
          empty = "^$",
          currency = "\\p{Sc}",
          stop("\n Unknown type."))
}

# check the count to pattern from family is
# not export

.check_count <- function(type) {
  if (type == "all") {
    return(-1L)
  } else if (type == "one") {
    return(1L)
  } else {
    stop("\n unknown type.")
  }
}

# check with filter
# not export

.check_is <- function(x) {
  if (is.element(length(x), 0)) {
    return(FALSE)
  } else {
    return(TRUE)
  }
}

# check string
# not export

.detect_string <- function(x, pattern, type) {
  stringi::stri_detect_regex(x, pattern = pattern, max_count = type)
}

## ------------------------------------------
## is
## ------------------------------------------

.get_pattern_general <- function(x, type, pattern_i) {
    if (type == "all") {
        check_i <- .detect_string(x, 
            pattern = .check_pattern(pattern_i), 
            type = .check_count(type))
        check_i[is.na(check_i)] <- FALSE
        return(check_i)
    } else if (type == "one") {
        check_i <- .detect_string(x, 
            pattern = .check_pattern(pattern_i), 
            type = .check_count(type))
        x <- intersect(check_i, TRUE)
        return(.check_is(x))
    }
}

## --------------------------------------------------------------------------------
## str - date: 2022-05-24 17:55:13
## --------------------------------------------------------------------------------

## ------------------------------------------
## engineer
## ------------------------------------------

# format class
# not export

.format_vector_class <- function(x, format_column) {
  class_i <- paste(class(x), collapse = " ")
  class_format <- .format_character_length(class_i)
  if(format_column) class_format else class_i
}

# check the size from object
# not export

.check_size <- function(x, type) {
  t <- switch(type,
              bytes = round(x*1000^0),
              kb = round(x*1000^-1, 4),
              mb = round(x*1000^-2, 4),
              gb = round(x*1000^-3, 4),
              tb = round(x*1000^-4, 4),
              stop("unknown type."))
}

# format size for .get_str_data()
# not export

.format_size_df <- function(x, type) {
  size_i <- .check_size(as.numeric(utils::object.size(x)), type)
  paste(size_i, type, collapse = " ")
}

# check encoding for .get_str_data()
# not export

.check_utf8 <- function(x) {
  all(unlist(lapply(x, stringi::stri_enc_isutf8)))
}

# get head for str_head()
# not export

.get_head <- function(data) {
  .head_i <- function(x) {
    paste0(utils::head(x, 3), collapse = " ")
  }

  as.vector(unlist(lapply(data, .head_i)))
}

# check the convert for str_class()
# not export

.check_yn <- function(type) {
  switch(as.character(type),
    "TRUE" = "yes",
    "FALSE" = "no"
  )
}

# construct general for str_class()
# not export

.check_general <- function(data) {
  .check_i <- function(x) {
    data.frame(
      na = .check_yn(anyNA(x)),
      element = .check_yn(is_element(x, type = "one")),
      number = .check_yn(is_number(x, type = "one")),
      letter = .check_yn(is_letter(x, type = "one")),
      accent = .check_yn(is_accent(x, type = "one")),
      punctuation = .check_yn(is_punctuation(x, type = "one")),
      space = .check_yn(is_space(x, type = "one")),
      empty = .check_yn(is_empty(x, type = "one"))
    )
  }

  do.call(base::rbind,
    lapply(data, .check_i))
}

## ------------------------------------------
## str
## ------------------------------------------

# get str
# not export

.get_str_data <- function(data, measure, format_column) {
  data.frame(
    structure = c("class", "type", "size", "column", "row", "NA"),
    information = c(.format_vector_class(data, format_column),
                    typeof(data),
                    .format_size_df(data, measure),
                    ncol(data),
                    nrow(data),
                    anyNA(data))
  )
}

# get structure from df for str_head()
# not export

.get_str_head <- function(data, format_column) {
    col_i <- colnames(data)
    head_i <- .get_head(data)
    class_i <- unlist(lapply(data, function(x)toString(class(x))))
    df_i <- data.frame(
        column = if(format_column) .format_character_length(col_i) else col_i,
        class = if(format_column) .format_character_length(class_i) else class_i,
        head = if(format_column) .format_character_length(head_i) else head_i)
    row.names(df_i) <- 1:nrow(df_i)
    return(df_i)
}

# join class
# not export

.get_str_class <- function(data, format_column) {
  df_i <- data.frame(
    .get_str_head(data, format_column), 
    .check_general(data))
  row.names(df_i) <- 1:nrow(df_i) 
  return(df_i)
}

## --------------------------------------------------------------------------------
## extract - date: 2022-05-28 12:37:24
## --------------------------------------------------------------------------------

## ------------------------------------------
## engineer
## ------------------------------------------

.extract_all <- function(x, pattern) {
  stringi::stri_extract_all_regex(x, pattern = pattern)
}

# extract pattern
# not export

.extract_i <- function(data, pattern_i) {
  .check_i <- function(x, pattern_i) {
    x_i <- .extract_all(x, 
      pattern = .check_pattern(pattern_i))
    x_i <- unique(unlist(x_i))
    x_i[is.na(x_i)] <- ""
    paste(x_i, collapse = "")
  }

  unlist(lapply(data, function(x).check_i(x, pattern_i)))
}

## ------------------------------------------
## get
## ------------------------------------------

# get extract
# not export

.get_extract <- function(data, format_column, pattern_i) {
  df_i <- data.frame(
    .get_str_head(data, format_column),
    extract = .extract_i(data, pattern_i))
  df_i[["extract"]][df_i[["extract"]] == ""] <- NA
  row.names(df_i) <- 1:nrow(df_i) 
  return(df_i)
}

## --------------------------------------------------------------------------------
## detect - date: 2022-05-28 13:02:43
## --------------------------------------------------------------------------------

## ------------------------------------------
## check
## ------------------------------------------

## extract info in dir
## not export

.get_info <- function(path) {
  as.data.frame(fs::dir_info(path))
}

## check extension
## not export

.check_extension <- function(x) {
  check_i <- function(x) {
      if (grepl(x, pattern = "\\.")) .rm_before(x, ".") else NA
  }

  unlist(lapply(x, check_i))
}

.check_exists_extension <- function(path) {
  is_punctuation(.check_extension(.get_info(path)[["path"]]))
}

# .check_exists_extension(getwd())

# .check_extension(.get_info(getwd())[["path"]])
# .check_name(.get_info(getwd())[["path"]])

## check name
## not export

.check_name <- function(path_name, path_extension) {
  .name_i <- function(path_name, path_extension) {
    name_i <- basename(path_name)
    extension_i <- .check_extension(basename(path_extension))
    if (anyNA(extension_i)) name_i else gsub(path_extension, "", name_i)
  }

  loop_i <- Vectorize(function(i, j).name_i(i, j))
  as.character(loop_i(path_name, path_extension))
}

# format size
# not export

.check_size_file <- function(x, measure) {
  unlist(lapply(x, function(x).check_size(x, measure)))
}

## ------------------------------------------
## engineer
## ------------------------------------------

.get_file <- function(path, measure, format_column) {
  df_i <- .get_info(path)
  df_i <- df_i[df_i[["type"]] == "file",]
  path_i <- df_i[["path"]]
  extension_i <- .check_extension(basename(path_i))
  name_i <- .check_name(path_i, extension_i)
  df_i[["size"]] <- .check_size_file(as.numeric(df_i[["size"]]), measure)
  df_i[["name"]] <- if(format_column) .format_character_length(name_i) else name_i
  df_i[["extension"]] <- extension_i
  df_i <- df_i[,c("name", "extension", "size", "birth_time", "modification_time")]
  colnames(df_i) <- c("name", "extension", paste0("size_", measure), "birth_time", "modification_time")
  return(df_i)
}

## --------------------------------------------------------------------------------
## convert - date: 2022-05-29 17:43:23
## --------------------------------------------------------------------------------

.get_convert_utf8 <- function(x) {
  stringi::stri_unescape_unicode(x)
}
