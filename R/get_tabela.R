#' Extração de tabelas da SSP-SP
#' Cria função para ser inserida dentro de map
#' @import magrittr
#' @import rvest
#' @export
get_tabela <- function(){
  "http://www.ssp.sp.gov.br/Estatistica/ViolenciaMulher.aspx" %>%
    read_html() %>%
    html_table() %>%
    .[[x]] %>%
    as.data.frame() %>%
    rename("crime" = "") %>%
    janitor::clean_names() %>%
    mutate(table_id = x)
}
