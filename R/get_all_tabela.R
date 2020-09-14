#' Extração de todas as tabelas da SSP-SP
#' Extrai os dados de todas as tabelas do site
#' @import purrr
#'
#' @export
get_all_tabela <- function(){
  purrr::map_df(1:count_tabela(), get_tabela())
}

get_all_tabela()
