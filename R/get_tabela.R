#' Extração de tabelas da SSP-SP
#'
#' Cria função para ser inserida dentro de map
#'
#' @param NULL
#'
#' @return tibble::tibble()
#'
#' @export
get_tabela <- function(){
  "http://www.ssp.sp.gov.br/Estatistica/ViolenciaMulher.aspx" %>%
    xml2::read_html() %>%
    rvest::html_table() %>%
    .[[x]] %>%
    as.data.frame() %>%
    dplyr::rename("crime" = "") %>%
    janitor::clean_names() %>%
    dplyr::mutate(table_id = x)
}
