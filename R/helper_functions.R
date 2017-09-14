helper_sp <- function(f, y, m, d){
    f <- dplyr::case_when(
      stringr::str_detect(f, "[hh]omic[íi]") ~ "btnHomicicio",
      TRUE ~ f
    )

    y <- dplyr::case_when(
      as.numeric(y) < 2013 ~ '02',
      as.numeric(y) >= 2013 ~ as.character(as.numeric(y)-2000),
      TRUE ~ y
    )

    d <- dplyr::case_when(
      stringr::str_detect(d, "t[uo]do|all") ~ "0",
      TRUE ~ d
    )

    return(list(f = f, y = y, m = m, d = d))
}
