#' Extração de tabelas da SSP-SP
#' Captura os dados das tabelas do site
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
