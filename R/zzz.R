#' @export
`%>%` <- magrittr::`%>%`

parse_number_br <- function(char_numbers){
  char_numbers %>%
    stringr::str_replace_all("\\.", "") %>%
    stringr::str_replace_all(",", "\\.") %>%
    as.numeric()
}
