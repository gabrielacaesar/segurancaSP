#' Contagem o número de tabelas da SSP-SP
#' Diz quantas tabelas há no site
#'
#' @export
count_tabela <- function(){
  "http://www.ssp.sp.gov.br/Estatistica/ViolenciaMulher.aspx" %>%
    read_html() %>%
    html_table() %>%
    length() %>%
    return()
}

