basic_params <- function(val, dest, states){
  list(`__EVENTTARGET` = get_browse_target(val, dest),
       `__EVENTARGUMENT` = "",
       `__VIEWSTATE` = states$vs,
       `__EVENTVALIDATION` = states$ev)
}

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

get_browse_target <- function(val, dest, header = 'ctl00$cphBody'){
  selector <- dplyr::case_when(
    dest == "year" ~ "lkAno",
    dest == "month" ~ "lkMes",
    TRUE ~ "")

  glue::glue("{header}${selector}{val}")
}
