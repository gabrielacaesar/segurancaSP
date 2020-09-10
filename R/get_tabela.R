#' Extração de tabelas da SSP-SP
#' Cria função para ser inserida dentro de map
#'
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
