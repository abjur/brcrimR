open_table <- function(r){

  # Create tempfile
  tmp <- tempfile()

  # Open Raw Connection to r's content
  httr::content(r, type = 'raw') %>%
    readr::write_file(tmp)

  read.table(tmp, fileEncoding = "UTF-16LE", sep = "\t", header = T, stringsAsFactors = F)
}
