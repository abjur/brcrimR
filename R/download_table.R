#' Download tables publicized by the São Paulo's Security Office
#'
#'@param ano Year to download
#'@param municipio Intended city. Is a number between 1 and 645, representing the rank of the city in alphabetical order.
#'@param type Formulary to make the request, encodes the type of information to be downloaded.
#'"ctl00$conteudo$$btnMes" downloads recorded crime count.
#'
#'@export
download_table_sp <- function(ano, municipio, type = "ctl00$conteudo$$btnMes"){
  url <- 'http://www.ssp.sp.gov.br/Estatistica/Pesquisa.aspx'

  pivot <- httr::GET(url)
  #serve apenas para pegarmos um view_state e um event_validation valido

  view_state <- pivot %>%
    xml2::read_html() %>%
    rvest::html_nodes("input[name='__VIEWSTATE']") %>%
    rvest::html_attr("value")

  event_validation <- pivot %>%
    xml2::read_html() %>%
    rvest::html_nodes("input[name='__EVENTVALIDATION']") %>%
    rvest::html_attr("value")

  params <- list(`__EVENTTARGET` = "ctl00$conteudo$$btnMes",
                 `__EVENTARGUMENT` = "",
                 `__LASTFOCUS` = "",
                 `__VIEWSTATE` = view_state,
                 `__EVENTVALIDATION` = event_validation,
                 `ctl00$conteudo$ddlAnos` = ano,
                 `ctl00$conteudo$ddlRegioes` = "0",
                 `ctl00$conteudo$ddlMunicipios` = municipio,
                 `ctl00$conteudo$ddlDelegacias` = "0")

  httr::POST(url, body = params, encode = 'form') %>%
    xml2::read_html() %>%
    rvest::html_table() %>%
    dplyr::first() %>%
    #serve pra pegar apenas a primeira tabela da página, se houver mais do que uma. Estou assumindo que a tabela que eu quero é sempre a primeira.
    dplyr::mutate(municipio = municipio,
                  ano = ano)
}
#' @examples
#'
#' download_table_sp('2017', municipio = '1')
