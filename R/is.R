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

#' Check the element in vector
#'
#' The `is_element()` check if the vector has an element.
#'
#' @usage is_element(x, type = "one")
#' @param x not null class vector.
#' @param type character class vector that indicates the type of search in the vector. If "one" the search stops when true and does not check the entire vector. If "all" the search checks the entire vector.
#' @export 
#' @examples
#' is_element(c("1", NA, "3"))          #TRUE
#' is_element(c(1, NA, 3))              #TRUE
#' is_element(c("", 
#'  convert_utf8("\\u00e7\\u00e7"), 
#'  convert_utf8("\\u00e1\\u00e9")))    #TRUE
#' 
#' # modify type
#' is_element(c(
#'  NA, 
#'  "", 
#'  convert_utf8("\\u00e7\\u00e7")), 
#'  type = "all")                       #FALSE FALSE TRUE

is_element <- function(x, type = "one") {
    .check_patern_general(x, type, "element")
}

#' Check the number in vector
#'
#' The `is_number()` check if the vector has an number.
#'
#' @usage is_number(x, type = "one")
#' @param x not null class vector.
#' @param type character class vector that indicates the type of search in the vector. If "one" the search stops when true and does not check the entire vector. If "all" the search checks the entire vector.
#' @export 
#' @examples
#' is_number("")                    #FALSE
#' is_number(".")                   #FALSE
#' is_number(" ")                   #FALSE
#' is_number("na")                  #FALSE
#' is_number(NA)                    #FALSE
#' is_number(".5")                  #TRUE
#' is_number("5L")                  #TRUE
#' is_number("5.1")                 #TRUE
#' is_number("5/4")                 #TRUE
#' is_number("pi")                  #FALSE
#' is_number("sin(pi/2)")           #TRUE
#' is_number("Inf")                 #FALSE
#' is_number("1i^2")                #TRUE
#' is_number("!#$%&*()_-[{]};.")    #FALSE
#' is_number("!#$%&*()_-[{]};.5")   #TRUE
#' is_number(5)                     #TRUE
#' is_number(5L)                    #TRUE
#' is_number(5.1)                   #TRUE
#' is_number(5/4)                   #TRUE
#' is_number(pi)                    #TRUE
#' is_number(sin(pi/2))             #TRUE
#' is_number(Inf)                   #FALSE
#' is_number(-Inf)                  #FALSE
#' is_number(1i^2)                  #TRUE
#' is_number(1i + 1)                #TRUE
#' is_number(c("", NA, "hi"))       #FALSE

is_number <- function(x, type = "one") {
    .check_patern_general(x, type, "number")
}

#' Check the letter in vector
#'
#' The `is_letter()` check if the vector has an letter.
#'
#' @usage is_letter(x, type = "one")
#' @param x not null class vector.
#' @param type character class vector that indicates the type of search in the vector. If "one" the search stops when true and does not check the entire vector. If "all" the search checks the entire vector.
#' @export 
#' @examples
#' is_letter("")                                #FALSE
#' is_letter(".")                               #FALSE
#' is_letter(" ")                               #FALSE
#' is_letter("na")                              #TRUE
#' is_letter("aeiou uoiea")                     #TRUE
#' is_letter("AEIOU uoiea")                     #TRUE
#' is_letter("AEIOU UOIEA")                     #TRUE
#' is_letter(convert_utf8("\\u00e1 \\u00f9"))   #TRUE
#' is_letter(convert_utf8("\\u00c1 \\u00e1"))   #TRUE
#' is_letter(NA)                                #FALSE
#' is_letter(".5")                              #FALSE
#' is_letter(5)                                 #FALSE
#' is_letter(c("1", NA, ""))                    #FALSE
#' is_letter(c("1", NA, "A"))                   #TRUE
#' is_letter(c(56, NA, "!#$%&*()_-[{]};."))     #FALSE
#' is_letter(c(56, NA, "!#$%&*()_-[{]};.5"))    #FALSE
#' is_letter(c(56, NA, "!#$%&*(b)_-[{]};.5"))   #TRUE

is_letter <- function(x, type = "one") {
    .check_patern_general(x, type, "letter")
}

#' Check the accent in vector
#'
#' The `is_accent()` check if the vector has an accent. It's a function in experiment.
#'
#' @usage is_accent(x, type = "one")
#' @param x not null class vector.
#' @param type character class vector that indicates the type of search in the vector. If "one" the search stops when true and does not check the entire vector. If "all" the search checks the entire vector.
#' @export 
#' @examples
#' is_accent("")                                    #FALSE
#' is_accent(".")                                   #FALSE
#' is_accent(" ")                                   #FALSE
#' is_accent("`")                                   #FALSE
#' is_accent("\\u00d7\\u00f7")                      #FALSE
#' is_accent("na")                                  #FALSE
#' is_accent("s\\u00e1")                            #FALSE
#' is_accent("aeiou")                               #FALSE
#' is_accent("aeiou uoiea")                         #FALSE
#' is_accent("AEIOU uoiea")                         #FALSE
#' is_accent(convert_utf8("\\u00e0\\u00e8\\u00ed")) #TRUE
#' is_accent(" a a ")                               #FALSE
#' is_accent(c(" a ", convert_utf8("\\u00e0")))     #TRUE
#' is_accent(convert_utf8("\\u00e7"))               #TRUE
#' is_accent("c")                                   #FALSE
#' is_accent(convert_utf8("\\u00e4"))               #TRUE
#' is_accent("a")                                   #FALSE
#' is_accent(convert_utf8("\\u00f5"))               #TRUE
#' is_accent(convert_utf8("\\u00d8"))               #TRUE
#' is_accent(" o ")                                 #FALSE
#' is_accent(NA)                                    #FALSE
#' is_accent(".5")                                  #FALSE
#' is_accent(convert_utf8("!#$%\\u00a8&*(){]};."))  #FALSE
#' is_accent(5)                                     #FALSE
#' is_accent(c(1, NA, "na"))                        #FALSE
#' is_accent(c(56, NA, convert_utf8("\\u00d8")))    #TRUE
#' 
#' #FALSE
#' all(is_accent(c("", " ", "'", "/", "*", "-", "+", ".", ",", ";", "<", ">",
#'             ":", "!", "$", "%", "&", "*", "(", ")", "_", "-",
#'             "{", "}", "[", "]", "=", "?", "1", "~", "`", "'")))

