#' Extração de todas as tabelas da SSP-SP
#' Recebe uma URL
#' @import purrr
#' 
#' @export
get_all_tabela <- function(){
  purrr::map_df(1:count_tabela(), get_tabela())
}

get_all_tabela()
