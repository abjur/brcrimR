#' @export
`%>%` <- magrittr::`%>%`

get_viewstate <- function(r){
  view_state <- r %>%
    xml2::read_html() %>%
    rvest::html_nodes("input[name='__VIEWSTATE']") %>%
    rvest::html_attr("value")

  event_validation <- r %>%
    xml2::read_html() %>%
    rvest::html_nodes("input[name='__EVENTVALIDATION']") %>%
    rvest::html_attr("value")

  return(list(vs = view_state, ev = event_validation))
}