is_accent <- function(x, type = "one") {
    .check_patern_general(x, type, "accent")
}

#' Check the punctuation in vector
#'
#' The `is_punctuation()` check if the vector has an punctuation.
#'
#' @usage is_punctuation(x, type = "one")
#' @param x not null class vector.
#' @param type character class vector that indicates the type of search in the vector. If "one" the search stops when true and does not check the entire vector. If "all" the search checks the entire vector.
#' @export 
#' @examples
#' is_punctuation(convert_utf8("s\\u00e1"))         #FALSE
#' is_punctuation("")                               #FALSE
#' is_punctuation(" ")                              #FALSE
#' is_punctuation("'")                              #TRUE
#' is_punctuation("/")                              #TRUE
#' is_punctuation("*")                              #TRUE
#' is_punctuation("-")                              #TRUE
#' is_punctuation("+")                              #TRUE
#' is_punctuation(".")                              #TRUE
#' is_punctuation(",")                              #TRUE
#' is_punctuation(";")                              #TRUE
#' is_punctuation("<")                              #TRUE
#' is_punctuation(">")                              #TRUE
#' is_punctuation(":")                              #TRUE
#' is_punctuation("!")                              #TRUE
#' is_punctuation("$")                              #FALSE
#' is_punctuation("%")                              #TRUE
#' is_punctuation("&")                              #TRUE
#' is_punctuation("*")                              #TRUE
#' is_punctuation("(")                              #TRUE
#' is_punctuation(")")                              #TRUE
#' is_punctuation("_")                              #TRUE
#' is_punctuation("-")                              #TRUE
#' is_punctuation("{")                              #TRUE
#' is_punctuation("}")                              #TRUE
#' is_punctuation("]")                              #TRUE
#' is_punctuation("=")                              #TRUE
#' is_punctuation("?")                              #TRUE
#' is_punctuation("1")                              #FALSE
#' is_punctuation("~")                              #TRUE
#' is_punctuation(convert_utf8("\\u00e3"))          #FALSE
#' is_punctuation("a")                              #FALSE
#' is_punctuation(convert_utf8("\\u00b4"))          #TRUE
#' is_punctuation(convert_utf8("\\u00e1"))          #FALSE
#' is_punctuation("`")                              #TRUE
#' is_punctuation(convert_utf8("\\u00f9"))          #FALSE
#' is_punctuation("a")                              #FALSE
#' is_punctuation(" a")                             #FALSE
#' is_punctuation("a ")                             #FALSE
#' is_punctuation(" a ")                            #FALSE
#' is_punctuation(c(56, NA, "(246) 659 996 325"))   #TRUE
#' is_punctuation(c(56, NA, "$ 56,99"))             #TRUE

is_punctuation <- function(x, type = "one") {
    .check_patern_general(x, type, "punctuation")
}

#' Check the space in vector
#'
#' The `is_space()` check if the vector has an space.
#'
#' @usage is_space(x, type = "one")
#' @param x not null class vector.
#' @param type character class vector that indicates the type of search in the vector. If "one" the search stops when true and does not check the entire vector. If "all" the search checks the entire vector.
#' @export 
#' @examples
#' is_space("")                                 #FALSE
#' is_space(".")                                #FALSE
#' is_space(" ")                                #TRUE
#' is_space("  ")                               #TRUE
#' is_space("   ")                              #TRUE
#' is_space("na")                               #FALSE
#' is_space("na ")                              #TRUE
#' is_space(" na ")                             #TRUE
#' is_space("n a")                              #TRUE
#' is_space(NA)                                 #FALSE
#' is_space(".5")                               #FALSE
#' is_space("!#$%&*()_-[{]};.")                 #FALSE
#' is_space(5)                                  #FALSE
#' is_space(c("10mg", NA_character_, "12mg"))   #FALSE
#' is_space(c("10mg", NA_character_, "12 mg"))  #TRUE

is_space <- function(x, type = "one") {
    .check_patern_general(x, type, "space")
}

#' Check the empty in vector
#'
#' The `is_empty()` check if the vector has an empty.
#'
#' @usage is_empty(x, type = "one")
#' @param x not null class vector.
#' @param type character class vector that indicates the type of search in the vector. If "one" the search stops when true and does not check the entire vector. If "all" the search checks the entire vector.
#' @export 
#' @examples
#' is_empty("")                                         #TRUE
#' is_empty(".")                                        #FALSE
#' is_empty(" ")                                        #FALSE
#' is_empty("  ")                                       #FALSE
#' is_empty("   ")                                      #FALSE
#' is_empty("na")                                       #FALSE
#' is_empty(NA)                                         #FALSE
#' is_empty(".5")                                       #FALSE
#' is_empty("!#$%&*()_-[{]};.")                         #FALSE
#' is_empty(5)                                          #FALSE
#' is_empty(c("", NA_character_, "12mg"))               #TRUE
#' is_empty(c(NA_character_, NA_character_, "12 mg"))   #FALSE

is_empty <- function(x, type = "one") {
    .check_patern_general(x, type, "empty")
}
