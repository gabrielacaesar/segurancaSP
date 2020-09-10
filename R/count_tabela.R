#' Contagem o número de tabelas da SSP-SP
#' Recebe uma URL
#'
#' @export
count_tabela <- function(){
  "http://www.ssp.sp.gov.br/Estatistica/ViolenciaMulher.aspx" %>%
    read_html() %>%
    html_table() %>%
    length() %>%
    return()
}

